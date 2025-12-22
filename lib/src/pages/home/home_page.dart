import 'package:crypto_app/src/controllers/crypto_controller.dart';
import 'package:crypto_app/src/pages/home/widgets/crypto_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final cryptoController = Get.find<CryptoController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Todas as Cryptomoedas'),
      ),
      body: Obx(() {
        if (cryptoController.isLoading.value) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        return ListView.builder(
          itemCount: cryptoController.listCryptos.length,
          itemBuilder: (context, index) {
            final crypto = cryptoController.listCryptos[index];
            return CryptoCard(model: crypto);
          },
        );
      }),
    );
  }
}