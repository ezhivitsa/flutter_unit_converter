import 'package:flutter/material.dart';

import 'package:flutter_unit_converter/interfaces/category.dart';
import 'package:flutter_unit_converter/interfaces/unit.dart';

import 'package:flutter_unit_converter/models/static_unit.dart';

class WeightCategory extends Category {
  String name = 'Weight';

  List<Unit> getUnits() {
    return <Unit>[
      StaticUnit(name: 'Kilogram', conversion: 1, label: 'kgram'),
      StaticUnit(name: 'Gram', conversion: 0.001, label: 'gram'),
      StaticUnit(name: 'Miligram', conversion: 0.000001, label: 'mgram'),
      StaticUnit(name: 'Metric Ton', conversion: 1000, label: 'mton'),
      StaticUnit(name: 'Long Ton', conversion: 1016.04608, label: 'lton'),
      StaticUnit(name: 'Pound', conversion: 0.453592, label: 'pound'),
    ];
  }

  ColorSwatch getColorSwatch() {
    return ColorSwatch(0xFFE65100, {
      'background': Color(0xFFFFCC80),
      'border': Color(0xFFFB8C00),
    });
  }
}