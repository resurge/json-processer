[![Flattr this git repo](http://api.flattr.com/button/flattr-badge-large.png)](https://flattr.com/submit/auto?user_id=resurge&url=https://github.com/resurge/json-processer&title=json-processer&language=coffeescript&tags=github&category=software)
[![Fund me on Gittip](https://www.gittip.com/assets/7.0.8/logo.png)](https://www.gittip.com/<your account here>/)
# JSON Processer

## Purpose
JSON processer is meant to easily be able to transform json using javascript.  
A live example [can be found here][gh-pages].

## Usage
1. You enter JSON in the left most column.
2. You add javascript code in the middle column to manipulate the data in the `json` variable, which contains the parsed json from step #1.
3. Press *Run* and the output will be displayed in the third column.

## Development
1. Clone repo
1. `npm install -g coffee-script`
1. `npm install`
1. `grunt`

`grunt deploy` builds what you see on the [live example][gh-pages].

[gh-pages]: http://resurge.github.io/json-processer