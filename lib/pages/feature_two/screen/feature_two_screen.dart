import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_auth/pages/feature_two/bloc/feature_two_bloc.dart';
import 'package:sample_auth/pages/feature_two/bloc/feature_two_event.dart';
import 'package:sample_auth/pages/feature_two/bloc/feature_two_state.dart';

class FeatureTwoScreen extends StatefulWidget {
  static const String routeName = '/FeatureTwoScreen/';

  @override
  _FeatureTwoScreenState createState() => _FeatureTwoScreenState();
}

class _FeatureTwoScreenState extends State<FeatureTwoScreen> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    BlocProvider.of<FeatureTwoBloc>(context).add(LoadData());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeatureTwoBloc, FeatureTwoState>(buildWhen: (p, c) {
      return (c is DataLoaded);
    }, builder: (BuildContext context, state) {
      print('FeatureTwoScreen.BlocBuilder.state: $state');

      //
      if (state is DataIsLoading) {
        return Material(
          child: Center(child: CircularProgressIndicator()),
        );
      }

      String data;
      if (state is DataLoaded) {
        data = state.data;
      }

      return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.blue,
          body: Hero(
            tag: "AnimateMe",
            child: Text('Data: $data'),
          ),
        ),
      );
    });
  }
}
