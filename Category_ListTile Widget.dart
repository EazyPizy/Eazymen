import 'package:flutter/material.dart';
import 'package:flutter_auth_provider/model/main_catagory_mode.dart';

class CategoryListTileWidget extends StatelessWidget {
  final bool isNative;
  final bool isSelected;
  final MainCategoryModel category;
  final ValueChanged<MainCategoryModel> onSelectedCategory;

  const CategoryListTileWidget({
    @required this.isNative,
    @required this.isSelected,
    @required this.category,
    @required this.onSelectedCategory,
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
        onSelectedCategory(category);
      },
      title: Text(
        category.mainCategoryTitle,
        style: style,
      ),
      trailing:
          isSelected ? Icon(Icons.check, color: selectedColor, size: 26) : null,
    );
  }
}
