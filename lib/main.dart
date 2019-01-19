import 'package:flutter/material.dart';
import 'package:mobile/pages/home_page_screen.dart';
import 'package:mobile/pages/login_screen.dart';
import 'package:mobile/pages/register_screen.dart';
import 'package:mobile/pages/splash_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'چاپ',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
//        accentColor: Color(0xFFDBF0E5),
        accentColor: Color(0xFF42a5f5).withAlpha(40),
//        primaryColor: Color(0xFF129C59),
        primaryColor: Color(0xFF1976d2),
//        backgroundColor: Color(0xFFF0EDF1),
        backgroundColor: Color(0xFFFAFAFA),
        fontFamily: "IranYekan",
      ),
      routes: {
        "/": (context) => Directionality(textDirection: TextDirection.rtl, child: SplashScreen()),
        "/home": (context) => Directionality(textDirection: TextDirection.rtl, child: HomeScreen()),
        "/login": (context) => Directionality(textDirection: TextDirection.rtl, child: LoginScreen()),
        "/register": (context) => Directionality(textDirection: TextDirection.rtl, child: RegisterScreen())
      },
    );
  }
}
