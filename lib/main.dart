import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_auth/pages/auth/auth.dart';
import 'package:sample_auth/pages/home/screen/home.dart';

import 'pages/auth/register/bloc/register_bloc.dart';
import 'pages/auth/verify/bloc/verify_bloc.dart';
import 'pages/home/bloc/home_bloc.dart';
import 'pages/init/bloc/init_block.dart';
import 'pages/init/bloc/init_event.dart';
import 'pages/init/bloc/init_state.dart';
import 'pages/init/screen/splash.dart';
import 'pages/intro/screen/intro.dart';
import 'repository/user_repository.dart';

void main() async {
  UserRepository userRepository = UserRepository();
  runApp(BlocProvider<InitBloc>(
      create: (BuildContext context) {
        return InitBloc(userRepository: userRepository)..add(LoadUser());
      },
      child: MyApp(userRepository: userRepository)));
}

class MyApp extends StatelessWidget {
  final UserRepository userRepository;

  const MyApp({Key key, this.userRepository}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        backgroundColor: Colors.white,
      ),
      routes: {
        // Intro
        IntroScreen.routeName: (context) => IntroScreen(),
        // Auth (Register/Verify)
        AuthScreen.routeName: (context) {
          return MultiBlocProvider(
            providers: [
              BlocProvider<RegisterBloc>(create: (BuildContext context) {
                return RegisterBloc(userRepository: userRepository);
              }),
              BlocProvider<VerifyBloc>(create: (BuildContext context) {
                return VerifyBloc(
                  userRepository: userRepository,
                );
              }),
            ],
            child: Navigator(
                // @note: Actually I would like to have something like this:
                // /auth/register/ and /auth/verify/ for routing this flow,
                // But i don't know how to have this route.
                initialRoute: '/auth/',
                onGenerateRoute: (RouteSettings settings) =>
                    AuthScreen.route(settings)),
          );
        },
        // Home
        HomeScreen.routeName: (context) => BlocProvider<HomeBloc>(
            create: (BuildContext context) {
              return HomeBloc(userRepository: userRepository);
            },
            child: HomeScreen()),
      },
      home: BlocBuilder<InitBloc, InitState>(
          builder: (BuildContext context, state) {
        print('main.BlocBuilder.state: $state');
        if (state == AppIsLoading() || state == UserIsLoading()) {
          return SplashScreen();
        } else if (state == UserIsNotExist()) {
          return IntroScreen();
        }
        return Center(
          child: Text('No state !'),
        );
      }),
    );
  }
}
