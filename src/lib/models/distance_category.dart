import 'package:flutter/material.dart';

import 'package:flutter_unit_converter/interfaces/category.dart';
import 'package:flutter_unit_converter/interfaces/unit.dart';

import 'package:flutter_unit_converter/models/static_unit.dart';

class DistanceCategory extends Category {
  String name = 'Distance';

  List<Unit> getUnits() {
    return <Unit>[
      StaticUnit(name: 'Meter', conversion: 1, label: 'meter'),
      StaticUnit(name: 'Kilometer', conversion: 1000, label: 'kmeter'),
      StaticUnit(name: 'Centimeter', conversion: 0.01, label: 'cmeter'),
      StaticUnit(name: 'Millimeter', conversion: 0.001, label: 'mmeter'),
      StaticUnit(name: 'Mile', conversion: 1609.35, label: 'mile'),
      StaticUnit(name: 'Yard', conversion: 0.9144, label: 'yard'),
      StaticUnit(name: 'Foot', conversion: 0.3048, label: 'foot'),
    ];
  }

  ColorSwatch getColorSwatch() {
    return ColorSwatch(0xFF2E7D32, {
      'background': Color(0xFF81C784),
      'border': Color(0xFF4CAF50),
    });
  }
}