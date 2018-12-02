import 'package:flutter/material.dart';

class Layout extends StatelessWidget {
  final Widget child;
  final String title;
  final Color backgroundColor;
  final Color color;

  Layout({
    this.child,
    this.title,
    this.backgroundColor,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.title),
        backgroundColor: this.backgroundColor,
        textTheme: TextTheme(
          title: TextStyle(
            color: this.color,
            fontSize: 22,
            fontWeight: FontWeight.w600,
          ),
        ),
        iconTheme: IconThemeData(
          color: this.color,
        ),
      ),
      backgroundColor: this.backgroundColor,
      body: Container(
        child: this.child
      ),
    );
  }
}