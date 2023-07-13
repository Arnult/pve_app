import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pve_app/src/blocs/authentication/authentication.dart';
import 'package:pve_app/src/log.dart';
import 'package:pve_app/src/repository/address_repository.dart';
import 'package:pve_app/src/repository/repository.dart';
import 'package:pve_app/src/repository/ticket_repository.dart';
import 'package:pve_app/src/route.dart';

void main() async {
  await Repository.init();
  runApp(const App());
}


class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late final TicketRepository _ticketRepository;
  late final AddressRepository _addressRepository;

  @override
  void initState() {
    super.initState();
    _ticketRepository = TicketRepository();
    _addressRepository = AddressRepository();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: _ticketRepository,
      child: BlocProvider(
        create: (_) => AuthenticationBloc(
          ticketRepository: _ticketRepository,
          addressRepository: _addressRepository,
        ),
        child: const AppView(),
      ),
    );
  }
}

class AppView extends StatefulWidget {
  const AppView({super.key});

  @override
  State<AppView> createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  @override
  Widget build(BuildContext context) => MaterialApp.router(
      routerConfig: router,
      builder: (context, child) =>
          BlocListener<AuthenticationBloc, AuthenticationState>(
            listener: (context, state) {
              switch (state.status) {
                case AuthenticationStatus.authenticated:
                  router.go("/login");
                case AuthenticationStatus.unauthenticated:
                  router.go("/login");
                case AuthenticationStatus.unknown:
                  logger.i('unknown');
                  break;
              }
            },
            child: child,
          ));
}
