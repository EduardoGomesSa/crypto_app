import 'package:crypto_app/src/controllers/favorite_controller.dart';
import 'package:crypto_app/src/models/crypto_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoriteIconWidget extends StatelessWidget {
  const FavoriteIconWidget({
    super.key,
    required this.model,
    this.alreadyFavorite = false,
  });
  final CryptoModel model;
  final bool alreadyFavorite;

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<FavoriteController>();

    if (alreadyFavorite) {
      return IconButton(
          onPressed: () {
            Get.dialog(
              AlertDialog(
                title: const Text('Remover favorito'),
                content: Text(
                  'Deseja realmente remover ${model.name} dos favoritos?',
                ),
                actions: [
                  TextButton(
                    onPressed: () => Get.back(),
                    child: const Text('Cancelar'),
                  ),
                  TextButton(
                    onPressed: () {
                      controller.controlFavorite(model);
                      Get.back();
                    },
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.red,
                    ),
                    child: const Text('Remover'),
                  ),
                ],
              ),
            );
          },
          icon: Icon(
            Icons.delete,
            color: Colors.red.shade300,
          ));
    }

    return Obx(() {
      return IconButton(
        onPressed: () {
          controller.controlFavorite(model);
        },
        icon: Icon(model.isFavorite.value ? Icons.star : Icons.star_border,
            color: Colors.yellow),
      );
    });
  }
}
