import 'package:crypto_app/src/bindings/favorite_binding.dart';
import 'package:crypto_app/src/pages/base_page.dart';
import 'package:crypto_app/src/pages/favorite/favorite_page.dart';
import 'package:crypto_app/src/pages/home/home_page.dart';
import 'package:get/get.dart';

abstract class AppPages {
  static final pages = <GetPage>[
    GetPage(
      name: AppRoutes.base,
      page: () => const BasePage(),
      binding: FavoriteBinding()
    ),
    GetPage(
      name: AppRoutes.home,
      page: () => const HomePage(),
    ),
    GetPage(
      name: AppRoutes.favorite,
      page: () => const FavoritePage(),
      binding: FavoriteBinding(),
    ),
  ];
}

abstract class AppRoutes {
  static const String base = '/';
  static const String home = '/home';
  static const String favorite = '/favorite';
}
