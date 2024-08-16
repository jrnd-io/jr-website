---
# Title, summary, and page position.
linktitle: Distributed JR
weight: 540
#icon: book
icon_pack: fas

# Page metadata.
title: Distributed JR
date: '2024-02-02T00:00:00Z'
type: book # Do not modify.
---

## Distributed JR

If you need to generate more data than a single instance of JR can handle, what you need is Distributed JR!
At the moment you can distribute JR with two different frameworks: [Locust](https://locust.io) or [xk6-exec](https://github.com/grafana/xk6-exec).

## Distributing JR with Locust

JR can run with  [Locust](https://locust.io)

### Prerequisites

- a Kubernetes cluster
- the `jr` image accessible either as built locally or from a registry
- [`helm`](https://helm.sh) client


###  Build the image

Build the customised `jr` and `locust` image with:

```
docker build -t locust-jr .
```

### Create the configmap for the jr locust library

Create a configmap  with:

```
kubectl create configmap locust-jr-lib --from-file jr.py
```


### Example with jr and the MongoDB Producer

Create a configmap with the MongoDB configuration and the locust python file:


```yaml
---
apiVersion: v1
kind: ConfigMap
metadata:
  name: mongodb-jr
data:
  mongoconfig.json: |
    {
      "mongo_uri": "mongodb+srv://...","
      "database": "[mongodb database]",
      "collection": "[mongodb collection]"
    }
---
apiVersion: v1
kind: ConfigMap
metadata:
  name: locust-jr
data:
  main.py: |
    from locust import task
    from lib.jr import JRUser

    class MyUser(JRUser):
        @task
        def jr_task(self):
            self.run_jr(["run", 
                        "net_device",
                        "--output","mongo",
                        "--mongoConfig", "/jrconfig/mongoconfig.json"])
```

Add the `deliveryhero` repo:

```
https://github.com/deliveryhero/helm-charts/tree/master/stable/locust
```

Install the [Locust Helm chart](https://github.com/deliveryhero/helm-charts/tree/master/stable/locust) with:

```bash
helm install locust deliveryhero/locust \
   --set loadtest.name=jr-test-01 \
   --set loadtest.locust_locustfile_configmap=locust-jr \
   --set loadtest.locust_lib_configmap=locust-jr-lib \
   --set image.pullPolicy=Always \
   --set worker.image=registry.localhost:5000/locust-jr \
   --set worker.logLevel=DEBUG \
   --set worker.replicas=4  \
   --set extraConfigMaps.mongodb-jr="/jrconfig"
```

Expose the port `8089` of the locust master pod via port forward, connect with the browser to http://localhost:8089 and launch the test (ignore the Host field in the form)


## Distributing JR with K6 on Kubernetes


JR can run with [xk6-exec](https://github.com/grafana/xk6-exec) with the [distributed K6](https://grafana.com/docs/k6/latest/set-up/set-up-distributed-k6/) in Kubernetes.

### Prerequisites

- a Kubernetes cluster
- the [K6 operator](https://grafana.com/docs/k6/latest/set-up/set-up-distributed-k6/) installed
- the `jr` image accessible either as built locally or from a registry


### Build the image

From the `/k6/exec` folder launch:

```bash
docker build -t k6-jr .
```

The `k6-jr` image can launch a script that executes `jr` in the runner.
e.g.:

```javascript
import exec from 'k6/x/exec';

export default ()=> {
       console.log(exec.command("/usr/bin/jr", ["run",
                                                "net_device",
                                                "-n", "2",
                                                "-f", "100ms",
                                                "-d", "1m"
                                                ]))

}
```

### Create the CR

You can now create the CR from the k6 CRD to run the test.
The following example runs `jr` with a parallelism of `4` and `200` virtual users (e.g. 50 VUs each pod)


```yaml
---
apiVersion: v1
kind: ConfigMap
metadata:
  name: jr-test
data:
  jr.js: |
    import exec from 'k6/x/exec';

    export const options = {
      vus: 20,
      duration: '5m',
    };
    export default ()=> {
      try{
          var output = exec.command("/usr/bin/jr", ["run",
                                                    "net_device",
                                                    ],{"continue_on_error": true});
      }catch (e) {
        console.log("ERROR: " + e);
        if (e.value && e.value.stderr) {
                console.log("STDERR: " + String.fromCharCode.apply(null, e.value.stderr))
        }
      }


    }    
---
apiVersion: k6.io/v1alpha1
kind: TestRun
metadata:
  name: k6-jr-example
spec:
  parallelism: 4
  script:
    configMap:
      name: jr-test
      file: jr.js
  runner:
    image: registry.localhost:5000/k6-jr:latest
```    


> Note: `k6` is responsible for running `jr` with the proper number pf virtual users, duration  and parallelism so `jr` in the script should be run emitting just one sample

To run the example:

```bash
kubectl apply -f test-jr-run.yaml
```

The k6 operator should launch 4 pods with `jr` runnning for the amount of time declared in the `options` variable of the `javascript`  test script.


### A more complex example with MongoDB producer  and Prometheus remote RW

In this example we will run a distributed test with `jr` using as producer `MongoDB` and writing the `k6` metrics to `Prometheus`.

The prerequisites are:

- a reachable `MongoDB` cluster instance
- a reachable `Prometheus` instance with the remote write receiver enabled

The `yaml` (self explanatory) of the TestRun CR is the following:


```yaml
---
apiVersion: v1
kind: ConfigMap
metadata:
  name: jr-configmap
data:
  mongoconfig.json: |
    {
      "mongo_uri": "mongodb+srv://<user>:<password>@...",
      "database": "<mongo database>",
      "collection": "<mongo collection>"
    }
  jr.js: |
    import exec from 'k6/x/exec';

    export const options = {
      vus: 20,
      duration: '5m',
    };
    export default ()=> {
      try{
          var output = exec.command("/usr/bin/jr", ["run",
                                                    "net_device",
                                                    "--output","mongo",
                                                    "--mongoConfig", "/jrconfig/mongoconfig.json"
                                                    ],{"continue_on_error": true});
      }catch (e) {
        console.log("ERROR: " + e);
        if (e.value && e.value.stderr) {
                console.log("STDERR: " + String.fromCharCode.apply(null, e.value.stderr))
        }
      }


    }
---
apiVersion: k6.io/v1alpha1
kind: TestRun
metadata:
  name: k6-jr-example
spec:
  parallelism: 4
  script:
    configMap:
      name: jr-configmap
      file: jr.js
  arguments: -o experimental-prometheus-rw
  runner:
    image: registry.localhost:5000/k6-jr:latest
    env: 
      - name: K6_PROMETHEUS_RW_SERVER_URL
        value: http://<prometheus endpoint>/api/v1/write
      - name: K6_PROMETHEUS_RW_TREND_STATS
        value: "p(95),p(99),min,max"
    volumeMounts:
    - name: config-volume
      mountPath: /jrconfig
    volumes:
    - name: config-volume
      configMap:
        name: jr-configmap
```






