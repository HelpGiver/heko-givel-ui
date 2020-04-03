import 'package:flutter/material.dart';

class Make extends StatelessWidget {
static const routeName = '/makePage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Make Reuqests'),
      ),
          body: 
          
          Container(
        child: Center(
          child: Text ('Make'),
        ),
        
      ),
    );
  }
}