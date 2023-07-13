import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pve_app/src/repository/address_repository.dart';
import 'package:pve_app/src/repository/ticket_repository.dart';

import '../blocs/login/login.dart';
import '../widgets/login_form.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: BlocProvider(
          create: (context) {
            return LoginBloc(
              addressRepository: AddressRepository(),
              ticketRepository: TicketRepository(),
            );
          },
          child: const LoginForm(),
        ),
      ),
    );
  }
}
