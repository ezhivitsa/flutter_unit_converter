import 'package:flutter_unit_converter/interfaces/category.dart';

import 'package:flutter_unit_converter/models/unit.dart';

class DistanceCategory extends Category {
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
}