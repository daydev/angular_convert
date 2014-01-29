part of angular.convert;

@NgDirective(selector: 'input[type=date][ng-model][ngx-conv-date]')

class NgxConvDate extends NgxConvDirective<DateTime> {
  final InputElement input;

  NgxConvDate(Element this.input, NgModel ngModel): super(ngModel) {
    ngModel.render = (var value) {
      DateTime date = convert(value);
      if (date != null) {
        input.valueAsDate = date;
      } else {
        input.value = "";
      }
    };

    input.onChange.listen((_) {
      ngModel.viewValue = unconvert(input.valueAsDate);
    });
  }

  @override

  DateTime convert(String val) {
    if (val == null) {
      return null;
    } else {
      return DateTime.parse(val);
    }
  }

  bool get isLocal => "datetime-local" == input.type;
}