# Sass JSON Vars

[![Build Status](https://travis-ci.org/vigetlabs/sass-json-vars.png?branch=master)](https://travis-ci.org/vigetlabs/sass-json-vars)
[![Coverage Status](https://coveralls.io/repos/vigetlabs/sass-json-vars/badge.png)](https://coveralls.io/r/vigetlabs/sass-json-vars)
[![Code Climate](https://codeclimate.com/github/vigetlabs/sass-json-vars.png)](https://codeclimate.com/github/vigetlabs/sass-json-vars)
[![Gem Version](https://badge.fury.io/rb/sass-json-vars.png)](http://badge.fury.io/rb/sass-json-vars)

`@import` json data into Sass `$variables`.


**Important:** the latest version of [`sass-rails`](https://github.com/rails/sass-rails) is locked in to Sass 3.2. This means that [Sass maps](http://thesassway.com/news/sass-3-3-released#maps) are not available to `sass-json-vars` to parse nested objects.

### Usage

```shell
gem install sass-json-vars
```

After that reload rails server if you are on rails.

#### For projects using Sass >= 3.3


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

#### For projects using Sass <= 3.2

Place variables in a JSON file:

```javascript
// variables.json
{
    "font-sans": "Helvetica, sans-serif",
    "colors-red": "#c33"
}
```

Import the file in Sass to expose variable names:

```scss
@import "variables.json"

body {
    color: $colors-red;
    font: $font-sans;
}
```


Require sass-json-vars when compiling

```shell
sass style.scss -r sass-json-vars
```

### What about node-sass?

Take a look at
[node-sass-json-importer](https://github.com/Updater/node-sass-json-importer)
for a libsass variant of this project:

https://github.com/Updater/node-sass-json-importer
