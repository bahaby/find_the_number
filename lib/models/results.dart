import 'package:find_the_number/models/number.dart';
import 'package:find_the_number/models/parent.dart';
import 'package:flutter/foundation.dart';

class Results {
  List<int> _baseNumbers;
  List<int> _baseIndexes = [];
  List<List<int>> _allNumberCombinations = [];
  List<Number> items = [];
  List<dynamic> operationMap(int length){
    switch (length) {
      case 2:
        return [
          [[0, 1]],
        ];
      case 3:
        return [
          [[0, 1, 2]],
        ];
      case 4:
        return [
          [[0, 1], [2, 3]],
          [[0, 1, 2, 3]],
        ];
      case 5:
        return [
          [[0, 1], [2, 3, 4]],
          [[0, 1, 2], [3, 4]],
          [[0, 1, 2, 3, 4]],
        ];
      case 6:
        return [
          [[0, 1], [2, 3], [4, 5]],
          [[0, 1, 2], [3, 4, 5]],
          [[0, 1], [2, 3, 4, 5]],
          [[0, 1, 2, 3], [4, 5]],
          [[0, 1, 2, 3, 4, 5]],
        ];
      default: return null;
    }
  }
  Results(this._baseNumbers) {
    int index = 0;
    _baseNumbers.forEach((element) {
      items.add(Number.noParent(element));
      _baseIndexes.add(index);
      index ++;
    });
  }

  void createResults() {
    for (var i = 2; i < _baseNumbers.length; i++) {
      for (var j = 0; j < i; j++) {}
    }
  }
  static void calculate(){
    var num1 = Number.noParent(10);
    var num2 = Number.noParent(51);

    var newnum = Parent.addNumbers(num1, num2, Operator.Sub);
    print(newnum.number);
    print('${newnum.parent.firstNumber.number} ${newnum.parent.secondNumber.number}');
  }

  void subList() {
    var sublists = _genSubList(_baseIndexes).sublist(1);
    
    sublists.forEach((element) { 
      _allNumberCombinations += _shuffleList(element);
    });
    print(_allNumberCombinations.length);
  }
  static List<List<int>> _genSubList(List<int> list){
    if (list.length == 0) 
      return [[]];
    var smaller = _genSubList(list.sublist(0, list.length-1));
    var extra = [list.last];
    List<List<int>> newList = [];
    smaller.forEach((element) { 
      newList.add(element + extra);
    });
    return smaller + newList;
  }

  bool _containsList(List<List<int>> lists, List<int> list) {
    bool check = false;
    lists.forEach((element) {
      if (listEquals(element, list)) check = true;
    });
    return check;
  }

  int _factorial(int n) => n == 0 ? 1 : n * _factorial(n - 1);

  List<List<int>> _shuffleList(List<int> list) {
    int limit = _factorial(list.length);
    List<List<int>> shuffledList = [];
    while (shuffledList.length != limit) {
      if (!_containsList(shuffledList, list)) {
        shuffledList.add([...list]);
      }
      list.shuffle();
    }
    return shuffledList;

  }
}
