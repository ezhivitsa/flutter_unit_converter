import 'package:flutter/material.dart';

import 'package:flutter_unit_converter/interfaces/category.dart';
import 'package:flutter_unit_converter/widgets/pages/unit_converter/route.dart';

const double BORDER_RADIUS = 10.0;
const double ICON_PADDING = 20.0;

class CategoryItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final Category category;
  final Color backgroudColor;
  final Color color;
  final Color borderColor;

  CategoryItem({
    this.icon,
    this.text,
    this.category,
    this.backgroudColor,
    this.color,
    this.borderColor,
  });

  Function onTap(BuildContext context) {
    return () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => UnitConverterRoute(
            category: this.category,
            backgroudColor: this.backgroudColor,
            color: this.color,
            borderColor: this.borderColor,
          )),
      );
    };
  }

  Widget _iconWidget() {
    return Padding(
      padding: EdgeInsets.all(ICON_PADDING),
      child: Icon(
        this.icon,
        size: 50.0,
        color: Colors.blue[800],
      ),
    );
  }

  Widget _textWidget() {
    return Center(
      child: Text(this.text,
          style: TextStyle(
              fontSize: 25.0,
              color: Colors.blue[800],
              fontWeight: FontWeight.w600)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        borderRadius: BorderRadius.circular(BORDER_RADIUS),
        onTap: this.onTap(context),
        highlightColor: Colors.amber[100],
        child: Row(
          children: <Widget>[
            this._iconWidget(),
            this._textWidget(),
          ],
        ),
      ),
    );
  }
}