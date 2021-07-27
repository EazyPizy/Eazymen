import 'package:flutter/material.dart';
import 'package:flutter_auth_provider/Widgets/Product_Variant_List.dart';
import 'package:flutter_auth_provider/providers/Cart_Provider.dart';
import 'package:flutter_auth_provider/providers/product_variant_provider.dart';
import 'package:flutter_auth_provider/screens/Product_Details_Scree.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class ProductCard extends StatelessWidget {
  final String productId;
  final String productName;
  final String sellingPrice;
  final String imageURL;
  final String subCategoryTitle;
  final String subCategoryId;
  final String productCommission;

  ProductCard(
    this.productName,
    this.imageURL,
    this.subCategoryTitle,
    this.subCategoryId,
    this.sellingPrice,
    this.productId,
    this.productCommission,
  );

  Widget build(BuildContext context) {
    var onTap = Provider.of<ProductVariantProvider>(context, listen: false);
    final cartData = Provider.of<CartProvider>(context);

    return InkWell(
        onTap: () {
          onTap.valueSetter(productId);
          Navigator.of(context).pushNamed(ProductDetailScreen.routeName,
              arguments: {
                "Product Id": productId,
                "ProductName": productName,
                "imageURLs": imageURL
              });
        },
        child: Card(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Container(
                          height: 90,
                          width: 90,
                          child: Image.network(
                            imageURL,
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
                              productName,
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
                              sellingPrice.toString(),
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
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(
                              sellingPrice,
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                              ),
                              softWrap: true,
                              overflow: TextOverflow.fade,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(
                              productCommission,
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                              ),
                              softWrap: true,
                              overflow: TextOverflow.fade,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: ElevatedButton(
                          onPressed: () async {
                            onTap.valueSetter(productId);
                            (await onTap.checkIfCollectionExist(
                                        "Product Variants", productId)) ==
                                    true
                                ? Get.bottomSheet(ProductVariantList(),
                                    backgroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                      topRight: Radius.zero,
                                      topLeft: Radius.zero,
                                    )))
                                : cartData.addToCart(productName, productId,
                                    sellingPrice, imageURL);
                            //Get.snackbar(("Product Added"), ("you product is in cart"));
                          },
                          child: Text("Add")),
                    ),
                  ]),
            ),
          ),
        ));
  }
}
