enum currentStatusEnum {
  requested, completed
}
enum requestNameEnum {
  Groceries, Transport, Dog_Walker, Prepared_Food, Pharmacy
}
class Request {
  int id;
  String requestName;
  String requestDescription;
  String address;

  String dateTime;
  String currentStatus;


  Request({ this.id,this.requestName, this.requestDescription, this.dateTime, this.currentStatus, this.address});
}


