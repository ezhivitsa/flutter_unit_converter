import 'package:flutter/material.dart';

import 'package:flutter_unit_converter/interfaces/category.dart';

import 'package:flutter_unit_converter/widgets/ui/layout.dart';

import 'package:flutter_unit_converter/widgets/pages/unit_converter/convert_container.dart';
import 'package:flutter_unit_converter/widgets/pages/unit_converter/exchange.dart';

class UnitConverterRoute extends StatefulWidget {
  final Category category;
  final Color backgroudColor;
  final Color color;
  final Color borderColor;

  UnitConverterRoute({
    this.category,
    this.backgroudColor,
    this.color,
    this.borderColor,
  });

  @override
  _UnitConverterRouteState createState() => _UnitConverterRouteState(
    this.category,
    backgroudColor: this.backgroudColor,
    color: this.color,
    borderColor: this.borderColor,
  );
}

class _UnitConverterRouteState extends State<UnitConverterRoute> {
  double _fromUnit;
  String _fromValue;

  double _toUnit;
  String _toValue;

  Category category;
  Color backgroudColor;
  Color color;
  Color borderColor;

  _UnitConverterRouteState(Category category, {
    this.backgroudColor,
    this.color,
    this.borderColor,
  }) {
    this.category = category;

    var units = category.getUnits();
    _fromUnit = units[0].conversion;
    _toUnit = units[0].conversion;

    _fromValue = '';
    _toValue = '';
  }

  String toValueString(double value) {
    var valueString = value.toString()
      .replaceAll(new RegExp(r'\.0+$'), '');

    return valueString;
  }

  void onFromValueChanged(String value) {
    double inputValue = double.tryParse(value) ?? 0;
    this.setState(() {
      _fromValue = value;
      _toValue = this.toValueString(inputValue * _fromUnit / _toUnit);
    });
  }

  void onFromUnitChanged(double unit) {
    this.setState(() {
      double inputValue = double.tryParse(_fromValue) ?? 0;

      _fromUnit = unit;
      _toValue = this.toValueString(inputValue * unit / _toUnit);
    });
  }
  
  void onToValueChanged(String value) {
    double inputValue = double.tryParse(value) ?? 0;
    this.setState(() {
      _fromValue = this.toValueString(inputValue / _fromUnit * _toUnit);
      _toValue = value;
    });
  }

  void onToUnitChanged(double unit) {
    this.setState(() {
      double inputValue = double.tryParse(_fromValue) ?? 0;

      _toUnit = unit;
      _toValue = this.toValueString(inputValue * _fromUnit / unit);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Layout(
      backgroundColor: this.backgroudColor,
      color: this.color,
      title: category.name,
      child: ListView(
        children: <Widget>[
          ConvertContainer(
            category: this.category,
            label: 'From',
            hint: 'From value',
            selectedUnit: this._fromUnit,
            value: this._fromValue,
            onValueChanged: this.onFromValueChanged,
            onUnitChanged: this.onFromUnitChanged,
            color: this.color,
            borderColor: this.borderColor,
          ),
          Exchange(),
          ConvertContainer(
            category: this.category,
            label: 'To',
            hint: 'To value',
            selectedUnit: this._toUnit,
            value: this._toValue,
            onValueChanged: this.onToValueChanged,
            onUnitChanged: this.onToUnitChanged,
            color: this.color,
            borderColor: this.borderColor,
          )
        ],
      ),
    );
  }
}
