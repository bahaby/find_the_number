import 'package:find_the_number/models/step_model.dart';
import 'package:flutter/material.dart';

class StepsItem extends StatelessWidget {
  final List<StepModel> stepsData;
  StepsItem(this.stepsData);
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 0),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Column(
          children: stepsData.map((step){
            TextStyle style = TextStyle(
              fontSize: 24,
            );
            return Row(
              children: <Widget>[
                Text(step.num1.toString(), style: style,),
                Text(" ${step.op} ", style: style,),
                Text(step.num2.toString(), style: style,),
                Text(" = ", style: style,),
                Text(step.result.toString(), style: style,),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
