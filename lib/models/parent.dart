/* import 'package:find_the_number/models/number.dart';

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

  static List<int> operation(List<int> nums, int num2, Operator op) {
    List<int> result = [];
    nums.forEach((number) {
      switch (op) {
        case Operator.Add:
          result.add(number + num2);
          break;
        case Operator.Sub:
          if (number > num2) {
            result.add(number - num2);
          }
          break;
        case Operator.Div:
          if (!(number % num2 != 0 || number < num2)) {
            result.add(number ~/ num2);
          }
          break;
        case Operator.Mul:
          result.add(number * num2);
          break;
      }
    });
    return result;
  }

  /* static Number addNumbers(Number num1, Number num2, Operator op) {
    int operationResult = operation(num1.number, num2.number, op);
    if (operationResult == null) return null;
    return Number(operationResult, Parent(num1, num2, op));
  } */
}
 */