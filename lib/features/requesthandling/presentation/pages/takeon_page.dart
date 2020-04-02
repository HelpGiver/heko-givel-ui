import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:help_giver/features/requesthandling/data/repositories/requesthandling_repo.dart';

import 'package:help_giver/features/requesthandling/presentation/bloc/request_bloc.dart';
import 'package:help_giver/features/requesthandling/presentation/pages/takeon_form.dart';

class TakeonPage extends StatefulWidget {
  final RequestRepository requestRepository;

  TakeonPage({Key key, @required this.requestRepository})
      : assert(requestRepository != null),
        super(key: key);

  @override
  State<TakeonPage> createState() => _TakeonPageState();
}

class _TakeonPageState extends State<TakeonPage> {
  RequestBloc _requestBloc;

  RequestRepository get _requestRepository => widget.requestRepository;

  @override
  void initState() {
    _requestBloc = BlocProvider.of<RequestBloc>(context);
    _requestBloc = RequestBloc(
      requestRepository: _requestRepository,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Take on requests'),
      ),
      body: TakeonForm(
        requestBloc: _requestBloc,
      ),
    );
  }

  @override
  void dispose() {
    _registerBloc.dispose();
    super.dispose();
  }
}