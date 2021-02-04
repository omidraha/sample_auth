import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_auth/pages/feature_one/bloc/feature_one_event.dart';
import 'package:sample_auth/pages/feature_one/bloc/feature_one_state.dart';
import 'package:sample_auth/pages/feature_one/screen/feature_one_screen.dart';

import 'pages/feature_one/bloc/feature_one_bloc.dart';
import 'pages/feature_two/bloc/feature_two_bloc.dart';
import 'pages/feature_two/screen/feature_two_screen.dart';
import 'repository/user_repository.dart';

GlobalKey<NavigatorState> navigatorKeyForAuth = GlobalKey<NavigatorState>();

void main() async {
  UserRepository userRepository = UserRepository();
  runApp(MyApp(userRepository: userRepository));
}

class MyApp extends StatelessWidget {
  final UserRepository userRepository;

  const MyApp({Key key, this.userRepository}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // FeatureOne
    BlocProvider featureOneBlocProvider = BlocProvider<FeatureOneBloc>(
      create: (BuildContext context) {
        return FeatureOneBloc(userRepository: userRepository);
      },
      child: FeatureOneScreen(),
    );
    // FeatureTwo
    BlocProvider featureTwoBocProvider = BlocProvider<FeatureTwoBloc>(
      create: (BuildContext context) {
        return FeatureTwoBloc(userRepository: userRepository);
      },
      child: FeatureTwoScreen(),
    );
    // RectTween _createRectTween(Rect begin, Rect end) {
    //   return CustomRectTween(begin: begin, end: end);
    // }

    // final heroC = HeroController(createRectTween: _createRectTween);
    return MaterialApp(
        // navigatorObservers: [heroC],
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          backgroundColor: Colors.white,
        ),
        home: featureOneBlocProvider,
        onGenerateRoute: (RouteSettings settings) {
          print('RouteSettings: $settings');
          WidgetBuilder builder;
          switch (settings.name) {
            // Intro
            case FeatureOneScreen.routeName:
              builder = (BuildContext _) => featureOneBlocProvider;
              break;
            case FeatureTwoScreen.routeName:
              builder = (BuildContext _) => featureTwoBocProvider;
              break;
          }
          return CustomPageRoute(
            builder: builder,
            settings: settings,
          );
        });
  }
}

class CustomPageRoute extends MaterialPageRoute {
  CustomPageRoute({builder, settings})
      : super(
          builder: builder,
          settings: settings,
        );

  @override
  Duration get transitionDuration => const Duration(milliseconds: 1500);

  // @override
  // Widget buildTransitions(BuildContext context, Animation<double> animation,
  //     Animation<double> secondaryAnimation, Widget child) {
  //   return SlideTransition(
  //     position: Tween<Offset>(
  //       begin: Offset(1.0, 0),
  //       end: Offset.zero,
  //     ).animate(animation),
  //     child: SlideTransition(
  //       position: Tween<Offset>(
  //         begin: Offset.zero,
  //         end: Offset(-1.0, 0),
  //       ).animate(secondaryAnimation),
  //       child: child,
  //     ),
  //   );
  // }
}

// class CustomRectTween extends RectTween {
//   CustomRectTween({Rect begin, Rect end}) : super(begin: begin, end: end) {}
//
//   @override
//   Rect lerp(double t) {
//     double height = end.top - begin.top;
//     double width = end.left - begin.left;
//
//     double transformedY = transformValue(t);
//
//     double animatedX = begin.left + (t * width);
//     double animatedY = begin.top + (transformedY * height);
//
//     return Rect.fromLTWH(animatedX, animatedY, 1, 1);
//   }
//
//   double transformValue(double t) {
//     final double s = 0.4 / 4.0;
//     t = 2.0 * t - 1.0;
//     if (t < 0.0)
//       return -0.5 * pow(2.0, 10.0 * t) * sin((t - s) * (pi * 2.0) / 0.4);
//     else
//       return pow(2.0, -10.0 * t) * sin((t - s) * (pi * 2.0) / 0.4) * 0.5 + 1.0;
//   }
// }
