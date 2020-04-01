//imports
//create list of request
//Stream Controllers
//Stream sink getter
//Constructor - add data , listen to changed
//core functions
//dispose

//imports
import 'dart:async';
import '../providers/request.dart';


//create list of request
class RequestBloc {

  List<Request> _requestList =[
Request(id : 1 , requestName: "Groceries", 
requestDescription: '2 oranges',
 currentStatus: "completed",
  address: ' this is my address',
   dateTime: DateTime.now().toString()),
Request(id : 2, requestName: "Transport", 
requestDescription: 'Book a to GP',
 currentStatus: "requested",
  address: ' this is my address',
   dateTime: DateTime.now().toString()),
  ];

//Stream Controllers
final _requestListStreamController = StreamController<List<Request>>();
final _currentStatusController = StreamController<Request>();

//Stream sink getter

Stream<List<Request>> get requestListStream => _requestListStreamController.stream;

StreamSink<List<Request>> get requestListSink => _requestListStreamController.sink;
StreamSink<Request> get curentStatusSink => _currentStatusController.sink;

RequestBloc(){
  _requestListStreamController.add(_requestList);

  _currentStatusController.stream.listen(_currentStatus);
  
}
_currentStatus (Request req){
  _requestList[req.id].currentStatus = "completed";
  

}
void dispose(){
  _requestListStreamController.close();
  _currentStatusController.close();

}

}