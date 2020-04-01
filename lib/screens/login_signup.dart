import 'package:flutter/material.dart';
class LoginSignup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromRGBO(0, 98, 95, 1).withOpacity(0.5),
            Color.fromRGBO(0, 49, 94, 1).withOpacity(0.9),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: [0, 1],
        ),
      ),
      child:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/help_giver_suggested_logo.png'),
            SizedBox(height: 50,),
            FlatButton(
              child: Text('Login', style: TextStyle(
                fontSize: 25,

              ),),
              padding: EdgeInsets.all(5),
              onPressed: () {},
            ),
            FlatButton(
              child: Text('Sign Up',style: TextStyle(
                fontSize: 25,
              ),
              ),
              padding: EdgeInsets.all(5),
              onPressed: () {},
            ),
          ],
        ),
      ) ,
    );
  }
}
