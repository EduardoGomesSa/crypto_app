import 'package:crypto_app/src/controllers/favorite_controller.dart';
import 'package:crypto_app/src/core/widgets/favorite_icon_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    final favoriteController = Get.find<FavoriteController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite Page'),
      ),
      body: Obx(() {
        if (favoriteController.isLoading.value) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (favoriteController.favoriteCryptos.isEmpty) {
          return const Center(
            child: Text('No favorite cryptocurrencies found.'),
          );
        }

        return ListView.builder(
          itemCount: favoriteController.favoriteCryptos.length,
          itemBuilder: (context, index) {
            final crypto = favoriteController.favoriteCryptos[index];
            return ListTile(
              leading: Image.network(
                crypto.image!,
                width: 40,
                height: 40,
              ),
              title: Text(crypto.name!),
              subtitle: Text('Symbol: ${crypto.symbol!}'),
              trailing: FavoriteIconWidget(
                model: crypto,
                alreadyFavorite: true,
              ),
            );
          },
        );
      }),
    );
  }
}