import 'package:flutter/material.dart';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:help_giver/features/requesthandling/presentation/pages/homepage.dart';
import 'package:help_giver/features/userhandling/presentation/pages/splash_page.dart';
import 'package:help_giver/features/userhandling/presentation/pages/login_page.dart';
import 'package:help_giver/features/userhandling/presentation/pages/register_page.dart';

import 'package:help_giver/features/userhandling/data/repositories/userhandling_repo.dart';
import 'package:help_giver/features/requesthandling/data/repositories/requesthandling_repo.dart';
import 'package:help_giver/features/userhandling/presentation/bloc/authentication_bloc.dart';
import 'package:help_giver/features/userhandling/presentation/widgets/loading_indicator.dart';

import 'package:help_giver/features/userhandling/domain/usecases/authentication_usecase.dart';
import 'package:help_giver/features/userhandling/domain/entities/authentication_entity.dart';

import 'features/requesthandling/presentation/bloc/request_bloc.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'core/network/network_info.dart';
import 'features/requesthandling/data/datasources/request_local_data_source.dart';
import 'features/requesthandling/data/datasources/request_remote_data_source.dart';

class SimpleBlocDelegate extends BlocDelegate {
  @override
  void onTransition(Transition transition) {
    print(transition.toString());
  }
}

void main() {
  //final sharedPreference = Future<void> () async {await SharedPreferences.getInstance()};

  RequestRepository r = RequestRepository(
    remoteDataSource: RequestRemoteDataSourceImp(client: http.Client()),
    localDataSource: RequestLocalDataSourceImpl(),
    networkInfo: NetworkInfoImp(DataConnectionChecker()),
  );

  BlocSupervisor().delegate = SimpleBlocDelegate();
  runApp(App(userRepository: UserRepository(), requestRepository: r));
}

class App extends StatefulWidget {
  final UserRepository userRepository;
  final RequestRepository requestRepository;

  App({Key key, @required this.userRepository, @required this.requestRepository}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  AuthenticationBloc authenticationBloc;
  RequestBloc requestBloc;
  UserRepository get userRepository => widget.userRepository;
  RequestRepository get requestRepository => widget.requestRepository;

  @override
  void initState() {
    authenticationBloc = AuthenticationBloc(userRepository: userRepository);
    authenticationBloc.dispatch(AppStarted());
    requestBloc = RequestBloc(userRepository: userRepository, requestRepository: requestRepository);
    super.initState();
  }

  @override
  void dispose() {
    authenticationBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthenticationBloc>(
      bloc: authenticationBloc,
      child: MaterialApp(
        home: BlocBuilder<AuthenticationEvent, AuthenticationState>(
          bloc: authenticationBloc,
          builder: (BuildContext context, AuthenticationState state) {
            if (state is AuthenticationUninitialized) {
              return SplashPage();
            }
            if (state is AuthenticationAuthenticated) {
              return HomePage(requestBloc: requestBloc);
            }
            if (state is AuthenticationUnauthenticated) {
              return LoginPage(userRepository: userRepository);
            }
            if (state is AuthenticationStartRegistration) {
              return RegisterPage(userRepository: userRepository);
            }
            if (state is AuthenticationLoading) {
              return LoadingIndicator();
            }
          },
        ),
      ),
    );
  }
}
