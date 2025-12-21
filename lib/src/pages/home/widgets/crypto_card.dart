import 'package:crypto_app/src/models/crypto_model.dart';
import 'package:flutter/material.dart';

class CryptoCard extends StatelessWidget {
  const CryptoCard({super.key, required this.model});

  final CryptoModel model;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 16, right: 16),
      child: Card(
        elevation: 2,
        child: ListTile(
          leading: Image.network(
            model.image!,
            width: 40,
            height: 40,
          ),
          title: Text(model.name!),
          subtitle: Text(model.symbol!),
          trailing: Text('\$${model.currentPrice!.toStringAsFixed(2)}'),
        ),
      ),
    );
  }
}
