import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_auth/pages/home/bloc/home_bloc.dart';
import 'package:sample_auth/pages/init/bloc/init_block.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/home/';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: RaisedButton(
            child: Text('Home'),
            onPressed: () {
              // @note: we need to access to initBloc and homeBloc here.
              InitBloc initBloc = BlocProvider.of<InitBloc>(context);
              print('HomeScreen.initBloc.state: ${initBloc.state}');
              HomeBloc homeBloc = BlocProvider.of<HomeBloc>(context);
              print('HomeScreen.homeBloc.state: ${homeBloc.state}');
            },
          ),
        ),
      ),
    );
  }
}
