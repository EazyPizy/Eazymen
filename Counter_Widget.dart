import 'package:flutter/material.dart';
import 'package:flutter_auth_provider/Database_Services/Add_Product.dart';
import 'package:flutter_auth_provider/providers/Cart_Provider.dart';
import 'package:flutter_auth_provider/providers/product_provider.dart';
import 'package:flutter_auth_provider/providers/product_variant_provider.dart';
import 'package:provider/provider.dart';

class CounterWidget extends StatefulWidget {

  int qty = 1;
  @override
  _CounterWidgetState createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: EdgeInsets.all(3),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Theme.of(context).accentColor),
      child: Row(
        children: [
          InkWell(
              onTap: () {},
              child: Icon(
                Icons.remove,
                color: Colors.white,
                size: 16,
              )),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 3),
            padding:
            EdgeInsets.symmetric(horizontal: 3, vertical: 2),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3),
                color: Colors.white),
            child: Text(
              '3000',
              style: TextStyle(color: Colors.black, fontSize: 16),
            ),
          ),
          InkWell(
              onTap: () {},
              child: Icon(
                Icons.add,
                color: Colors.white,
                size: 16,
              )),
        ],
      ),
    );
  }
}
