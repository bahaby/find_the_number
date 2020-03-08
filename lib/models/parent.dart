import 'package:find_the_number/models/number.dart';

enum Operator {
  Add,
  Sub,
  Div,
  Mul,
}

class Parent {
  static const operators = [
    Operator.Add,
    Operator.Sub,
    Operator.Div,
    Operator.Mul
  ];
  final Number firstNumber;
  final Number secondNumber;
  final Operator op;
  Parent(this.firstNumber, this.secondNumber, this.op);

  static int operation(int num1, int num2, Operator op) {
    switch (op) {
      case Operator.Add:
        return num1 + num2;
      case Operator.Sub:
        if (num1 <= num2) return null;
        return num1 - num2;
      case Operator.Div:
        if (num1 % num2 != 0 || num1 < num2) return null;
        return num1 ~/ num2;
      case Operator.Mul:
        return num1 + num2;
    }
    return null;
  }

  static Number addNumbers(Number num1, Number num2, Operator op) {
    int operationResult = operation(num1.number, num2.number, op);
    if (operationResult == null) return null;
    return Number(operationResult, Parent(num1, num2, op));
  }
}
