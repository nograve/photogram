import 'package:flutter_test/flutter_test.dart';
import 'package:photogram/functions/email_validator.dart';

void main() {
  test(
      'Given null email '
      'When passwordValidator function invoked '
      'Then result returned', () {
    final result = emailValidator(null);
    expect(result.runtimeType, String);
  });
  test(
      'Given empty email '
      'When passwordValidator function invoked '
      'Then result returned', () {
    final result = emailValidator('');
    expect(result.runtimeType, String);
  });
  test(
      'Given wrong written email '
      'When passwordValidator function invoked '
      'Then result returned', () {
    final result = emailValidator('123gmai@123123');
    expect(result.runtimeType, String);
  });
  test(
      'Given right written email '
      'When passwordValidator function invoked '
      'Then result returned', () {
    final result = emailValidator('test@gmail.com');
    expect(result, null);
  });
}
