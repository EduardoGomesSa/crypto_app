class CryptoChartPointModel {
  final DateTime time;
  final double price;

  CryptoChartPointModel({
    required this.time,
    required this.price,
  });

  factory CryptoChartPointModel.fromList(List item) {
    return CryptoChartPointModel(
      time: DateTime.fromMillisecondsSinceEpoch(item[0]),
      price: (item[1] as num).toDouble(),
    );
  }
}
