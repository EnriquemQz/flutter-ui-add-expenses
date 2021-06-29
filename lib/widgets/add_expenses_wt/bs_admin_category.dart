import 'package:expenses_app/models/features_model.dart';
import 'package:expenses_app/utils/constants.dart';
import 'package:expenses_app/widgets/add_expenses_wt/bs_add_category.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:expenses_app/providers/expenses_provider.dart';
import 'package:expenses_app/utils/utils.dart';

class BSAdminCategory extends StatefulWidget {
  BSAdminCategory({Key key}) : super(key: key);

  @override
  _BSAdminCategoryState createState() => _BSAdminCategoryState();
}

class _BSAdminCategoryState extends State<BSAdminCategory> {
  @override
  Widget build(BuildContext context) {
    final exProvider = Provider.of<ExpensesProvider>(context);
    final features = exProvider.features;

    return Container(
       child: ListView.builder(
         itemCount: features.length,
         itemBuilder: (_, i){
           var item = features[i];
           return ListTile(
             leading: Icon(
               item.icon.toIcon(),
               size: 35.0,
               color: item.color.toColor()
             ),
             title: Text(item.category),
             trailing: Icon(Icons.edit, size: 25.0),
             onTap: (){
               Navigator.pop(context);
               _editCategory(item);
             },
           );
         }
      ),
    );
  }

  _editCategory(FeaturesModel fModel){
    showModalBottomSheet(
      context: context, 
      builder: (_)=> AddNewCategory(fModelEdit: fModel)
    );
  }
}