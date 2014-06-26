# Sass JSON Vars

[![Build Status](https://travis-ci.org/vigetlabs/sass-json-vars.png?branch=master)](https://travis-ci.org/vigetlabs/sass-json-vars) [![Code Climate](https://codeclimate.com/github/vigetlabs/sass-json-vars.png)](https://codeclimate.com/github/vigetlabs/sass-json-vars) [![Gem Version](https://badge.fury.io/rb/sass-json-vars.png)](http://badge.fury.io/rb/sass-json-vars)

`@import` json data into Sass `$variables`.

### Usage

```shell
gem install sass-json-vars
```

Place variables in a JSON file:

```javascript
// variables.json
{
    "font-sans": "Helvetica, sans-serif",
    "colors": {
        "red": "#c33"
    }
}
```

Import the file in Sass to expose variable names:

```scss
@import "variables.json"

body {
    color: map-get($colors, red);
    font: $font-sans;
}
```

Require sass-json-vars when compiling

```shell
sass style.scss -r sass-json-vars
```
