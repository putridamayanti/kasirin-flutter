import 'package:flutter/material.dart';
import 'package:kasirin_flutter/components/input_component.dart';
import 'package:kasirin_flutter/styles/color_style.dart';
import 'package:kasirin_flutter/styles/input_style.dart';
import 'package:kasirin_flutter/components/button_component.dart';
import 'package:kasirin_flutter/repository/user_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _LoginState();
  }
}

class _LoginState extends State<LoginScreen> {

  String status    = '';
  var showUser      = false;

  void initState() {
    super.initState();

    fetch();
  }

  fetch() async {
    // Usertable().getUser(1).then((result) {
    //   print(result);
    // });

//    userBloc.getUsers();
  }

  TextEditingController username = new TextEditingController();
  TextEditingController password = new TextEditingController();

  login() async {
    UserRepository().login(username.text, password.text).then((result) async {
      print('Result $result');
      if (result != null) {
        this.setState(() {
          status  = 'Successfully';
        });
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setBool('logged_in', true);
        Future.delayed(Duration(milliseconds: 1000), () {
          Navigator.pushReplacementNamed(context, '/dashboard');
        });
      } else {
        this.setState(() {
          status  = 'No data';
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorStyle.darkBlue,
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(bottom: 5.0),
              child: Image.asset('assets/images/Kasirin Logo.png', width: 40.0,),
            ),
            InputComponent(
                controller: username,
                style: InputStyle.roundPinkInput,
                hint: 'Username',
                icon: Icons.people,
            ),
            InputComponent(
              controller: password,
              style: InputStyle.roundPinkInput,
              hint: 'Password',
              icon: Icons.lock,
              obscureText: true,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0),
              child: ButtonComponent('Login', ColorStyle.purple, ColorStyle.pink, () {
                login();
              })
            ),
            Text(status, style: TextStyle(color: Colors.white),)
          ],
        ),
      ),
    );
  }
}
