library angular.convert;

import 'dart:html';

import 'package:angular/angular.dart';

part 'ngx_conv_directive.dart';
part 'ngx_conv_num.dart';
part 'ngx_conv_date.dart';

class AngularConvertModule extends Module {

  AngularConvertModule() {
    type(NgxConvNumBasicInput);
    type(NgxConvNumNumericInput);
    type(NgxConvDate);
  }
}