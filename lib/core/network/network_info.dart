import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter/rendering.dart';

abstract class NetworkInfo {
  Future<bool> get isConnected;
}

class NetworkInfoImp implements NetworkInfo {
  final DataConnectionChecker connectionChecker;

  NetworkInfoImp(this.connectionChecker);

  //call forwarding
  //future holding a value of true or false from connectionCheck package.
  @override
  Future<bool> get isConnected => connectionChecker.hasConnection;
}
