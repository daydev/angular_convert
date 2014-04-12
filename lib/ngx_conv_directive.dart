part of angular.convert;

/**
 * Base converter hook that overrides ngModel's modelValue
 * getter and setter to convert value from String to target type and back.
 */
abstract class NgxConvDirective<T> {
  final NgModel ngModel;

  NgxConvDirective(this.ngModel) {
    var setter = ngModel.setter;
    ngModel.setter = (var value) {
      setter(convert(value));
    };
    var getter = ngModel.getter;
    ngModel.getter = () => unconvert(getter());
  }

  T convert(String value);

  String unconvert(T value) {
    return value != null ? value.toString() : null;
  }

}