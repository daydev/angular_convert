part of angular_transform;

@NgController(
    selector: "[example-ctrl]",
    publishAs: "ctrl"
    )

class ExampleController {
  Scope scope;

  int x1 = 0;

  int x2 = 0;

  int y1 = 0;

  int y2 = 0;

  ExampleController();
}