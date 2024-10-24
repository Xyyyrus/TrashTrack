String? commentValidator(String? value) {
  if (value!.trim().isEmpty) {
    return 'Required field';
  } else {
    return null;
  }
}
