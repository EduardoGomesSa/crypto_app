import 'package:crypto_app/src/bindings/crypto_binding.dart';
import 'package:crypto_app/src/core/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  await dotenv.load(fileName: ".env");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Crypto App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: false,
        appBarTheme: AppBarTheme(backgroundColor: Colors.blue.shade400),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Colors.blue,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white.withAlpha(870),
        ),
      ),
      debugShowCheckedModeBanner: false,
      initialBinding: CryptoBinding(),
      initialRoute: AppRoutes.base,
      getPages: AppPages. pages,
    );
  }
}
