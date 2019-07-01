class TransactionModel {
  int id;
  String user_id;
  String product_id;
  String qty;
  String date;

  TransactionModel({ this.id, this.user_id, this.product_id, this.qty, this.date });

  factory TransactionModel.fromMap(Map<String, dynamic> data) {
    print(data);
    return TransactionModel(
      id          : data['id'],
      user_id     : data['user_id'],
      product_id  : data['product_id'],
      qty         : data['qty'],
      date        : data['date'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id'          :id,
      'user_id'     : user_id,
      'product_id'  : product_id,
      'qty'         : qty,
      'date'        : date
    };
  }
}

class TransacitionArguments {
  int id;
  String user_id;
  String product_id;
  String qty;
  String date;
  int totalData;

  TransacitionArguments({ this.id, this.user_id, this.product_id, this.qty, this.date, this.totalData });
}