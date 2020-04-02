import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class User extends Equatable {
  final int id;
  final String userName;
  final String password;
  final String mobileNumber;
  final String address;

  User({this.id, 
    @required this.userName,
    @required this.password,
    this.mobileNumber,
    this.address,
  }) : super([userName, password, mobileNumber, address]);
}
