import 'dart:math';
import 'package:intl/intl.dart';

String generateRandomString(int length) {
  // displayName is by default random 8-character string of letters
  final _random = Random();
  const _availableChars =
      'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  final randomString = List.generate(length,
          (index) => _availableChars[_random.nextInt(_availableChars.length)])
      .join();

  return randomString;
}

String convertDateTimeToString(DateTime dateTime) {
  // If joined in last 30 days, show actual date
  if (dateTime.difference(DateTime.now()).inDays < 30) {
    return DateFormat('MMM d, yyyy').format(dateTime);
  } else {
    // Otherwise, show month and year only
    return DateFormat('MMM yyyy').format(dateTime);
  }
}
