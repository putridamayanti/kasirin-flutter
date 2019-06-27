import 'package:flutter/material.dart';
import 'package:kasirin_flutter/components/input_component.dart';
import 'package:kasirin_flutter/styles/color_style.dart';
import 'package:kasirin_flutter/styles/input_style.dart';
import 'package:kasirin_flutter/components/button_component.dart';
import 'package:kasirin_flutter/repository/user_repository.dart';
import 'package:kasirin_flutter/models/user_model.dart';

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
//    Usertable().login(username.text, password.text).then((result) {
//      print(result);
//      this.setState(() {
//        if (result['status'] == 'failed') {
//          status  = result['message'];
//        } else {
//          print(result);
//          status  = 'Success';
//        }
//      });
//    });

    UserRepository().login(username.text, password.text).then((result) {
      print('Result $result');
      if (result != null) {
        this.setState(() {
          status  = 'Successfully';
        });
        Future.delayed(Duration(milliseconds: 1000), () {
          Navigator.pushReplacementNamed(context, '/dashboard');
        });
      } else {
        this.setState(() {
          status  = 'No data';
        });
      }
    });

//    userBloc.login(username.text, password.text);
//    Future.delayed(Duration(milliseconds: 1000), () {
//      this.setState(() {
//        showUser  = true;
//      });
//    });
//      userBloc.login();
  }


//  Widget usernameField() {
//    return StreamBuilder(
//      stream: userBloc.username,
//        builder: (context, snap) {
//          return TextField(
//            onChanged: userBloc.changeUsername,
//            decoration: InputDecoration(
//                labelText: 'Username',
//                hintText: 'you@example.com',
//                errorText: snap.error
//            ),
//              style: TextStyle(color: Colors.white)
//          );
//        },
//    );
//  }

//  Widget passwordField() {
//    return StreamBuilder(
//      stream: userBloc.password,
//      builder: (context, snap) {
//        return TextField(
//            onChanged: userBloc.changePassword,
//          decoration: InputDecoration(
//              labelText: 'Password',
//              hintText: 'you@example.com',
//              errorText: snap.error
//          ),
//            style: TextStyle(color: Colors.white)
//        );
//      },
//    );
//  }

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
              padding: EdgeInsets.only(bottom: 15.0),
              child: Image.asset('assets/images/Kasirin Logo.png', width: 50.0,),
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
//            InputComponent(password, InputStyle.roundBlueInput, 'Password', Icons.lock, true),
//            Padding(
//              padding: EdgeInsets.symmetric(vertical: 10.0),
//              child: TextField(
//                controller: username,
//                decoration: InputDecoration(
//                  enabledBorder: InpuStyle.inputBorder,
//                  border: InpuStyle.inputBorder,
//                  focusedBorder: InpuStyle.inputBorder,
//                  hintText: 'Username',
//                  hintStyle: TextStyle(color: Colors.white30),
//                  prefixIcon: const Icon(
//                    Icons.people,
//                    color: Colors.white,
//                  ),
//                ),
//                style: TextStyle(color: Colors.white),
//              ),
//            ),
//            Padding(
//              padding: EdgeInsets.symmetric(vertical: 10.0),
//              child: TextField(
//                controller: password,
//                decoration: InputDecoration(
//                  enabledBorder: InpuStyle.inputBorder,
//                  border: InpuStyle.inputBorder,
//                  focusedBorder: InpuStyle.inputBorder,
//                  hintText: 'Password',
//                  hintStyle: TextStyle(color: Colors.white30),
//                  prefixIcon: const Icon(
//                    Icons.lock,
//                    color: Colors.white,
//                  ),
//                ),
//                style: TextStyle(color: Colors.white),
//                obscureText: true,
//              ),
//            ),
//            Padding(
//              padding: EdgeInsets.symmetric(vertical: 10.0),
//              child: usernameField(),
//            ),
//            Padding(
//              padding: EdgeInsets.symmetric(vertical: 10.0),
//              child: passwordField(),
//            ),
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
