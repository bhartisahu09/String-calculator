import 'package:flutter_assessment/model/string_calculator.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final calculator = StringCalculator();

  // Test case: Empty string should return 0
  test('Empty string should return 0', () {
    expect(calculator.add(""), equals(0));
  });

  // Test case: Single number should return itself
  test('Single number should return itself', () {
    expect(calculator.add("1"), equals(1));
  });

  // Test case: Two numbers should return their sum
  test('Two numbers should return their sum', () {
    expect(calculator.add("1,5"), equals(6));
  });

  // Test case: Multiple numbers should return their sum
  test('Multiple numbers should return their sum', () {
    expect(calculator.add("1,2,3,4"), equals(10));
  });

  // Test case: New line as a separator should be handled
  test('New line as a separator should be handled', () {
    expect(calculator.add("1\n2,3"), equals(6));
  });

  // Test case: Custom delimiter should be supported
  test('Custom delimiter should be supported', () {
    expect(calculator.add("//;\n1;2"), equals(3));
  });

  // Test case: Negative numbers should throw an exception
  test('Negative numbers should throw an exception', () {
    expect(() => calculator.add("1,-2,3,-4"), throwsA(isA<Exception>().having((e) => e.toString(), 'message', contains('negative numbers not allowed: -2, -4'))));
  });

  // Test case: Numbers greater than 1000 should be ignored
  test('Numbers greater than 1000 should be ignored', () {
    expect(calculator.add("2,1001"), equals(2));
  });
}
