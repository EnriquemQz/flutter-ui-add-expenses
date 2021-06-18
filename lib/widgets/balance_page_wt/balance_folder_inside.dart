import 'package:flutter/material.dart';

import 'package:expenses_app/utils/constants.dart';


class BalanceFolderInside extends StatelessWidget {
  const BalanceFolderInside({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: Constants.fiBoxDecoration,
      child: ListView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        children: [
        ],
      ),
    );
  }
}