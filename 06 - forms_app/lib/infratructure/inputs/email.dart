import 'package:formz/formz.dart';

enum EmailInputError { empty, format }

// Extend FormzInput and provide the input type and error type.
class EmailInput extends FormzInput<String, EmailInputError> {
  static final emailRegExp = RegExp(
    r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
  );

  // Call super.pure to represent an unmodified form input.
  const EmailInput.pure() : super.pure('');

  // Call super.dirty to represent a modified form input.
  const EmailInput.dirty(super.value) : super.dirty();

  // Override validator to handle validating a given input value.
  @override
  EmailInputError? validator(String value) {
    if (value.isEmpty || value.trim().isEmpty) EmailInputError.empty;

    if (!emailRegExp.hasMatch(value)) {
      return EmailInputError.format;
    }

    return null;
  }

  String? get errorMessage {
    if (isValid || isPure) {
      return null;
    }

    if (displayError == EmailInputError.empty) {
      return "El campo es requerido";
    }

    if (displayError == EmailInputError.format) {
      return "Email invalido";
    }

    return null;
  }
}
