
import 'package:expenses_app/pages/balance_page.dart';
import 'package:expenses_app/pages/charts_page.dart';
import 'package:expenses_app/pages/setting_page.dart';
import 'package:expenses_app/providers/ui_provider.dart';
import 'package:expenses_app/widgets/home_page_wt/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _HomePage(),
      bottomNavigationBar: CustomNavigationBar(),
    );
  }
}

class _HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final uiProvider = Provider.of<UiProvider>(context);

    final currentIndex = uiProvider.selectedMenu;

    switch(currentIndex){
      case 0:
        return BalancePage();
      case 1:
        return ChartsPage();
      case 2:
        return SettingPage();
      default:
        return BalancePage();
    }
  }
}
