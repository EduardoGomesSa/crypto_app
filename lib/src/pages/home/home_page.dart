import 'package:crypto_app/src/controllers/crypto_controller.dart';
import 'package:crypto_app/src/pages/home/widgets/crypto_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final cryptoController = Get.find<CryptoController>();
    final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
        GlobalKey<RefreshIndicatorState>();

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

        if(cryptoController.listCryptos.isEmpty) {
          return const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.money_off_outlined,
                  size: 80,
                  color: Colors.grey,
                ),
                SizedBox(height: 16),
                Text(
                  'Nenhuma criptomoeda encontrada',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
              ],
            ),
          );
        }

        return RefreshIndicator(
          key: _refreshIndicatorKey,
          onRefresh: () async => cryptoController.getAllCoins(),
          child: ListView.builder(
            itemCount: cryptoController.listCryptos.length,
            itemBuilder: (context, index) {
              final crypto = cryptoController.listCryptos[index];
              return CryptoCard(model: crypto);
            },
          ),
        );
      }),
    );
  }
}
