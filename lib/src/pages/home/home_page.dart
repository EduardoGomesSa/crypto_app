import 'package:crypto_app/src/controllers/crypto_controller.dart';
import 'package:crypto_app/src/pages/home/widgets/crypto_card.dart';
import 'package:crypto_app/src/pages/home/widgets/search_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final cryptoController = Get.find<CryptoController>();
    final GlobalKey<RefreshIndicatorState> refreshIndicatorKey =
        GlobalKey<RefreshIndicatorState>();
    final TextEditingController searchController = TextEditingController();

    void searchCryptos(String searchTerm) {
      cryptoController.searchCryptosByParam(searchTerm);
    }

    return SafeArea(
      top: false,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Todas as Cryptomoedas'),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 12, bottom: 5),
              child: Row(
                children: [
                  Expanded(
                      child: SearchWidget(
                    onSearch: searchCryptos,
                    controller: searchController,
                  )),
                ],
              ),
            ),
            Expanded(
              child: Obx(() {
                if (cryptoController.isLoading.value) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                if (cryptoController.filteredCryptos.isEmpty) {
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
                  key: refreshIndicatorKey,
                  onRefresh: () async {
                    searchController.clear();
                    searchCryptos('');
                    await cryptoController.getAllCoins();
                  },
                  child: ListView.builder(
                    itemCount: cryptoController.filteredCryptos.length,
                    itemBuilder: (context, index) {
                      final crypto = cryptoController.filteredCryptos[index];
                      return CryptoCard(model: crypto);
                    },
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
