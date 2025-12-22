class CryptoChartPointModel {
  final DateTime time;
  final double price;

  CryptoChartPointModel({
    required this.time,
    required this.price,
  });

  factory CryptoChartPointModel.fromMap(List item) {
    return CryptoChartPointModel(
      time: DateTime.fromMillisecondsSinceEpoch(item[0]),
      price: (item[1] as num).toDouble(),
    );
  }

  static List<CryptoChartPointModel> fromList(List list) {
    return list.map((item) => CryptoChartPointModel.fromMap(item)).toList();
  }
}
