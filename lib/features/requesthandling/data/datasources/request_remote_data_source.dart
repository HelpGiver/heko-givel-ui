import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

import 'package:help_giver/core/error/exceptions.dart';
import 'package:help_giver/features/requesthandling/data/models/request_model.dart';

abstract class RequestRemoteDataSource {
  /// Throws a [ServerExcception] for all error codes.
  Future<RequestModel> askRequest(int number);

  /// Throws a [ServerExcception] for all error codes.
  Future<RequestModel> takeonRequest();
}

class NumberTriviaRemoteDataSourceImp implements NumberTriviaRemoteDataSource {
  final http.Client client;

  NumberTriviaRemoteDataSourceImp({@required this.client});

  @override
  Future<NumberTriviaModel> getConcreteNumberTrivia(int number) async {
    return await _getTriviaFromUrl(number.toString());
  }

  @override
  Future<NumberTriviaModel> getRandomNumberTrivia() async {
    return await _getTriviaFromUrl('random');
  }

  Future<NumberTriviaModel> _getTriviaFromUrl(String url) async {
    final response = await client.get('http://numbersapi.com/$url',
        headers: {'Content-Type': 'application/json'});

    if (response.statusCode == 200) {
      return NumberTriviaModel.fromJson(json.decode(response.body));
    } else
      throw ServerException();
  }
}
