import 'package:flutter/material.dart';

import 'package:flutter_unit_converter/interfaces/category.dart';
import 'package:flutter_unit_converter/interfaces/unit.dart';

import 'package:flutter_unit_converter/widgets/pages/unit_converter/convert_container.dart';
import 'package:flutter_unit_converter/widgets/pages/unit_converter/exchange.dart';

class UnitConverterRoute extends StatefulWidget {
  final Category category;

  UnitConverterRoute({
    this.category,
  });

  @override
  _UnitConverterRouteState createState() => _UnitConverterRouteState();
}

class _UnitConverterRouteState extends State<UnitConverterRoute> {
  Unit _fromUnit;
  String _fromValue;

  Unit _toUnit;
  String _toValue;

  @override
  void initState() {
    super.initState();

    _init();
  }

  @override
  void didUpdateWidget(UnitConverterRoute oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.category != oldWidget.category) {
      _init();
    }
  }

  _init() {
    var units = widget.category.getUnits();
    _fromUnit = units[0];
    _toUnit = units[0];

    _fromValue = '';
    _toValue = '';
  }

  String toValueString(double value) {
    var valueString = value.toString()
      .replaceAll(new RegExp(r'\.0+$'), '');

    return valueString;
  }

  Future<void> onFromValueChanged(String value) async {
    double inputValue = double.tryParse(value) ?? 0;
    var toValue = await widget.category.convert(_fromUnit, _toUnit, inputValue);

    this.setState(() {
      _fromValue = value;
      _toValue = toValueString(toValue);
    });
  }

  Future<void> onFromUnitChanged(Unit unit) async {
    double inputValue = double.tryParse(_fromValue) ?? 0;
    var toValue = await widget.category.convert(unit, _toUnit, inputValue);

    this.setState(() {
      _fromUnit = unit;
      _toValue = toValueString(toValue);
    });
  }
  
  Future<void> onToValueChanged(String value) async {
    double inputValue = double.tryParse(value) ?? 0;
    var fromValue = await widget.category.convert(_toUnit, _fromUnit, inputValue);

    this.setState(() {
      _fromValue = toValueString(fromValue);
      _toValue = value;
    });
  }

  Future<void> onToUnitChanged(Unit unit) async {
    double inputValue = double.tryParse(_fromValue) ?? 0;
    var toValue = await widget.category.convert(_fromUnit, unit, inputValue);

    this.setState(() {
      _toUnit = unit;
      _toValue = toValueString(toValue);
    });
  }

  Widget _content() {
    return Column(
      children: <Widget>[
        ConvertContainer(
          category: widget.category,
          label: 'From',
          hint: 'From value',
          selectedUnit: this._fromUnit.label,
          value: this._fromValue,
          onValueChanged: this.onFromValueChanged,
          onUnitChanged: this.onFromUnitChanged,
        ),
        Exchange(),
        ConvertContainer(
          category: widget.category,
          label: 'To',
          hint: 'To value',
          selectedUnit: this._toUnit.label,
          value: this._toValue,
          onValueChanged: this.onToValueChanged,
          onUnitChanged: this.onToUnitChanged,
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxHeight > constraints.maxWidth) {
          return SingleChildScrollView(
            child: Container(
              child: _content()
            ),
          );
        } else {
          return SingleChildScrollView(
            child: Center(
              child: Container(
                width: 500,
                child: _content(),
              )
            )
          );
        }
      },
    );
  }
}
