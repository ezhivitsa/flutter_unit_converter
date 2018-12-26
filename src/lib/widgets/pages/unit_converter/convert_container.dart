import 'package:flutter/material.dart';

import 'package:flutter_unit_converter/interfaces/category.dart';
import 'package:flutter_unit_converter/interfaces/unit.dart';

import 'package:flutter_unit_converter/widgets/ui/input.dart';
import 'package:flutter_unit_converter/widgets/ui/select.dart';

class ConvertContainer extends StatelessWidget {
  final Function(String) onValueChanged;
  final Function(Unit) onUnitChanged;
  final Category category;
  final String label;
  final String selectedUnit;
  final String value;
  final String hint;

  ConvertContainer({
    this.onValueChanged,
    this.onUnitChanged,
    this.category,
    this.label,
    this.selectedUnit,
    this.value,
    this.hint,
  });

  void _onUnitChanged(String value) {
    var units = category.getUnits();
    var unit = units.firstWhere((u) => u.label == value);

    onUnitChanged(unit);
  }

  @override
  Widget build(BuildContext context) {
    var selectItems = this.category.toSelectItems();
    var swatch = this.category.getColorSwatch();

    return Container(
      child: Column(
        children: <Widget>[
          Input(
            labelText: this.label,
            hintText: this.hint,
            onChanged: this.onValueChanged,
            value: this.value,
            color: swatch,
            borderColor: swatch['border'],
          ),
          Select(
            items: selectItems,
            value: this.selectedUnit,
            onChanged: _onUnitChanged,
            color: swatch,
            borderColor: swatch['border'],
          ),
        ],
      ),
    );
  }
}
