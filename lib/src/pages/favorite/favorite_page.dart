import 'package:crypto_app/src/controllers/favorite_controller.dart';
import 'package:crypto_app/src/pages/favorite/widgets/crypto_favorite_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    final favoriteController = Get.find<FavoriteController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cryptomoedas Favoritas'),
        actions: [
          Obx(
            () => IconButton(
              padding: const EdgeInsets.only(right: 25),
              onPressed: favoriteController.favoriteCryptos.isEmpty
                  ? null
                  : () {
                      Get.dialog(
                        AlertDialog(
                          title: const Text('Remover favorito'),
                          content: const Text(
                            'Deseja realmente remover todos os favoritos?',
                          ),
                          actions: [
                            TextButton(
                              onPressed: () => Get.back(),
                              child: const Text('Cancelar'),
                            ),
                            TextButton(
                              onPressed: () async {
                                favoriteController.removeAllFavorites();
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
              icon: const Icon(Icons.delete_forever),
            ),
          ),
        ],
      ),
      body: Obx(() {
        if (favoriteController.isLoading.value) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (favoriteController.favoriteCryptos.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 16,
              children: [
                Icon(
                  Icons.heart_broken,
                  size: 100,
                  color: Colors.grey.withValues(alpha: 0.6),
                ),
                const Text(
                  'Nenhuma criptomoeda favorita ainda',
                  style: TextStyle(fontSize: 18, color: Colors.grey),
                ),
              ],
            ),
          );
        }

        return ListView.builder(
          itemCount: favoriteController.favoriteCryptos.length,
          itemBuilder: (context, index) {
            final crypto = favoriteController.favoriteCryptos[index];
            return CryptoFavoriteCard(model: crypto);
          },
        );
      }),
    );
  }
}
