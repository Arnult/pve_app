part of 'login_bloc.dart';

sealed class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object?> get props => [];
}

final class LoginUsernameChanged extends LoginEvent {
  const LoginUsernameChanged(this.username);

  final String username;

  @override
  List<Object> get props => [username];
}

final class LoginPasswordChanged extends LoginEvent {
  const LoginPasswordChanged(this.password);

  final String password;

  @override
  List<Object> get props => [password];
}

final class LoginHostChanged extends LoginEvent {
  final String host;

  const LoginHostChanged(this.host);

  @override
  List<Object> get props => [host];
}

final class LoginPortChanged extends LoginEvent {
  final int port;

  const LoginPortChanged(this.port);

  @override
  List<Object> get props => [port];
}

final class LoginSubmitted extends LoginEvent {
  const LoginSubmitted();
}
