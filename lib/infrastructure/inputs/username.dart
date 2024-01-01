import 'package:formz/formz.dart';

// Define input validation errors
enum UsernameError { empty, length }

// Extend FormzInput and provide the input type and error type.
class Username extends FormzInput<String, UsernameError> {
  // Se establece el valor inicial mediante el super
  const Username.pure() : super.pure('');

  // Se establece un valor modificado
  const Username.dirty(String value) : super.dirty(value);

  String? get errorMessage {
    if (isValid || isPure) return null;

    if (displayError == UsernameError.empty) {
      return 'El campo es requerido';
    }
    if (displayError == UsernameError.length) {
      return 'El campo debe contener al menos 6 carácteres';
    }

    return null;
  }

  // Override validator to handle validating a given input value.
  @override
  UsernameError? validator(String value) {
    if (value.isEmpty || value.trim().isEmpty) return UsernameError.empty;

    if (value.length < 6) return UsernameError.length;

    return null;
  }
}
