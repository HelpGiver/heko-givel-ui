import 'package:flutter/material.dart';


class See extends StatelessWidget {
  static const routeName = '/seePage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('See My Tasks'),
      ),
          body: 
          
          Container(
        child: Center(
          child: Text ('See'),
        ),
        
      ),
    );
  }
}