import 'package:flutter/material.dart';

import 'package:flutter_unit_converter/interfaces/category.dart';
import 'package:flutter_unit_converter/interfaces/unit.dart';

import 'package:flutter_unit_converter/models/static_unit.dart';

class TimeCategory extends Category {
  String name = 'Time';

  List<Unit> getUnits() {
    return <Unit>[
      StaticUnit(name: 'Second', conversion: 1/60, label: 'second'),
      StaticUnit(name: 'Minute', conversion: 1, label: 'minute'),
      StaticUnit(name: 'Hour', conversion: 60, label: 'hour'),
      StaticUnit(name: 'Day', conversion: 1440, label: 'day'),
      StaticUnit(name: 'Week', conversion: 10080, label: 'week'),
    ];
  }

  ColorSwatch getColorSwatch() {
    return ColorSwatch(0xFFF57F17, {
      'background': Color(0xFFFFF59D),
      'border': Color(0xFFFBC02D),
    });
  }
}