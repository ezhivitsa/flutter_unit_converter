import 'package:flutter_app/interfaces/category.dart';
import 'package:flutter_app/models/unit.dart';

class WeightCategory implements Category {
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
}