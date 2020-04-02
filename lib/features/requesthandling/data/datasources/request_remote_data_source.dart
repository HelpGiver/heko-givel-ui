import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

import '../../domain/entities/request.dart';
import 'package:help_giver/core/error/exceptions.dart';
import 'package:help_giver/features/requesthandling/data/models/request_model.dart';

abstract class RequestRemoteDataSource {
  
  /// Throw [CacheException] if no cached is present.
  Future<Request> askRequest(Request request);

  /// Throws a [ServerExcception] for all error codes.
  Future<Request> listAllRequests(String userId);
  
  /// Throws a [ServerExcception] for all error codes.
  Future<Request> listRequests(String userId, String status);

}

class RequestRemoteDataSourceImp implements RequestRemoteDataSource {
  final http.Client client;

  RequestRemoteDataSourceImp({@required this.client});

  @override
  Future<Request> askRequest(Request request) async {
    //return await _askRequest(request);
  }

  @override
  Future<Request> listAllRequests(String userId) async {
    return await _listRequests(userId, "all");
  }

    @override
  Future<Request> listRequests(String userId, String status) async {
    return await _listRequests(userId, status);
  }

  Future<Request> _listRequests(String url, String status) async {
    final response = await client.get('http://$url',
        headers: {'Content-Type': 'application/json'});

    if (response.statusCode == 200) {
      return null;//RequestModel.fromJson(json.decode(response.body));
    } else
      throw ServerException();
  }
}
