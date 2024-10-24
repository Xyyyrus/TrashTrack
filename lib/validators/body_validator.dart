String? bodyValidator(String? value) {
  if (value!.trim().isEmpty) {
    return 'Add a description';
  } else {
    return null;
  }
}
