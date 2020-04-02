import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:help_giver/features/requesthandling/data/repositories/requesthandling_repo.dart';

import 'package:help_giver/features/requesthandling/presentation/bloc/ask_bloc.dart';
import 'package:help_giver/features/requesthandling/presentation/pages/ask_form.dart';

class AskPage extends StatefulWidget {
  final RequestRepository requestRepository;

  AskPage({Key key, @required this.requestRepository})
      : assert(requestRepository != null),
        super(key: key);

  @override
  State<AskPage> createState() => _AskPageState();
}

class _AskPageState extends State<AskPage> {
  AskBloc _askBloc;
  AuthenticationBloc _authenticationBloc;

  RequestRepository get _requestRepository => widget.requestRepository;

  @override
  void initState() {
    _authenticationBloc = BlocProvider.of<AuthenticationBloc>(context);
    _askBloc = AskBloc(
      userRepository: _userRepository,
      authenticationBloc: _authenticationBloc,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ask for a task'),
      ),
      body: Center(  
        child: Column(
          children: <Widget>[
          AskForm(
          authenticationBloc: _authenticationBloc,
          askBloc: _askBloc,
        ),
      ],
      ),
      ),
    );
  }

  @override
  void dispose() {
    _askBloc.dispose();
    super.dispose();
  }
}