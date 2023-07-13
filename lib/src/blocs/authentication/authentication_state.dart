part of 'authentication_bloc.dart';

enum AuthenticationStatus { unknown, authenticated, unauthenticated }

class AuthenticationState extends Equatable {
  const AuthenticationState._({
    this.status = AuthenticationStatus.unknown,
    this.ticket = Ticket.empty
  });

  const AuthenticationState.unknown() : this._();

  const AuthenticationState.authenticated(Ticket ticket)
      : this._(status: AuthenticationStatus.authenticated, ticket: ticket);

  const AuthenticationState.unauthenticated()
      : this._(status: AuthenticationStatus.unauthenticated);

  final AuthenticationStatus status;
  final Ticket ticket;

  @override
  List<Object> get props => [status, ticket];
}
