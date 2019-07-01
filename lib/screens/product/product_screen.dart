import 'package:flutter/material.dart';
import 'package:kasirin_flutter/components/drawer_component.dart';
import 'package:kasirin_flutter/components/header_component.dart';
import 'package:kasirin_flutter/models/product_model.dart';
import 'package:kasirin_flutter/repository/product_repository.dart';
import 'package:kasirin_flutter/screens/product/form_product_screen.dart';
import 'package:kasirin_flutter/styles/color_style.dart';

class ProductScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _ProductState();
  }
  
}

class _ProductState extends State<ProductScreen> {

  List products = new List();

  void initState() {
    super.initState();
  
    getProducts();
  }

  getProducts() async {
    ProductRepository().getAllProduct().then((result) {
      this.setState(() {
        result.forEach((product) {
          // print(product);
          products.add(ProductModel.fromMap(product));
        });
      });
    });
  }

  Widget CardList(id, name, price, stock) {
    return Card(
      color: ColorStyle.dark,
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FormProductScreen(),
              settings: RouteSettings(
                arguments: ProductArguments(
                  id: id,
                  name: name,
                  price: price,
                  stock: stock,
                  totalData: products.length
                ),
              ),
            ),
          );
        },
        child: Padding(
        padding: EdgeInsets.all(15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(name, style: TextStyle(color: Colors.white, fontSize: 18.0),),
                Text('Rp $price', style: TextStyle(color: Colors.white24),)
              ],
            ),
            Icon(
                    Icons.edit,
                    color: Colors.white30,
                  )
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
            child: Padding(
              padding: EdgeInsets.only(top: 65.0),
              child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Container(
                    child: Column(
                      children: <Widget>[
                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: products != null ? products.length : 0,
                          itemBuilder: (BuildContext context, int index){
                            return CardList(products[index].id, 
                              products[index].name, products[index].price, 
                              products[index].stock);
                          },
                        )
                      ],
                    ),
                  ),
                ),
                
              ],
            ),
            )
          ),
          HeaderComponent(title: 'Produk', gradient1: ColorStyle.darkBlue, gradient2: ColorStyle.darkBlue),
        ],
      ),
      floatingActionButton: FloatingActionButton(
                  onPressed: () {
                    Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FormProductScreen(),
              // Pass the arguments as part of the RouteSettings. The
              // ExtractArgumentScreen reads the arguments from these
              // settings.
              settings: RouteSettings(
                arguments: ProductArguments(
                  id: 0,
                  totalData: products != null ? products.length : 0
                ),
              ),
            ),
          );
                  },
                  child: Icon(Icons.add),
                  backgroundColor: ColorStyle.blue,
                ),
    );
  }
  
}