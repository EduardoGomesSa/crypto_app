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
          IconButton(
            padding: const EdgeInsets.only(right: 25),
            onPressed: () {
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
        ],
      ),
      body: Obx(() {
        if (favoriteController.isLoading.value) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (favoriteController.favoriteCryptos.isEmpty) {
          return const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.star_border,
                  size: 80,
                  color: Colors.grey,
                ),
                SizedBox(height: 16),
                Text(
                  'Nenhuma criptomoeda favorita ainda',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
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
