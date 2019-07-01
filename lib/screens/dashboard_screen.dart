import 'package:flutter/material.dart';
import 'package:kasirin_flutter/components/drawer_component.dart';
import 'package:kasirin_flutter/components/header_component.dart';
import 'package:kasirin_flutter/styles/color_style.dart';
import 'package:kasirin_flutter/styles/text_style.dart';

class DashboardScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _DashboardState();
  }

}

class _DashboardState extends State<DashboardScreen> {

  var _gradientColor1 = Colors.transparent;
  var _gradientColor2 = Colors.transparent; 
  ScrollController _scrollViewController;

  void changeColor(){
    if((_scrollViewController.offset == 0) && (_gradientColor1 != Colors.transparent)){
      setState(() {
        _gradientColor1 = Colors.transparent;
        _gradientColor2 = Colors.transparent;
      });
    }else if((_scrollViewController.offset <= 100) && (_scrollViewController.offset > 40)){
      var opacity = _scrollViewController.offset/100;
      setState(() {
        _gradientColor1 = ColorStyle.pink;
        _gradientColor2 = ColorStyle.orange;
      });
    }
  }

  Widget CardRecent(color, text, amount) {
    return Card(
      color: color,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(amount, style: TextStyle(color: Colors.white),),
          Text(text, style: TextStyle(color: Colors.white),)
        ],
      ),
    );
  }

  Widget CardMenu(icon, text, route) {
    return Card(
        color: ColorStyle.dark,
        child: InkWell(
          onTap: () {
            Navigator.pushReplacementNamed(context, route);
          },
          child: Padding(
          padding: EdgeInsets.all(15.0),
          child:  Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(right: 20.0),
                    child: Icon(
                      icon,
                      color: Colors.white,
                    ),
                  ),
                  Text(text, style: TextStyle(color: Colors.white),),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white30,
                  )
                ],
              ),
            ],
          ),
        ),
        )
    );
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
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 400.0,
                  height: 170.0,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: <Color>[
                            ColorStyle.pink,
                            ColorStyle.orange,
                          ]
                      )
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(top: 50.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text('Rp 20.000.000,00',
                          style: CustomTextStyle.titleWhite,
                        ),
                        Text('Penjualan Hari Ini', style: TextStyle(color: Colors.white),)
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(bottom: 20.0),
                        child: GridView.count(
                          shrinkWrap: true,
                          primary: false,
                          crossAxisCount: 2,
                          crossAxisSpacing: 4.0,
                          childAspectRatio: 2.0,
                          children: <Widget>[
                            CardRecent(ColorStyle.orange, 'Transaksi Hari Ini', '200'),
                            CardRecent(ColorStyle.pink, 'Produk Terjual Hari Ini', '200'),
                          ],
                        ),
                      ),
                      CardMenu(Icons.people, 'Pengguna', '/user'),
                      CardMenu(Icons.layers, 'Produk', '/product'),
                      CardMenu(Icons.swap_horiz, 'Transaksi', '/transaction'),
                    ],
                  ),
                )
              ],
            ),
          ),
          HeaderComponent(title: 'Dashboard', gradient1: _gradientColor1, gradient2: _gradientColor2),
        ],
      ),
    );
  }
}
