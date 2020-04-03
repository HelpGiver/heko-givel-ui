import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:help_giver/features/userhandling/presentation/bloc/authentication_bloc.dart';
import 'package:help_giver/features/requesthandling/presentation/bloc/request_bloc.dart';
import 'package:help_giver/features/requesthandling/domain/usecases/request_usecase.dart';

class SelectPage extends StatelessWidget {
  final RequestBloc requestBloc;

  SelectPage({
    Key key,
    @required this.requestBloc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
        child: buildCenter(requestBloc),
    );
  }

  Center buildCenter(RequestBloc requestBloc) {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text('All requests'),
              onPressed: () {
                print("hoj");
                print(requestBloc.userRepository.username1);
                requestBloc.dispatch(AllRequests(requestBloc.userRepository.user1));
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
