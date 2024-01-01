import 'package:formz/formz.dart';

// Define input validation errors
enum PasswordError { empty, length }

// Extend FormzInput and provide the input type and error type.
class Password extends FormzInput<String, PasswordError> {
  // Se establece el valor inicial mediante el super
  const Password.pure() : super.pure('');

  // Se establece un valor modificado
  const Password.dirty(String value) : super.dirty(value);

  String? get errorMessage {
    if (isValid || isPure) return null;

    if (displayError == PasswordError.empty) {
      return 'El campo es requerido';
    }
    if (displayError == PasswordError.length) {
      return 'El campo debe contener al menos 6 carácteres';
    }

    return null;
  }

  // Override validator to handle validating a given input value.
  @override
  PasswordError? validator(String value) {
    if (value.isEmpty || value.trim().isEmpty) return PasswordError.empty;

    if (value.length < 6) return PasswordError.length;

    return null;
  }
}
