import 'dart:math';

import 'package:find_the_number/models/results_model.dart';
import 'package:find_the_number/models/step_model.dart';
import 'package:flutter/foundation.dart';
enum Operator {
  Add,
  Sub,
  Div,
  Mul,
}

class NumbersModel {
  var operators = [
    Operator.Add,
    Operator.Sub,
    Operator.Div,
    Operator.Mul
  ];

  List<ResultModel> results = [];
  List<ResultModel> bestResults = [];
  List<StepModel> _steps = [];
  List<int> baseNumbers;
  int target;
  
  NumbersModel(){
    refresh();
  }

  refresh(){
    generateNumbers();
    calculate();
  }

  generateNumbers(){
    List<int> numbers = [];
    var rd = Random.secure(); 
    int target = rd.nextInt(900) + 100;
    for (var i = 0; i < 6; i++) {
      numbers.add(rd.nextInt(9) + 1);
    }
    numbers.last *= 10;

    this.baseNumbers = numbers;
    this.target = target;
  }

  setUp(List<int> baseNumbers, int target){
    this.baseNumbers = baseNumbers;
    this.target = target;
    calculate();
  }

  ResultModel operate(){
    _steps = [];
    ResultModel result;
    int range = 100000000;
    int stepCount = 0;
    List<int> availableNumbers = [...baseNumbers];
    while (availableNumbers.length > 1) {
      int tempResult;
      availableNumbers.shuffle();
      operators.shuffle();
      tempResult = operation(availableNumbers[0], availableNumbers[1], operators[0]);
      if (tempResult == null) continue;
      stepCount++;
      availableNumbers.add(tempResult);
      availableNumbers.removeRange(0, 2);
      if ((tempResult - target).abs() < range){
        range = (tempResult - target).abs();
        result = ResultModel(tempResult, [..._steps], stepCount, range);
      }
    }
    return result;
  } 
  calculate(){
    for (var i = 0; i < 50000; i++) {
      ResultModel temp = operate();
      if (temp != null){
        results.add(temp);
      }
    }
    int bestRange = 100000000;
    int bestSteps = 100000000;
    results.forEach((result) { 
      if (bestRange > result.range)
        bestRange = result.range;
    });
    results.forEach((result) { 
      if (result.range == bestRange && bestSteps > result.stepCount)
        bestSteps = result.stepCount;
    });
    results.forEach((result) { 
      if (bestRange == result.range && bestSteps == result.stepCount){
        bestResults.add(result);
      }
    });
  }

  int operation(int num1, int num2, Operator op) {
    switch (op) {
      case Operator.Add:
        _steps.add(StepModel(num1, num2, op, num1 + num2));
        return num1 + num2;
      case Operator.Sub:
        if (num1 <= num2) return null;
        _steps.add(StepModel(num1, num2, op, num1 - num2));
        return num1 - num2;
      case Operator.Div:
        if (num1 % num2 != 0 || num1 < num2) return null;
        _steps.add(StepModel(num1, num2, op, num1 ~/ num2));
        return num1 ~/ num2;
      case Operator.Mul:
        _steps.add(StepModel(num1, num2, op, num1 * num2));
        return num1 * num2;
    }
    return null;
  }
  

}