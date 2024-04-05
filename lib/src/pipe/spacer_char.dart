String addSpaceEvery6Chars(String input) {
  String result = '';
  for (int i = 0; i < input.length; i++) {
    if (i > 0 && i % 6 == 0) {
      result += '  ';
    }
    result += input[i];
  }
  return result;
}

String addSpaceEvery4Chars(String input) {
  String result = '';
  for (int i = 0; i < input.length; i++) {
    if (i > 0 && i % 4 == 0) {
      result += ' ';
    }
    result += input[i];
  }
  return result;
}
