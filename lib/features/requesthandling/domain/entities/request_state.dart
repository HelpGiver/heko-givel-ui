import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:help_giver/features/requesthandling/domain/entities/request.dart';

abstract class RequestState extends Equatable {
  @override
  List<Object> get props => [];
}

class NoRequestState extends RequestState {}

class AllRequestState extends RequestState {
  final List<Request> requestList;

   AllRequestState({@required this.requestList});

  @override
  List<Object> get props => [requestList];

  @override
  String toString() => 'AllRequestState { requestList: $requestList }';
  }

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