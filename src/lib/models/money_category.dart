import 'package:flutter/material.dart';

import 'package:flutter_unit_converter/interfaces/category.dart';
import 'package:flutter_unit_converter/interfaces/unit.dart';

import 'package:flutter_unit_converter/models/dynamic_unit.dart';

class MoneyCategory extends Category {
  String name = 'Distance';

  List<Unit> getUnits() {
    return <Unit>[
      DynamicUnit(name: 'Us Dollar'),
      DynamicUnit(name: 'Euro'),
      DynamicUnit(name: 'BYN'),
    ];
  }

  ColorSwatch getColorSwatch() {
    return ColorSwatch(0xFF00897B, {
      'background': Color(0xFFB2DFDB),
      'border': Color(0xFF26A69A),
    });
  }
}