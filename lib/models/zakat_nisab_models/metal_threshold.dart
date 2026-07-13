class MetalThreshold {
  final double? weight;
  final double? unitPrice;
  final double? nisabAmount;

  MetalThreshold({this.weight, this.unitPrice, this.nisabAmount});

  factory MetalThreshold.fromJson(Map<String, dynamic> json) {
    return MetalThreshold(
      weight: (json['weight'] as num?)?.toDouble(),
      unitPrice: (json['unit_price'] as num?)?.toDouble(),
      nisabAmount: (json['nisab_amount'] as num?)?.toDouble(),
    );
  }
}
