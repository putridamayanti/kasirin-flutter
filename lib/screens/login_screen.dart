import 'package:flutter/material.dart';
import 'package:kasirin_flutter/styles/color_style.dart';
import 'package:kasirin_flutter/styles/input_style.dart';
import 'package:kasirin_flutter/components/button_component.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _LoginState();
  }
}

class _LoginState extends State<LoginScreen> {

  TextEditingController username = new TextEditingController();
  TextEditingController password = new TextEditingController();

  login() async {

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
                controller: username,
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

                },
                textColor: Colors.white,
                padding: const EdgeInsets.all(0.0),
                shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
                child: ButtonComponent('Login', ColorStyle.blue, ColorStyle.green),
              ),
            )
          ],
        ),
      ),
    );
  }
}