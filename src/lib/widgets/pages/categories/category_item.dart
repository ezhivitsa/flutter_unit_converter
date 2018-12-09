import 'package:flutter/material.dart';

import 'package:flutter_unit_converter/interfaces/category.dart';
import 'package:flutter_unit_converter/widgets/pages/unit_converter/route.dart';

const double BORDER_RADIUS = 10.0;
const double ICON_PADDING = 20.0;

class CategoryItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final Category category;
  final Function onTap;

  CategoryItem({
    this.icon,
    this.text,
    this.category,
    this.onTap,
  });

  void _onTap() {
    onTap(this);
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
        onTap: _onTap,
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
