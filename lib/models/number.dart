import 'package:find_the_number/models/parent.dart';

class Number{
  int number;
  Parent parent;
  Number.noParent(this.number):this.parent = null;
  Number(this.number, this.parent);
  
}