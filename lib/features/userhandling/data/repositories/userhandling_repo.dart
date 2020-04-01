
import 'package:meta/meta.dart';

class UserRepository {
  String username1;

  Future<String> authenticate({
    @required String username,
    @required String password,
  }) async {
    await Future.delayed(Duration(seconds: 1));
    if (username != "richard" && password != "1") {
      throw 'Error login';
    } else {
      username1 = username;
      return 'token';
    }
  }

  Future<String> register({
    @required String username,
    @required String password,
    @required String mobileNumber,
  }) async {
    await Future.delayed(Duration(seconds: 1));
    if (username != "richard" && password != "1" && mobileNumber != "007" ) {
      print("Register error");
      throw 'Error register';
    } else {
      return 'token';
    }
  }

  Future<void> deleteToken() async {
    /// delete from keystore/keychain
    await Future.delayed(Duration(seconds: 1));
    return;
  }

  Future<void> persistToken(String token) async {
    /// write to keystore/keychain
    await Future.delayed(Duration(seconds: 1));
    return false;
  }

  Future<bool> hasToken() async {
    /// read from keystore/keychain
    await Future.delayed(Duration(seconds: 1));
    return false;
  }

}