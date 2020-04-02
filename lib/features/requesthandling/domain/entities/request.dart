import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

enum currentStatusEnum {
  requested, completed
}
enum requestNameEnum {
  Groceries, Transport, Dog_Walker, Prepared_Food, Pharmacy
}

class Request extends Equatable {
  final int id;
  final String requestName;
  final String requestDescription;
  final String address;

  final String dateTime;
  final String currentStatus;


  Request({@required this.id, 
    @required this.requestName,
    @required this.requestDescription,
    @required this.dateTime,
    @required this.currentStatus,
    @required this.address,
  }) : super([requestName, requestDescription, dateTime, currentStatus, address]);
}
