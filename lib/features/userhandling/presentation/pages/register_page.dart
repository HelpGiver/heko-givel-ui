import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:help_giver/features/userhandling/data/repositories/userhandling_repo.dart';

import 'package:help_giver/features/userhandling/presentation/bloc/authentication_bloc.dart';
import 'package:help_giver/features/userhandling/presentation/bloc/register_bloc.dart';
import 'package:help_giver/features/userhandling/presentation/pages/register_form.dart';

class RegisterPage extends StatefulWidget {
  final UserRepository userRepository;

  RegisterPage({Key key, @required this.userRepository})
      : assert(userRepository != null),
        super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  RegisterBloc _registerBloc;
  AuthenticationBloc _authenticationBloc;

  UserRepository get _userRepository => widget.userRepository;

  @override
  void initState() {
    _authenticationBloc = BlocProvider.of<AuthenticationBloc>(context);
    _registerBloc = RegisterBloc(
      userRepository: _userRepository,
      authenticationBloc: _authenticationBloc,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
      ),
      body: RegisterForm(
        authenticationBloc: _authenticationBloc,
        registerBloc: _registerBloc,
      ),
    );
  }

  @override
  void dispose() {
    _registerBloc.dispose();
    super.dispose();
  }
}