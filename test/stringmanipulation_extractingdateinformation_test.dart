import 'package:stringmanipulation_extractingdateinformation/stringmanipulation_extractingdateinformation.dart';
import 'package:test/test.dart';

void main() {
  group('Date Extraction Tests', () {
    test('Valid timestamp', () {
      var result = extractDate('2023-03-15 09:30:45');
      expect(
          result,
          equals({
            'year': '2023',
            'month': '03',
            'day': '15',
            'hour': '09',
            'minute': '30',
            'second': '45'
          }));
    });

    test('Invalid timestamp format', () {
      var result = extractDate('15-03-2023 09:30:45');
      expect(result, isNull); // or handle as per your function's design
    });

    test('Empty timestamp', () {
      var result = extractDate('');
      expect(result, isNull); // or handle as per your function's design
    });

    // Add more tests for different scenarios like leap year, invalid dates, etc.
  });
}
