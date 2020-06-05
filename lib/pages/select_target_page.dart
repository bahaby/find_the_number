import 'package:find_the_number/widgets/number_item.dart';
import 'package:flutter/material.dart';

class SelectTargetPage extends StatefulWidget {
  static const routeName = "/select_target";

  @override
  _SelectTargetPageState createState() => _SelectTargetPageState();
}

class _SelectTargetPageState extends State<SelectTargetPage> {
    int target = 0;
    int counter = 0;
    bool isFirst = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Hedef Belirle")),
      body: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Container(
              width: 80,
              height: 50,
              padding: EdgeInsets.symmetric(horizontal: 6, vertical: 3),
              decoration:
                  BoxDecoration(border: Border(bottom: BorderSide(width: 3))),
              child: Text(
                target.toString(),
                style: TextStyle(
                  fontSize: 30,
                  color: Theme.of(context).primaryColor,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              child: GridView.count(
                crossAxisCount: 5,
                children: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9].map((number) {
                  return InkWell(
                    onTap: (isFirst && number == 0) ? null : () {
                      setState(() {
                        target = target * 10 + number;
                        isFirst = false;
                      });
                      counter++;
                      if (counter == 3){
                        Navigator.of(context).pop(target);
                      }
                    },
                    child: Container(
                      child: Center(
                        child: Text(
                          number.toString(),
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
