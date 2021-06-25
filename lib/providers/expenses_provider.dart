
import 'package:expenses_app/models/category_list_json.dart';
import 'package:expenses_app/providers/category_json.dart';
import 'package:flutter/cupertino.dart';

class ExpensesProvider extends ChangeNotifier {

  List<CategoryListJson> cListJson = [];

  callCatListJson() async {
    final res = await categoryJson.loadCategories();
    this.cListJson = [...res];
    notifyListeners();
  }
}