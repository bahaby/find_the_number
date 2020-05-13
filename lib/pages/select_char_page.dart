import 'package:find_the_number/models/words_model.dart';
import 'package:find_the_number/widgets/char_item.dart';
import 'package:flutter/material.dart';

class SelectCharPage extends StatelessWidget {
  static const routeName = "/select_char";
  
  @override
  Widget build(BuildContext context) {
    int currentChar = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(title:Text("Harf seç")),
          body: Container(
        margin: EdgeInsets.all(10),
        child: GridView.count(
          crossAxisCount: 5,
          children:
            WordsModel.alphabet.runes.map((char){
              bool isSelected = currentChar == char;
              return CharItem(char, isSelected);
            }).toList(),
        ),
      ),
    );
  }
}
