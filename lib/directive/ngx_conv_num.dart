part of angular.convert;
/**
 * Converter for numeric values binded to basic [type=text] inputs of select elements.
 * For specifically numeric inputs see [NgxConvNumNumericInput]
 */
@Decorator(selector: "input[type=text][ng-model][ngx-conv-num]")
@Decorator(selector: "select[ng-model][ngx-conv-num]")
class NgxConvNum extends NgxConvDirective<num> {
  NgxConvNum(NgModel ngModel, NumberConverter conv): super(ngModel, conv);
}