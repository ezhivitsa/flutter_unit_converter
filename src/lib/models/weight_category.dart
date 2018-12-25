import 'package:flutter/material.dart';

import 'package:flutter_unit_converter/interfaces/category.dart';
import 'package:flutter_unit_converter/models/static_unit.dart';

class WeightCategory extends Category {
  String name = 'Weight';

  List<Unit> getUnits() {
    return <Unit>[
      Unit(name: 'Kilogram', conversion: 1),
      Unit(name: 'Gram', conversion: 0.001),
      Unit(name: 'Miligram', conversion: 0.000001),
      Unit(name: 'Metric Ton', conversion: 1000),
      Unit(name: 'Long Ton', conversion: 1016.04608),
      Unit(name: 'Pound', conversion: 0.453592),
    ];
  }

  ColorSwatch getColorSwatch() {
    return ColorSwatch(0xFFE65100, {
      'background': Color(0xFFFFCC80),
      'border': Color(0xFFFB8C00),
    });
  }
}