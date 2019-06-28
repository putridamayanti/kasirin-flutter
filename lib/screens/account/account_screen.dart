import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:kasirin_flutter/components/drawer_component.dart';
import 'package:kasirin_flutter/components/header_component.dart';
import 'package:kasirin_flutter/styles/color_style.dart';

class AccountScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _AccountState();
  }
}

class _AccountState extends State<AccountScreen> {

  logout() {
    Future.delayed(Duration(milliseconds: 2000), () async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool('logged_in', false);
      Navigator.pushReplacementNamed(context, '/login');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorStyle.darkBlue,
      drawer: DrawerComponent(),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  width: 400.0,
                  height: 250.0,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: <Color>[
                            ColorStyle.purple,
                            ColorStyle.blue,
                          ]
                      )
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(top: 100.0),
                    child: Text('Admin', style: TextStyle(color: Colors.white),),
                  )
                ),
                FlatButton(
                  onPressed: () {
                    
                  },
                  child: SizedBox(
                    width: double.infinity,
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border(bottom: BorderSide(width: 1.0, color: Color(0xFFdddddd)))
                        ),
                        child: 
                        Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Text(
                          'Edit Profil', 
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
                FlatButton(
                  onPressed: () {
                    logout();
                  },
                  child: SizedBox(
                    width: double.infinity,
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border(bottom: BorderSide(width: 1.0, color: Color(0xFFdddddd)))
                        ),
                        child: 
                        Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Text(
                          'Logout', 
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          HeaderComponent(title: 'Akun', gradient1: ColorStyle.darkBlue, gradient2: ColorStyle.darkBlue),
        ]
      )
    );
  }
}