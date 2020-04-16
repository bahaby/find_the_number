import 'package:find_the_number/models/parent.dart';

class Number{
  int number;
  String history;
  final String _add;
  Number(this.number, this._add){
    history = _add;
  }

  Number.add(this.number, this._add){
    
  }
  
}