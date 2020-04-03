import 'package:help_giver/features/requesthandling/domain/entities/request.dart';
import 'package:meta/meta.dart';

class RequestModel extends Request {

  RequestModel({@required int id, 
    @required String requestName,
    @required String requestDescription,
    @required String dateTime,
    @required String currentStatus,
    @required String address,
  }) : super(id: id,
      requestName: requestName, 
      requestDescription: requestDescription, 
      dateTime: dateTime, 
      currentStatus: currentStatus, 
      address: address);

  factory RequestModel.fromJson(Map<String, dynamic> json) {
    return RequestModel(
      id: json['_embedded']['helpRequests'][0]['id'],
      requestName: json['_embedded']['helpRequests'][0]['title'],
      requestDescription: json['_embedded']['helpRequests'][0]['description'],
      dateTime: json['_embedded']['helpRequests'][0]['dateTime'],
      currentStatus: json['_embedded']['helpRequests'][0]['currentStatus'],
      address: json['_embedded']['helpRequests'][0]['address'],
    );
  }


  // factory RequestModel.fromJson(Map<String, dynamic> json) {
  //   return RequestModel(
  //     text: json['text'] 
  //     //number: (json['number'] as num).toInt()
  //     );
  // }

  // Map<String, dynamic> toJson(){
  //   return {
  //   //  'text':text,
  //   //  'number': number
  //   };
  // }
}