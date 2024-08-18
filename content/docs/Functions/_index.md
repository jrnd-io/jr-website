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
You can look at this list via ```jr man``` command.

## Address functions

### Name: building
**Category:** address\
**Description:** returns a random building number of max n digits\
**Parameters:** `n int`\
**Localizable:** `false`\
**Return:** `string`\
**Example:** `jr template run --embedded '{{building 3}}'`\
**Output:** `982`

### Name: capital
**Category:** address\
**Description:** returns a random capital\
**Parameters:**  \
**Localizable:** `true`\
**Return:** `string`\
**Example:** `jr template run --embedded '{{capital}}'`\
**Output:** `Phoenix`

## Name: capital_at
**Category:** address\
**Description:** returns capital at given index\
**Parameters:** `index int`\
**Localizable:** `true`\
**Return:** `string`\
**Example:** `jr template run --embedded '{{capital_at 4}}'`\
**Output:** `Sacramento`

## Name: cardinal
**Category:** address\
**Description:** returns a random cardinal direction\
**Parameters:** `short bool`\
**Localizable:** `false`\
**Return:** `string`\
**Example:** `jr template run --embedded '{{cardinal false}} {{cardinal true}}'`\
**Output:** `North-Ovest SE`

## Name: city
**Category:** address\
**Description:** returns a random city\
**Parameters:**  \
**Localizable:** `true`\
**Return:** `string`\
**Example:** `jr template run --embedded '{{city}}'`\
**Output:** `New York`

## Name: city_at
**Category:** address\
**Description:** returns a city at given index\
**Parameters:** `index int`\
**Localizable:** `true`\
**Return:** `string`\
**Example:** `jr template run --embedded '{{city_at 1}}'`\
**Output:** `Austin`

## Name: country
**Category:** address\
**Description:** returns the ISO 3166 country code (selected locale)\
**Parameters:**  \
**Localizable:** `true`\
**Return:** `string`\
**Example:** `jr --locale it run --embedded '{{country}}'`\
**Output:** `IT`

## Name: country_at
**Category:** address\
**Description:** returns an ISO 3166 country code at a given index\
**Parameters:**  \
**Localizable:** `true`\
**Return:** `string`\
**Example:** `jr template run --embedded '{{country_at 109}}'`\
**Output:** `IT`

## Name: country_random
**Category:** address\
**Description:** returns a random ISO 3166 country code\
**Parameters:**  \
**Localizable:** `true`\
**Return:** `string`\
**Example:** `jr template run --embedded '{{country}}'`\
**Output:** `IT`

## Name: latitude
**Category:** address\
**Description:** returns a random latitude between -90 and 90 degrees\
**Parameters:**  \
**Localizable:** `false`\
**Return:** `string`\
**Example:** `jr template run --embedded '{{latitude}}'`\
**Output:** ``

## Name: longitude
**Category:** address\
**Description:** returns a random longitude between -180 and 180 degrees\
**Parameters:**  \
**Localizable:** `false`\
**Return:** `string`\
**Example:** `jr template run --embedded '{{longitude}}'`\
**Output:** ``

## Name: nearby_gps
**Category:** address\
**Description:** returns a random latitude longitude within a given radius in meters\
**Parameters:** `latitude float64, longitude float64, radius int`\
**Localizable:** `false`\
**Return:** `string`\
**Example:** `jr template run --embedded '{{nearby_gps 41.9028 12.4964 1000}}'`\
**Output:** `41.8963 12.4975`

## Name: state
**Category:** address\
**Description:** returns a random state\
**Parameters:**  \
**Localizable:** `true`\
**Return:** `string`\
**Example:** `jr template run --embedded '{{state}}'`\
**Output:** `New York`

## Name: state_at
**Category:** address\
**Description:** returns state at given index\
**Parameters:** `index int`\
**Localizable:** `true`\
**Return:** `string`\
**Example:** `jr template run --embedded '{{state_at 3}}'`\
**Output:** `Arkansas`

## Name: state_short
**Category:** address\
**Description:** returns a random short State\
**Parameters:**  \
**Localizable:** `true`\
**Return:** `string`\
**Example:** `jr template run --embedded '{{state_short}}'`\
**Output:** `KY`

## Name: state_short_at
**Category:** address\
**Description:** returns short State at given index\
**Parameters:** `index int`\
**Localizable:** `true`\
**Return:** `string`\
**Example:** `jr template run --embedded '{{state_short_at 3}}'`\
**Output:** `AR`

## Name: street
**Category:** address\
**Description:** returns a random street\
**Parameters:**  \
**Localizable:** `true`\
**Return:** `string`\
**Example:** `jr template run --embedded '{{street}}'`\
**Output:** `Union Street`

## Name: zip
**Category:** address\
**Description:** returns a random zip code\
**Parameters:**  \
**Localizable:** `true`\
**Return:** `string`\
**Example:** `jr template run --embedded '{{zip}}'`\
**Output:** `21401`

## Name: zip_at
**Category:** address\
**Description:** returns Zip code at given index\
**Parameters:** `index int`\
**Localizable:** `true`\
**Return:** `string`\
**Example:** `jr template run --embedded '{{zip_at 3}}'`\
**Output:** `72201`

## Context functions

## Name: add_v_to_list
**Category:** context\
**Description:** adds a context value to a list. A random value from the list can be obtained with 'random_v_from_list', usually in an other template\
**Parameters:** `name string, value string`\
**Localizable:** `false`\
**Return:** `string`\
**Example:** `jr template run --embedded '{{add_v_to_list "ids" "12770"}}{{random_v_from_list "ids"}}'`\
**Output:** `12770`

## Name: get_v
**Category:** context\
**Description:** returns a context value. The value must be set with 'set_v', usually in an other template\
**Parameters:** `name string`\
**Localizable:** `false`\
**Return:** `string`\
**Example:** `jr template run --embedded '{{set_v "id" "12770"}}{{get_v "id"}}'`\
**Output:** `12770`

## Name: get_v_from_list_at_index
**Category:** context\
**Description:** returns a specific value from a list. The list must be set with 'add_v_to_list', usually in an other template\
**Parameters:** `name string index int`\
**Localizable:** `false`\
**Return:** `string`\
**Example:** `jr template run --embedded '{{add_v_to_list "ids" "12770"}}{{get_v_from_list_at_index "ids" 0}}'`\
**Output:** `12770`

## Name: random_n_v_from_list
**Category:** context\
**Description:** returns n random values from a list. All values will be different. The list must be set with 'add_v_to_list', usually in an other template\
**Parameters:** `name string`\
**Localizable:** `false`\
**Return:** `string`\
**Example:** `jr template run --embedded '{{add_v_to_list "ids" "12770"}}{{add_v_to_list "ids" "12771"}}{{add_v_to_list "ids" "12772"}}{{random_n_v_from_list "ids" 2}}'`\
**Output:** `[12770,12771]`

## Name: random_v_from_list
**Category:** context\
**Description:** returns a random value from a list. The list must be set with 'add_v_to_list', usually in an other template\
**Parameters:** `name string`\
**Localizable:** `false`\
**Return:** `string`\
**Example:** `jr template run --embedded '{{add_v_to_list "ids" "12770"}}{{random_v_from_list "ids"}}'`\
**Output:** `12770`

## Name: set_v
**Category:** context\
**Description:** sets a context value. The value must be get with 'get_v', usually in an other template\
**Parameters:** `name string, value string`\
**Localizable:** `false`\
**Return:** `string`\
**Example:** `jr template run --embedded '{{set_v "id" "12770"}}{{get_v "id"}}'`\
**Output:** `12770`

## Finance functions 

## Name: account
**Category:** finance\
**Description:** returns a random account number of given length\
**Parameters:** `length int`\
**Localizable:** `false`\
**Return:** `string`\
**Example:** `jr template run --embedded '{{account 10}}'`\
**Output:** `6192117146`

## Name: amount
**Category:** finance\
**Description:** returns an amount of money between min and max, and given currency\
**Parameters:** `min float32, max float32, currency string`\
**Localizable:** `false`\
**Return:** `string`\
**Example:** `jr template run --embedded '{{account 10 1000 "$"}}'`\
**Output:** `$7409.66`

## Name: bitcoin
**Category:** finance\
**Description:** returns a bitcoin address\
**Parameters:**  \
**Localizable:** `false`\
**Return:** `string`\
**Example:** `jr template run --embedded '{{bitcoin}}'`\
**Output:** `12KuG8lNm42zkk3aKd4sC0uuFM`

## Name: card
**Category:** finance\
**Description:** returns a random credit card number\
**Parameters:** `issuer string`\
**Localizable:** `false`\
**Return:** `string`\
**Example:** `jr template run --embedded '{{card "amex"}}'`\
**Output:** `376794009305701`

## Name: cardCVV
**Category:** finance\
**Description:** returns a random credit card CVV of given length\
**Parameters:** `length int`\
**Localizable:** `false`\
**Return:** `string`\
**Example:** `jr template run --embedded '{{cardCVV 3}}'`\
**Output:** `072`

## Name: cusip
**Category:** finance\
**Description:** returns a valid 9 characters cusip code\
**Parameters:**  \
**Localizable:** `false`\
**Return:** `string`\
**Example:** `jr template run --embedded '{{cusip}}'`\
**Output:** `DWNFYN9W2`

## Name: ethereum
**Category:** finance\
**Description:** returns an ethereum address\
**Parameters:**  \
**Localizable:** `false`\
**Return:** `string`\
**Example:** `jr template run --embedded '{{ethereum}}'`\
**Output:** `0xb0c2fa65e1C39bD0ADeE9c2EDfC260af81aF62f8`

## Name: isin
**Category:** finance\
**Description:** returns a valid 12 characters isin code\
**Parameters:**  \
**Localizable:** `false`\
**Return:** `string`\
**Example:** `jr template run --embedded '{{isin}}'`\
**Output:** ``

## Name: sedol
**Category:** finance\
**Description:** returns a valid 7 characters sedol code\
**Parameters:**  \
**Localizable:** `false`\
**Return:** `string`\
**Example:** `jr template run --embedded '{{sedol}}'`\
**Output:** ``

## Name: stock_symbol
**Category:** finance\
**Description:** returns a NASDAQ stock symbol\
**Parameters:**  \
**Localizable:** `false`\
**Return:** `string`\
**Example:** `jr template run --embedded '{{stock_symbol}}'`\
**Output:** `CFLT`

## Name: swift
**Category:** finance\
**Description:** returns a swift/bic code\
**Parameters:**  \
**Localizable:** `false`\
**Return:** `string`\
**Example:** `jr template run --embedded '{{swift}}'`\
**Output:** `KZMTMP84448`

## Name: valor
**Category:** finance\
**Description:** returns a valid 6-9 digits valor code\
**Parameters:**  \
**Localizable:** `false`\
**Return:** `string`\
**Example:** `jr template run --embedded '{{valor}}'`\
**Output:** `0832047`

## Name: wkn
**Category:** finance\
**Description:** returns a valid 6 characters wkn code\
**Parameters:**  \
**Localizable:** `false`\
**Return:** `string`\
**Example:** `jr template run --embedded '{{wkn}}'`\
**Output:** `UFJKSNM`

## Math functions

## Name: add
**Category:** math\
**Description:** adds two numbers\
**Parameters:** `first int, second int`\
**Localizable:** `false`\
**Return:** `int`\
**Example:** `jr template run --embedded '{{add 1 2}}'`\
**Output:** `3`

## Name: div
**Category:** math\
**Description:** divides two numbers\
**Parameters:** `first int, second int`\
**Localizable:** `false`\
**Return:** `int`\
**Example:** `jr template run --embedded '{{div 10 2}}'`\
**Output:** `5`

## Name: floating
**Category:** math\
**Description:** returns a random float64 between min and max\
**Parameters:** `min float64, max float64`\
**Localizable:** `false`\
**Return:** `float64`\
**Example:** `jr template run --embedded '{{floating 10 20}}'`\
**Output:** `13.123`

## Name: format_float
**Category:** math\
**Description:** returns a string with a formatted floating number\
**Parameters:** `format string, number float`\
**Localizable:** `false`\
**Return:** `string`\
**Example:** `jr template run --embedded '{{{format_float "%.2f" (floating 1 5)}}'`\
**Output:** `4.46`

## Name: integer
**Category:** math\
**Description:** returns a random integer between min and max\
**Parameters:** `min int, max int`\
**Localizable:** `false`\
**Return:** `int`\
**Example:** `jr template run --embedded '{{integer 10 20}}'`\
**Output:** `13`

## Name: integer64
**Category:** math\
**Description:** returns a random int64 between min and max\
**Parameters:** `min int64, max int64`\
**Localizable:** `false`\
**Return:** `int64`\
**Example:** `jr template run --embedded '{{integer64 10 20}}'`\
**Output:** `13`

## Name: max
**Category:** math\
**Description:** returns the maximum of two numbers\
**Parameters:** `first int|float, second int|float`\
**Localizable:** `false`\
**Return:** `int`\
**Example:** `jr template run --embedded '{{max 10.3 2.4}}'`\
**Output:** `10.3`

## Name: max
**Category:** math\
**Description:** returns the maximum of two ints\
**Parameters:** `first int, second int`\
**Localizable:** `false`\
**Return:** `int`\
**Example:** `jr template run --embedded '{{max 10 2}}'`\
**Output:** `10`

## Name: min
**Category:** math\
**Description:** returns the minimum of two numbers\
**Parameters:** `first int|float, second int|float`\
**Localizable:** `false`\
**Return:** `int`\
**Example:** `jr template run --embedded '{{min 10.1 2.3}}'`\
**Output:** `2.3`

## Name: min
**Category:** math\
**Description:** returns the minimum of two ints\
**Parameters:** `first int, second int`\
**Localizable:** `false`\
**Return:** `int`\
**Example:** `jr template run --embedded '{{min 10 2}}'`\
**Output:** `2`

## Name: mod
**Category:** math\
**Description:** returns the remainder of two numbers\
**Parameters:** `first int, second int`\
**Localizable:** `false`\
**Return:** `int`\
**Example:** `jr template run --embedded '{{mod 10 2}}'`\
**Output:** `0`

## Name: mul
**Category:** math\
**Description:** multiplies two numbers\
**Parameters:** `first int, second int`\
**Localizable:** `false`\
**Return:** `int`\
**Example:** `jr template run --embedded '{{mul 10 2}}'`\
**Output:** `20`

## Name: sub
**Category:** math\
**Description:** subtracts two numbers\
**Parameters:** `first int, second int`\
**Localizable:** `false`\
**Return:** `int`\
**Example:** `jr template run --embedded '{{sub 1 2}}'`\
**Output:** `-1`

## Network functions

## Name: http_method
**Category:** network\
**Description:** returns a random http method\
**Parameters:**  \
**Localizable:** `false`\
**Return:** `string`\
**Example:** `jr template run --embedded '{{http_method}}'`\
**Output:** `GET`

## Name: ip
**Category:** network\
**Description:** returns a random Ip Address matching the given cidr\
**Parameters:** `cidr string`\
**Localizable:** `false`\
**Return:** `string`\
**Example:** `jr template run --embedded '{{ip "10.2.0.0/16"}}'`\
**Output:** `10.2.55.217`

## Name: ip_known_port
**Category:** network\
**Description:** returns a random known port number\
**Parameters:**  \
**Localizable:** `false`\
**Return:** `string`\
**Example:** `jr template run --embedded '{{ip_known_port}}'`\
**Output:** `80`

## Name: ip_known_protocol
**Category:** network\
**Description:** returns a random known protocol\
**Parameters:**  \
**Localizable:** `false`\
**Return:** `string`\
**Example:** `jr template run --embedded '{{ip_known_protocol}}'`\
**Output:** `tcp`

## Name: ipv6
**Category:** network\
**Description:** returns a random Ipv6 Address\
**Parameters:**  \
**Localizable:** `false`\
**Return:** `string`\
**Example:** `jr template run --embedded '{{ipv6}}'`\
**Output:** `2001:db8:85a3:8d3:1319:8a2e:370:7348`

## Name: mac
**Category:** network\
**Description:** returns a random mac Address\
**Parameters:**  \
**Localizable:** `false`\
**Return:** `string`\
**Example:** `jr template run --embedded '{{mac}}'`\
**Output:** `7e:8e:75:a5:0a:85`

## People functions

## Name: cf
**Category:** people\
**Description:** returns an Italian codice fiscale. Note: this function gets name, surname, gender, birthdate and city from the context\
**Parameters:**  \
**Localizable:** `false`\
**Return:** `string`\
**Example:** `jr template run --locale IT --embedded '{{cf}}'`\
**Output:** `RSSMRA70A30H501W`

## Name: company
**Category:** people\
**Description:** returns a random company name\
**Parameters:**  \
**Localizable:** `true`\
**Return:** `string`\
**Example:** `jr template run --embedded '{{company}}'`\
**Output:** `Umbrella Corporation`

## Name: email
**Category:** people\
**Description:** returns a random email. Note: it uses automatically name, surname previously used in the template\
**Parameters:**  \
**Localizable:** `true`\
**Return:** `string`\
**Example:** `jr template run --embedded '{{email_provider}}'`\
**Output:** `paul.newman@gmail.com`

## Name: email_provider
**Category:** people\
**Description:** returns a random email provider\
**Parameters:**  \
**Localizable:** `true`\
**Return:** `string`\
**Example:** `jr template run --embedded '{{email_provider}}'`\
**Output:** `gmail.com`

## Name: email_work
**Category:** people\
**Description:** returns a random email. Note: it uses automatically name, surname and company if previously used in the template\
**Parameters:**  \
**Localizable:** `true`\
**Return:** `string`\
**Example:** `jr template run --embedded '{{email_work}}'`\
**Output:** `paul.newman@bostonstatic.com`

## Name: gender
**Category:** people\
**Description:** returns a random gender. Note: it gets the gender context automatically setup by previous name calls\
**Parameters:**  \
**Localizable:** `false`\
**Return:** `string`\
**Example:** `jr template run --embedded '{{gender}}'`\
**Output:** `F`

## Name: middle_name
**Category:** people\
**Description:** returns a random middle Name\
**Parameters:**  \
**Localizable:** `true`\
**Return:** `string`\
**Example:** `jr template run --embedded '{{middle_name}}'`\
**Output:** `J`

## Name: name
**Category:** people\
**Description:** returns a random Name\
**Parameters:**  \
**Localizable:** `true`\
**Return:** `string`\
**Example:** `jr template run --embedded '{{name}}'`\
**Output:** `Lisa`

## Name: name_f
**Category:** people\
**Description:** returns a random female Name\
**Parameters:**  \
**Localizable:** `true`\
**Return:** `string`\
**Example:** `jr template run --embedded '{{name_f}}'`\
**Output:** `Lisa`

## Name: name_m
**Category:** people\
**Description:** returns a random male Name\
**Parameters:**  \
**Localizable:** `true`\
**Return:** `string`\
**Example:** `jr template run --embedded '{{name_m}}'`\
**Output:** `John`

## Name: ssn
**Category:** people\
**Description:** returns a random ssn (Social Security Number)\
**Parameters:**  \
**Localizable:** `false`\
**Return:** `string`\
**Example:** `jr template run --embedded '{{ssn}}'`\
**Output:** `834-76-1234`

## Name: surname
**Category:** people\
**Description:** returns a random surname\
**Parameters:**  \
**Localizable:** `true`\
**Return:** `string`\
**Example:** `jr template run --embedded '{{surname}}'`\
**Output:** `Wright`

## Name: user
**Category:** people\
**Description:** returns a random Username using Name, Surname and a length\
**Parameters:** `name string, surname string, length int`\
**Localizable:** `true`\
**Return:** `string`\
**Example:** `jr template run --embedded '{{user "barack" "obama" 12 }}'`\
**Output:** `barackobama75`

## Name: username
**Category:** people\
**Description:** returns a random Username using Name, Surname\
**Parameters:** `name string, surname string`\
**Localizable:** `true`\
**Return:** `string`\
**Example:** `jr template run --embedded '{{username "barack" "obama" }}'`\
**Output:** `b-obama`

## Phone functions

## Name: country_code
**Category:** phone\
**Description:** returns a random Country Code prefix\
**Parameters:**  \
**Localizable:** `false`\
**Return:** `string`\
**Example:** `jr template run --embedded '{{country_code}}'`\
**Output:** `+39`

## Name: country_code_at
**Category:** phone\
**Description:** returns a Country Code prefix at a given index\
**Parameters:**  \
**Localizable:** `false`\
**Return:** `string`\
**Example:** `jr template run --embedded '{{country_code_at 109}}'`\
**Output:** `+39`

## Name: imei
**Category:** phone\
**Description:** returns a random imei number of 15 digits\
**Parameters:**  \
**Localizable:** `false`\
**Return:** `string`\
**Example:** `jr template run --embedded '{{imei}}'`\
**Output:** `334238791972527`

## Name: mobile_phone
**Category:** phone\
**Description:** returns a random mobile phone\
**Parameters:**  \
**Localizable:** `false`\
**Return:** `string`\
**Example:** `jr template run --embedded '{{mobile_phone}}'`\
**Output:** `34033546096`

## Name: mobile_phone_at
**Category:** phone\
**Description:** returns a mobile phone at a given index\
**Parameters:**  \
**Localizable:** `false`\
**Return:** `string`\
**Example:** `jr template run --embedded '{{mobile_phone_at 79}}'`\
**Output:** `3422308090`

## Name: phone
**Category:** phone\
**Description:** returns a random phone\
**Parameters:**  \
**Localizable:** `false`\
**Return:** `string`\
**Example:** `jr template run --embedded '{{phone}}'`\
**Output:** `06 72358749`

## Name: phone_at
**Category:** phone\
**Description:** returns a phone at a given index\
**Parameters:** `index int`\
**Localizable:** `false`\
**Return:** `string`\
**Example:** `jr template run --embedded '{{phone_at 79}}'`\
**Output:** `06 72358749`

## Text functions

## Name: atoi
**Category:** text\
**Description:** converts a string to an integer\
**Parameters:** `string`\
**Localizable:** `false`\
**Return:** `int`\
**Example:** `jr template run --embedded '{{atoi "123"}}'`\
**Output:** `123`

## Name: concat
**Category:** text\
**Description:** converts an integer to a string\
**Parameters:** `string string`\
**Localizable:** `false`\
**Return:** `string`\
**Example:** `jr template run --embedded '{{concat "aaa" "bbb"}}'`\
**Output:** `123`

## Name: first
**Category:** text\
**Description:** returns the first character of a string\
**Parameters:** `text string`\
**Localizable:** `false`\
**Return:** `string`\
**Example:** `jr template run --embedded '{{first "hello world"}}'`\
**Output:** `h`

## Name: firstword
**Category:** text\
**Description:** returns the first word of a text\
**Parameters:** `text string`\
**Localizable:** `false`\
**Return:** `string`\
**Example:** `jr template run --embedded '{{firstword "hello world"}}'`\
**Output:** `hello`

## Name: from
**Category:** text\
**Description:** returns a random string from a list of strings in a file. Files are in '$JR_SYSTEM_DIR/templates/data/locale'\
**Parameters:** `set string`\
**Localizable:** `true`\
**Return:** `string`\
**Example:** `jr template run --embedded '{{from "actor"}}'`\
**Output:** `John Travolta`

## Name: from_at
**Category:** text\
**Description:** returns a string at a given position in a list of strings in a file. Files are in '$JR_SYSTEM_DIR/templates/data/locale'\
**Parameters:** `index int`\
**Localizable:** `true`\
**Return:** `string`\
**Example:** `jr template run --embedded '{{from_at "actor" 3}}'`\
**Output:** `James Dean`

## Name: from_n
**Category:** text\
**Description:** return a subset of elements in a list of string in a file. Files are in '$JR_SYSTEM_DIR/templates/data/locale'\
**Parameters:** `set string, number int`\
**Localizable:** `true`\
**Return:** `[]string`\
**Example:** `jr template run --embedded '{{from_n "State" 5}}'`\
**Output:** `[West Virginia Idaho Maryland New Hampshire Wyoming]`

## Name: from_shuffle
**Category:** text\
**Description:** returns a shuffled list of strings in a file. Files are in '$JR_SYSTEM_DIR/templates/data/locale'\
**Parameters:** `set string`\
**Localizable:** `true`\
**Return:** `[]string`\
**Example:** `jr template run --embedded '{{from_shuffle "state_short"}}'`\
**Output:** `[ND IL MO WA NC SD MS PA AZ HI DE SC WI WV TN AL MA IA NH NV OH VA WY MT MN NM LA OK IN CA OR VT MD NY RI UT AK NE AR CO FL ID KY TX ME GA NJ MI KS CT]`

## Name: index_of
**Category:** text\
**Description:** returns the index of s in 'name' file \
**Parameters:** `s string, name string`\
**Localizable:** `false`\
**Return:** `string`\
**Example:** `jr template run --embedded '{{index_of  "New York" "city"}}'`\
**Output:** `27`

## Name: itoa
**Category:** text\
**Description:** converts an integer to a string\
**Parameters:** `int`\
**Localizable:** `false`\
**Return:** `string`\
**Example:** `jr template run --embedded '{{itoa 123}}'`\
**Output:** `123`

## Name: join
**Category:** text\
**Description:** joins a list of strings with a separator\
**Parameters:** `strings []string`\
**Localizable:** `false`\
**Return:** `string`\
**Example:** `jr template run --embedded '{{join "hello," "world"}}'`\
**Output:** `hello,world`

## Name: len
**Category:** text\
**Description:** returns the length a list of strings in a file. Files are in '$JR_SYSTEM_DIR/templates/data/locale'\
**Parameters:** `set string`\
**Localizable:** `true`\
**Return:** `string`\
**Example:** `jr template run --embedded '{{len "city"}}'`\
**Output:** `46`

## Name: lorem
**Category:** text\
**Description:** generates a Lorem ipsum string\
**Parameters:** `words int`\
**Localizable:** `false`\
**Return:** `string`\
**Example:** `jr template run --embedded '{{lorem 10}}'`\
**Output:** `Lorem ipsum dolor sit amet, consectetur adipiscing elit.Fusce elit magna.`

## Name: lower
**Category:** text\
**Description:** converts a string to lowercase\
**Parameters:** `text string`\
**Localizable:** `false`\
**Return:** `string`\
**Example:** `jr template run --embedded '{{lower "HELLO"}}'`\
**Output:** `hello`

## Name: markov
**Category:** text\
**Description:** generates a markov chain from a string\
**Parameters:** `chain int, text string`\
**Localizable:** `false`\
**Return:** `string`\
**Example:** `jr template run --embedded '{{markov 10 "hello world"}}'`\
**Output:** `hello world`

## Name: random
**Category:** text\
**Description:** returns a random string from a list of strings\
**Parameters:** `list []string`\
**Localizable:** `false`\
**Return:** `string`\
**Example:** `jr template run --embedded '{{dates_between "1970-12-07" "1990-12-07" 10 | random}}'`\
**Output:** `hello`

## Name: random_index
**Category:** text\
**Description:** returns a random index from a list of strings in a file. Files are in '$JR_SYSTEM_DIR/templates/data/locale'\
**Parameters:** `set string`\
**Localizable:** `true`\
**Return:** `string`\
**Example:** `jr template run --embedded '{{random_index "city"}}'`\
**Output:** `12`

## Name: random_string
**Category:** text\
**Description:** returns a random string long between min and max characters\
**Parameters:** `min int, max int, vocabulary string`\
**Localizable:** `false`\
**Return:** `string`\
**Example:** `jr template run --embedded '{{random_string 3 10}}'`\
**Output:** `YBCEjxmn`

## Name: random_string_vocabulary
**Category:** text\
**Description:** returns a random string long between min and max characters using a vocabulary\
**Parameters:** `min int, max int, vocabulary string`\
**Localizable:** `false`\
**Return:** `string`\
**Example:** `jr template run --embedded '{{random_string_vocabulary 3 10 "hello world"}}'`\
**Output:** `llolh`

## Name: randoms
**Category:** text\
**Description:** returns a random strings from a | separated list string\
**Parameters:** `list string`\
**Localizable:** `false`\
**Return:** `string`\
**Example:** `jr template run --embedded '{{randoms "ALPHA|BETA|GAMMA|DELTA"}}'`\
**Output:** `BETA`

## Name: regex
**Category:** text\
**Description:** returns a random string matching the Regex\
**Parameters:** `regex string`\
**Localizable:** `false`\
**Return:** `string`\
**Example:** `jr template run --embedded '{{regex "[a-z]{5}"}}'`\
**Output:** `xxlbh`

## Name: repeat
**Category:** text\
**Description:** repeats a string a number of times\
**Parameters:** `text string, number int`\
**Localizable:** `false`\
**Return:** `string`\
**Example:** `jr template run --embedded '{{repeat "hello" 3}}'`\
**Output:** `hellohellohello`

## Name: replaceall
**Category:** text\
**Description:** replaces all instances of a string with another string\
**Parameters:** `set string, original string, replaced string`\
**Localizable:** `false`\
**Return:** `string`\
**Example:** `jr template run --embedded '{{replaceall "hello world" "hello" "goodbye"}}'`\
**Output:** `goodbye world`

## Name: sentence
**Category:** text\
**Description:** generates a random Sentence of n words\
**Parameters:** `words int`\
**Localizable:** `false`\
**Return:** `string`\
**Example:** `jr template run --embedded '{{sentence 15}}'`\
**Output:** `Alice was not going to happen next. First, she tried to curtsey as she fell`

## Name: sentence_prefix
**Category:** text\
**Description:** generates a random Sentence of n words, with a prefix length\
**Parameters:** `prefix int, length int`\
**Localizable:** `false`\
**Return:** `string`\
**Example:** `jr template run --embedded '{{sentence_prefix 3 15}}'`\
**Output:** `Alice was beginning to get very tired of sitting by her sister on the bank.`

## Name: split
**Category:** text\
**Description:** splits a string into a list of strings\
**Parameters:** `text string, separator string`\
**Localizable:** `false`\
**Return:** `[]string`\
**Example:** `jr template run --embedded '{{split "hello,world" ","}}'`\
**Output:** `[hello world]`

## Name: squeeze
**Category:** text\
**Description:** removes all spaces from a string\
**Parameters:** `text string`\
**Localizable:** `false`\
**Return:** `string`\
**Example:** `jr template run --embedded '{{squeeze " hello   world "}}'`\
**Output:** `helloworld`

## Name: squeezechars
**Category:** text\
**Description:** removes all instances of a character from a string\
**Parameters:** `set string, chars string`\
**Localizable:** `false`\
**Return:** `string`\
**Example:** `jr template run --embedded '{{squeezechars "hello world" "l"}}'`\
**Output:** `heo word`

## Name: substr
**Category:** text\
**Description:** returns a substring of a string\
**Parameters:** `from int, to int, text string`\
**Localizable:** `false`\
**Return:** `string`\
**Example:** `jr template run --embedded '{{substr 0 5 "hello world"}}'`\
**Output:** `hello`

## Name: title
**Category:** text\
**Description:** converts a string to title case\
**Parameters:** `text string`\
**Localizable:** `false`\
**Return:** `string`\
**Example:** `jr template run --embedded '{{title "hello world"}}'`\
**Output:** `Hello World`

## Name: trim
**Category:** text\
**Description:** trims whitespace from a string\
**Parameters:** `text string`\
**Localizable:** `false`\
**Return:** `string`\
**Example:** `jr template run --embedded '{{trim " hello world "}}'`\
**Output:** `hello world`

## Name: trimchars
**Category:** text\
**Description:** trims all characters in the given set from the beginning and end of a string\
**Parameters:** `set string, chars string`\
**Localizable:** `false`\
**Return:** `string`\
**Example:** `jr template run --embedded '{{trimchars "hello world" "hld"}}'`\
**Output:** `ello wor`

## Name: upper
**Category:** text\
**Description:** converts a string to uppercase\
**Parameters:** `text string`\
**Localizable:** `false`\
**Return:** `string`\
**Example:** `jr template run --embedded '{{upper "hello"}}'`\
**Output:** `HELLO`

## Utilities functions

## Name: array
**Category:** utilities\
**Description:** returns an empty array of given size\
**Parameters:** `size int`\
**Localizable:** `false`\
**Return:** `array`\
**Example:** `jr template run --embedded '{{array 5}}'`\
**Output:** `[0,0,0,0,0]`

## Name: bool
**Category:** utilities\
**Description:** returns a random boolean\
**Parameters:**  \
**Localizable:** `false`\
**Return:** `bool`\
**Example:** `jr template run --embedded '{{bool}}'`\
**Output:** `true`

## Name: counter
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

## Name: fromcsv
**Category:** utilities\
**Description:** returns a value for given column label from a csv file row\
**Parameters:** `string`\
**Localizable:** `false`\
**Return:** `string`\
**Example:** `jr template run --embedded '{{fromcsv "NAME"}}' --csv testfiles/test2.csv`\
**Output:** `John`

## Name: inject
**Category:** utilities\
**Description:** inject a string with a given probability between 0 (never) and 1 (always): useful to inject errors\
**Parameters:** `probability float64, injected any, original any`\
**Localizable:** `false`\
**Return:** `any`\
**Example:** `jr template run --embedded '{{$bad_city:=regex "[A-Z]{5}"}}{{city | inject 0.5 $bad_city}}'`\
**Output:** `Portland|ZPTAC`

## Name: key
**Category:** utilities\
**Description:** returns a random key string using a prefix and a length\
**Parameters:** `prefix string, length int`\
**Localizable:** `false`\
**Return:** `string`\
**Example:** `jr template run --embedded '{{key "KEY" 20}}'`\
**Output:** `KEY4`

## Name: seed
**Category:** utilities\
**Description:** set seed directly in a template\
**Parameters:** `rndSeed int64`\
**Localizable:** `false`\
**Return:** ``\
**Example:** `jr template run --embedded '{{seed 12345}}'`\
**Output:** ``

## Name: uuid
**Category:** utilities\
**Description:** returns a random uuid\
**Parameters:**  \
**Localizable:** `false`\
**Return:** `string`\
**Example:** `jr template run --embedded '{{uuid}}'`\
**Output:** `a6da3ed0-5fcb-4bb8-a6aa-654120a1e6e3`

## Name: yesorno
**Category:** utilities\
**Description:** returns a random yes or no\
**Parameters:**  \
**Localizable:** `false`\
**Return:** `string`\
**Example:** `jr template run --embedded '{{yesorno}}'`\
**Output:** `yes`
