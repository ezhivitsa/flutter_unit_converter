import 'package:flutter/material.dart';

import 'package:flutter_unit_converter/interfaces/unit.dart';
import 'package:flutter_unit_converter/models/select_item.dart';

abstract class Category {
  List<Unit> getUnits();

  String name;

  List<SelectItem> toSelectItems() {
    var units = getUnits();

    return units.map((unit) {
      return SelectItem(
        label: unit.name,
      );
    }).toList();
  }

  ColorSwatch getColorSwatch();

  Future<double> convert(Unit unitFrom, Unit unitTo, double value) async {
    double conversionRate = await unitFrom.conversionRate(unitTo);
  }
}