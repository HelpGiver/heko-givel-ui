import 'package:flutter/material.dart';
import 'package:help_giver/providers/request.dart';
import '../providers/requestBloc.dart';

class TakeHomePage extends StatefulWidget {
  @override
  _TakeHomePageState createState() => _TakeHomePageState();
}

class _TakeHomePageState extends State<TakeHomePage> {
  final RequestBloc _requestBloc = RequestBloc();
  @override
  dispose() {
    _requestBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Requests'),
      ),
      body: Container(
          child: StreamBuilder<List<Request>>(
        stream: _requestBloc.requestListStream,
        builder: (BuildContext context, AsyncSnapshot<List<Request>> snapshot) {
          return  ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  
                  elevation: 3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      
                      Text(
                        "${snapshot.data[index].id}",
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(
                        "${snapshot.data[index].requestName}",
                        style: TextStyle(fontSize: 20),
                      ),
                       Text(
                        "${snapshot.data[index].requestDescription}",
                        style: TextStyle(fontSize: 18),
                      ),
                       Text(
                        "${snapshot.data[index].address}",
                        style: TextStyle(fontSize: 16),
                      ),
                       Text(
                        "${snapshot.data[index].dateTime.toString()}",
                        style: TextStyle(fontSize: 10),
                      ),
                       Text(
                        "${snapshot.data[index].currentStatus
                        }",
                        style: TextStyle(fontSize: 20),
                      ),


                    ],
                  ),
                );
              });
        },
      )),
    );
  }
}
