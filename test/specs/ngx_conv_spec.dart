part of angular.convert.test;

abstract class NgxConvSpec {
  final String name;

  TestBed tb;

  Scope scope;

  Element element;

  NgxConvSpec(this.name);

  doTest() {
    group("[$name]", () {
      setUp(() {
        schedule(setUpInjector);
        schedule(module((Module m) => m.install(new AngularConvertModule())));
        schedule(inject((Scope scope, TestBed tb) {
          this.scope = scope;
          this.tb = tb;
        }));
        schedule(initScope);

        currentSchedule.onComplete.schedule(tearDownInjector);
      });
      _doTest();
    });

  }

  void initScope();

  void _doTest();

  Element _compile(String content) {
    _apply(() {
      element = tb.compile(content, scope: scope);
    });
  }

  void _apply([Function f]) {
    if (f != null) {
      schedule(f);
    }
    schedule(() => scope.apply());
  }

}