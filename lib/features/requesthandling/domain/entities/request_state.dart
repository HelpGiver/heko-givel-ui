import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

abstract class RequestState extends Equatable {
  @override
  List<Object> get props => [];
}

class NoRequestState extends RequestState {}

class AllRequestState extends RequestState {}

class MyRequestState extends RequestState {}

class MakeRequestState extends RequestState {}

class RequestLoading extends RequestState {}

class RequestFailure extends RequestState {
  final String error;

   RequestFailure({@required this.error});

  @override
  List<Object> get props => [error];

  @override
  String toString() => 'RequestFailure { error: $error }';
}