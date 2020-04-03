import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:help_giver/features/requesthandling/presentation/bloc/request_bloc.dart';
import 'package:help_giver/features/requesthandling/domain/usecases/request_usecase.dart';
import 'package:help_giver/features/requesthandling/domain/entities/request.dart';

class AllRequestsPage extends StatelessWidget {
  final List<Request> requestList;
  final RequestBloc requestBloc;

  AllRequestsPage({
    Key key,
    @required this.requestBloc,
    @required this.requestList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (requestList != null) {
      return Container(
          child: buildCenter(requestBloc, requestList),
      );
    } else {
      return Text("No requests");
    }
  }

  Center buildCenter(RequestBloc requestBloc, List<Request> requestList) {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 20,),
            Image.asset('images/seeMyTasks.png'), 
            Text(''),
            ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: requestList.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  elevation: 3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "${requestList[index].id}",
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(
                        "${requestList[index].requestName}",
                        style: TextStyle(fontSize: 20),
                      ),
                       Text(
                        "${requestList[index].requestDescription}",
                        style: TextStyle(fontSize: 18),
                      ),
                       Text(
                        "${requestList[index].address}",
                        style: TextStyle(fontSize: 16),
                      ),
                       Text(
                        "${requestList[index].dateTime.toString()}",
                        style: TextStyle(fontSize: 10),
                      ),
                       Text(
                        "${requestList[index].currentStatus}",
                        style: TextStyle(fontSize: 20),
                      ),


                    ],
                  ),
                );
              }),
          ],
        ),
    );
  }
} 
