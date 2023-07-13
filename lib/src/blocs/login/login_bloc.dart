import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

import '../../log.dart';
import '../../models/address.dart';
import '../../models/password.dart';
import '../../models/port.dart';
import '../../models/ticket.dart';
import '../../models/username.dart';
import '../../models/host.dart';
import '../../repository/address_repository.dart';
import '../../repository/ticket_repository.dart';
import '../../service/access_service.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc({
    required AddressRepository addressRepository,
    required TicketRepository ticketRepository,
  })  : _addressRepository = addressRepository,
        _ticketRepository = ticketRepository,
        super(const LoginState()) {
    on<LoginHostChanged>(_onHostChanged);
    on<LoginPortChanged>(_onPortChanged);
    on<LoginUsernameChanged>(_onUsernameChanged);
    on<LoginPasswordChanged>(_onPasswordChanged);
    on<LoginSubmitted>(_onSubmitted);
  }

  final AddressRepository _addressRepository;
  final TicketRepository _ticketRepository;

  void _onHostChanged(
    LoginHostChanged event,
    Emitter<LoginState> emit,
  ) {
    final host = Host.dirty(event.host);
    emit(
      state.copyWith(
        host: host,
        isValid: Formz.validate([state.host, host]),
      ),
    );
  }

  void _onPortChanged(
      LoginPortChanged event,
      Emitter<LoginState> emit,
      ) {
    final port = Port.dirty(event.port);
    emit(
      state.copyWith(
        port: port,
        isValid: Formz.validate([state.port, port]),
      ),
    );
  }


  void _onUsernameChanged(
    LoginUsernameChanged event,
    Emitter<LoginState> emit,
  ) {
    final username = Username.dirty(event.username);
    emit(
      state.copyWith(
        username: username,
        isValid: Formz.validate([state.password, username]),
      ),
    );
  }

  void _onPasswordChanged(
    LoginPasswordChanged event,
    Emitter<LoginState> emit,
  ) {
    final password = Password.dirty(event.password);
    emit(
      state.copyWith(
        password: password,
        isValid: Formz.validate([password, state.username]),
      ),
    );
  }

  Future<void> _onSubmitted(
    LoginSubmitted event,
    Emitter<LoginState> emit,
  ) async {
    if (state.isValid) {
      emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
      try {
        var req = TicketRequest(
            username: state.username.value, password: state.password.value);
        var data = req.toJson();
        var res = await ticket(state.host.value, state.port.value, data);
        var address = Address(host: state.host.value, port: state.port.value);
        _addressRepository.saveAddress(address);
        _ticketRepository.saveTicket(res);
        emit(state.copyWith(status: FormzSubmissionStatus.success));
        logger.i("login success");
      } catch (e) {
        logger.e(e);
        emit(state.copyWith(status: FormzSubmissionStatus.failure));
      }
    }
  }
}
