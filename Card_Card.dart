import 'package:flutter/material.dart';

import 'package:flutter_auth_provider/providers/Cart_Provider.dart';

import 'package:provider/provider.dart';

class CartCard extends StatelessWidget {
  final String cartId;
  final String productId;
  final String price;
  final String imageUrL;
  final String productName;
  final int quantity;

  CartCard(this.cartId, this.productId, this.price, this.imageUrL,
      this.productName, this.quantity);

  @override
  Widget build(BuildContext context) {
    final cartItems = Provider.of<CartProvider>(context, listen: false);
    final cartData = Provider.of<CartProvider>(context);

    return Card(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          width: double.infinity,
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Container(
                  height: 90,
                  width: 90,
                  child: Image.network(
                    imageUrL,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      quantity.toString(),
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      productName,
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      productName,
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
