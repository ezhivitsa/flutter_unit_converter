import 'package:meta/meta.dart';

import 'package:flutter_unit_converter/interfaces/unit.dart';

import 'package:flutter_unit_converter/services/currency.dart';

class MoneyUnit implements Unit {
  String name;
  String label;

  MoneyUnit({
    @required this.name,
    @required this.label,
  });

  @override
  Future<double> conversionRate(Unit unitTo) async {
    var moneyUnitTo = unitTo as MoneyUnit;

    if (label == moneyUnitTo.label) {
      return 1.0;
    }

    var response = await getRates(label);
    var conversion = response.rates[moneyUnitTo.label];

    return conversion ?? 0;
  }
}