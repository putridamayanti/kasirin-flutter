import 'package:flutter/material.dart';
import 'package:kasirin_flutter/screens/account/account_screen.dart';
import 'package:kasirin_flutter/screens/dashboard_screen.dart';
import 'package:kasirin_flutter/screens/product/product_screen.dart';
import 'package:kasirin_flutter/screens/splash_screen.dart';
import 'package:kasirin_flutter/screens/login_screen.dart';
import 'package:kasirin_flutter/screens/user/form_user_screen.dart';
import 'package:kasirin_flutter/screens/user/user_screen.dart';

 final routes  = <String, WidgetBuilder>
 {
   '/'             : (context) => (SplashScreen()),
   '/login'        : (context) => (LoginScreen()),
   '/dashboard'    : (context) => (DashboardScreen()),
   '/user'         : (context) => (UserScreen()),
   '/user/form'    : (context) => (FormUserScreen()),
   '/account'      : (context) => (AccountScreen()),
   '/product'       : (context) => (ProductScreen()),
   '/transaction'   : (context) => (TransactionScreen()),
 };
