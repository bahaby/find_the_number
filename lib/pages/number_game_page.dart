import 'package:find_the_number/models/results.dart';
import 'package:flutter/material.dart';

class NumberGamePage extends StatelessWidget {
  static const routeName = '/number_game';
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber,
      child: Center(
        child: RaisedButton(
          onPressed: (){
            Results([1, 2, 3, 4, 5 ,6]).subList();
          },
          child: Text('bas'),)
      ),
    );
  }
}
