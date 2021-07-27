import 'package:flutter/material.dart';
import 'package:flutter_auth_provider/Widgets/Category_ListTile%20Widget.dart';
import 'package:flutter_auth_provider/model/main_catagory_mode.dart';
import 'package:flutter_auth_provider/providers/main_category_provider.dart';
import 'package:provider/provider.dart';

class MainCategoryBottomSheet extends StatefulWidget {
  static const routeName = '/SelectCategory';

  final bool isMultiSelection;
  final List<MainCategoryModel> categories;

  const MainCategoryBottomSheet({
    Key key,
    this.isMultiSelection = false,
    this.categories = const [],
  }) : super(key: key);

  @override
  _MainCategoryBottomSheetState createState() =>
      _MainCategoryBottomSheetState();
}

class _MainCategoryBottomSheetState extends State<MainCategoryBottomSheet> {
  List<MainCategoryModel> selectedCategories = [];

  @override
  Widget build(BuildContext context) {
    final mainCategoryProvider = Provider.of<MainCategoryProvider>(context);
    var allCategory = mainCategoryProvider.mainCategoryItems;
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Category'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: allCategory.map((category) {
                final isSelected = selectedCategories.contains(category);
                return CategoryListTileWidget(
                  category: category,
                  isNative: false,
                  isSelected: isSelected,
                  onSelectedCategory: selectCategory,
                );
              }).toList(),
            ),
          ),
          buildSelectButton(context),
        ],
      ),
    );
  }

  void selectCategory(MainCategoryModel category) {
    if (widget.isMultiSelection) {
      final isSelected = selectedCategories.contains(category);
      setState(() {
        isSelected
            ? selectedCategories.remove(category)
            : selectedCategories.add(category);
      });
    } else {
      Navigator.pop(context, category);
    }
  }
   Widget buildSelectButton(BuildContext context){
    final label = widget.isMultiSelection ?
        'Select ${selectedCategories.length} Category '
        : "Continue";
return Container(
  padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
  color: Theme.of(context).primaryColor,
  child: ElevatedButton(
    style: ElevatedButton.styleFrom(
      shape: StadiumBorder(),
      minimumSize: Size.fromHeight(40),
      primary: Colors.white,
    ),
    child: Text(
      label,
      style: TextStyle(color: Colors.black, fontSize: 16),
    ),
    onPressed: submit,
  ),
);
   }

  void submit() => Navigator.pop(context, selectedCategories);

}


