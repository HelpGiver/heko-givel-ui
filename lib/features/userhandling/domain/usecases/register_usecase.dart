import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

abstract class RegisterEvent extends Equatable {
   RegisterEvent();
}

class RegisterButtonPressed extends RegisterEvent {
  final String username;
  final String password;
  final String mobileNumber;

   RegisterButtonPressed({
    @required this.username,
    @required this.password,
    @required this.mobileNumber,
  });

  @override
  List<Object> get props => [username, password, mobileNumber];

  @override
  String toString() =>
      'LoginButtonPressed { username: $username, password: $password , mobile: $mobileNumber}';
}