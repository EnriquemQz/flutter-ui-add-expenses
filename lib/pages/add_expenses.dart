import 'package:expenses_app/widgets/add_expenses_wt/save_button.dart';
import 'package:flutter/material.dart';
import 'package:expenses_app/widgets/add_expenses_wt/bs_number.dart';
import 'package:expenses_app/widgets/add_expenses_wt/comment_box.dart';

class AddExpenses extends StatefulWidget {
  const AddExpenses({Key key}) : super(key: key);

  @override
  _AddExpensesState createState() => _AddExpensesState();
}

class _AddExpensesState extends State<AddExpenses> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agregar Gastos'),
        centerTitle : false,
      ),
      body: FormOfExpenses(),
    );
  }
}

class FormOfExpenses extends StatefulWidget {
  FormOfExpenses({Key key}) : super(key: key);

  @override
  _FormOfExpensesState createState() => _FormOfExpensesState();
}

class _FormOfExpensesState extends State<FormOfExpenses> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ListView(
      physics: NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.all(18.0),
          child: BottomSheetNumber(),
        ),
        Container(
          padding: EdgeInsets.all(18.0),
          height: size.height,
          decoration: BoxDecoration(
            color: Colors.black54,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50.0),
              topRight: Radius.circular(50.0),
            )
          ),
          child: Column(
            children: [
              CommentBox(),
              Expanded(
                flex: 3,
                child: SaveButton()
              )
            ],
          ),
        )
      ]);
  }
}

