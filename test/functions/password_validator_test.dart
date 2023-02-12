import 'package:flutter_test/flutter_test.dart';
import 'package:photogram/functions/password_validator.dart';

void main() {
  test(
      'Given null password '
      'When passwordValidator function invoked '
      'Then result returned', () {
    final String? result = passwordValidator(null);
    expect(result.runtimeType, String);
  });
  test(
      'Given empty password '
      'When passwordValidator function invoked '
      'Then result returned', () {
    final String? result = passwordValidator('');
    expect(result.runtimeType, String);
  });
}
