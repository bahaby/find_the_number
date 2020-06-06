import 'dart:math';

import 'package:find_the_number/models/results_model.dart';
import 'package:find_the_number/models/step_model.dart';
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

  List<ResultModel> results = [];//sonuçlar
  List<ResultModel> bestResults = [];//en yakın filtrelenmiş sonuçlar
  List<StepModel> _steps = [];//adımlar
  int range;//hedef sayıya olan mesafe
  
  static List<int> get generateNumbers{//sayı oluşturma
    List<int> numbers = [];
    var rd = Random.secure(); 
    for (var i = 0; i < 6; i++) {
      numbers.add(rd.nextInt(9) + 1);
    }
    numbers.last *= 10;
    return numbers;
  }
  static int get generateTarget{//bulunması gereken sayıyı random oluşturur.
    var rd = Random.secure(); 
    return rd.nextInt(900) + 100;
  }

  ResultModel operate(List<int> baseNumbers, int target){
    _steps = [];
    ResultModel result;//sonuç
    int range = 100000000;
    int stepCount = 0;//adım sayısı
    List<int> availableNumbers = [...baseNumbers];//sayılar diziye kopyalanır
    while (availableNumbers.length > 1) {//asıl işlem kısmı
      int tempResult;// geçici sonuç
      availableNumbers.shuffle();//dizideki sayıların yerlerini değiştirir
      operators.shuffle();//operatör sıralarını değiştirir
      tempResult = operation(availableNumbers[0], availableNumbers[1], operators[0]);//fonksiyona sayıları ve operatörü yollayıp sonucu alıyoruz
      if (tempResult == null) continue;//sonuç null ise geri kalan adımları atla.
      stepCount++;// adım sayısını arttırır.
      availableNumbers.add(tempResult);//bulunan sonucu diziye ekler.
      availableNumbers.removeRange(0, 2);//kullandığımız sayıları diziden çıkarır.
      if ((tempResult - target).abs() < range){//hedeflenen sayıya yakınlığa bakılır.
        range = (tempResult - target).abs();
        result = ResultModel(tempResult, [..._steps], stepCount, range);//en yakın sonuç result değişkenine kayıt edilir.
      }
    }
    return result;
  } 
  calculate(List<int> baseNumbers, int target){
    for (var i = 0; i < 10000; i++) {//10000 kere operate fonsiyonunu çalıştırır.
      ResultModel temp = operate(baseNumbers, target);
      if (temp != null){//sonuç null değil ise result'a eklenir.
        results.add(temp);
      }
    }
    int bestRange = 100000000;//en yakın değer ile hedeflenen sayının arasındaki farkın tutulduğu değişken.
    int bestSteps = 100000000;//en kısa adım sayısının tutulduğu değişken.
    results.forEach((result) {//en iyi range bulunur.
      if (bestRange > result.range)
        bestRange = result.range;
    });
    results.forEach((result) { //aynı range değerine sahip olanların en az adım sayısına bakılır.
      if (result.range == bestRange && bestSteps > result.stepCount)
        bestSteps = result.stepCount;
    });
    results.forEach((result) { //Range ve Step sayısına göre filtreleme yapılır.
      if (bestRange == result.range && bestSteps == result.stepCount){
        bestResults.add(result);
      }
    });
    this.range = bestRange; //Puanlama için en iyi mesafe kaydedilir.
  }

  int operation(int num1, int num2, Operator op) {//işlem yapılır sonuç döndürülür.
    switch (op) {
      case Operator.Add:
        _steps.add(StepModel(num1, num2, op, num1 + num2));
        return num1 + num2;
      case Operator.Sub:
        if (num1 <= num2) return null;//ikinci sayı birinci sayıdan büyük yada eşitse null sonucu gönderilir.
        _steps.add(StepModel(num1, num2, op, num1 - num2));
        return num1 - num2;
      case Operator.Div:
        if (num1 % num2 != 0 || num1 < num2) return null;//modu 0 değilse veya //ikinci sayı birinci sayıdan büyük yada eşitse null sonucu gönderilir.
        _steps.add(StepModel(num1, num2, op, num1 ~/ num2));
        return num1 ~/ num2;
      case Operator.Mul:
        _steps.add(StepModel(num1, num2, op, num1 * num2));
        return num1 * num2;
    }
    return null;
  }
  int get score{//score hesaplanır.
    return (range < 10) ? 10 - range : 0;
  }

}