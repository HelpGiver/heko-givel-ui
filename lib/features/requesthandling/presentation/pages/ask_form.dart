import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';


class AskForm extends StatefulWidget {
  final AskBloc askBloc;

  AskForm({
    Key key,
    @required this.askBloc,
  }) : super(key: key);

  @override
  State<AskForm> createState() => _AskFormState();
}

class _AskFormState extends State<AskForm> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  AskBloc get _askBloc => widget.askBloc;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AskEvent, AskState>(
      bloc: _askBloc,
      builder: (
        BuildContext context,
        AskState state,
      ) {
        if (state is LoginFailure) {
          _onWidgetDidBuild(() {
            Scaffold.of(context).showSnackBar(
              SnackBar(
                content: Text('${state.error}'),
                backgroundColor: Colors.red,
              ),
            );
          });
        }

        return Form(
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'username'),
                controller: _usernameController,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'password'),
                controller: _passwordController,
                obscureText: true,
              ),
              RaisedButton(
                onPressed:
                    state is! LoginLoading ? _onLoginButtonPressed : null,
                child: Text('Login'),
              ),
              Container(
                child:
                    state is LoginLoading ? CircularProgressIndicator() : null,
              ),
            ],
          ),
        );
      },
    );
  }

  void _onWidgetDidBuild(Function callback) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      callback();
    });
  }

  _onLoginButtonPressed() {
    _loginBloc.dispatch(LoginButtonPressed(
      username: _usernameController.text,
      password: _passwordController.text,
    ));
  }

}