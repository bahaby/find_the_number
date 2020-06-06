import 'package:find_the_number/models/step_model.dart';

class ResultModel {//Bulunan sonuçlar tutulur
  final int number;
  final List<StepModel> steps;
  final int stepCount;
  final int range;
  ResultModel(this.number, this.steps, this.stepCount, this.range);
  List<int> get trace{
    List<int> results = []; 
    steps.forEach((step) { 
      results.add(step.result);
    });
    return results;
  }
}
