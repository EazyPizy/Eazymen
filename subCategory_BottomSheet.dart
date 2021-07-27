import 'package:flutter/material.dart';
import 'package:flutter_auth_provider/Widgets/Sub_Category_ListTileWidget.dart';
import 'package:flutter_auth_provider/model/sub_catagory_model.dart';
import 'package:flutter_auth_provider/providers/sub_category_provider.dart';
import 'package:provider/provider.dart';

class SubCategoryBottomSheet extends StatefulWidget {
  static const routeName = '/SelectSubCategory';

  final bool isMultiSelection;
  final List<SubCategoryModel> subcategories;

  const SubCategoryBottomSheet({
    Key key,
    this.isMultiSelection = false,
    this.subcategories = const [],
  }) : super(key: key);

  @override
  _SubCategoryBottomSheetState createState() => _SubCategoryBottomSheetState();
}

class _SubCategoryBottomSheetState extends State<SubCategoryBottomSheet> {
  List<SubCategoryModel> selectedSubCategories = [];

  @override
  Widget build(BuildContext context) {
    final subCategoryProvider = Provider.of<SubCategoryProvider>(context);
    var allSubCategory = subCategoryProvider.subCategoryItems;
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Category'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: allSubCategory.map((subcategory) {
                final isSelected = selectedSubCategories.contains(subcategory);
                return SubCategoryListTileWidget(
                  subcategory: subcategory,
                  isNative: false,
                  isSelected: isSelected,
                  onSelectedSubCategory: selectSubCategory,
                );
              }).toList(),
            ),
          ),
          buildSelectButton(context),
        ],
      ),
    );
  }

  void selectSubCategory(SubCategoryModel subcategory) {
    if (widget.isMultiSelection) {
      final isSelected = selectedSubCategories.contains(subcategory);
      setState(() {
        isSelected
            ? selectedSubCategories.remove(subcategory)
            : selectedSubCategories.add(subcategory);
      });
    } else {
      Navigator.pop(context, subcategory);
    }
  }

  Widget buildSelectButton(BuildContext context) {
    final label = widget.isMultiSelection
        ? 'Select ${selectedSubCategories.length} Category '
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

  void submit() => Navigator.pop(context, selectedSubCategories);
}
