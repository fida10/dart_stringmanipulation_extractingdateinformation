/// Support for doing something awesome.
///
/// More dartdocs go here.
library;

export 'src/stringmanipulation_extractingdateinformation_base.dart';

/*
Challenge: You are given a string representing a timestamp in the format 
"YYYY-MM-DD HH:MM:SS", for example, "2023-03-15 09:30:45". 
Write a Dart function to extract and print the 
year, month, day, hour, minute, and second as separate entities. 
First, solve this using substring and split, and then 
solve it again using regular expressions.

Key Points: This question tests your ability to manipulate 
strings using both substring/split methods and regular expressions. 
It also challenges your understanding of string pattern recognition.
 */

//2023-03-15 09:30:45
Map<String, String>? extractDate(String initial) {
  // try {
  //   if ((initial[4] != '-') ||
  //       (initial[7] != '-') ||
  //       (initial[10] != ' ') ||
  //       (initial[13] != ':') ||
  //       (initial[16] != ':')) {
  //     return null;
  //   }
  // } on RangeError catch (e) {
  //   print("Error: $e");
  //   return null;
  // }

  // return {
  //   'year': initial.substring(0, 4),
  //   'month': initial.substring(5, 7),
  //   'day': initial.substring(8, 10),
  //   'hour': initial.substring(11, 13),
  //   'minute': initial.substring(14, 16),
  //   'second': initial.substring(17, 19)
  // };

  //above is with substring

  try {
    final year = (RegExp(r'^(.+?)-').allMatches(initial).first.group(1));
    if (isIncorrectLength(year, 4)) {
      return null;
    }
    final month = (RegExp(r'-(.+?)-').allMatches(initial).first.group(1));
    if (isIncorrectLength(month, 2)) {
      return null;
    }
    final day =
        (RegExp(r'-(?:.*?)-(.+?)\s').allMatches(initial).first.group(1));
    if (isIncorrectLength(day, 2)) {
      return null;
    }
    final hour = (RegExp(r'\s(.+?):').allMatches(initial).first.group(1));
    if (isIncorrectLength(hour, 2)) {
      return null;
    }
    final minute = (RegExp(r':(.+?):').allMatches(initial).first.group(1));
    if (isIncorrectLength(minute, 2)) {
      return null;
    }
    final second =
        (RegExp(r':(?:.*?):(.+?)$').allMatches(initial).first.group(1));
    if (isIncorrectLength(second, 2)) {
      return null;
    }

    print(second);

    return {
      'year': initial.substring(0, 4),
      'month': initial.substring(5, 7),
      'day': initial.substring(8, 10),
      'hour': initial.substring(11, 13),
      'minute': initial.substring(14, 16),
      'second': initial.substring(17, 19)
    };
  } catch (e) {
    print("Error: $e");
    return null;
  }
}

bool isIncorrectLength(String? input, int expectedLength) {
  // if (input == null || input.length != expectedLength) {
  //   return false;
  // } else {
  //   return true;
  // }

  return (input == null || input.length != expectedLength);
}

void main() {
  extractDate("2023-03-15 09:30:45");
}
