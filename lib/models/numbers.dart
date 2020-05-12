import 'package:find_the_number/models/results.dart';
import 'package:flutter/foundation.dart';
enum Operator {
  Add,
  Sub,
  Div,
  Mul,
}

class Numbers {
  var operators = [
    Operator.Add,
    Operator.Sub,
    Operator.Div,
    Operator.Mul
  ];

  List<Result> results = [];
  List<String> traces = [];
  final int target;
  final List<int> baseNumbers;
  List<int> availableNumbers;
  String history;
  
  Numbers(this.baseNumbers, this.target){
    availableNumbers = baseNumbers;
  }
  Result operate(){
    history = "";
    int bestResult;
    int bestRange = 100000000;
    String bestHistory;
    while (availableNumbers.length > 1) {
      int result;
      availableNumbers.shuffle();
      operators.shuffle();
      result = operation(availableNumbers[0], availableNumbers[1], operators[0]);
      if (result == null) continue;
      availableNumbers.add(result);
      availableNumbers.removeRange(0, 2);
      if ((result - target).abs() < bestRange){
        traces.add(history);
        bestRange = (result - target).abs();
        bestResult = result;
        bestHistory = history;
      }
    }
    if (bestResult != null) {
      print(bestResult);
      print(bestHistory);
      
    }
    return Result(bestResult, bestHistory);
  } 
  calculate(){
    print(results.length);
    for (var i = 0; i < 200000; i++) {
      availableNumbers = baseNumbers;
      Result temp = operate();
      if (temp != null){
        results.add(temp);
      }
      print(availableNumbers);
    }
    results.forEach((result) { 
      print(result.operations + "\n\n");
    });
  }
  

  int operation(int num1, int num2, Operator op) {
    switch (op) {
      case Operator.Add:
        history += "$num1 + $num2 = ${num1 + num2}\n"; 
        return num1 + num2;
      case Operator.Sub:
        if (num1 <= num2) return null;
        history += "$num1 - $num2 = ${num1 - num2}\n"; 
        return num1 - num2;
      case Operator.Div:
        if (num1 % num2 != 0 || num1 < num2) return null;
        history += "$num1 / $num2 = ${num1 ~/ num2}\n"; 
        return num1 ~/ num2;
      case Operator.Mul:
        history += "$num1 * $num2 = ${num1 * num2}\n"; 
        return num1 * num2;
    }
    return null;
  }
  

}