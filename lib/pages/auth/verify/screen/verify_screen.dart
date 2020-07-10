import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_auth/pages/auth/register/bloc/register_bloc.dart';
import 'package:sample_auth/pages/auth/verify/bloc/verify_bloc.dart';
import 'package:sample_auth/pages/auth/verify/bloc/verify_event.dart';
import 'package:sample_auth/pages/home/screen/home.dart';
import 'package:sample_auth/pages/init/bloc/init_bloc.dart';

class VerifyScreen extends StatelessWidget {
  static const String routeName = '/verify/';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
//      body: Verify(),
      body: Center(
        child: RaisedButton(
          child: Text('Verify'),
          onPressed: () {
            // @note: we need to access to registerBloc and VerifyBloc here.
            RegisterBloc registerBloc = BlocProvider.of<RegisterBloc>(context);
            print('VerifyScreen.registerBloc.state: ${registerBloc.state}');
            VerifyBloc verifyBloc = BlocProvider.of<VerifyBloc>(context);
            print('VerifyScreen.verifyBloc.state: ${verifyBloc.state}');
            verifyBloc..add(UserSubmitVerificationCode());
            Navigator.of(context, rootNavigator: true)
                .pushNamed(HomeScreen.routeName);
          },
        ),
      ),
    ));
  }
}
