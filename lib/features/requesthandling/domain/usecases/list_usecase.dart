import 'package:help_giver/core/error/failures.dart';
import 'package:help_giver/core/usecases/usecases.dart';
import 'package:help_giver/features/requesthandling/domain/entities/request.dart';
import 'package:help_giver/features/requesthandling/data/repositories/requesthandling_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class ListRequest implements UseCase<Request, Params> {
  final RequestRepository repository;
    
    ListRequest(this.repository);
  
    @override
    Future<Either<Failure, Request>> call(Params params) async {
      return await repository.listRequests(params.userId, params.status);
    }
  }

  class Params extends Equatable{
    final String userId;
    final String status;

    Params({@required this.userId, @required this.status}) : super([userId, status]);
  }