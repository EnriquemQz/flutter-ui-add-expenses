import 'package:flutter/material.dart';

class SaveButton extends StatelessWidget {
  const SaveButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.green,
      radius: 35.0,
      child: CircleAvatar(
        backgroundColor: Colors.grey[900],
        radius: 34.0,
        child: Icon(
          Icons.done_outline,
          size: 45.0,
          color: Colors.green,
        ),
      ),
    );
  }
}