
import 'package:flutter/material.dart';
import 'package:hello_world/screens/home_page.dart';
import 'package:hello_world/screens/second_page.dart';

const String homePage = 'home';
const String secondPage = 'second';

Route<dynamic> routeController(RouteSettings settings) {
  switch (settings.name) {
    case homePage:
      return MaterialPageRoute(
          builder: (context) => const HomePage()
      );
    case secondPage:
      String parameter = settings.arguments as String;
      return MaterialPageRoute(
          builder: (context) => SecondPage(username: parameter)
      );
    default:
      throw Exception("Unknown route");
  }
}
