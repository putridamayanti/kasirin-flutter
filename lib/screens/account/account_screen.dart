import 'package:flutter/material.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorStyle.darkBlue,
      drawer: DrawerComponent(),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          SingleChildScrollView(
            child: Stack(
              children: <Widget>[
                Container(
                  width: 400.0,
                  height: 150.0,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: <Color>[
                            ColorStyle.purple,
                            ColorStyle.blue,
                          ]
                      )
                  ),
                  child: Text('Admin'),
                ),
                FlatButton(
                  onPressed: () {
                    
                  },
                  child: Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Text('Edit Profil'),
                  ),
                ),
                FlatButton(
                  onPressed: () {
                    
                  },
                  child: Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Text('Logout'),
                  ),
                )
              ],
            ),
          ),
          HeaderComponent(title: 'Pengguna', gradient1: ColorStyle.darkBlue, gradient2: ColorStyle.darkBlue),
        ]
      )
    );
  }
}