[![Build Status](https://drone.io/github.com/daydev/angular_convert/status.png)](https://drone.io/github.com/daydev/angular_convert/latest)

##Warning
The changes to `ngModel` in angular.dart releases since this library was created have rendered it mostly useless.
**This repository is now more useful as an example of how you would create and register converter for `ngModel` rather then actual library.** 

## Description
This library was created to augment [angular.dart](https://github.com/angular/angular.dart)'s `ngModel` directive with view/model value conversion. 
A value bound through `ngModel` is kind of split in two: view value and model value. Model value is what you get in code, and view value is what you get in DOM.
Simplifying a bit, view value is always going to be `String`. Model value not necessarily so.
For example, you may have input where user is supposed to enter number and you would like to get `num` in your code, not `String`. 
When this library was created there wasn't really support for such conversion in angular.dart. `String` was pretty much what you got, with some exceptions.
Since then concept of converters has been added to `ngModel`.
And although angular.dart doesn't have any useful built-in converters yet, `ngModel` now correctly binds inputs of type `number`, `checkbox`, `date`, etc.
The only real use case left for this library is binding a value of `select` as there's no variety of types for `select` like there is for `input`.

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

## Implemented converters

1. `ngx-conv-num`. Will map input value to `num` (`int` or `double`) property in the model.
Works on `input`s of type `text` and `select`s. `number` and `range` inputs are now handled correctly by angular.dart itself.

## Example

See [example](https://github.com/daydev/angular_convert/tree/master/example)
