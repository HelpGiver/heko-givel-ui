import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../injection_container.dart';
import 'package:help_giver/features/userhandling/presentation/bloc/authentication_bloc.dart';
import 'package:help_giver/features/userhandling/domain/usecases/authentication_usecase.dart';
import 'package:help_giver/features/requesthandling/presentation/bloc/request_bloc.dart';
import 'package:help_giver/features/requesthandling/presentation/pages/request_form.dart';

class HomePage extends StatelessWidget {
  final RequestBloc requestBloc;
  
  HomePage({
    Key key,
    @required this.requestBloc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AuthenticationBloc authenticationBloc =
        BlocProvider.of<AuthenticationBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Container(
        child: buildCenter(authenticationBloc, requestBloc),
      ),
    );
  }

  Center buildCenter(AuthenticationBloc authenticationBloc, RequestBloc requestBloc) {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/help_giver_suggested_logo.png'),
            RequestForm(
              requestBloc: requestBloc,
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
