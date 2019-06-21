import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:kasirin_flutter/styles/color_style.dart';
import 'package:kasirin_flutter/styles/input_style.dart';
import 'package:kasirin_flutter/components/button_component.dart';
import 'package:kasirin_flutter/models/database.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _LoginState();
  }
}

class _LoginState extends State<LoginScreen> {

  final database = DBProvider.db;
  String status    = '';

  void initState() {
    super.initState();

    init();
  }

  init() async {
    final result = await database.getAllData('user');
    print(result);
  }

  TextEditingController username = new TextEditingController();
  TextEditingController password = new TextEditingController();

  login() async {
    final response = await database.getData('user', 'username', username.text);
    print(response);
    if (response.length != 0) {
      if (response[0]['password'] == password.text) {
        this.setState(() {
          status  = 'Success';
        });
        status  = 'Success';
      } else {
        this.setState(() {
          status  = 'Wrong Password';
        });
        status  = 'Wrong Password';
      }
    } else {
      this.setState(() {
        status  = 'No Data';
      });
    }
    print(status);
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
              padding: EdgeInsets.symmetric(vertical: 10.0),
              child: TextField(
                controller: username,
                decoration: InputDecoration(
                  enabledBorder: InpuStyle.inputBorder,
                  border: InpuStyle.inputBorder,
                  focusedBorder: InpuStyle.inputBorder,
                  hintText: 'Username',
                  hintStyle: TextStyle(color: Colors.white30),
                  prefixIcon: const Icon(
                    Icons.people,
                    color: Colors.white,
                  ),
                ),
                style: TextStyle(color: Colors.white),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0),
              child: TextField(
                controller: password,
                decoration: InputDecoration(
                  enabledBorder: InpuStyle.inputBorder,
                  border: InpuStyle.inputBorder,
                  focusedBorder: InpuStyle.inputBorder,
                  hintText: 'Password',
                  hintStyle: TextStyle(color: Colors.white30),
                  prefixIcon: const Icon(
                    Icons.lock,
                    color: Colors.white,
                  ),
                ),
                style: TextStyle(color: Colors.white),
                obscureText: true,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0),
              child: RaisedButton(
                onPressed: () {
                  login();
                },
                textColor: Colors.white,
                padding: const EdgeInsets.all(0.0),
                shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
                child: ButtonComponent('Login', ColorStyle.blue, ColorStyle.green),
              ),
            ),
            Text(status, style: TextStyle(color: Colors.white),)
          ],
        ),
      ),
    );
  }
}
