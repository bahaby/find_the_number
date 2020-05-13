import 'package:find_the_number/models/numbers_model.dart';
import 'package:find_the_number/widgets/steps_item.dart';
import 'package:flutter/material.dart';

class NumberGamePage extends StatefulWidget {
  static const routeName = '/number_game';

  @override
  _NumberGamePageState createState() => _NumberGamePageState();
}

class _NumberGamePageState extends State<NumberGamePage> {
  @override
  Widget build(BuildContext context) {
    NumbersModel numbers = NumbersModel();

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
                    ...numbers.baseNumbers.asMap().entries.map((number) {
                      return InkWell(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(5),
                          topRight: Radius.circular(5),
                        ),
                        onTap: () {},
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
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                        decoration: BoxDecoration(
                          border: Border.all(width: 3),
                          borderRadius: BorderRadius.all(Radius.circular(10))
                        ),
                        child: Text(
                          numbers.target.toString(),
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
                RaisedButton(
                  onPressed: () {
                    setState(() {
                      numbers.refresh();
                    });
                  },
                  child: Text("Yenile"),
                ),
                Text("Score"),
                RaisedButton(
                  onPressed: () {},
                  child: Text("Harf gir"),
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
    /* return Container(
      color: Colors.amber,
      child: Center(
        child: RaisedButton(
          onPressed: (){
            var result = Numbers();
            String msg = "Numbers: ";
            result.baseNumbers.forEach((element) { 
              msg += "$element, ";
            });
            msg += "Target: ${result.target}";
            print(msg);
            result.bestResults.forEach((element) { 
              element.steps.forEach((step) { 
                print("${step.num1}" + step.op + "${step.num2}" + " = " + "${step.result}");
              });
            print("\n\n");
            });


          },
          child: Text('bas'),)
      ),
    ); */
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
