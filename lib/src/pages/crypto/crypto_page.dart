import 'package:crypto_app/src/controllers/crypto_controller.dart';
import 'package:crypto_app/src/core/widgets/favorite_icon_widget.dart';
import 'package:crypto_app/src/models/crypto_model.dart';
import 'package:crypto_app/src/pages/crypto/widgets/crypto_line_chart.dart';
import 'package:crypto_app/src/pages/crypto/widgets/info_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CryptoPage extends StatelessWidget {
  const CryptoPage({super.key, required this.model});

  final CryptoModel model;

  @override
  Widget build(BuildContext context) {
    final cryptoController = Get.find<CryptoController>();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      cryptoController.getChartById(model.id!);
    });

    return Scaffold(
      appBar: AppBar(
        title: Text(model.name!),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 25),
            child: FavoriteIconWidget(model: model),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  Image.network(
                    model.image!,
                    width: 80,
                    height: 80,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    model.name!,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    model.symbol!.toUpperCase(),
                    style: const TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            Center(
              child: Text(
                '\$${model.currentPrice!.toStringAsFixed(2)}',
                style: const TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 4),

            Center(
              child: Text(
                '${model.priceChangePercentage24h!.toStringAsFixed(2)}%',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: model.priceChangePercentage24h! >= 0
                      ? Colors.green
                      : Colors.red,
                ),
              ),
            ),

            const SizedBox(height: 16),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InfoItem(
                  label: 'Volume',
                  value:
                      '\$${model.totalVolume!.toStringAsFixed(0)}',
                ),
                InfoItem(
                  label: 'Market Cap',
                  value:
                      '\$${model.marketCap!.toStringAsFixed(0)}',
                ),
              ],
            ),

            const SizedBox(height: 24),

            Obx(() {
              if (cryptoController.listChartPoints.isEmpty) {
                return const SizedBox(
                  height: 200,
                  child: Center(child: CircularProgressIndicator()),
                );
              }

              return CryptoLineChart(
                chartPoints: cryptoController.listChartPoints,
              );
            }),
          ],
        ),
      ),
    );
  }
}
