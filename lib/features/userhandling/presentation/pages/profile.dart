import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
 static const routeName = '/profilePage';

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
          body: Container(
       
                child: Center(
          child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 10,),
                Container(
            height: 50, width: 50, child: Image.asset('assets/logo.jpg')),
            SizedBox(height: 5,),
            Text("Help Giver",style: TextStyle(fontSize: 30),),
            SizedBox(height: 20,),
                //     Padding(
                //     padding: EdgeInsets.fromLTRB(32.0, 0.0, 32.0, 0.0),
                //     child: RaisedButton(
                //     child: Text('logout '+ authenticationBloc.userRepository.username1.toString()),
                //     onPressed: () {
                //       authenticationBloc.dispatch(LoggedOut());
                //     },
                // )
                // ),

                Form(
            child: Column(
          children: <Widget>[
              TextFormField(
                initialValue: 'richard',
                      decoration: InputDecoration(
                  labelText: 'First Name',
                  hintText: 'Please Enter Your First Name',
                  hintStyle: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                textInputAction: TextInputAction.done,
              ),
              SizedBox(
                height: 10,
                width: 10,
              ),
               TextFormField(
                decoration: InputDecoration(
                  labelText: 'Last Name',
                  hintText: 'Please Enter Your Last Name',
                  hintStyle: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                textInputAction: TextInputAction.done,
              ),
              SizedBox(
                height: 10,
                width: 10,
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Phone Number',
                  hintText: 'Please Enter Your Phone Number',
                  hintStyle: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                textInputAction: TextInputAction.done,
              ),
              SizedBox(
                height: 10,
                width: 10,
              ),
              FlatButton(onPressed: (){
                Navigator.of(context).pushReplacementNamed('/');
              }, child:Image.asset('images/joinedHands.png')), 
          ],
                ),
                ),    
              ],
            ),
      ),
        ),
    );
      
    
  }
}