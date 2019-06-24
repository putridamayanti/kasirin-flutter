import 'package:flutter/material.dart';
import 'package:kasirin_flutter/components/drawer_component.dart';
import 'package:kasirin_flutter/components/input_component.dart';
import 'package:kasirin_flutter/styles/input_style.dart';

class FormUserScreen extends StatefulWidget{
  final id;

  FormUserScreen(this.id);

  @override
  State<StatefulWidget> createState() {
    return new _FormUserState(this.id);
  }
}

class FormUser {
  int id;
  String name;
  // String username;
  // String password;
  String role;

  FormUser(this.id, this.name, this.role);
}

class _FormUserState extends State<FormUserScreen> {

  final id;

  _FormUserState(this.id);

  TextEditingController name      = new TextEditingController();
  TextEditingController username  = new TextEditingController();
  TextEditingController password  = new TextEditingController();
  TextEditingController role      = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context).settings.arguments;
    print(arguments);

    return Scaffold(
      backgroundColor: Color(0xff191b2a),
      drawer: DrawerComponent(),
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            InputComponent(
              controller: name,
              style: InputStyle.roundPinkInput,
              hint: 'Name',
              icon: Icons.people,
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
              icon: Icons.people,
              obscureText: true,
            ),
          ],
        ),
      )
    );
  }
  
}