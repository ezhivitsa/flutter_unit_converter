import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import 'package:flutter_unit_converter/models/select_item.dart';

const DEFAULT_COLOR = Color(0xFF5E35B1);
const DEFAULT_BORDER_COLOR = Color(0xFF9575CD);

class Select extends StatelessWidget {
  final List<SelectItem> items;
  final String value;
  final Function(String) onChanged;
  final Color color;
  final Color borderColor;

  Select({
    @required this.items,
    @required this.value,
    @required this.onChanged,
    this.color = DEFAULT_COLOR,
    this.borderColor = DEFAULT_BORDER_COLOR,
  });

  List<DropdownMenuItem<String>> dropdownItems() {
    return items.map((item) {
      return DropdownMenuItem(
        value: item.value,
        child: Text(item.label),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: DropdownButtonHideUnderline(
        child: Container(
          margin: EdgeInsets.all(10.0),
          padding: EdgeInsets.only(
            bottom: 5.0,
            top: 5.0,
            left: 10.0,
            right: 10.0,
          ),
          decoration: BoxDecoration(
            border: Border.all(
              width: 2.0,
              color: this.borderColor,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
            color: Colors.white70,
          ),
          child: DropdownButton(
            style: TextStyle(
              color: this.color,
              fontSize: 25.0,
            ),
            items: dropdownItems(),
            isExpanded: true,
            onChanged: this.onChanged,
            value: this.value,
          ),
        ),
      ),
    );
  }
}