bool regexUppercase(String txt) {
  const value = "[A-Z]";
  final regex = RegExp(value);
  final matches = regex.allMatches(txt);
  return matches.isEmpty ? false : true;
}

bool regexLowercase(String txt) {
  const value = "[a-z]";
  final regex = RegExp(value);
 final matches = regex.allMatches(txt);
  return matches.isEmpty ? false : true;
}

bool regexNumber(String txt) {
  const value = "[0-9]";
  final regex = RegExp(value);
  final matches = regex.allMatches(txt);
  return matches.isEmpty ? false : true;
}

bool regexAlphaNumeric(String txt) {
  const value = "^[a-zA-Z0-9]+\$";
  final regex = RegExp(value);
  final matches = regex.allMatches(txt);
  return matches.isEmpty ? false : true;
}
