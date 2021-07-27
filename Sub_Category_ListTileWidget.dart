import 'package:flutter/material.dart';
import 'package:flutter_auth_provider/Widgets/Product_Variant_List.dart';
import 'package:flutter_auth_provider/model/main_catagory_mode.dart';
import 'package:flutter_auth_provider/model/sub_catagory_model.dart';

class SubCategoryListTileWidget extends StatelessWidget {
  final bool isNative;
  final bool isSelected;
  final SubCategoryModel subcategory;
  final ValueChanged<SubCategoryModel> onSelectedSubCategory;

  const SubCategoryListTileWidget({
    @required this.isNative,
    @required this.isSelected,
    @required this.subcategory,
    @required this.onSelectedSubCategory,
  });

  @override
  Widget build(BuildContext context) {
    final selectedColor = Theme.of(context).primaryColor;
    final style = isSelected
        ? TextStyle(
            fontSize: 18,
            color: selectedColor,
            fontWeight: FontWeight.bold,
          )
        : TextStyle(fontSize: 18);

    return ListTile(
      onTap: () {
        onSelectedSubCategory(subcategory);
      },
      title: Text(
        subcategory.subCategoryTitle,
        style: style,
      ),
      trailing:
          isSelected ? Icon(Icons.check, color: selectedColor, size: 26) : null,
    );
  }
}
