import 'package:flutter/material.dart';
import 'package:login_flutter/ui/screen/dashboard/dashboard_screen.dart';
import 'package:login_flutter/ui/screen/login/login_screen.dart';

class Routes {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case LoginScreen.routeName:
        return MaterialPageRoute(builder: (_) => const LoginScreen());

      case DashboardScreen.routeName:
        return MaterialPageRoute(builder: (_) => const DashboardScreen());
      // case ProfileScreen.routeName:
      //   return MaterialPageRoute(builder: (_) => const ProfileScreen());
      // case SearchScreen.routeName:
      //   return MaterialPageRoute(builder: (_) => const SearchScreen());
      // case MovieDetailScreen.routeName:
      //   var movieArgs = settings.arguments as MovieDetailArguments;
      //   return MaterialPageRoute(
      //     builder: (_) => MovieDetailScreen(args: movieArgs),
      //   );
    }
  }
}
