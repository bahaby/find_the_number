import 'package:find_the_number/models/numbers.dart';
import 'package:flutter/material.dart';

class NumberGamePage extends StatelessWidget {
  static const routeName = '/number_game';
  @override
  Widget build(BuildContext context) {
            var result = Numbers([1, 9, 4, 5, 6, 7], 20);
    return Container(
      color: Colors.amber,
      child: Center(
        child: RaisedButton(
          onPressed: (){
            result.calculate();

          },
          child: Text('bas'),)
      ),
    );
  }
}
