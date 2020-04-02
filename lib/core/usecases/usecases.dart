import 'package:help_giver/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

abstract class UseCase<Type, User>{
  Future<Either<Failure, Type>> call(User user);  
}

class NoParams extends Equatable{}