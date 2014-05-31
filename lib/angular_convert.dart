library angular.convert;

import 'dart:html';

import 'package:angular/angular.dart';

part 'converter/number_converter.dart';
part 'directive/ngx_conv_directive.dart';
part 'directive/ngx_conv_num.dart';

class AngularConvertModule extends Module {

  AngularConvertModule() {
    type(NumberConverter);
    type(NgxConvNum);
  }
}