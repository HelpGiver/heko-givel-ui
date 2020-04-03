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
  Future<Request> listRequests(String userId, String status) async {
    //return null; await listRequests(userId, "all");
  }

  Future<Request> listAllRequests(String userId) async {
    final response = await http.get(
        'http://localhost:8080/v1/user/5e8600a2433908443c6b2123/helpWantedRequests');

    if (response.statusCode == 200) {
      return RequestModel.fromJson(json.decode(response.body));
    } else
      throw ServerException();
  }
}
