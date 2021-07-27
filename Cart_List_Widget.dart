import 'package:flutter/material.dart';
import 'package:flutter_auth_provider/Database_Services/Add_Product.dart';
import 'package:flutter_auth_provider/Widgets/Card_Card.dart';
import 'package:flutter_auth_provider/Widgets/Product_Card.dart';
import 'package:flutter_auth_provider/providers/Cart_Provider.dart';
import 'package:flutter_auth_provider/providers/product_provider.dart';
import 'package:provider/provider.dart';

class CartListView extends StatefulWidget {
  @override
  _CartListViewState createState() => _CartListViewState();
}

class _CartListViewState extends State<CartListView> {
  AddProductService _addProductService = AddProductService();

  @override
  void initState() {
    CartProvider cartProvider =
        Provider.of<CartProvider>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final cartData = Provider.of<CartProvider>(context);

    return ListView.builder(
        itemCount: cartData.cartItems.length,
        itemBuilder: (ctx, i) => CartCard(
              cartData.cartItems.values.toList()[i].cartId,
              cartData.cartItems.values.toList()[i].productId,
              cartData.cartItems.values.toList()[i].sellingPrice,
              cartData.cartItems.values.toList()[i].imageURL,
              cartData.cartItems.values.toList()[i].productName,
              cartData.cartItems.values.toList()[i].quantity,
            ));
  }
}
