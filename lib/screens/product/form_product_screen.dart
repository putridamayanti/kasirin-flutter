import 'package:flutter/material.dart';
import 'package:kasirin_flutter/components/button_component.dart';
import 'package:kasirin_flutter/components/drawer_component.dart';
import 'package:kasirin_flutter/components/header_component.dart';
import 'package:kasirin_flutter/components/input_component.dart';
import 'package:kasirin_flutter/models/product_model.dart';
import 'package:kasirin_flutter/repository/product_repository.dart';
import 'package:kasirin_flutter/styles/color_style.dart';
import 'package:kasirin_flutter/styles/input_style.dart';

class FormProductScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _FormProductState();
  }
  
}

class _FormProductState extends State<FormProductScreen> {

  int id        = 0;
  int totalData = 0;

  TextEditingController name    = new TextEditingController();
  TextEditingController price   = new TextEditingController();
  TextEditingController stock   = new TextEditingController();

  saveProduct() {
    final product = ProductModel(
      id    : id == 0 ? totalData + 1 : id,
      name  : name.text,
      price :price.text,
      stock : stock.text
    );

    if (id == 0) {
      ProductRepository().storeProduct(product).then((result) {
        Future.delayed(Duration(milliseconds: 2000), () {
          Navigator.pushReplacementNamed(context, '/product');
        });
      });
    } else {
      ProductRepository().updateProduct(product).then((result) {
        Future.delayed(Duration(milliseconds: 2000), () {
          Navigator.pushReplacementNamed(context, '/product');
        });
      });
    }
  }

  deleteProduct() {
    if (id != 0) {
      ProductRepository().deleteProduct(id).then((result) {
        Future.delayed(Duration(milliseconds: 2000), () {
          Navigator.pushReplacementNamed(context, '/product');
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final ProductArguments args  = ModalRoute.of(context).settings.arguments;
    if (args.id != 0) {
      this.setState(() {
        id              = args.id;
        name.text       = args.name;
        price.text      = args.price;
        stock.text      = args.stock;
        totalData       = args.totalData;
      });
    } else {
      this.setState(() {
        totalData       = args.totalData;
      });
    }

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
                      controller: price,
                      style: InputStyle.roundPinkInput,
                      hint: price.text == '' ? 'Price' : '',
                      icon: Icons.monetization_on,
                      keyboardType: TextInputType.number,
                    ),
                    InputComponent(
                      controller: stock,
                      style: InputStyle.roundPinkInput,
                      hint: stock.text == '' ? 'Stock' : '',
                      icon: Icons.folder,
                      keyboardType: TextInputType.number,
                    ),
                    ButtonComponent('Simpan', ColorStyle.purple, ColorStyle.pink, () {
                      saveProduct();
                    }),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 15.0),
                      child: id != 0 ? ButtonComponent('Delete', Colors.redAccent, Colors.redAccent, () {
                        deleteProduct();
                      }) : Container(),
                    )
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
