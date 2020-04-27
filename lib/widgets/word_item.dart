import 'package:flutter/material.dart';

class WordItem extends StatelessWidget {
  final wordData;
  WordItem(this.wordData);
  @override
  Widget build(BuildContext context) {
  bool joker = false;
    return Card(
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 0),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Row(
          children: (wordData['word'] as String).runes.map((letter){
            Color color;
            if (String.fromCharCode(letter) == wordData['joker'] && !joker){
              color = Colors.red;
              joker = true;
            }else{
              color = Colors.black;
            }
            return Text(String.fromCharCode(letter), style: TextStyle(color: color, fontSize: 30, letterSpacing: 2),);
          }).toList(),
        ),
      ),
    );
  }
}
