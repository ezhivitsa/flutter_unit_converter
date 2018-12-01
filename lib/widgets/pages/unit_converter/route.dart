import 'package:flutter/material.dart';

import 'package:flutter_unit_converter/interfaces/category.dart';
import 'package:flutter_unit_converter/models/unit.dart';

import 'package:flutter_unit_converter/widgets/pages/unit_converter/convert_container.dart';
import 'package:flutter_unit_converter/widgets/pages/unit_converter/exchange.dart';

class UnitConverterRoute extends StatefulWidget {
  final Category category;

  UnitConverterRoute({
    this.category,
  });

  @override
  _UnitConverterRouteState createState() => _UnitConverterRouteState(this.category);
}

class _UnitConverterRouteState extends State<UnitConverterRoute> {
  Unit _fromUnit;
  String _fromValue;

  Unit _toUnit;
  String _toValue;

  Category category;

  _UnitConverterRouteState(Category category) {
    this.category = category;

    var units = category.getUnits();
    _fromUnit = units[0];
    _toUnit = units[0];

    _fromValue = '';
    _toValue = '';
  }

  void onFromValueChanged(String value) {
    double inputValue = double.tryParse(value) ?? 0;
    this.setState(() {
      _fromValue = value;
      _toValue = (inputValue / _fromUnit.conversion * _toUnit.conversion).toString();
    });
  }

  void onFromUnitChanged(Unit unit) {
    this.setState(() {
      double inputValue = double.tryParse(_fromValue) ?? 0;

      _fromUnit = unit;
      _toValue = (inputValue / unit.conversion * _toUnit.conversion).toString();
    });
  }
  
  void onToValueChanged(String value) {
    double inputValue = double.tryParse(value) ?? 0;
    this.setState(() {
      _fromValue = (inputValue * _fromUnit.conversion / _toUnit.conversion).toString();
      _toValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: <Widget>[
        ConvertContainer(
          category: this.category,
          label: 'From',
          selectedUnit: this._fromUnit,
          value: this._fromValue,
          onValueChanged: this.onFromValueChanged,
          onUnitChanged: this.onFromUnitChanged,
        ),
        Exchange(),
        ConvertContainer(
          category: this.category,
          label: 'To',
          selectedUnit: this._toUnit,
          value: this._toValue,
          onValueChanged: this.onToValueChanged,
        )
      ],
    );
  }
}
