import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

void main() {
  print('Hello, World!');

  Future<Request> fetchRequest() async {
    final resp = await http.get(
        'http://localhost:8080/v1/user/5e8600a2433908443c6b2123/helpWantedRequests');

    return Request.fromJson(json.decode(resp.body));
  }

  fetchRequest().then((val) {
    print(val);
  });
}

class Request extends Equatable {
  final String id;
  final String requestName;
  final String requestDescription;
  final String address;

  final String dateTime;
  final String currentStatus;

  @override
  String toString() {
    return 'Request{id: $id, requestName: $requestName, requestDescription: $requestDescription, address: $address, dateTime: $dateTime, currentStatus: $currentStatus}';
  }

  Request({
    @required this.id,
    @required this.requestName,
    @required this.requestDescription,
    @required this.dateTime,
    @required this.currentStatus,
    @required this.address,
  }) : super([
          requestName,
          requestDescription,
          dateTime,
          currentStatus,
          address
        ]);

  factory Request.fromJson(Map<String, dynamic> json) {
    return Request(
      id: json['_embedded']['helpRequests'][0]['id'],
      requestName: json['_embedded']['helpRequests'][0]['title'],
      requestDescription: json['_embedded']['helpRequests'][0]['description'],
      dateTime: json['_embedded']['helpRequests'][0]['dateTime'],
      currentStatus: json['_embedded']['helpRequests'][0]['currentStatus'],
      address: json['_embedded']['helpRequests'][0]['address'],
    );
  }
}
