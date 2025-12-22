import 'package:crypto_app/src/core/widgets/favorite_icon_widget.dart';
import 'package:crypto_app/src/models/crypto_model.dart';
import 'package:flutter/material.dart';

class CryptoPage extends StatelessWidget {
  const CryptoPage({super.key, required this.model});

  final CryptoModel model;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(model.name!),
        actions: [
          FavoriteIconWidget(model: model),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.network(
                model.image!,
                width: 100,
                height: 100,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Name: ${model.name!}',
              style: const TextStyle(fontSize: 18),
            ),
            Text(
              'Symbol: ${model.symbol!}',
              style: const TextStyle(fontSize: 18),
            ),
            Text(
              'Current Price: \$${model.currentPrice!.toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}