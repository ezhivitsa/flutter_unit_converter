import 'package:flutter/material.dart';

import 'package:flutter_unit_converter/interfaces/category.dart';

import 'package:flutter_unit_converter/models/static_unit.dart';

class DistanceCategory extends Category {
  String name = 'Distance';

  List<Unit> getUnits() {
    return <Unit>[
      Unit(name: 'Meter', conversion: 1),
      Unit(name: 'Kilometer', conversion: 1000),
      Unit(name: 'Centimeter', conversion: 0.01),
      Unit(name: 'Millimeter', conversion: 0.001),
      Unit(name: 'Mile', conversion: 1609.35),
      Unit(name: 'Yard', conversion: 0.9144),
      Unit(name: 'Foot', conversion: 0.3048),
    ];
  }

  ColorSwatch getColorSwatch() {
    return ColorSwatch(0xFF2E7D32, {
      'background': Color(0xFF81C784),
      'border': Color(0xFF4CAF50),
    });
  }
}