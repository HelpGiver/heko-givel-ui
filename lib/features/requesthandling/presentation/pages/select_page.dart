import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:help_giver/features/userhandling/presentation/bloc/authentication_bloc.dart';
import 'package:help_giver/features/requesthandling/presentation/bloc/request_bloc.dart';
import 'package:help_giver/features/requesthandling/domain/usecases/request_usecase.dart';

class SelectPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AuthenticationBloc authenticationBloc =
        BlocProvider.of<AuthenticationBloc>(context);
    final RequestBloc requestBloc =
        BlocProvider.of<RequestBloc>(context);

    return Container(
        child: buildCenter(requestBloc, authenticationBloc),
    );
  }

  Center buildCenter(RequestBloc requestBloc, AuthenticationBloc authenticationBloc) {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/help_giver_suggested_logo.png'),
            RaisedButton(
              child: Text('All requests'),
              onPressed: () {
                requestBloc.dispatch(AllRequests(authenticationBloc.userRepository.user1));
              },
            ),
            // RaisedButton(
            //   child: Text('My requests'),
            //   onPressed: () {
            //     requestBloc.dispatch(MyRequests());
            //   },
            // ),
            // RaisedButton(
            //   child: Text('Make a request'),
            //   onPressed: () {
            //     requestBloc.dispatch(MakeRequest());
            //   },
            // ),
          ],
        ),
    );
  }
} 
