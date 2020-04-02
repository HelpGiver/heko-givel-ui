import 'package:help_giver/core/error/failures.dart';
import 'package:help_giver/core/usecases/usecases.dart';
import 'package:help_giver/features/requesthandling/domain/entities/request.dart';
import 'package:help_giver/features/requesthandling/data/repositories/requesthandling_repo.dart';
import 'package:help_giver/features/userhandling/domain/entities/user.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class ListAllRequest implements UseCase<Request, User> {
  final RequestRepository repository;
    
    ListAllRequest(this.repository);
  
    @override
    Future<Either<Failure, Request>> call(User user) async {
      return await repository.listAllRequests(user.userName);
    }
  }