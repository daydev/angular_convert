part of angular.convert;
/**
* Converter for numeric values binded to basic [type=text] inputs of select elements.
* For specifically numeric inputs see [NgxConvNumNumericInput]
*/
@NgDirective(selector: "input[type=text][ng-model][ngx-conv-num]")
@NgDirective(selector: "select[ng-model][ngx-conv-num]")

class NgxConvNumBasicInput extends NgxConvDirective<num> {
  NgxConvNumBasicInput(NgModel ngModel): super(ngModel);

  @override

  num convert(String val) {
    if (val == null || val == "") {
      return null;
    } else {
      try {
        return num.parse(val);
      } catch (e) {
        return 0 / 0;
      }
    }
  }

  @override

  String unconvert(num value) {
    if (value == null) {
      return null;
    } else if (value.isNaN) {
      return "";
    } else {
      return value.toString();
    }
  }
}
/**
* Converter for numeric values binded to numeric inputs ([type=number] and [type=range])
* For basic inputs see [NgxConvNumBasicInput]
*/
@NgDirective(selector: "input[type=number][ng-model][ngx-conv-num]")
@NgDirective(selector: "input[type=range][ng-model][ngx-conv-num]")

class NgxConvNumNumericInput extends NgxConvNumBasicInput {
  final InputElement input;

  NgxConvNumNumericInput(Element this.input, NgModel ngModel): super(ngModel) {
    ngModel.render = (var value) {
      num number = convert(value);
      input.valueAsNumber = number != null ? number : 0;
    };
    input.onChange.listen((_) {
      ngModel.viewValue = input.value;
    });
  }
}