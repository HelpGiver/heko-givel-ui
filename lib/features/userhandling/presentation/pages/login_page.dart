import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:help_giver/features/userhandling/data/repositories/userhandling_repo.dart';

import 'package:help_giver/features/userhandling/presentation/bloc/authentication_bloc.dart';
import 'package:help_giver/features/userhandling/domain/usecases/authentication_usecase.dart';
import 'package:help_giver/features/userhandling/presentation/bloc/login_bloc.dart';
import 'package:help_giver/features/userhandling/presentation/pages/login_form.dart';

class LoginPage extends StatefulWidget {
  final UserRepository userRepository;
static const routeName = '/loginPage';
  LoginPage({Key key, @required this.userRepository})
      : assert(userRepository != null),
        super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginBloc _loginBloc;
  AuthenticationBloc _authenticationBloc;

  UserRepository get _userRepository => widget.userRepository;

  @override
  void initState() {
    _authenticationBloc = BlocProvider.of<AuthenticationBloc>(context);
    _loginBloc = LoginBloc(
      userRepository: _userRepository,
      authenticationBloc: _authenticationBloc,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Center(  
        child: Column(
          children: <Widget>[
          LoginForm(
          authenticationBloc: _authenticationBloc,
          loginBloc: _loginBloc,
        ),RaisedButton(
        onPressed: () {
          _authenticationBloc.dispatch(Register());
        },
        child: Text('Register'),
        ),
      ],
      ),
      ),
    );
  }

  @override
  void dispose() {
    _loginBloc.dispose();
    super.dispose();
  }
}