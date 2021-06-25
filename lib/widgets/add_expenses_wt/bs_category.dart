import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:expenses_app/models/category_list_json.dart';
import 'package:expenses_app/models/combined_model.dart';
import 'package:expenses_app/providers/expenses_provider.dart';
import 'package:expenses_app/utils/constants.dart';
import 'package:expenses_app/utils/utils.dart';

class BottomSheetCategory extends StatefulWidget {
  final CombinedModel cModel;
  BottomSheetCategory({Key key, this.cModel}) : super(key: key);

  @override
  _BottomSheetCategoryState createState() => _BottomSheetCategoryState();
}

class _BottomSheetCategoryState extends State<BottomSheetCategory> {
  bool hasData = false;
  @override
  Widget build(BuildContext context) {
    final exProvider = Provider.of<ExpensesProvider>(context);
    final catJsonList = exProvider.cListJson;
    Size size = MediaQuery.of(context).size;

    if(widget.cModel.category != 'Selecciona Categoría'){
      hasData = true;
    }


    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Icon(Icons.category_outlined, size: 35.0),
        GestureDetector(
          onTap: () => _categorySelected(size, catJsonList ),
          child: Container(
            width: size.width / 1.5,
            decoration: BoxDecoration(
              border: (hasData)
                ? Border.all(color: widget.cModel.color.toColor())
                : Border.all(color: Colors.grey[700]),
              borderRadius: BorderRadius.circular(20.0)
            ),
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  widget.cModel.category
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  _categorySelected(Size size, List<CategoryListJson> catJsonList){

    void _categoryName(String category, String color){
      setState(() {
        widget.cModel.category = category;
        widget.cModel.color = color;
        Navigator.pop(context);
      });
    }

    var widgets = <Widget>[
      ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: catJsonList.length,
        itemBuilder: (_, i)=> ListTile(
          leading: Icon(
            catJsonList[i].icon.toIcon(),
            size: 35.0,
            color: catJsonList[i].color.toColor(),
          ),
          title: Text(catJsonList[i].category),
          trailing: Icon(
            Icons.arrow_forward_ios_outlined,
            size: 16.0,
          ),
          onTap: (){
            _categoryName(
              catJsonList[i].category,
              catJsonList[i].color
            );
          },
        )
      ),
      Divider(
        thickness: 2.0
      ),
      ListTile(
        leading: Icon(Icons.create_new_folder_outlined, size: 35.0),
        title: Text('Crear nueva categoría'),
        trailing: Icon(Icons.arrow_forward_ios_outlined, size: 16.0),
        onTap: (){
          Navigator.pop(context);
        },
      ),
      ListTile(
        leading: Icon(Icons.edit_outlined, size: 35.0),
        title: Text('Administrar categorías'),
        trailing: Icon(Icons.arrow_forward_ios_outlined, size: 16.0),
        onTap: (){
          Navigator.pop(context);
        },
      )
    ];

    


    showModalBottomSheet(
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25.0)
        )
      ),
      context: context,
      builder: (context){
        return Container(
          height: size.height / 1.3,
          child: ListView(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children: widgets,
          ),
        );
      }
    );
  }
}