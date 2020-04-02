import 'package:help_giver/core/error/failures.dart';
import 'package:help_giver/core/usecases/usecases.dart';
import 'package:help_giver/features/requesthandling/domain/entities/request.dart';
import 'package:help_giver/features/requesthandling/domain/irepositories/requesthandling_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class ListAllRequest implements UseCase<Request, Params> {
  final RequestRepository repository;
    
    ListAllRequest(this.repository);
  
    @override
    Future<Either<Failure, Request>> call(Params params) async {
      return await repository.listAllRequests(params.userId);
    }
  }

  class Params extends Equatable{
    final String userId;

    Params({@required this.userId}) : super([userId]);
  }