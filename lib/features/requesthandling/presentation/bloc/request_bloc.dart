import 'dart:async';

import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:help_giver/features/requesthandling/domain/usecases/request_usecase.dart';
import 'package:help_giver/features/requesthandling/domain/usecases/ask_usecase.dart';
import 'package:help_giver/features/requesthandling/domain/usecases/list_usecase.dart';
import 'package:help_giver/features/requesthandling/domain/usecases/listall_usecase.dart';
import 'package:help_giver/features/requesthandling/domain/usecases/takeon_usecase.dart';
import 'package:help_giver/features/requesthandling/domain/usecases/delete_usecase.dart';
import 'package:help_giver/features/requesthandling/domain/entities/request_state.dart';
import 'package:help_giver/features/requesthandling/domain/irepositories/requesthandling_repo.dart';


const String SERVER_FAILURE_MESSAGE = 'Server failure';
const String CACHE_FAILURE_MESSAGE = 'Cache failure';
const String INVALID_INPUT_FAILURE_MESSAGE =
    'Invalid input - The number must be a positive integer or zero';

class RequestBloc extends Bloc<RequestEvent, RequestState> {
  final RequestEvent requestEvent;
  final AskRequest askRequest;
  final DeleteRequest deleteRequest;
  final ListRequest listRequest;
  final ListAllRequest listAllRequest;
  final TakeonRequest takeonRequest;


  RequestBloc({@required this.requestEvent,
      @required this.askRequest,
      @required this.deleteRequest,
      @required this.listRequest,
      @required this.listAllRequest,
      @required this.takeonRequest});

  @override
  RequestState get initialState => RequestInitial();

  @override
  Stream<RequestState> mapEventToState(
    RequestState currentState,
    RequestEvent event,
  ) async* {
    if (event is RegisterButtonPressed) {
      yield RegisterLoading();

      try {
        final token = await userRepository.register(
          username: event.username,
          password: event.password,
          mobileNumber: event.mobileNumber,
        );

        authenticationBloc.dispatch(LoggedOut());
        yield RegisterInitial();
      } catch (error) {
        yield RegisterFailure(error: error.toString());
      }
    }
  }
}