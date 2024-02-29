enum UnitMeasurement {
  g(0),
  kg(1),
  unit(2),
  ml(3),
  l(4);

  const UnitMeasurement(this.code);

  final int code;

  static UnitMeasurement fromCode(int code) {
    final value = UnitMeasurement.values.firstWhere((e) => e.code == code);
    return value;
  }

  String? toShow() {
    return switch (this) {
      UnitMeasurement.g => 'g',
      UnitMeasurement.kg => 'Kg',
      UnitMeasurement.unit => ' unit',
      UnitMeasurement.ml => 'ml',
      UnitMeasurement.l => 'L',
    };
  }
}
