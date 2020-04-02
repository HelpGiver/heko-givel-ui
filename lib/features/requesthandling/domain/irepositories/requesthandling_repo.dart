import 'package:help_giver/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import '../entities/request.dart';

abstract class RequestRepository {
  Future<Either<Failure, Request>> askRequest(Request request);
  Future<Either<Failure, Request>> listAllRequests(String userId);
  Future<Either<Failure, Request>> listRequests(String userId, String status);
}