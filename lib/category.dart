import 'package:flutter/material.dart';

import './unit_converter_route.dart';
import './unit.dart';

const double BORDER_RADIUS = 10.0;
const double ICON_PADDING = 20.0;

class Category extends StatelessWidget {
  final IconData icon;
  final String text;

  Category({this.icon, this.text});

  Function onTap(BuildContext context) {
    return () {
      var unit = Unit(
        name: text,
        conversion: 4.0,
      );

      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => UnitConverterRoute(
                  unit: unit,
                  color: Colors.green,
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
        color: Colors.green[800],
      ),
    );
  }

  Widget _textWidget() {
    return Center(
      child: Text(this.text,
          style: TextStyle(
              fontSize: 25.0,
              color: Colors.black54,
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
