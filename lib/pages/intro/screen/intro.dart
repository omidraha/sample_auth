import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_auth/pages/auth/auth.dart';
import 'package:sample_auth/pages/auth/register/screen/register_screen.dart';
import 'package:sample_auth/pages/init/bloc/init_bloc.dart';

class IntroScreen extends StatelessWidget {
  static const String routeName = '/intro/';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: RaisedButton(
            onPressed: () {
              // @note: we have access to initBloc here.
              InitBloc initBloc = BlocProvider.of<InitBloc>(context);
              print('IntroScreen.initBloc.state: ${initBloc.state}');
              Navigator.of(context).pushNamed(AuthScreen.routeName);
            },
            child: Text('Intro page'),
          ),
        ),
      ),
    );
  }
}
