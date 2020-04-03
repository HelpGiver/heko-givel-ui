import 'package:flutter/material.dart';

class Take extends StatelessWidget {
  static const routeName = '/seePage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Take on Tasks'),
      ),
          body: 
          
          Container(
        child: Center(
          child: Text ('Take'),
        ),
        
      ),
    );
  }
}