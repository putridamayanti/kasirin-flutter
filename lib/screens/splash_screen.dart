import 'package:flutter/material.dart';
import 'package:kasirin_flutter/styles/color_style.dart';
import 'package:kasirin_flutter/models/database.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _SplashState();
  }
}

class _SplashState extends State<SplashScreen> {

  void initState() {
    super.initState();

    final database = DBProvider.db;
    database.database;
    
    Future.delayed(Duration(milliseconds: 3000), () {
      Navigator.pushNamed(context, '/login');
    });
  }

  initDatabase() async {

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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset('assets/images/Kasirin Logo.png', width: 100.0,),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 30.0),
              child: Text(
                'KASIRIN',
                style: TextStyle(
                    color: Colors.white,
                  fontSize: 30.0
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
