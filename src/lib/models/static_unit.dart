import 'package:flutter_unit_converter/interfaces/unit.dart';

class StaticUnit implements Unit {
  String name;
  String label;
  double conversion;

  StaticUnit({
    this.name,
    this.conversion,
    this.label,
  });

  @override
  Future<double> conversionRate(Unit unitTo) async {
    var staticUnitTo = unitTo as StaticUnit;
    return conversion / staticUnitTo.conversion;
  }
}
