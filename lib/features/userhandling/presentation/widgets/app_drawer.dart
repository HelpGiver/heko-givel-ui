import 'package:flutter/material.dart';
import 'package:help_giver/features/userhandling/presentation/pages/profile.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            title: Text('richard'),
            leading: CircleAvatar(
              radius: 25.0,
              backgroundImage: AssetImage(
                'assets/my.jpg',
              ),
            ),
            automaticallyImplyLeading: false,
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('HOME'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),

          Divider(),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('PROFILE'),
            onTap: () {
             Navigator.of(context).pushNamed(Profile.routeName);
            },
          ),
           Divider(),
          ListTile(
            leading: Icon(Icons.add_location),
            title: Text('LOCATION'),
            onTap: () {
             
            },
          ),
          Divider(),
                    ListTile(
            leading: Icon(Icons.assignment),
            title: Text('MY TASKS'),
            onTap: () {
             
            },
          ),
          Divider(),
         ListTile(
            leading: Icon(Icons.business_center),
            title: Text('MY REQUESTS'),
            onTap: () {
             
            },
          ),
          Divider(),
                   ListTile(
            leading: Icon(Icons.notifications_active),
            title: Text('COMMUNITY ASKS'),
            onTap: () {
             
            },
          ),
          Divider(),
                   ListTile(
            leading: Icon(Icons.chrome_reader_mode),
            title: Text('USER GUIDE'),
            onTap: () {
             
            },
          ),
          Divider(),
                   ListTile(
            leading: Icon(Icons.input),
            title: Text('LOGOUT'),
            onTap: () {
             
            },
          ),
          Divider(),
         
        ],
      ),
    );
  }
}
