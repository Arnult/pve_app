import 'package:formz/formz.dart';

enum HostValidationError { empty }

class Host extends FormzInput<String, HostValidationError> {
  const Host.pure() : super.pure('');

  const Host.dirty([String value = '']) : super.dirty(value);

  @override
  HostValidationError? validator(String value) {
    if (value.isEmpty) return HostValidationError.empty;
    return null;
  }
}
