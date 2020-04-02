import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/entities/number_trivia.dart';
import '../../domain/irepositories/number_trivia_repository.dart';
import '../datasources/number_trivia_local_data_source.dart';
import '../datasources/number_trivia_remote_remote_data_source.dart';

typedef Future<Request> _ConcreteOrRandomChooser();

class RequestRepositoryImplementation implements RequestRepository {
  final RequestRemoteDataSource remoteDataSource;
  final RequestLocalSource localDataSource;
  final NetworkInfo networkInfo;

  RequestRepositoryImplementation(
      {@required this.remoteDataSource,
      @required this.localDataSource,
      @required this.networkInfo});

  @override
  Future<Either<Failure, Request>> askRequest(
    int number,
  ) async {
    //higher order of function
    return await _getTrivia(() {
      return remoteDataSource.askRequest(number);
    });
  }

  @override
  Future<Either<Failure, Request>> takeonRequest() async {
    //higher order of function
    return await _getTrivia(() {
      return remoteDataSource.takeonRequest();
    });
  }

Future<Either<Failure, Request>> _askRequest(
) async{
    if (await networkInfo.isConnected) {
      try {
        final remoteTrivia = await getConcreteOrRandom();
        localDataSource.cacheNumberTrivia(remoteTrivia);
        return Right(remoteTrivia);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localTrivia = await localDataSource.getLastNumberTrivia();
        return Right(localTrivia);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
 }
}
