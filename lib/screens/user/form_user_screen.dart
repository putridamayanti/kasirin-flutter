import 'package:flutter/material.dart';
import 'package:kasirin_flutter/components/button_component.dart';
import 'package:kasirin_flutter/components/drawer_component.dart';
import 'package:kasirin_flutter/components/header_component.dart';
import 'package:kasirin_flutter/components/input_component.dart';
import 'package:kasirin_flutter/models/user_model.dart';
import 'package:kasirin_flutter/styles/color_style.dart';
import 'package:kasirin_flutter/styles/input_style.dart';

class FormUserScreen extends StatefulWidget{
//  final id;
//
//  FormUserScreen(this.id);

  @override
  State<StatefulWidget> createState() {
    return new _FormUserState();
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

  TextEditingController name      = new TextEditingController();
  TextEditingController username  = new TextEditingController();
  TextEditingController password  = new TextEditingController();
  TextEditingController role      = new TextEditingController();
  List<Map> roles = [
    { 'value': 'Admin'},
    { 'value': 'Pegawai'}
  ];

  saveUser() {

  }

  @override
  Widget build(BuildContext context) {
    final UserArguments args  = ModalRoute.of(context).settings.arguments;
    this.setState(() {
      name.text  = args.name;
      username.text  = args.username;
      password.text  = args.password;
    });

    return Scaffold(
      backgroundColor: ColorStyle.darkBlue,
      drawer: DrawerComponent(),
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 80.0),
              child: Padding(
                  padding: EdgeInsets.all(15.0),
                child: Column(
                  children: <Widget>[
                    InputComponent(
                      controller: name,
                      style: InputStyle.roundPinkInput,
                      hint: name.text == '' ? 'Name' : '',
                      icon: Icons.people,
                    ),
                    InputComponent(
                      controller: username,
                      style: InputStyle.roundPinkInput,
                      hint: username.text == '' ? 'Username' : '',
                      icon: Icons.people,
                    ),
                    InputComponent(
                      controller: password,
                      style: InputStyle.roundPinkInput,
                      hint: password.text == '' ? 'Password' : '',
                      icon: Icons.lock,
                      obscureText: true,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 15.0),
                      child: Container(
                          width: 400.0,
                          height: 60.0,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.white),
                              borderRadius: BorderRadius.circular(50.0)
                          ),
                          child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 15.0),
                              child: Theme(
                                data: ThemeData(
                                  canvasColor: ColorStyle.dark,
                                ),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton(
                                    value: role.text,
                                    style: TextStyle(color: Colors.white),
                                    hint: Text('Pilih Role'),
                                    items: roles != null ? roles.map((item) {
                                      return DropdownMenuItem(
                                        child: Text(
                                          item['value'],
                                        ),
                                        value: item['value'].toString(),
                                      );
                                    }).toList() : [],
                                    onChanged: (val) {
                                      this.setState(() {
                                        role.text = val;
                                      });
                                    },
                                  ),
                                ),
                              )
                          )
                      ),
                    ),
                    ButtonComponent('Simpan', ColorStyle.purple, ColorStyle.pink)
                  ],
                ),
              ),
            ),
            HeaderComponent(title: 'Pengguna', gradient1: ColorStyle.darkBlue, gradient2: ColorStyle.darkBlue),
          ],
        ),
      )
    );
  }
  
}
