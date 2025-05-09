---
# Title, summary, and page position.
linktitle: Functions
summary: Functions available in JR Templates
weight: 110
#icon: book
icon_pack: fas

# Page metadata.
title: Functions
date: '2023-04-17T00:00:00Z'
type: book # Do not modify.
---

This section contains all the available functions in JR Templates.

There are 10 different categories

- [Address](#address-functions)
- [Context](#context-functions)
- [Date and Time](#date-and-time-functions)
- [Finance](#finance-functions)
- [Math](#math-functions)
- [Network](#network-functions)
- [People](#people-functions)
- [Phone](#phone-functions)
- [Text](#text-functions) 
- [Utilities](#utilities-functions)

You can look at this list via ```jr man``` command.

## Address functions


### building 
**Category:** address\
**Description:** returns a random building number of max n digits\
**Parameters:** `n int`\
**Localizable:** `false`\
**Return:** `string`\
**Example:** `jr template run --embedded '{{building 3}}'`\
**Output:** `982`

### capital 
**Category:** address\
**Description:** returns a random capital\
**Parameters:**  \
**Localizable:** `true`\
**Return:** `string`\
**Example:** `jr template run --embedded '{{capital}}'`\
**Output:** `Phoenix`

### capital_at 
**Category:** address\
**Description:** returns capital at given index\
**Parameters:** `index int`\
**Localizable:** `true`\
**Return:** `string`\
**Example:** `jr template run --embedded '{{capital_at 4}}'`\
**Output:** `Sacramento`

### cardinal 
**Category:** address\
**Description:** returns a random cardinal direction\
**Parameters:** `short bool`\
**Localizable:** `false`\
**Return:** `string`\
**Example:** `jr template run --embedded '{{cardinal false}} {{cardinal true}}'`\
**Output:** `North-Ovest SE`

### city 
**Category:** address\
**Description:** returns a random city\
**Parameters:**  \
**Localizable:** `true`\
**Return:** `string`\
**Example:** `jr template run --embedded '{{city}}'`\
**Output:** `New York`

### city_at 
**Category:** address\
**Description:** returns a city at given index\
**Parameters:** `index int`\
**Localizable:** `true`\
**Return:** `string`\
**Example:** `jr template run --embedded '{{city_at 1}}'`\
**Output:** `Austin`

### country 
**Category:** address\
**Description:** returns the ISO 3166 country code (selected locale)\
**Parameters:**  \
**Localizable:** `true`\
**Return:** `string`\
**Example:** `jr --locale it run --embedded '{{country}}'`\
**Output:** `IT`

### country_at 
**Category:** address\
**Description:** returns an ISO 3166 country code at a given index\
**Parameters:**  \
**Localizable:** `true`\
**Return:** `string`\
**Example:** `jr template run --embedded '{{country_at 109}}'`\
**Output:** `IT`

### country_random 
**Category:** address\
**Description:** returns a random ISO 3166 country code\
**Parameters:**  \
**Localizable:** `true`\
**Return:** `string`\
**Example:** `jr template run --embedded '{{country}}'`\
**Output:** `IT`

### latitude 
**Category:** address\
**Description:** returns a random latitude between -90 and 90 degrees\
**Parameters:**  \
**Localizable:** `false`\
**Return:** `string`\
**Example:** `jr template run --embedded '{{latitude}}'`\
**Output:** ``

### longitude 
**Category:** address\
**Description:** returns a random longitude between -180 and 180 degrees\
**Parameters:**  \
**Localizable:** `false`\
**Return:** `string`\
**Example:** `jr template run --embedded '{{longitude}}'`\
**Output:** ``

### nearby_gps 
**Category:** address\
**Description:** returns a random latitude longitude within a given radius in meters\
**Parameters:** `latitude float64, longitude float64, radius int`\
**Localizable:** `false`\
**Return:** `string`\
**Example:** `jr template run --embedded '{{nearby_gps 41.9028 12.4964 1000}}'`\
**Output:** `41.8963 12.4975`

### nearby_gps_into_polygon 
**Category:** address\
**Description:** returns a random latitude longitude within a given start point, radius in meters and poligon from a GeoJson file\
**Parameters:** `string`\
**Localizable:** `false`\
**Return:** `string`\
**Example:** `jr template run --embedded '{{nearby_gps_into_polygon 45.849539549943 9.3874341200659 10}}' --geojson testfiles/polygon.geojson`\
**Output:** `41.8963 12.4975`

### nearby_gps_into_polygon 
**Category:** address\
**Description:** returns a random latitude longitude within a given start point, radius in meters and poligon from a GeoJson file\
**Parameters:** `string`\
**Localizable:** `false`\
**Return:** `string`\
**Example:** `jr template run --embedded '{{nearby_gps_into_polygon_without_start 10}}' --geojson testfiles/polygon.geojson`\
**Output:** `41.8963 12.4975`

### state 
**Category:** address\
**Description:** returns a random state\
**Parameters:**  \
**Localizable:** `true`\
**Return:** `string`\
**Example:** `jr template run --embedded '{{state}}'`\
**Output:** `New York`

### state_at 
**Category:** address\
**Description:** returns state at given index\
**Parameters:** `index int`\
**Localizable:** `true`\
**Return:** `string`\
**Example:** `jr template run --embedded '{{state_at 3}}'`\
**Output:** `Arkansas`

### state_short 
**Category:** address\
**Description:** returns a random short State\
**Parameters:**  \
**Localizable:** `true`\
**Return:** `string`\
**Example:** `jr template run --embedded '{{state_short}}'`\
**Output:** `KY`

### state_short_at 
**Category:** address\
**Description:** returns short State at given index\
**Parameters:** `index int`\
**Localizable:** `true`\
**Return:** `string`\
**Example:** `jr template run --embedded '{{state_short_at 3}}'`\
**Output:** `AR`

### street 
**Category:** address\
**Description:** returns a random street\
**Parameters:**  \
**Localizable:** `true`\
**Return:** `string`\
**Example:** `jr template run --embedded '{{street}}'`\
**Output:** `Union Street`

### zip 
**Category:** address\
**Description:** returns a random zip code\
**Parameters:**  \
**Localizable:** `true`\
**Return:** `string`\
**Example:** `jr template run --embedded '{{zip}}'`\
**Output:** `21401`

### zip_at 
**Category:** address\
**Description:** returns Zip code at given index\
**Parameters:** `index int`\
**Localizable:** `true`\
**Return:** `string`\
**Example:** `jr template run --embedded '{{zip_at 3}}'`\
**Output:** `72201`

Total functions: 21


## Context functions


### add_v_to_list 
**Category:** context\
**Description:** adds a context value to a list. A random value from the list can be obtained with 'random_v_from_list', usually in an other template\
**Parameters:** `name string, value string`\
**Localizable:** `false`\
**Return:** `string`\
**Example:** `jr template run --embedded '{{add_v_to_list "ids" "12770"}}{{random_v_from_list "ids"}}'`\
**Output:** `12770`

### get_first_n_in_list 
**Category:** context\
**Description:** returns first n elements of a list from context. The value must be set with 'add_v_to_list', usually in an other template\
**Parameters:** `name string, number int `\
**Localizable:** `false`\
**Return:** `[]string`\
**Example:** `jr template run --embedded '{{add_v_to_list "ids" "random1"}}{{add_v_to_list "ids" "random2"}}{{add_v_to_list "ids" "random3"}}{{$x := get_first_n_in_list "ids" 2}} {{range $x}}[{{.}}],{{end}}'`\
**Output:** `[random1],[random2],`

### get_list 
**Category:** context\
**Description:** returns a list from context. The value must be set with 'add_v_to_list', usually in an other template\
**Parameters:** `name string`\
**Localizable:** `false`\
**Return:** `[]string`\
**Example:** `jr template run --embedded '{{add_v_to_list "ids" "random1"}}{{add_v_to_list "ids" "random2"}}{{add_v_to_list "ids" "random3"}}{{$x := get_list "ids"}} {{range $x}}[{{.}}],{{end}}'`\
**Output:** `[random1],[random2],[random3],`

### get_v 
**Category:** context\
**Description:** returns a context value. The value must be set with 'set_v', usually in an other template\
**Parameters:** `name string`\
**Localizable:** `false`\
**Return:** `string`\
**Example:** `jr template run --embedded '{{set_v "id" "12770"}}{{get_v "id"}}'`\
**Output:** `12770`

### get_v_from_list_at_index 
**Category:** context\
**Description:** returns a specific value from a list. The list must be set with 'add_v_to_list', usually in an other template\
**Parameters:** `name string index int`\
**Localizable:** `false`\
**Return:** `string`\
**Example:** `jr template run --embedded '{{add_v_to_list "ids" "12770"}}{{get_v_from_list_at_index "ids" 0}}'`\
**Output:** `12770`

### random_n_v_from_list 
**Category:** context\
**Description:** returns n random values from a list. All values will be different. The list must be set with 'add_v_to_list', usually in an other template\
**Parameters:** `name string`\
**Localizable:** `false`\
**Return:** `string`\
**Example:** `jr template run --embedded '{{add_v_to_list "ids" "12770"}}{{add_v_to_list "ids" "12771"}}{{add_v_to_list "ids" "12772"}}{{random_n_v_from_list "ids" 2}}'`\
**Output:** `[12770,12771]`

### random_v_from_list 
**Category:** context\
**Description:** returns a random value from a list. The list must be set with 'add_v_to_list', usually in an other template\
**Parameters:** `name string`\
**Localizable:** `false`\
**Return:** `string`\
**Example:** `jr template run --embedded '{{add_v_to_list "ids" "12770"}}{{random_v_from_list "ids"}}'`\
**Output:** `12770`

### set_v 
**Category:** context\
**Description:** sets a context value. The value must be get with 'get_v', usually in an other template\
**Parameters:** `name string, value string`\
**Localizable:** `false`\
**Return:** `string`\
**Example:** `jr template run --embedded '{{set_v "id" "12770"}}{{get_v "id"}}'`\
**Output:** `12770`

Total functions: 8


## Date and Time functions


### birthdate 
**Category:** time\
**Description:** generates a birthdate in a given age range\
**Parameters:** `minAge int, maxAge int`\
**Localizable:** `false`\
**Return:** `[]string`\
**Example:** `jr template run --embedded '{{birthdate 1 23}}'`\
**Output:** `2018-06-09`

### date_between 
**Category:** time\
**Description:** generates a date between given from and to\
**Parameters:** `from string, to string`\
**Localizable:** `false`\
**Return:** `string`\
**Example:** `jr template run --embedded '{{date_between "1970-12-07" "1990-12-07"}}'`\
**Output:** `1985-06-29`

### dates_between 
**Category:** time\
**Description:** generates an array of num dates between given from and to\
**Parameters:** `from string, to string, num int`\
**Localizable:** `false`\
**Return:** `[]string`\
**Example:** `jr template run --embedded '{{dates_between "1970-12-07" "1990-12-07" 3}}'`\
**Output:** `[1974-12-27 1987-06-07 1985-08-18]`

### format_timestamp 
**Category:** time\
**Description:** formats the given timestamp with given pattern according to https://go.dev/src/time/format.go\
**Parameters:** `timestamp int64, format string`\
**Localizable:** `false`\
**Return:** `string`\
**Example:** `jr template run --embedded '{{format_timestamp 1729857168 "2006-01-02 15:04:05.000000000" }}'`\
**Output:** `2024-11-10 22:59:5`

### future 
**Category:** time\
**Description:** returns a date in the future not after the given years\
**Parameters:** `years int`\
**Localizable:** `false`\
**Return:** `string`\
**Example:** `jr template run --embedded '{{future 5}}'`\
**Output:** `2022-05-08`

### just_passed 
**Category:** time\
**Description:** returns a date in the past not before the given milliseconds\
**Parameters:** `milliseconds int`\
**Localizable:** `false`\
**Return:** `string`\
**Example:** `jr template run --embedded '{{just_passed 60000}}'`\
**Output:** `2024-11-10 22:59:5`

### now 
**Category:** time\
**Description:** returns the current time as a Unix timestamp\
**Parameters:**  \
**Localizable:** `false`\
**Return:** `int`\
**Example:** `jr template run --embedded '{{now}}'`\
**Output:** `2024-11-10 22:59:5`

### now_add 
**Category:** time\
**Description:** returns a date in the future for the given milliseconds\
**Parameters:** `milliseconds int`\
**Localizable:** `false`\
**Return:** `string`\
**Example:** `jr template run --embedded '{{now_add 60000}}'`\
**Output:** `2024-11-10 21:50:00`

### now_sub 
**Category:** time\
**Description:** returns a date in the past for the given milliseconds\
**Parameters:** `milliseconds int`\
**Localizable:** `false`\
**Return:** `string`\
**Example:** `jr template run --embedded '{{now_sub 60000}}'`\
**Output:** `2024-11-10 22:01:00`

### past 
**Category:** time\
**Description:** returns a date in the past not before the given years\
**Parameters:** `years int`\
**Localizable:** `false`\
**Return:** `string`\
**Example:** `jr template run --embedded '{{past 5}}'`\
**Output:** `2022-05-08`

### recent 
**Category:** time\
**Description:** returns a date in the past not before the given days\
**Parameters:** `days int`\
**Localizable:** `false`\
**Return:** `string`\
**Example:** `jr template run --embedded '{{recent 15}}'`\
**Output:** `2023-04-17`

### soon 
**Category:** time\
**Description:** returns a date in the future not after the given days\
**Parameters:** `days int`\
**Localizable:** `false`\
**Return:** `string`\
**Example:** `jr template run --embedded '{{soon 15}}'`\
**Output:** `2023-04-25`

### unix_time_stamp 
**Category:** time\
**Description:** returns a random unix timestamp not older than the given number of days (in seconds)\
**Parameters:** `days int`\
**Localizable:** `false`\
**Return:** `int64`\
**Example:** `jr template run --embedded '{{unix_time_stamp 10}}'`\
**Output:** `1679703304`

### unix_time_stamp_ms 
**Category:** time\
**Description:** returns a random unix timestamp not older than the given number of days (in milliseconds)\
**Parameters:** `days int`\
**Localizable:** `false`\
**Return:** `int64`\
**Example:** `jr template run --embedded '{{unix_time_stamp_ms 10}}'`\
**Output:** `1679703304`

Total functions: 14


## Finance functions


### account 
**Category:** finance\
**Description:** returns a random account number of given length\
**Parameters:** `length int`\
**Localizable:** `false`\
**Return:** `string`\
**Example:** `jr template run --embedded '{{account 10}}'`\
**Output:** `6192117146`

### amount 
**Category:** finance\
**Description:** returns an amount of money between min and max, and given currency\
**Parameters:** `min float32, max float32, currency string`\
**Localizable:** `false`\
**Return:** `string`\
**Example:** `jr template run --embedded '{{account 10 1000 "$"}}'`\
**Output:** `$7409.66`

### bitcoin 
**Category:** finance\
**Description:** returns a bitcoin address\
**Parameters:**  \
**Localizable:** `false`\
**Return:** `string`\
**Example:** `jr template run --embedded '{{bitcoin}}'`\
**Output:** `12KuG8lNm42zkk3aKd4sC0uuFM`

### card 
**Category:** finance\
**Description:** returns a random credit card number\
**Parameters:** `issuer string`\
**Localizable:** `false`\
**Return:** `string`\
**Example:** `jr template run --embedded '{{card "amex"}}'`\
**Output:** `376794009305701`

### cardCVV 
**Category:** finance\
**Description:** returns a random credit card CVV of given length\
**Parameters:** `length int`\
**Localizable:** `false`\
**Return:** `string`\
**Example:** `jr template run --embedded '{{cardCVV 3}}'`\
**Output:** `072`

### cusip 
**Category:** finance\
**Description:** returns a valid 9 characters cusip code\
**Parameters:**  \
**Localizable:** `false`\
**Return:** `string`\
**Example:** `jr template run --embedded '{{cusip}}'`\
**Output:** `DWNFYN9W2`

### ethereum 
**Category:** finance\
**Description:** returns an ethereum address\
**Parameters:**  \
**Localizable:** `false`\
**Return:** `string`\
**Example:** `jr template run --embedded '{{ethereum}}'`\
**Output:** `0xb0c2fa65e1C39bD0ADeE9c2EDfC260af81aF62f8`

### isin 
**Category:** finance\
**Description:** returns a valid 12 characters isin code\
**Parameters:**  \
**Localizable:** `false`\
**Return:** `string`\
**Example:** `jr template run --embedded '{{isin}}'`\
**Output:** ``

### sedol 
**Category:** finance\
**Description:** returns a valid 7 characters sedol code\
**Parameters:**  \
**Localizable:** `false`\
**Return:** `string`\
**Example:** `jr template run --embedded '{{sedol}}'`\
**Output:** ``

### stock_symbol 
**Category:** finance\
**Description:** returns a NASDAQ stock symbol\
**Parameters:**  \
**Localizable:** `false`\
**Return:** `string`\
**Example:** `jr template run --embedded '{{stock_symbol}}'`\
**Output:** `CFLT`

### swift 
**Category:** finance\
**Description:** returns a swift/bic code\
**Parameters:**  \
**Localizable:** `false`\
**Return:** `string`\
**Example:** `jr template run --embedded '{{swift}}'`\
**Output:** `KZMTMP84448`

### valor 
**Category:** finance\
**Description:** returns a valid 6-9 digits valor code\
**Parameters:**  \
**Localizable:** `false`\
**Return:** `string`\
**Example:** `jr template run --embedded '{{valor}}'`\
**Output:** `0832047`

### wkn 
**Category:** finance\
**Description:** returns a valid 6 characters wkn code\
**Parameters:**  \
**Localizable:** `false`\
**Return:** `string`\
**Example:** `jr template run --embedded '{{wkn}}'`\
**Output:** `UFJKSNM`

Total functions: 13


## Math functions


### add 
**Category:** math\
**Description:** adds two numbers\
**Parameters:** `first int, second int`\
**Localizable:** `false`\
**Return:** `int`\
**Example:** `jr template run --embedded '{{add 1 2}}'`\
**Output:** `3`

### add64 
**Category:** math\
**Description:** adds two numbers\
**Parameters:** `first int64, second int64`\
**Localizable:** `false`\
**Return:** `int64`\
**Example:** `jr template run --embedded '{{add64 1 2}}'`\
**Output:** `3`

### div 
**Category:** math\
**Description:** divides two numbers\
**Parameters:** `first int, second int`\
**Localizable:** `false`\
**Return:** `int`\
**Example:** `jr template run --embedded '{{div 10 2}}'`\
**Output:** `5`

### div64 
**Category:** math\
**Description:** divides two numbers\
**Parameters:** `first int64, second int64`\
**Localizable:** `false`\
**Return:** `int64`\
**Example:** `jr template run --embedded '{{div64 10 2}}'`\
**Output:** `5`

### floating 
**Category:** math\
**Description:** returns a random float64 between min and max\
**Parameters:** `min float64, max float64`\
**Localizable:** `false`\
**Return:** `float64`\
**Example:** `jr template run --embedded '{{floating 10 20}}'`\
**Output:** `13.123`

### format_float 
**Category:** math\
**Description:** returns a string with a formatted floating number\
**Parameters:** `format string, number float`\
**Localizable:** `false`\
**Return:** `string`\
**Example:** `jr template run --embedded '{{{format_float "%.2f" (floating 1 5)}}'`\
**Output:** `4.46`

### integer 
**Category:** math\
**Description:** returns a random integer between min and max\
**Parameters:** `min int, max int`\
**Localizable:** `false`\
**Return:** `int`\
**Example:** `jr template run --embedded '{{integer 10 20}}'`\
**Output:** `13`

### integer64 
**Category:** math\
**Description:** returns a random int64 between min and max\
**Parameters:** `min int64, max int64`\
**Localizable:** `false`\
**Return:** `int64`\
**Example:** `jr template run --embedded '{{integer64 10 20}}'`\
**Output:** `13`

### max 
**Category:** math\
**Description:** returns the maximum of two numbers\
**Parameters:** `first float64, second float64`\
**Localizable:** `false`\
**Return:** `float64`\
**Example:** `jr template run --embedded '{{max 10.3 2.4}}'`\
**Output:** `10.3`

### maxint 
**Category:** math\
**Description:** returns the maximum of two ints\
**Parameters:** `first int, second int`\
**Localizable:** `false`\
**Return:** `int`\
**Example:** `jr template run --embedded '{{maxint 10 2}}'`\
**Output:** `10`

### maxint64 
**Category:** math\
**Description:** returns the maximum of two ints\
**Parameters:** `first int64, second int64`\
**Localizable:** `false`\
**Return:** `int64`\
**Example:** `jr template run --embedded '{{maxint64 10 2}}'`\
**Output:** `10`

### min 
**Category:** math\
**Description:** returns the minimum of two numbers\
**Parameters:** `first float64, second float64`\
**Localizable:** `false`\
**Return:** `float64`\
**Example:** `jr template run --embedded '{{min 10.1 2.3}}'`\
**Output:** `2.3`

### minint 
**Category:** math\
**Description:** returns the minimum of two ints\
**Parameters:** `first int, second int`\
**Localizable:** `false`\
**Return:** `int`\
**Example:** `jr template run --embedded '{{minint 10 2}}'`\
**Output:** `2`

### minint64 
**Category:** math\
**Description:** returns the minimum of two ints\
**Parameters:** `first int64, second int64`\
**Localizable:** `false`\
**Return:** `int64`\
**Example:** `jr template run --embedded '{{minint64 10 2}}'`\
**Output:** `2`

### mod 
**Category:** math\
**Description:** returns the remainder of two numbers\
**Parameters:** `first int, second int`\
**Localizable:** `false`\
**Return:** `int`\
**Example:** `jr template run --embedded '{{mod 10 2}}'`\
**Output:** `0`

### mod64 
**Category:** math\
**Description:** returns the remainder of two numbers\
**Parameters:** `first int64, second int64`\
**Localizable:** `false`\
**Return:** `int64`\
**Example:** `jr template run --embedded '{{mod64 10 2}}'`\
**Output:** `0`

### mul 
**Category:** math\
**Description:** multiplies two numbers\
**Parameters:** `first int, second int`\
**Localizable:** `false`\
**Return:** `int`\
**Example:** `jr template run --embedded '{{mul 10 2}}'`\
**Output:** `20`

### mul64 
**Category:** math\
**Description:** multiplies two numbers\
**Parameters:** `first int64, second int64`\
**Localizable:** `false`\
**Return:** `int64`\
**Example:** `jr template run --embedded '{{mul64 10 2}}'`\
**Output:** `20`

### sub 
**Category:** math\
**Description:** subtracts two numbers\
**Parameters:** `first int, second int`\
**Localizable:** `false`\
**Return:** `int`\
**Example:** `jr template run --embedded '{{sub 1 2}}'`\
**Output:** `-1`

### sub64 
**Category:** math\
**Description:** subtracts two numbers\
**Parameters:** `first int64, second int64`\
**Localizable:** `false`\
**Return:** `int64`\
**Example:** `jr template run --embedded '{{sub64 1 2}}'`\
**Output:** `-1`

Total functions: 20


## Network functions


### http_method 
**Category:** network\
**Description:** returns a random http method\
**Parameters:**  \
**Localizable:** `false`\
**Return:** `string`\
**Example:** `jr template run --embedded '{{http_method}}'`\
**Output:** `GET`

### ip 
**Category:** network\
**Description:** returns a random Ip Address matching the given cidr\
**Parameters:** `cidr string`\
**Localizable:** `false`\
**Return:** `string`\
**Example:** `jr template run --embedded '{{ip "10.2.0.0/16"}}'`\
**Output:** `10.2.55.217`

### ip_known_port 
**Category:** network\
**Description:** returns a random known port number\
**Parameters:**  \
**Localizable:** `false`\
**Return:** `string`\
**Example:** `jr template run --embedded '{{ip_known_port}}'`\
**Output:** `80`

### ip_known_protocol 
**Category:** network\
**Description:** returns a random known protocol\
**Parameters:**  \
**Localizable:** `false`\
**Return:** `string`\
**Example:** `jr template run --embedded '{{ip_known_protocol}}'`\
**Output:** `tcp`

### ipv6 
**Category:** network\
**Description:** returns a random Ipv6 Address\
**Parameters:**  \
**Localizable:** `false`\
**Return:** `string`\
**Example:** `jr template run --embedded '{{ipv6}}'`\
**Output:** `2001:db8:85a3:8d3:1319:8a2e:370:7348`

### mac 
**Category:** network\
**Description:** returns a random mac Address\
**Parameters:**  \
**Localizable:** `false`\
**Return:** `string`\
**Example:** `jr template run --embedded '{{mac}}'`\
**Output:** `7e:8e:75:a5:0a:85`

Total functions: 6


## People functions


### cf 
**Category:** people\
**Description:** returns an Italian codice fiscale. Note: this function gets name, surname, gender, birthdate and city from the context\
**Parameters:**  \
**Localizable:** `false`\
**Return:** `string`\
**Example:** `jr template run --locale IT --embedded '{{cf}}'`\
**Output:** `RSSMRA70A30H501W`

### company 
**Category:** people\
**Description:** returns a random company name\
**Parameters:**  \
**Localizable:** `true`\
**Return:** `string`\
**Example:** `jr template run --embedded '{{company}}'`\
**Output:** `Umbrella Corporation`

### email 
**Category:** people\
**Description:** returns a random email. Note: it uses automatically name, surname previously used in the template\
**Parameters:**  \
**Localizable:** `true`\
**Return:** `string`\
**Example:** `jr template run --embedded '{{email_provider}}'`\
**Output:** `paul.newman@gmail.com`

### email_provider 
**Category:** people\
**Description:** returns a random email provider\
**Parameters:**  \
**Localizable:** `true`\
**Return:** `string`\
**Example:** `jr template run --embedded '{{email_provider}}'`\
**Output:** `gmail.com`

### email_work 
**Category:** people\
**Description:** returns a random email. Note: it uses automatically name, surname and company if previously used in the template\
**Parameters:**  \
**Localizable:** `true`\
**Return:** `string`\
**Example:** `jr template run --embedded '{{email_work}}'`\
**Output:** `paul.newman@bostonstatic.com`

### gender 
**Category:** people\
**Description:** returns a random gender. Note: it gets the gender context automatically setup by previous name calls\
**Parameters:**  \
**Localizable:** `false`\
**Return:** `string`\
**Example:** `jr template run --embedded '{{gender}}'`\
**Output:** `F`

### middle_name 
**Category:** people\
**Description:** returns a random middle Name\
**Parameters:**  \
**Localizable:** `true`\
**Return:** `string`\
**Example:** `jr template run --embedded '{{middle_name}}'`\
**Output:** `J`

### name 
**Category:** people\
**Description:** returns a random Name\
**Parameters:**  \
**Localizable:** `true`\
**Return:** `string`\
**Example:** `jr template run --embedded '{{name}}'`\
**Output:** `Lisa`

### name_f 
**Category:** people\
**Description:** returns a random female Name\
**Parameters:**  \
**Localizable:** `true`\
**Return:** `string`\
**Example:** `jr template run --embedded '{{name_f}}'`\
**Output:** `Lisa`

### name_m 
**Category:** people\
**Description:** returns a random male Name\
**Parameters:**  \
**Localizable:** `true`\
**Return:** `string`\
**Example:** `jr template run --embedded '{{name_m}}'`\
**Output:** `John`

### ssn 
**Category:** people\
**Description:** returns a random ssn (Social Security Number)\
**Parameters:**  \
**Localizable:** `false`\
**Return:** `string`\
**Example:** `jr template run --embedded '{{ssn}}'`\
**Output:** `834-76-1234`

### surname 
**Category:** people\
**Description:** returns a random surname\
**Parameters:**  \
**Localizable:** `true`\
**Return:** `string`\
**Example:** `jr template run --embedded '{{surname}}'`\
**Output:** `Wright`

### user 
**Category:** people\
**Description:** returns a random Username using Name, Surname and a length\
**Parameters:** `name string, surname string, length int`\
**Localizable:** `true`\
**Return:** `string`\
**Example:** `jr template run --embedded '{{user "barack" "obama" 12 }}'`\
**Output:** `barackobama75`

### username 
**Category:** people\
**Description:** returns a random Username using Name, Surname\
**Parameters:** `name string, surname string`\
**Localizable:** `true`\
**Return:** `string`\
**Example:** `jr template run --embedded '{{username "barack" "obama" }}'`\
**Output:** `b-obama`

Total functions: 14


## Phone functions


### country_code 
**Category:** phone\
**Description:** returns a random Country Code prefix\
**Parameters:**  \
**Localizable:** `false`\
**Return:** `string`\
**Example:** `jr template run --embedded '{{country_code}}'`\
**Output:** `+39`

### country_code_at 
**Category:** phone\
**Description:** returns a Country Code prefix at a given index\
**Parameters:**  \
**Localizable:** `false`\
**Return:** `string`\
**Example:** `jr template run --embedded '{{country_code_at 109}}'`\
**Output:** `+39`

### imei 
**Category:** phone\
**Description:** returns a random imei number of 15 digits\
**Parameters:**  \
**Localizable:** `false`\
**Return:** `string`\
**Example:** `jr template run --embedded '{{imei}}'`\
**Output:** `334238791972527`

### mobile_phone 
**Category:** phone\
**Description:** returns a random mobile phone\
**Parameters:**  \
**Localizable:** `false`\
**Return:** `string`\
**Example:** `jr template run --embedded '{{mobile_phone}}'`\
**Output:** `34033546096`

### mobile_phone_at 
**Category:** phone\
**Description:** returns a mobile phone at a given index\
**Parameters:**  \
**Localizable:** `false`\
**Return:** `string`\
**Example:** `jr template run --embedded '{{mobile_phone_at 79}}'`\
**Output:** `3422308090`

### phone 
**Category:** phone\
**Description:** returns a random phone\
**Parameters:**  \
**Localizable:** `false`\
**Return:** `string`\
**Example:** `jr template run --embedded '{{phone}}'`\
**Output:** `06 72358749`

### phone_at 
**Category:** phone\
**Description:** returns a phone at a given index\
**Parameters:** `index int`\
**Localizable:** `false`\
**Return:** `string`\
**Example:** `jr template run --embedded '{{phone_at 79}}'`\
**Output:** `06 72358749`

Total functions: 7


## Text functions


### atoi 
**Category:** text\
**Description:** converts a string to an integer\
**Parameters:** `string`\
**Localizable:** `false`\
**Return:** `int`\
**Example:** `jr template run --embedded '{{atoi "123"}}'`\
**Output:** `123`

### concat 
**Category:** text\
**Description:** concatenates two strings\
**Parameters:** `string string`\
**Localizable:** `false`\
**Return:** `string`\
**Example:** `jr template run --embedded '{{concat "aaa" "bbb"}}'`\
**Output:** `123`

### first 
**Category:** text\
**Description:** returns the first character of a string\
**Parameters:** `text string`\
**Localizable:** `false`\
**Return:** `string`\
**Example:** `jr template run --embedded '{{first "hello world"}}'`\
**Output:** `h`

### firstword 
**Category:** text\
**Description:** returns the first word of a text\
**Parameters:** `text string`\
**Localizable:** `false`\
**Return:** `string`\
**Example:** `jr template run --embedded '{{firstword "hello world"}}'`\
**Output:** `hello`

### from 
**Category:** text\
**Description:** returns a random string from a list of strings in a file. Files are in '$JR_SYSTEM_DIR/templates/data/locale'\
**Parameters:** `set string`\
**Localizable:** `true`\
**Return:** `string`\
**Example:** `jr template run --embedded '{{from "actor"}}'`\
**Output:** `John Travolta`

### from_at 
**Category:** text\
**Description:** returns a string at a given position in a list of strings in a file. Files are in '$JR_SYSTEM_DIR/templates/data/locale'\
**Parameters:** `index int`\
**Localizable:** `true`\
**Return:** `string`\
**Example:** `jr template run --embedded '{{from_at "actor" 3}}'`\
**Output:** `James Dean`

### from_n 
**Category:** text\
**Description:** return a subset of elements in a list of string in a file. Files are in '$JR_SYSTEM_DIR/templates/data/locale'\
**Parameters:** `set string, number int`\
**Localizable:** `true`\
**Return:** `[]string`\
**Example:** `jr template run --embedded '{{from_n "State" 5}}'`\
**Output:** `[West Virginia Idaho Maryland New Hampshire Wyoming]`

### from_shuffle 
**Category:** text\
**Description:** returns a shuffled list of strings in a file. Files are in '$JR_SYSTEM_DIR/templates/data/locale'\
**Parameters:** `set string`\
**Localizable:** `true`\
**Return:** `[]string`\
**Example:** `jr template run --embedded '{{from_shuffle "state_short"}}'`\
**Output:** `[ND IL MO WA NC SD MS PA AZ HI DE SC WI WV TN AL MA IA NH NV OH VA WY MT MN NM LA OK IN CA OR VT MD NY RI UT AK NE AR CO FL ID KY TX ME GA NJ MI KS CT]`

### index_of 
**Category:** text\
**Description:** returns the index of s in 'name' file \
**Parameters:** `s string, name string`\
**Localizable:** `false`\
**Return:** `string`\
**Example:** `jr template run --embedded '{{index_of  "New York" "city"}}'`\
**Output:** `27`

### itoa 
**Category:** text\
**Description:** converts an integer to a string\
**Parameters:** `int`\
**Localizable:** `false`\
**Return:** `string`\
**Example:** `jr template run --embedded '{{itoa 123}}'`\
**Output:** `123`

### join 
**Category:** text\
**Description:** joins a list of strings with a separator\
**Parameters:** `strings []string`\
**Localizable:** `false`\
**Return:** `string`\
**Example:** `jr template run --embedded '{{join "hello," "world"}}'`\
**Output:** `hello,world`

### len 
**Category:** text\
**Description:** returns the length a list of strings in a file. Files are in '$JR_SYSTEM_DIR/templates/data/locale'\
**Parameters:** `set string`\
**Localizable:** `true`\
**Return:** `string`\
**Example:** `jr template run --embedded '{{len "city"}}'`\
**Output:** `46`

### lorem 
**Category:** text\
**Description:** generates a Lorem ipsum string\
**Parameters:** `words int`\
**Localizable:** `false`\
**Return:** `string`\
**Example:** `jr template run --embedded '{{lorem 10}}'`\
**Output:** `Lorem ipsum dolor sit amet, consectetur adipiscing elit.Fusce elit magna.`

### lower 
**Category:** text\
**Description:** converts a string to lowercase\
**Parameters:** `text string`\
**Localizable:** `false`\
**Return:** `string`\
**Example:** `jr template run --embedded '{{lower "HELLO"}}'`\
**Output:** `hello`

### markov 
**Category:** text\
**Description:** generates a markov chain from a string\
**Parameters:** `chain int, text string`\
**Localizable:** `false`\
**Return:** `string`\
**Example:** `jr template run --embedded '{{markov 10 "hello world"}}'`\
**Output:** `hello world`

### random 
**Category:** text\
**Description:** returns a random string from a list of strings\
**Parameters:** `list []string`\
**Localizable:** `false`\
**Return:** `string`\
**Example:** `jr template run --embedded '{{dates_between "1970-12-07" "1990-12-07" 10 | random}}'`\
**Output:** `hello`

### random_index 
**Category:** text\
**Description:** returns a random index from a list of strings in a file. Files are in '$JR_SYSTEM_DIR/templates/data/locale'\
**Parameters:** `set string`\
**Localizable:** `true`\
**Return:** `string`\
**Example:** `jr template run --embedded '{{random_index "city"}}'`\
**Output:** `12`

### random_string 
**Category:** text\
**Description:** returns a random string long between min and max characters\
**Parameters:** `min int, max int, vocabulary string`\
**Localizable:** `false`\
**Return:** `string`\
**Example:** `jr template run --embedded '{{random_string 3 10}}'`\
**Output:** `YBCEjxmn`

### random_string_vocabulary 
**Category:** text\
**Description:** returns a random string long between min and max characters using a vocabulary\
**Parameters:** `min int, max int, vocabulary string`\
**Localizable:** `false`\
**Return:** `string`\
**Example:** `jr template run --embedded '{{random_string_vocabulary 3 10 "hello world"}}'`\
**Output:** `llolh`

### randoms 
**Category:** text\
**Description:** returns a random strings from a | separated list string\
**Parameters:** `list string`\
**Localizable:** `false`\
**Return:** `string`\
**Example:** `jr template run --embedded '{{randoms "ALPHA|BETA|GAMMA|DELTA"}}'`\
**Output:** `BETA`

### regex 
**Category:** text\
**Description:** returns a random string matching the Regex\
**Parameters:** `regex string`\
**Localizable:** `false`\
**Return:** `string`\
**Example:** `jr template run --embedded '{{regex "[a-z]{5}"}}'`\
**Output:** `xxlbh`

### repeat 
**Category:** text\
**Description:** repeats a string a number of times\
**Parameters:** `text string, number int`\
**Localizable:** `false`\
**Return:** `string`\
**Example:** `jr template run --embedded '{{repeat "hello" 3}}'`\
**Output:** `hellohellohello`

### replaceall 
**Category:** text\
**Description:** replaces all instances of a string with another string\
**Parameters:** `set string, original string, replaced string`\
**Localizable:** `false`\
**Return:** `string`\
**Example:** `jr template run --embedded '{{replaceall "hello world" "hello" "goodbye"}}'`\
**Output:** `goodbye world`

### sentence 
**Category:** text\
**Description:** generates a random Sentence of n words\
**Parameters:** `words int`\
**Localizable:** `false`\
**Return:** `string`\
**Example:** `jr template run --embedded '{{sentence 15}}'`\
**Output:** `Alice was not going to happen next. First, she tried to curtsey as she fell`

### sentence_prefix 
**Category:** text\
**Description:** generates a random Sentence of n words, with a prefix length\
**Parameters:** `prefix int, length int`\
**Localizable:** `false`\
**Return:** `string`\
**Example:** `jr template run --embedded '{{sentence_prefix 3 15}}'`\
**Output:** `Alice was beginning to get very tired of sitting by her sister on the bank.`

### split 
**Category:** text\
**Description:** splits a string into a list of strings\
**Parameters:** `text string, separator string`\
**Localizable:** `false`\
**Return:** `[]string`\
**Example:** `jr template run --embedded '{{split "hello,world" ","}}'`\
**Output:** `[hello world]`

### squeeze 
**Category:** text\
**Description:** removes all spaces from a string\
**Parameters:** `text string`\
**Localizable:** `false`\
**Return:** `string`\
**Example:** `jr template run --embedded '{{squeeze " hello   world "}}'`\
**Output:** `helloworld`

### squeezechars 
**Category:** text\
**Description:** removes all instances of a character from a string\
**Parameters:** `set string, chars string`\
**Localizable:** `false`\
**Return:** `string`\
**Example:** `jr template run --embedded '{{squeezechars "hello world" "l"}}'`\
**Output:** `heo word`

### substr 
**Category:** text\
**Description:** returns a substring of a string\
**Parameters:** `from int, to int, text string`\
**Localizable:** `false`\
**Return:** `string`\
**Example:** `jr template run --embedded '{{substr 0 5 "hello world"}}'`\
**Output:** `hello`

### title 
**Category:** text\
**Description:** converts a string to title case\
**Parameters:** `text string`\
**Localizable:** `false`\
**Return:** `string`\
**Example:** `jr template run --embedded '{{title "hello world"}}'`\
**Output:** `Hello World`

### trim 
**Category:** text\
**Description:** trims whitespace from a string\
**Parameters:** `text string`\
**Localizable:** `false`\
**Return:** `string`\
**Example:** `jr template run --embedded '{{trim " hello world "}}'`\
**Output:** `hello world`

### trimchars 
**Category:** text\
**Description:** trims all characters in the given set from the beginning and end of a string\
**Parameters:** `set string, chars string`\
**Localizable:** `false`\
**Return:** `string`\
**Example:** `jr template run --embedded '{{trimchars "hello world" "hld"}}'`\
**Output:** `ello wor`

### upper 
**Category:** text\
**Description:** converts a string to uppercase\
**Parameters:** `text string`\
**Localizable:** `false`\
**Return:** `string`\
**Example:** `jr template run --embedded '{{upper "hello"}}'`\
**Output:** `HELLO`

Total functions: 33


## Utilities functions


### array 
**Category:** utilities\
**Description:** returns an empty array of given size\
**Parameters:** `size int`\
**Localizable:** `false`\
**Return:** `array`\
**Example:** `jr template run --embedded '{{array 5}}'`\
**Output:** `[0,0,0,0,0]`

### bool 
**Category:** utilities\
**Description:** returns a random boolean\
**Parameters:**  \
**Localizable:** `false`\
**Return:** `bool`\
**Example:** `jr template run --embedded '{{bool}}'`\
**Output:** `true`

### counter 
**Category:** utilities\
**Description:** returns a named counter, starting at n incrementing by i\
**Parameters:** `name string, start int, step int`\
**Localizable:** `false`\
**Return:** `int`\
**Example:** `jr template run -n 5 --embedded '{{counter "mycounter" 0 1}}'`\
**Output:** `
0
1
2
3
4`

### fromcsv 
**Category:** utilities\
**Description:** returns a value for given column label from a csv file row\
**Parameters:** `string`\
**Localizable:** `false`\
**Return:** `string`\
**Example:** `jr template run --embedded '{{fromcsv "NAME"}}' --csv testfiles/test2.csv`\
**Output:** `John`

### inject 
**Category:** utilities\
**Description:** inject a string with a given probability between 0 (never) and 1 (always): useful to inject errors\
**Parameters:** `probability float64, injected any, original any`\
**Localizable:** `false`\
**Return:** `any`\
**Example:** `jr template run --embedded '{{$bad_city:=regex "[A-Z]{5}"}}{{city | inject 0.5 $bad_city}}'`\
**Output:** `Portland|ZPTAC`

### key 
**Category:** utilities\
**Description:** returns a random key string using a prefix and a length\
**Parameters:** `prefix string, length int`\
**Localizable:** `false`\
**Return:** `string`\
**Example:** `jr template run --embedded '{{key "KEY" 20}}'`\
**Output:** `KEY4`

### seed 
**Category:** utilities\
**Description:** set seed directly in a template\
**Parameters:** `rndSeed int64`\
**Localizable:** `false`\
**Return:** ` `\
**Example:** `jr template run --embedded '{{seed 12345}}'`\
**Output:** ``

### uuid 
**Category:** utilities\
**Description:** returns a random uuid\
**Parameters:**  \
**Localizable:** `false`\
**Return:** `string`\
**Example:** `jr template run --embedded '{{uuid}}'`\
**Output:** `a6da3ed0-5fcb-4bb8-a6aa-654120a1e6e3`

### yesorno 
**Category:** utilities\
**Description:** returns a random yes or no\
**Parameters:**  \
**Localizable:** `false`\
**Return:** `string`\
**Example:** `jr template run --embedded '{{yesorno}}'`\
**Output:** `yes`

Total functions: 9

