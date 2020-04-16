import 'package:find_the_number/models/words.dart';
import 'package:flutter/material.dart';

class WordGamePage extends StatelessWidget {
  static const routeName = "/word_game";
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: RaisedButton(onPressed: (){
          Words words = Words();
          words.refresh();
          print(String.fromCharCodes(words.randomLetters));
          print(words.findBestWord());
        }),
      ),
    );
  }
}