import 'package:assignment_app/shared_functions.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  // Test to run correct use case......
  test('Flutter Date Format Test', () {
    DateTime testDate = DateTime.parse('2021-07-05T00:34:29.993Z');

    String finalDateFormat = formattedDate(testDate);
    expect(finalDateFormat, '05-Jul-2021');
  });

  // Test to run wrong use case
  test('Flutter Date Format Test', () {
    DateTime testDate = DateTime.parse('2021-07-05T00:34:29.993Z');

    String finalDateFormat = formattedDate(testDate);
    expect(finalDateFormat, '06-Jul-2021');
  });
}
