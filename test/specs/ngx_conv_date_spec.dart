part of angular.convert.test;

class NgxConvDateSpec extends NgxConvSpec {

  final Map model = {
      "d": new DateTime.utc(1970).toLocal()
  } ;

  NgxConvDateSpec(): super("ngx-conv-date");

  void _doTest() {
    test("should update date input value when model value changes", () {
      _compile(_input);
      schedule(() {
        expect(element.valueAsDate, d);
      });
      _apply(() {
        d = new DateTime.utc(2000, 12, 31).toLocal();
      });
      schedule(() {
        expect(element.valueAsDate, d);
        expect(element.valueAsDate, new DateTime.utc(2000, 12, 31).toLocal());
      });
    });

    test("should set date input value to null if date is null", () {
      _compile(_input);
      _apply(() {
        d = null;
      });
      schedule(() {
        expect(element.valueAsDate, isNull);
      });
    });

    test("should update model value when date input value changes", () {
      _compile(_input);
      schedule(() {
        var date = new DateTime.utc(1984, 01, 06).toLocal();
        element.valueAsDate = date;
        tb.triggerEvent(element, 'change');
        expect(d, date);
      });
    });

    test("should set model value to null if date input value is empty", () {
      _compile(_input);
      schedule(() {
        element.value = "";
        tb.triggerEvent(element, 'change');
        expect(d, isNull);
      });
    });
  }

  void initScope() {
    model["d"] = new DateTime.utc(1970).toLocal();
    scope["model"] = model;
  }

  String get _input => '<input type="date" ng-model="model.d" ngx-conv-date />"';

  DateTime get d => model["d"];

  void set

  d(DateTime d) {
    model["d"] = d;
  }

}