import 'package:find_the_number/widgets/number_item.dart';
import 'package:flutter/material.dart';
class SelectNumberPage extends StatelessWidget {
  static const routeName = "/select_number";
  @override
  Widget build(BuildContext context) {
    Map data = ModalRoute.of(context).settings.arguments;
    int currentNumber = data['number'];
    int mode = data['mode'];
    return Scaffold(
      appBar: AppBar(title:Text("Numara Seç")),
          body: Container(
        margin: EdgeInsets.all(10),
        child: GridView.count(
          crossAxisCount: 3,
          children:
            [1, 2, 3, 4, 5, 6, 7, 8, 9].map((number){
              if (mode == 1) number *= 10;
              bool isSelected = currentNumber == number;
              return NumberItem(number, isSelected);
            }).toList(),
        ),
      ),
    );
  }
}