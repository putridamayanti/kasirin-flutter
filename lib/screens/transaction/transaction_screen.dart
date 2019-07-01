import 'package:flutter/material.dart';
import 'package:kasirin_flutter/components/drawer_component.dart';
import 'package:kasirin_flutter/components/header_component.dart';
import 'package:kasirin_flutter/models/transaction_model.dart';
import 'package:kasirin_flutter/repository/transaction_repository.dart';
import 'package:kasirin_flutter/screens/transaction/form_transaction_screen.dart';
import 'package:kasirin_flutter/styles/color_style.dart';

class TransactionScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _TransactionState();
  }
  
}

class _TransactionState extends State<TransactionScreen> {

   List transactions = new List();

  void initState() {
    super.initState();
  
    getProducts();
  }

  getProducts() async {
    TransactionRepository().getAllTransaction().then((result) {
      this.setState(() {
        result.forEach((transaction) {
          transactions.add(TransactionModel.fromMap(transaction));
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return null;
  }
  
}