part of angular.convert.test;

class NgxConvNumSpec extends NgxConvSpec {

  final Map model = {
      "x": 0
  };

  NgxConvNumSpec(): super("ngx-conv-num");

  void _doTest() {
    test("should update input value when model value changes", () {
      _compile(_input);
      _apply(() {
        expect(x, 0);
        expect(element.value, "0");
        x = 42;
      });
      schedule(() {
        expect(element.value, "42");
      });
      _apply(() {
        x = 42.1;
      });
      schedule(() {
        expect(element.value, "42.1");
      });
    });

    test("should set input value to '' if model value is null", () {
      _compile(_input);
      _apply(() {
        expect(x, 0);
        x = null;
      });
      schedule(() {
        expect(element.value, isEmpty);
      });
    });

    test("should set input value to '' if model value is NaN", () {
      _compile(_input);
      _apply(() {
        expect(x, 0);
        x = 0 / 0;
      });
      schedule(() {
        expect(element.value, isEmpty);
      });
    });

    test("should update model value when input value changes", () {
      _compile(_input);
      schedule(() {
        element.value = "41";
        tb.triggerEvent(element, 'change');
        expect(x, 41);
        element.value = "41.1";
        tb.triggerEvent(element, 'change');
        expect(x, 41.1);
      });
    });

    test("should set scope value to NaN if input value is not numeric", () {
      _compile(_input);
      schedule(() {
        element.value = "a";
        tb.triggerEvent(element, 'change');
        expect(x.isNaN, isTrue);
      });
    });

    test("should update option of select element when model value changes", () {
      _compile(_select);
      schedule(() {
        expect(element.value, '?');
      });

      _apply(() {
        expect(x, 0);
        x = 43;
      });
      schedule(() {
        expect(element.querySelector("option#integer").selected, isTrue);
      });

      _apply(() {
        x = 43.1;
      });
      schedule(() {
        expect(element.querySelector("option#float").selected, isTrue);
      }) ;
    });

    test("should update model value when selected option changes", () {
      _compile(_select);
      schedule(() {
        element.querySelector("option#integer").selected = true;
        tb.triggerEvent(element, 'change');
        expect(x, 43);
        element.querySelector("option#float").selected = true;
        tb.triggerEvent(element, 'change');
        expect(x, 43.1);
      });
    });

  }

  void initScope() {
    model["x"] = 0;
    scope.context["model"] = model;
  }

  String get _input => '<input type="text" ng-model="model.x" ngx-conv-num />';

  String get _select =>
  '<select ng-model="model.x" ngx-conv-num>'
  '<option id="integer" value="43">43</option>'
  '<option id="float" value="43.1">43.1</option>'
  '</select>';

  num get x => model["x"];

  void set x(num x) {
    model["x"] = x;
  }
}