part of angular.convert;

/**
 * Base converter hook that overrides ngModel's modelValue
 * getter and setter to convert value from String to target type and back.
 */
abstract class NgxConvDirective<T> {
  final NgModel ngModel;
  final NgModelConverter conv;

  NgxConvDirective(this.ngModel, this.conv) {
    ngModel.converter = conv;
  }

}