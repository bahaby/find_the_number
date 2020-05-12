import 'package:flutter/material.dart';

class CharItem extends StatelessWidget {
  final int _char;
  final bool _isSelected;
  CharItem(this._char, this._isSelected);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pop(_char);
      },
      child: Container(
        child: Center(
          child: Text(
            String.fromCharCode(_char).toUpperCase(),
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
