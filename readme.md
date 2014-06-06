# Sass JSON Vars

A work in progress.

### Eventual Usage

Place variables in a JSON file:

```javascript
{
    color: {
        red: "#c33"
    }
}
```

Import the file in Sass to expose variable names:

```scss
@import "variables.json"

body {
    color: $color-red;
}
```
