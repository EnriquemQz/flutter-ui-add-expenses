import 'dart:io';

import 'package:expenses_app/models/features_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBFeatureProvider {
  static Database _database;
  static final DBFeatureProvider db = DBFeatureProvider._();

  DBFeatureProvider._();

  Future<Database> get database async {
    if(_database != null) return _database;

    _database = await initDB();
    return _database;
  }

  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, 'FeatureDB.db');
    print(path);
    return await openDatabase(path, version: 1, onOpen: (db){},
    onCreate: (Database db, int version) async {
      await db.execute('CREATE TABLE Features ('
        'id INTEGER PRIMARY KEY,'
        'category TEXT,'
        'color TEXT,'
        'icon TEXT'
      ')');
    });
  }

  newFeatures(FeaturesModel newFeatures) async {
    final db = await database;
    final res = db.insert('Features', newFeatures.toJson());
    return res;
  }

  Future<List<FeaturesModel>> getAllFeatures() async {
    final db = await database;
    final res = await db.query('Features');

    List<FeaturesModel> fList = res.isNotEmpty
      ? res.map((e) => FeaturesModel.fromJson(e)).toList()
      : [];
    return fList;
  }

  Future<int> updateFeatures(FeaturesModel newFeature) async {
    final db = await database;
    final res = db.update('Features', newFeature.toJson(),
      where: 'id = ?', whereArgs: [newFeature.id]);
    return res;
  }

}