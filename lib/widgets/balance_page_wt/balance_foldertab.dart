import 'package:flutter/material.dart';


class BalanceFolderTab extends StatelessWidget {
  const BalanceFolderTab({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: IntrinsicHeight(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Text(
                  'Ingresos',
                  style: TextStyle(
                    fontSize: 15.0,
                    letterSpacing: 1.5,
                    fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  '\$ 3,500.00',
                  style: TextStyle(
                    fontSize: 18.0, 
                    color: Colors.green[400],
                    letterSpacing: 1.5
                  ),
                )
              ],
            ),
            VerticalDivider(thickness: 2, width: 20.0, color: Colors.black38),
            Column(
              children: [
                Text(
                  'Gastos',
                  style: TextStyle(
                    fontSize: 15.0,
                    letterSpacing: 1.5,
                    fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  '\$ 1,000.00',
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.grey,
                    letterSpacing: 1.5
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}