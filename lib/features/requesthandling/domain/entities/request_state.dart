
import 'package:equatable/equatable.dart';

abstract class RequestState extends Equatable {
  @override
  List<Object> get props => [];
}

class NoRequests extends RequestState {}

class AllRequests extends RequestState {}

class MyRequests extends RequestState {}

class MakeRequest extends RequestState {}

class RequestLoading extends RequestState {}