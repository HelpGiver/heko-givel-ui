import 'dart:async';

import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:help_giver/features/requesthandling/data/repositories/requesthandling_repo.dart';
import 'package:help_giver/features/requesthandling/domain/usecases/request_usecase.dart';

class RequestBloc extends Bloc<RequestEvent, RegisterState> {
  final RequestRepository requestRepository;

  RequestBloc({
    @required this.requestRepository,
  })  : assert(requestRepository != null);

  @override
  RegisterState get initialState => RegisterInitial();

  @override
  Stream<RegisterState> mapEventToState(
    RegisterState currentState,
    RegisterEvent event,
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