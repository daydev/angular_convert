part of angular.convert;

class NumberConverter implements NgModelConverter {
  String get name => "ngx-conv-num";

  @override
  num parse(String value) {
    if (value == null || value == "") {
      return null;
    } else {
      try {
        return num.parse(value);
      } catch (e) {
        return 0 / 0;
      }
    }
  }

  @override
  String format(num value) {
    if (value == null) {
      return null;
    } else if (value.isNaN) {
      return "";
    } else {
      return value.toString();
    }
  }
}
