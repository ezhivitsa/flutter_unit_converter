import 'package:flutter_unit_converter/models/unit.dart';
import 'package:flutter_unit_converter/models/select_item.dart';

abstract class Category {
  List<Unit> getUnits();

  String name;

  List<SelectItem> toSelectItems() {
    var units = getUnits();

    return units.map((unit) {
      return SelectItem(
        label: unit.name,
        value: unit.conversion,
      );
    }).toList();
  }
}