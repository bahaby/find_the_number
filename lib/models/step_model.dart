import 'package:find_the_number/models/numbers_model.dart';

class StepModel {
  final Operator _op;
  final int num1;
  final int num2;
  final int result;

  String get op{
    switch (_op) {
      case Operator.Add: return "+";
      case Operator.Sub: return "-";
      case Operator.Div: return "/";
      case Operator.Mul: return "*";
      default: return null;
    }
  }

  StepModel(this.num1, this.num2, this._op, this.result);
  
}