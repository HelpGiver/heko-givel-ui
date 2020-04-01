import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:help_giver/features/userhandling/presentation/bloc/authentication_bloc.dart';
import 'package:help_giver/features/userhandling/domain/usecases/authentication_usecase.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AuthenticationBloc authenticationBloc =
        BlocProvider.of<AuthenticationBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Container(
        child: buildCenter(authenticationBloc),
      ),
    );
  }

  Center buildCenter(AuthenticationBloc authenticationBloc) {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/help_giver_suggested_logo.png'),
          Padding(
          padding: EdgeInsets.fromLTRB(32.0, 0.0, 32.0, 0.0),
          child: RaisedButton(
          child: Text('logout '+ authenticationBloc.userRepository.username1.toString()),
          onPressed: () {
            authenticationBloc.dispatch(LoggedOut());
          },
      )
      ),
          ],
        ),
    );
  }
} 
/*
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text('Welcome ' + inloggedUser.name),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/Home_illustration.png'),
            Padding(padding: EdgeInsets.fromLTRB(0.0, 32.0, 0.0, 0.0)),
            new Container(
                width: 300.0,
                child: new TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    border: new OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(10.0),
                      ),
                    ),
                    labelText: 'What do you want to do now?',
                  ),
                )),
            SpontanButton(
                registerUser: inloggedUser,
                buttonName: 'Create a meeting',
                route: MeetingScreen.routeName),
            SpontanButton(
                buttonName: 'Log out',
                registerUser: inloggedUser,
                route: LoginPage.routeName),
          ],
        ),
      ),
    ); //
  }
}
    appBar: AppBar(
        title: Text('Home'),
      ),
      body: Container(
        child: buildCenter(authenticationBloc),
      ),
    );
  }

  Center buildCenter(AuthenticationBloc authenticationBloc) {
    return Center(
          child: RaisedButton(
        child: Text('logout '+ authenticationBloc.userRepository.username1.toString()),
        onPressed: () {
          authenticationBloc.dispatch(LoggedOut());
        },
      ));
  }
} */