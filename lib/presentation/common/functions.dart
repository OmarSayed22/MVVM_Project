bool isValid({required String input, required String pattern}) {
  return RegExp(pattern).hasMatch(input);
}
