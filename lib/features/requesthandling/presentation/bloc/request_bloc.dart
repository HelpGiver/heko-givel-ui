import 'dart:async';

import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:help_giver/features/requesthandling/domain/usecases/request_usecase.dart';
// import 'package:help_giver/features/requesthandling/domain/usecases/ask_usecase.dart';
// import 'package:help_giver/features/requesthandling/domain/usecases/takeon_usecase.dart';
// import 'package:help_giver/features/requesthandling/domain/usecases/delete_usecase.dart';
import 'package:help_giver/features/requesthandling/domain/usecases/listall_usecase.dart';
import 'package:help_giver/features/requesthandling/domain/entities/request_state.dart';
import 'package:help_giver/features/userhandling/data/repositories/userhandling_repo.dart';
import 'package:help_giver/features/requesthandling/data/repositories/requesthandling_repo.dart';

const String SERVER_FAILURE_MESSAGE = 'Server failure';
const String CACHE_FAILURE_MESSAGE = 'Cache failure';
const String INVALID_INPUT_FAILURE_MESSAGE =
    'Invalid input - The number must be a positive integer or zero';

class RequestBloc extends Bloc<RequestEvent, RequestState> {
  final UserRepository userRepository;
  final RequestRepository requestRepository;

  RequestBloc({@required this.userRepository, @required this.requestRepository})
      : assert(userRepository != null, requestRepository != null);


  @override
  RequestState get initialState => NoRequestState();

  @override
  Stream<RequestState> mapEventToState(
    RequestState currentState,
    RequestEvent event,
  ) async* {
    if (event is AllRequests) {
    print("hhhhhhhoooolss sd sada");
        yield RequestLoading();

        try {
          print("hej");
          //ListAllRequest hej = ListAllRequest(requestRepository);
          //hej.call(userRepository.user1);
          yield AllRequestState();
        } catch (error) {
          yield RequestFailure(error: error.toString());
        }
    }
  }
}