import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_auth/pages/feature_one/bloc/feature_one_bloc.dart';
import 'package:sample_auth/pages/feature_one/bloc/feature_one_event.dart';
import 'package:sample_auth/pages/feature_one/bloc/feature_one_state.dart';
import 'package:sample_auth/pages/feature_two/screen/feature_two_screen.dart';

class FeatureOneScreen extends StatefulWidget {
  static const String routeName = '/FeatureOne/';

  @override
  _FeatureOneScreenState createState() => _FeatureOneScreenState();
}

class _FeatureOneScreenState extends State<FeatureOneScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeatureOneBloc, FeatureOneState>(
        builder: (BuildContext context, state) {
      print('FeatureOneScreen.BlocBuilder.state: $state');
      return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.amber,
          body: Center(
            child: RaisedButton(
              child: Hero(
                tag: "AnimateMe",
                child: Text('Feature One Screen'),
              ),
              onPressed: () {
                Navigator.of(context).pushNamed(
                  FeatureTwoScreen.routeName,
                );
              },
            ),
          ),
        ),
      );
    });
  }
}
