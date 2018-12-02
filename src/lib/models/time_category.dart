import 'package:flutter_unit_converter/interfaces/category.dart';

import 'package:flutter_unit_converter/models/unit.dart';

class TimeCategory extends Category {
  String name = 'Time';

  List<Unit> getUnits() {
    return <Unit>[
      Unit(name: 'Second', conversion: 1/60),
      Unit(name: 'Minute', conversion: 1),
      Unit(name: 'Hour', conversion: 60),
      Unit(name: 'Day', conversion: 1440),
      Unit(name: 'Week', conversion: 10080),
    ];
  }
}