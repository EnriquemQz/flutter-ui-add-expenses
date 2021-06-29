import 'package:expenses_app/providers/expenses_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Test extends StatelessWidget {
  const Test({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final exProvider = Provider.of<ExpensesProvider>(context);
    final features = exProvider.features;
    
    return ListView.builder(
      itemCount: features.length,
      itemBuilder: (_, i) => ListTile(
        title: Text(features[i].category),
      ),
    );
  }
}