import 'package:find_the_number/models/step_model.dart';

class ResultModel {
  final int number;
  final List<StepModel> steps;
  final int stepCount;
  final int range;
  ResultModel(this.number, this.steps, this.stepCount, this.range);
  List<int> get trace{
    List<int> result = []; 
    steps.forEach((step) { 
      result.add(step.result);
    });
  }
}
