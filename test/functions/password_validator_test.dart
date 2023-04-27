import 'package:flutter_test/flutter_test.dart';
import 'package:photogram/functions/password_validator.dart';

void main() {
  test(
      'Given null password '
      'When passwordValidator function invoked '
      'Then result returned', () {
    final result = passwordValidator(null);
    expect(result.runtimeType, String);
  });
  test(
      'Given empty password '
      'When passwordValidator function invoked '
      'Then result returned', () {
    final result = passwordValidator('');
    expect(result.runtimeType, String);
  });
  test(
      'Given password with less than 6 characters '
      'When passwordValidator function invoked '
      'Then result returned', () {
    final result = passwordValidator('sd2lo');
    expect(result.runtimeType, String);
  });
  test(
      'Given password with more than 6 characters '
      'When passwordValidator function invoked '
      'Then result returned', () {
    final result = passwordValidator('DSAe2112d');
    expect(result, null);
  });
}
