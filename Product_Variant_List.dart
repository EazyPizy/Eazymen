import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth_provider/Database_Services/Add_Product.dart';
import 'package:flutter_auth_provider/model/Product_Variant.dart';
import 'package:flutter_auth_provider/providers/product_variant_provider.dart';
import 'package:provider/provider.dart';
import 'Variant_Card_Widget.dart';

class ProductVariantList extends StatefulWidget {
  @override
  _ProductVariantListState createState() => _ProductVariantListState();
}

class _ProductVariantListState extends State<ProductVariantList> {
  AddProductService _addProductService = AddProductService();

  @override
  void initState() {
    ProductVariantProvider productProvider =
        Provider.of<ProductVariantProvider>(context, listen: false);
    _addProductService.getProductVariants(
        productProvider, productProvider.prodId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final productVariantData = Provider.of<ProductVariantProvider>(context);
    final productVariant = productVariantData.productVariantItems;

    return ListView.builder(
        itemCount: productVariant.length,
        itemBuilder: (ctx, i) => VariantCardWidget(
              productVariant[i].price,
              productVariant[i].color,
              productVariant[i].size,
              productVariant[i].discountPrice,
            ));
  }
}
