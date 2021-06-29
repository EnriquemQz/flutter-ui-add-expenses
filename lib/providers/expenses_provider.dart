
import 'package:expenses_app/models/category_list_json.dart';
import 'package:expenses_app/models/features_model.dart';
import 'package:expenses_app/providers/category_json.dart';
import 'package:expenses_app/providers/db_feature_provider.dart';
import 'package:flutter/cupertino.dart';

class ExpensesProvider extends ChangeNotifier {

  List<CategoryListJson> cListJson = [];
  List<FeaturesModel> features = [];

  // Add Expenses
  addNewFeature(String category, String color, String icon) async {
    final newFeature = new FeaturesModel(
      category: category,
      color: color,
      icon: icon
    );

    final id = await DBFeatureProvider.db.newFeatures(newFeature);
    newFeature.id = id;

    this.features.add(newFeature);
    notifyListeners();
  }


  // Call Expenses

  callAllFeatures() async {
    final res = await DBFeatureProvider.db.getAllFeatures();
    this.features = [...res];
    notifyListeners();
  }

  callCatListJson() async {
    final res = await categoryJson.loadCategories();
    this.cListJson = [...res];
  }


  // Edit Expenses

  updateFeatures(int id, String category, String icon, String color)async{
    final updateFeatures = FeaturesModel(
      id: id,
      category: category,
      icon: icon,
      color: color
    );
    await DBFeatureProvider.db.updateFeatures(updateFeatures);
  }
}