import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:help_giver/features/userhandling/presentation/bloc/authentication_bloc.dart';
import 'package:help_giver/features/userhandling/domain/usecases/authentication_usecase.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AuthenticationBloc authenticationBloc =
        BlocProvider.of<AuthenticationBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Container(
        child: buildCenter(authenticationBloc),
      ),
    );
  }

  Center buildCenter(AuthenticationBloc authenticationBloc) {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/help_giver_suggested_logo.png'),
            RaisedButton(
              child: Text('Ask task'),
              onPressed: () {
                authenticationBloc.dispatch(LoggedOut());
              },
            ),
            RaisedButton(
              child: Text('Take on task'),
              onPressed: () {
                authenticationBloc.dispatch(LoggedOut());
              },
            ),
            RaisedButton(
              child: Text('Tasks to do'),
              onPressed: () {
                authenticationBloc.dispatch(LoggedOut());
              },
            ),
            RaisedButton(
              child: Text('logout '+ authenticationBloc.userRepository.username1.toString()),
              onPressed: () {
                authenticationBloc.dispatch(LoggedOut());
            },
        )
          ],
        ),
    );
  }
} 
