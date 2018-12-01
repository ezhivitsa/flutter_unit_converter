import 'package:flutter/material.dart';

import 'package:flutter_unit_converter/models/unit.dart';
import 'package:flutter_unit_converter/interfaces/category.dart';

import 'package:flutter_unit_converter/widgets/ui/input.dart';
import 'package:flutter_unit_converter/widgets/ui/select.dart';

class ConvertContainer extends StatelessWidget {
  final Function(String) onValueChanged;
  final Function(Unit) onUnitChanged;
  final Category category;
  final String label;
  final Unit selectedUnit;
  final String value;

  ConvertContainer({
    this.onValueChanged,
    this.onUnitChanged,
    this.category,
    this.label,
    this.selectedUnit,
    this.value,
  });

  @override
  Widget build(BuildContext context) {
    var selectItems = category.toSelectItems();
    var selected = selectedUnit != null
        ? selectedUnit.conversion
        : selectItems[0].value;

    return Container(
      child: Column(
        children: <Widget>[
          Input(
            labelText: label,
            hintText: 'Unit value',
            onChanged: this.onValueChanged,
            value: this.value,
          ),
          Select(
            items: selectItems,
            value: selected,
          ),
        ],
      ),
    );
  }
}