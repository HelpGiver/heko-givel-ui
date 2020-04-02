import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/entities/request.dart';
import '../datasources/request_local_data_source.dart';
import '../datasources/request_remote_data_source.dart';

class RequestRepository {
  final RequestRemoteDataSource remoteDataSource;
  final RequestLocalSource localDataSource;
  final NetworkInfo networkInfo;

  RequestRepository(
      {@required this.remoteDataSource,
      @required this.localDataSource,
      @required this.networkInfo});

// SHOULD CHECK CACHE FIRST IN ALL BELOW

  @override
  Future<Either<Failure, Request>> askRequest(
    Request request,
  ) async {
    try {
        remoteDataSource.askRequest(request);
        return Right(request);
      } on ServerException {
        return Left(ServerFailure());
      }
  }

  @override
  Future<Either<Failure, Request>> listAllRequests(String userId) async {
    //higher order of function
      try {
        remoteDataSource.listAllRequests(userId);
        // "Should return request here from requestModel"
        return Right(null);
      } on ServerException {
        return Left(ServerFailure());
      }
  }

    @override
  Future<Either<Failure, Request>> listRequests(String userId, String status) async {
    //higher order of function
      try {
        remoteDataSource.listRequests(userId, status);
        // "Should return request here from requestModel"
        return Right(null);
      } on ServerException {
        return Left(ServerFailure());
      }
  }

// Future<Either<Failure, Request>> _askRequest(
// ) async{
//     if (await networkInfo.isConnected) {
//       try {
//         localDataSource.cacheRequest(remoteRequest);
//         return Right(remoteRequest);
//       } on ServerException {
//         return Left(ServerFailure());
//       }
//     } else {
//       try {
//         final localRequest = await localDataSource.getRequest();
//         return Right(localRequest);
//       } on CacheException {
//         return Left(CacheFailure());
//       }
//     }
//  }
}
