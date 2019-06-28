import 'package:flutter/material.dart';
import 'package:kasirin_flutter/screens/account/account_screen.dart';
import 'package:kasirin_flutter/screens/dashboard_screen.dart';
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
 };

//Widget makeRoute(
//    {@required BuildContext context,
//    @required String routeName,
//    Object arguments}) {
//  final Widget child =
//      _buildRoute(context: context, routeName: routeName, arguments: arguments);
//  return child;
//}
//
//Widget _buildRoute({
//  @required BuildContext context,
//  @required String routeName,
//  Object arguments,
//}) {
//  switch (routeName) {
//    case '/': return SplashScreen();
//    case '/dashboard': return DashboardScreen();
//    case '/login': return LoginScreen();
//    case '/user': return UserScreen();
//    case '/form/user':
//      // FormUser user = arguments as FormUser;
//      var id = arguments;
//      return FormUserScreen(id);
//    default:
//      throw 'Route $routeName is not defined';
//  }
//}
