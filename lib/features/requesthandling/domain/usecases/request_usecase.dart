import 'package:help_giver/features/userhandling/domain/entities/user.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

abstract class RequestEvent extends Equatable {
  RequestEvent([List props = const []]) : super(props);
}

class NoRequests extends RequestEvent {
  @override
  String toString() => 'NoRequests';
}

class AllRequests extends RequestEvent {
   final User user;
    
    AllRequests(this.user);
  
    @override
    String toString() => 'AllRequests';
}

class MyRequests extends RequestEvent {
  @override
  String toString() => 'MyRequests';
}

class MakeRequest extends RequestEvent {
  @override
  String toString() => 'MakeRequest';
}
