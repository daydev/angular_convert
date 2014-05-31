library angular.convert.test;

import 'dart:html';

import 'package:angular/angular.dart';
import 'package:angular/mock/module.dart';

import 'package:scheduled_test/scheduled_test.dart';

import 'package:angular_convert/angular_convert.dart';

part 'specs/ngx_conv_spec.dart';
part 'specs/ngx_conv_num_spec.dart';

main() {
  List<NgxConvSpec> specs = [
      new NgxConvNumSpec()
  ];

  specs.forEach((spec) => spec.doTest());

}