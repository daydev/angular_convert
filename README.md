[![Build Status](https://drone.io/github.com/daydev/angular_convert/status.png)](https://drone.io/github.com/daydev/angular_convert/latest)

## Description

This library provides type convert directives to augment [angular.dart](https://github.com/angular/angular.dart)'s `ngModel` directive.
At the time said directive disregards types in your model and force assigns `String`s to binded fields
(excluding some special cases like checkboxes).

So there is no simple way to map values other than `String`s and `bool`s to inputs in template.
This library is my attempt to circumvent this issue.

## Usage

Import library as you would usually.

Install module
```dart
class YourModule extends Module {
  YourModule() {
    install(new AngularConvertModule());

    //Your other angular bootstrap stuff
  }
}
```
Then in the templates annotate inputs with directives provided.

## Implemented directives

1. `ngx-conv-num`. Will map input value to `num` (`int` or `double`) property in the model.
Workss on `input`s of types `text`, `number`, and `range` and also `select`s.

2. `ngx-conv-date`. Will map input value to `DateTime` property in the model.
Works on `input`s of type `date`.

## Example

See [example](https://github.com/daydev/angular_convert/tree/master/example)
