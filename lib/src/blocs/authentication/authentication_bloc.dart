import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pve_app/src/log.dart';

import 'package:pve_app/src/models/ticket.dart';
import 'package:pve_app/src/service/version_service.dart';

import '../../repository/address_repository.dart';
import '../../repository/ticket_repository.dart';

part 'authentication_event.dart';

part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc(
      {required AddressRepository addressRepository,
      required TicketRepository ticketRepository})
      : _addressRepository = addressRepository,
        _ticketRepository = ticketRepository,
        super(const AuthenticationState.unknown()) {
    on<_AuthenticationStatusChanged>(_onAuthenticationStatusChanged);
    on<AuthenticationLogoutRequested>(_onAuthenticationLogoutRequested);

    var t = _ticketRepository.getTicket();
    if (t!=null) {
      var address = _addressRepository.getAddress();
      if (address != null) {
        try {
          version(address.host ?? "", address.port ?? 0);
        } catch (e) {
          logger.e(e);
          add(const _AuthenticationStatusChanged(AuthenticationStatus.unauthenticated));
        }
      }
    }else{
      add(const _AuthenticationStatusChanged(AuthenticationStatus.authenticated));
    }

  }

  final AddressRepository _addressRepository;
  final TicketRepository _ticketRepository;

  void _onAuthenticationLogoutRequested(
      AuthenticationLogoutRequested event, Emitter<AuthenticationState> emit) {
    _addressRepository.deleteAddress();
    _ticketRepository.deleteTicket();
  }

  Future<void> _onAuthenticationStatusChanged(_AuthenticationStatusChanged event,
      Emitter<AuthenticationState> emit) async {
    switch (event.status) {
      case AuthenticationStatus.authenticated:
        var ticket = _ticketRepository.getTicket();
        if (ticket != null) {
          var address = _addressRepository.getAddress();
          if (address != null) {
            try {
              version(address.host ?? "", address.port ?? 0);
            } catch (e) {
              logger.e(e);
              emit(const AuthenticationState.unauthenticated());
              return;
            }
          }
          emit(AuthenticationState.authenticated(ticket));
        }
        emit(const AuthenticationState.unauthenticated());

      case AuthenticationStatus.unauthenticated:
        emit(const AuthenticationState.unauthenticated());
      case AuthenticationStatus.unknown:
        emit(const AuthenticationState.unknown());
    }
  }
}
