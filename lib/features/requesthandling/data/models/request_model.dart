import 'package:help_giver/features/requesthandling/domain/entities/request.dart';
import 'package:meta/meta.dart';

class RequestModel extends Request {
  RequestModel({@required String text, @required int number})
      : super(text: text, number: number);

  factory RequestModel.fromJson(Map<String, dynamic> json) {
    return RequestModel(
      //text: json['text'], 
      //number: (json['number'] as num).toInt()
      );
  }

  Map<String, dynamic> toJson(){
    return {
    //  'text':text,
    //  'number': number
    };
  }
}