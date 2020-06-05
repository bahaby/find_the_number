import 'package:find_the_number/models/words_model.dart';
import 'package:find_the_number/pages/select_char_page.dart';
import 'package:find_the_number/widgets/word_item.dart';
import 'package:flutter/material.dart';

class WordGamePage extends StatefulWidget {
  static const routeName = "/word_game";

  @override
  _WordGamePageState createState() => _WordGamePageState();
}

class _WordGamePageState extends State<WordGamePage> {
  WordsModel words = WordsModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kelime Oyunu"),
      ),
      body: Container(
        width: double.infinity,
        margin: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            buildTitle(context, "Harfler"),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: words.randomLetters.asMap().entries.map((letter) {
                  return InkWell(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(5),
                        topRight: Radius.circular(5)),
                    onTap: () async {
                      var result = await Navigator.of(context)
                          .pushNamed(SelectCharPage.routeName, arguments: letter.value);
                      if (result != null) {
                        words.randomLetters[letter.key] = result;
                        setState(() {
                          words.findBestWord();
                        });
                      }
                    },
                    child: Container(
                      width: 30,
                      padding: EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                      decoration: BoxDecoration(
                          border: Border(bottom: BorderSide(width: 3))),
                      child: Text(
                        String.fromCharCode(letter.value).toUpperCase(),
                        style: TextStyle(
                          fontSize: 30,
                          color: Theme.of(context).primaryColor,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                RaisedButton(
                  onPressed: () {
                    setState(() {
                      words.refresh();
                    });
                  },
                  child: Text("Yenile"),
                ),
                Text("Score: ${words.score}"),
                RaisedButton(
                  onPressed: () {},
                  child: Text("Harf gir"),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            buildTitle(context, "Kelimeler"),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: words.bestResults.length,
                itemBuilder: (_, index) => WordItem(words.bestResults[index]),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container buildTitle(BuildContext context, String title) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 6, vertical: 3),
      decoration: BoxDecoration(
        color: Theme.of(context).accentColor,
        border: Border.all(width: 1),
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 20, color: Colors.white, letterSpacing: 0.8),
      ),
    );
  }
}
