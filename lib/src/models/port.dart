import 'package:formz/formz.dart';

enum PortValidationError { invalid }

class Port extends FormzInput<int, PortValidationError> {
  const Port.pure() : super.pure(8006);

  const Port.dirty([int value = 8006]) : super.dirty(value);

  @override
  PortValidationError? validator(int value) {
    if (value <= 0) return PortValidationError.invalid;
    return null;
  }
}
