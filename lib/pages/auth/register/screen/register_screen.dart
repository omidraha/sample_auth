import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_auth/pages/auth/register/bloc/register_bloc.dart';
import 'package:sample_auth/pages/auth/register/bloc/register_event.dart';
import 'package:sample_auth/pages/auth/verify/screen/verify_screen.dart';
import 'package:sample_auth/pages/init/bloc/init_bloc.dart';

class RegisterScreen extends StatelessWidget {
  static const String routeName = 'auth/register/';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
//      body: Register(),
      body: Center(
        child: RaisedButton(
          child: Text('Register'),
          onPressed: () {
            // @note: we need to access to initBloc and registerBloc here.
            InitBloc initBloc = BlocProvider.of<InitBloc>(context);
            print('RegisterScreen.initBloc.state: ${initBloc.state}');
            RegisterBloc registerBloc = BlocProvider.of<RegisterBloc>(context);
            print('RegisterScreen.registerBloc.state: ${registerBloc.state}');
            registerBloc..add(UserSubmitRegistration());
            Navigator.of(context).pushNamed(VerifyScreen.routeName);
          },
        ),
      ),
    ));
  }
}
