class InputValidators {
  static String? validateRequiredField(String? value) {
    if (value == null || value.isEmpty) {
      return 'Este campo é obrigatório';
    }
    return null;
  }
}
