import 'package:crypto_app/src/core/widgets/favorite_icon_widget.dart';
import 'package:crypto_app/src/models/crypto_model.dart';
import 'package:crypto_app/src/pages/crypto/crypto_page.dart';
import 'package:flutter/material.dart';

class CryptoCard extends StatelessWidget {
  const CryptoCard({super.key, required this.model});

  final CryptoModel model;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 16, right: 16),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CryptoPage(model: model),
            ),
          );
        },
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
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('\$${model.currentPrice!.toStringAsFixed(2)}'),
                FavoriteIconWidget(model: model),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
