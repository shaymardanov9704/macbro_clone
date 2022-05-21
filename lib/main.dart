import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:macbro/bindings/splash_bindings.dart';
import 'package:macbro/core/constants/constants.dart';
import 'package:macbro/core/theme/app_theme.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:macbro/data/database/models/basket_products.dart';
import 'package:macbro/data/database/models/favorite_products.dart';
import 'package:macbro/routes/app_pages.dart';
import 'package:macbro/routes/app_routes.dart';


// flutter pub run flutter_launcher_icons:main
// flutter run -d windows --no-sound-null-safety
// flutter build apk --release --no-sound-null-safety
// flutter build apk --split-per-abi --no-sound-null-safety
// flutter build appbundle --release --no-sound-null-safety
// flutter pub run build_runner watch --delete-conflicting-outputs

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  Hive.registerAdapter(FavoriteProductsAdapter());
  Hive.registerAdapter(BasketProductsAdapter());

  await Hive.openBox<FavoriteProducts>('favorite');
  await Hive.openBox<BasketProducts>('basket');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
      gestures: const [GestureType.onTap],
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (context) => GetMaterialApp(
          title: "MacBro",
          navigatorKey: AppConstants.navigatorKey,
          /// theme
          theme: AppThemes.light,
          darkTheme: AppThemes.dark,
          debugShowCheckedModeBanner: false,

          /// binding
          initialBinding: SplashBindings(),

          /// route
          initialRoute: AppRoutes.initial,
          getPages: AppPages.pages,
          ///
          defaultTransition: Transition.rightToLeft,
          ///
          transitionDuration: const Duration(milliseconds: 100),
         // home: ProductDetailPage(),
        ),
      ),
    );
  }
}
