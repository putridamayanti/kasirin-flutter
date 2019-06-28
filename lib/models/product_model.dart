class ProductModel {
  int id;
  String name;
  String price;
  String stock;

  ProductModel({ this.id, this.name, this.price, this.stock });

  factory ProductModel.fromMap(Map<String, dynamic> data) {
    return ProductModel(
      id: data['id'],
      name: data['name'],
      price: data['price'],
      stock: data['stock'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id'    :id,
      'name'  :name,
      'price' :price,
      'stock' :stock
    };
  }
}

class ProductArguments {
  int id;
  String name;
  String price;
  String stock;
  int totalData;

  ProductArguments({ this.id, this.name, this.price, this.stock, this.totalData });
}