import 'package:flutter/material.dart';

class Input extends StatelessWidget {
  final String hintText;
  final String labelText;

  Input({
    this.hintText: 'Input value...',
    this.labelText: 'Label',
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      child: TextField(
        decoration: InputDecoration(
          hintText: hintText,
          labelText: labelText,
          labelStyle: TextStyle(
            fontSize: 25,
            color: Colors.deepPurple,
            fontWeight: FontWeight.w600,
          ),
          fillColor: Colors.white70,
          filled: true,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 3.0,
              color: Colors.deepOrange,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            )
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 3.0,
              color: Colors.deepOrangeAccent[100],
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            )
          ),
        ),
        style: TextStyle(
          fontSize: 20,
          color: Colors.black54,
        ),
      )
    );
  }
}