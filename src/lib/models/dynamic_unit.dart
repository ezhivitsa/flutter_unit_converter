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
    var response = await getRates(label);
    var moneyUnitTo = unitTo as MoneyUnit;
    var conversion = response.rates[moneyUnitTo.label];

    return conversion ?? 0;
  }
}