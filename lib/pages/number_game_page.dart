import 'package:find_the_number/models/numbers_model.dart';
import 'package:find_the_number/pages/select_number_page.dart';
import 'package:find_the_number/pages/select_target_page.dart';
import 'package:find_the_number/widgets/steps_item.dart';
import 'package:flutter/material.dart';

class NumberGamePage extends StatefulWidget {
  static const routeName = '/number_game';

  @override
  _NumberGamePageState createState() => _NumberGamePageState();
}

class _NumberGamePageState extends State<NumberGamePage> {
  List<int> baseNumbers = NumbersModel.generateNumbers;
  int target = NumbersModel.generateTarget;
  @override
  Widget build(BuildContext context) {
    NumbersModel numbers = NumbersModel();
    numbers.calculate(baseNumbers, target);
    return Scaffold(
      appBar: AppBar(
        title: Text("Sayı Oyunu"),
      ),
      body: Container(
        width: double.infinity,
        margin: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            buildTitle(context, "Sayılar"),
            Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ...baseNumbers.asMap().entries.map((number) {
                      int mode = (number.key == 5) ? 1 : 0;
                      return InkWell(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(5),
                          topRight: Radius.circular(5),
                        ),
                        onTap: () async {
                          var result = await Navigator.of(context)
                          .pushNamed(SelectNumberPage.routeName, arguments: {
                            'number': number.value,
                            'mode': mode,
                          });
                          if (result != null) {
                            baseNumbers[number.key] = result;
                            setState(() {
                              numbers.calculate(baseNumbers, target);
                            });
                          }
                        },
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 6, vertical: 1),
                          decoration: BoxDecoration(
                              border: Border(bottom: BorderSide(width: 3))),
                          child: Text(
                            number.value.toString(),
                            style: TextStyle(
                              fontSize: 30,
                              color: Theme.of(context).primaryColor,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      );
                    }).toList(),
                    InkWell(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      onTap: () async {
                          var result = await Navigator.of(context)
                          .pushNamed(SelectTargetPage.routeName);
                          if (result != null) {
                            target = result;
                            setState(() {
                              numbers.calculate(baseNumbers, target);
                            });
                          }
                        },
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                        decoration: BoxDecoration(
                          border: Border.all(width: 3),
                          borderRadius: BorderRadius.all(Radius.circular(10))
                        ),
                        child: Text(
                          target.toString(),
                          style: TextStyle(
                            fontSize: 35,
                            color: Colors.red,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ]),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  width: 120,
                  child: RaisedButton(
                    onPressed: () {
                      setState(() {
                        baseNumbers = NumbersModel.generateNumbers;
                        target = NumbersModel.generateTarget;
                        numbers.calculate(baseNumbers, target);
                      });
                    },
                    child: Text("Sayıları Yenile"),
                  ),
                ),
                Text("Score: ${numbers.score}"),
                Container(
                  width: 120,
                  child: RaisedButton(
                    onPressed: () {
                      setState(() {
                        baseNumbers = [1, 4, 2, 5, 7, 60];
                        target = 485;
                        numbers.calculate(baseNumbers, target);
                      });
                    },
                    child: Text("Sayı gir"),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            buildTitle(context, "Sonuçlar"),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: numbers.bestResults.length,
                itemBuilder: (_, index) => StepsItem(numbers.bestResults[index].steps),
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
