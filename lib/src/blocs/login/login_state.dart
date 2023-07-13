part of 'login_bloc.dart';

final class LoginState extends Equatable {
  const LoginState(
      {this.status = FormzSubmissionStatus.initial,
      this.username = const Username.pure(),
      this.password = const Password.pure(),
      this.host = const Host.pure(),
      this.port = const Port.pure(),
      this.isValid = false});

  final FormzSubmissionStatus status;
  final Username username;
  final Password password;
  final Host host;
  final Port port;
  final bool isValid;

  LoginState copyWith({
    FormzSubmissionStatus? status,
    Username? username,
    Password? password,
    Host? host,
    Port? port,
    bool? isValid,
  }) {
    return LoginState(
      status: status ?? this.status,
      username: username ?? this.username,
      password: password ?? this.password,
      host: host ?? this.host,
      port: port ?? this.port,
      isValid: isValid ?? this.isValid,
    );
  }

  @override
  List<Object?> get props => [status, username, password, host, isValid];
}
