import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:help_giver/features/requesthandling/presentation/bloc/request_bloc.dart';
import 'package:help_giver/features/requesthandling/domain/usecases/request_usecase.dart';

class AllRequestsPage extends StatelessWidget {
  final RequestBloc requestBloc;

  AllRequestsPage({
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
            Image.asset('assets/help_giver_suggested_logo.png'),
            Text('All requests'),
          ],
        ),
    );
  }
} 
