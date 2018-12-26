abstract class Unit {
  String name;
  String label;

  Future<double> conversionRate(Unit unitTo);
}
