import 'package:flutter/material.dart';

const DEFAULT_COLOR = Color(0xFF5E35B1);
const DEFAULT_BORDER_COLOR = Color(0xFF9575CD);

class Input extends StatelessWidget {
  final Function(String) onChanged;
  final String hintText;
  final String labelText;
  final String value;
  final Color color;
  final Color borderColor;

  Input({
    this.hintText: 'Input value...',
    this.labelText: 'Label',
    this.onChanged,
    this.value,
    this.color = DEFAULT_COLOR,
    this.borderColor = DEFAULT_BORDER_COLOR,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(10.0),
        child: TextField(
        decoration: InputDecoration(
          labelText: this.labelText,
          labelStyle: TextStyle(
            fontSize: 25,
            color: this.color,
          ),
          hintText: hintText,
          fillColor: Colors.white70,
          filled: true,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 2.0,
              color: this.borderColor,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            )
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 2.0,
              color: this.borderColor,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            )
          ),
        ),
        controller: TextEditingController.fromValue(
          TextEditingValue(
            text: this.value,
            selection: TextSelection.collapsed(offset: this.value.length)
          ),
        ),
        keyboardType: TextInputType.numberWithOptions(
          decimal: true,
        ),
        onChanged: this.onChanged,
        style: TextStyle(
          fontSize: 20,
          color: this.color,
        ),
      )
    );
  }
}