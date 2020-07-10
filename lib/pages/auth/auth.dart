import 'package:flutter/material.dart';

import 'register/screen/register_screen.dart';
import 'verify/screen/verify_screen.dart';

class AuthScreen extends StatelessWidget {
  static const String routeName = 'auth';
  static Route route(RouteSettings settings) {
    print('AuthScreen.route.settings: $settings');
    WidgetBuilder builder;
    switch (settings.name) {
      case RegisterScreen.routeName:
        builder = (BuildContext _) => RegisterScreen();
        break;
      case VerifyScreen.routeName:
        builder = (BuildContext _) => VerifyScreen();
        break;
      default:
        throw Exception('Invalid route: ${settings.name}');
    }

    return MaterialPageRoute(builder: builder, settings: settings);
  }

  @override
  Widget build(BuildContext context) {
    print('AuthScreen.build');
    return Container(
      child: Text("Don't call AuthScreen !"),
    );
  }
}
