import 'package:flutter/material.dart';
import 'route/route.dart' as route;
// import 'package:practice/views/login.dart';

void main() {
  runApp(MyApp());
  /** Navigator */
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login',
      theme: ThemeData(
        fontFamily: 'Poppins',
        primaryColor: Color.fromRGBO(255, 240, 21, 1),
        // primaryColor: Colors.white,
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          elevation: 0,
          foregroundColor: Colors.white,
        ),
        accentColor: Color.fromRGBO(0, 180, 238, 1),
        // accentColor: Color.fromRGBO(255, 240, 21, 1),
        textTheme: TextTheme(
          headline1: TextStyle(
            fontSize: 22.0,
            color: Color.fromRGBO(0, 180, 238, 1),
          ),
          headline2: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.w700,
            color: Color.fromRGBO(0, 180, 238, 1),
          ),
          bodyText1: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
        ),
      ),
      // home: Login(),
      onGenerateRoute: route.controller,
      initialRoute: route.loginPage,
    );
  }
}
