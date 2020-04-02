import 'package:help_giver/core/error/failures.dart';
import 'package:help_giver/core/usecases/usecases.dart';
import 'package:help_giver/features/requesthandling/domain/entities/request.dart';
import 'package:help_giver/features/requesthandling/domain/irepositories/requesthandling_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';


class AskRequest implements UseCase<Request, NoParams> {
   final RequestRepository repository;
    
    AskRequest(this.repository);
  
    @override
    Future<Either<Failure, Request>> call(Params params) async {
      return await repository.askRequest(params.request);
    }
  }

  class Params extends Equatable{
    final Request request;

    Params({@required this.request}) : super([request]);
  }