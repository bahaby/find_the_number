class Result {
  final int number;
  final String operations;
  Result(this.number, this.operations);
}

/* class Results {
  List<int> _baseNumbers;
  List<int> _baseIndexes = [];
  List<List<int>> _allNumberCombinations = [];
  List<Number> items = [];

  /* List operationMap = [
    [[[0]]],
    [[[0, 1]]],
    [[[0, 1, 2]]],
    [[[0, 1], [2, 3]], [[0, 1, 2, 3]]],
    [[[0, 1], [2, 3, 4]], [[0, 1, 2], [3, 4]], [[0, 1, 2, 3, 4]]],
    [[[0, 1], [2, 3], [4, 5]], [[0, 1, 2], [3, 4, 5]], [[0, 1], [2, 3, 4, 5]], [[0, 1, 2, 3], [4, 5]], [[0, 1, 2, 3, 4, 5]]]
  ]; */
  
  Results(this._baseNumbers) {
    int index = 0;
    _baseNumbers.forEach((element) {
      /* items.add(Number.noParent(element)); */
      _baseIndexes.add(index);
      index ++;
    });
  }

  void createResults() {
    subList();
    _allNumberCombinations.forEach((indexes){
      List<int> results;
      bool isFirst = true;
      int result = 0;
      indexes.forEach((index) {
        if(isFirst){
          results = [_baseNumbers[index]];
          isFirst = false;
        }else{
          results = Parent.operation(results, _baseNumbers[index]);
        }
      });

    });
  }
  

  void subList() {
    var sublists = _genSubList(_baseIndexes).sublist(1);
    
    sublists.forEach((element) { 
      _allNumberCombinations += _shuffleList(element);
    });
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
 */