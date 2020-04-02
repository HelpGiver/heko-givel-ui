import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:help_giver/features/userhandling/presentation/bloc/authentication_bloc.dart';
import 'package:help_giver/features/userhandling/domain/usecases/authentication_usecase.dart';
import 'package:help_giver/features/requesthandling/presentation/bloc/request_bloc.dart';

class SelectPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final RequestBloc requestBloc =
        BlocProvider.of<RequestBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('NoRequests'),
      ),
      body: Container(
        child: buildCenter(requestBloc),
      ),
    );
  }

  Center buildCenter(RequestBloc requestBloc) {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/help_giver_suggested_logo.png'),
            RaisedButton(
              child: Text('All requests'),
              onPressed: () {
                requestBloc.dispatch(AllRequests());
              },
            ),
            RaisedButton(
              child: Text('My requests'),
              onPressed: () {
                requestBloc.dispatch(MyRequests());
              },
            ),
            RaisedButton(
              child: Text('Make a request'),
              onPressed: () {
                requestBloc.dispatch(MakeRequest());
              },
            ),
          ],
        ),
    );
  }
} 
