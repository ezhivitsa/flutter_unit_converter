import 'package:flutter/material.dart';

import 'package:flutter_unit_converter/interfaces/category.dart';

import 'package:flutter_unit_converter/widgets/ui/input.dart';
import 'package:flutter_unit_converter/widgets/ui/select.dart';

class ConvertContainer extends StatelessWidget {
  final Function(String) onValueChanged;
  final Function(double) onUnitChanged;
  final Category category;
  final String label;
  final double selectedUnit;
  final String value;
  final String hint;
  final Color color;
  final Color borderColor;

  ConvertContainer({
    this.onValueChanged,
    this.onUnitChanged,
    this.category,
    this.label,
    this.selectedUnit,
    this.value,
    this.hint,
    this.color,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    var selectItems = this.category.toSelectItems();

    return Container(
      child: Column(
        children: <Widget>[
          Input(
            labelText: this.label,
            hintText: this.hint,
            onChanged: this.onValueChanged,
            value: this.value,
            color: this.color,
            borderColor: this.borderColor,
          ),
          Select(
            items: selectItems,
            value: this.selectedUnit,
            onChanged: this.onUnitChanged,
            color: this.color,
            borderColor: this.borderColor,
          ),
        ],
      ),
    );
  }
}
