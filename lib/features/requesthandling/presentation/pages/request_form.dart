import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:help_giver/features/requesthandling/presentation/bloc/request_bloc.dart';
import 'package:help_giver/features/requesthandling/presentation/pages/select_page.dart';
import 'package:help_giver/features/requesthandling/presentation/pages/allrequests_page.dart';
import 'package:help_giver/features/requesthandling/domain/usecases/request_usecase.dart';
import 'package:help_giver/features/requesthandling/domain/entities/request_state.dart';
import 'package:help_giver/features/userhandling/presentation/widgets/loading_indicator.dart';

class RequestForm extends StatefulWidget {
  final RequestBloc requestBloc;

  RequestForm({
    Key key,
    @required this.requestBloc,
  }) : super(key: key);

  @override
  State<RequestForm> createState() => _RequestFormState();
}

class _RequestFormState extends State<RequestForm> {

  RequestBloc get _requestBloc => widget.requestBloc;

  @override
  void dispose() {
    _requestBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RequestEvent, RequestState>(
          bloc: _requestBloc,
          builder: (BuildContext context, RequestState state) {
            if (state is NoRequestState) {
              return SelectPage(requestBloc: _requestBloc);
            }
            if (state is AllRequests) {
              return AllRequestsPage(requestBloc: _requestBloc);
            }
            // if (state is MyRequests) {
            //   return SelectPage(); //MyRequestsPage();
            // }
            // if (state is MakeRequest) {
            //   return SelectPage();// MakeRequestPage();
            // }
            if (state is RequestLoading) {
              return LoadingIndicator();
            }
          },
        );
  }
}
