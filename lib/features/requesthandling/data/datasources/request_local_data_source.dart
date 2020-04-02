import 'dart:convert';

import 'package:help_giver/core/error/exceptions.dart';

import '../../domain/entities/request.dart';
import '../models/request_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:meta/meta.dart';

abstract class RequestLocalSource {
  /// Gets the cached [NumberTriviModel] which was gotten the last time the user had an internet connection.
  ///
  /// Throw [CacheException] if no cached is present.
  Future<RequestModel> askRequest(Request request);

  /// Throws a [ServerExcception] for all error codes.
  Future<RequestModel> listAllRequests(String userId);
  
  /// Throws a [ServerExcception] for all error codes.
  Future<RequestModel> listRequests(String userId, String status);
  
  Future<void> cacheRequest(RequestModel requestToCache);
}

class RequestLocalDataSourceImpl implements RequestLocalSource {
  //final SharedPreferences sharedPreferences;

  //RequestLocalDataSourceImpl({@required this.sharedPreferences});

  @override
  Future<RequestModel> askRequest(Request request) {
    //final jsonString = sharedPreferences.getString("");
    // if (jsonString != null) {
    //   return Future.value(null);//RequestModel.fromJson(json.decode(jsonString)));
    // } else
    //   throw CacheException();
  }

  
  @override
  Future<RequestModel> listAllRequests(String userId) {
    final jsonString = "";//sharedPreferences.getString("");
    if (jsonString != null) {
      return Future.value(null);//RequestModel.fromJson(json.decode(jsonString)));
    } else
      throw CacheException();
  }

  
  @override
  Future<RequestModel> listRequests(String userId, String status) {
    final jsonString = "";//sharedPreferences.getString("");
    if (jsonString != null) {
      return Future.value(null);//RequestModel.fromJson(json.decode(jsonString)));
    } else
      throw CacheException();
  }

  @override
  Future<void> cacheRequest(RequestModel requestToCache) {
    return null;//sharedPreferences.setString(
        // "CACHED_REQUEST",
        // json.encode(
        //   requestToCache.toJson(),
        // ));
  }
}
