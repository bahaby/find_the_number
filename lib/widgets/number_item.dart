import 'package:flutter/material.dart';
class NumberItem extends StatelessWidget {
  final int _number;
  final bool _isSelected;
  NumberItem(this._number, this._isSelected);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pop(_number);
      },
      child: Container(
        child: Center(
          child: Text(
            _number.toString(),
            style: TextStyle(
              color: _isSelected ? Theme.of(context).primaryColor : Colors.black,
              fontSize: 30,
            ),
          ),
        ),
      ),
    );
  }
}