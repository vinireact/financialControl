import 'package:random_string/random_string.dart';

class Token {
  String? id = randomAlphaNumeric(64);
  String? title;
  double? value;
  DateTime? date;
  Token({this.title, this.value, this.date});
}
