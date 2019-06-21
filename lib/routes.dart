import 'package:flutter/material.dart';
import 'package:kasirin_flutter/screens/splash_screen.dart';
import 'package:kasirin_flutter/screens/login_screen.dart';

final routes  = <String, WidgetBuilder>
{
  '/'             : (context) => (SplashScreen()),
  '/login'        : (context) => (LoginScreen()),
};
