import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:my_flutter_app/routes/app_pages.dart';
import 'package:my_flutter_app/screen/auth/login/login_binding.dart';
import 'package:my_flutter_app/screen/auth/login/login_view.dart';
import 'package:alice/alice.dart';
import 'package:my_flutter_app/screen/home/home_binding.dart';
import 'package:my_flutter_app/screen/home/home_view.dart';
import 'package:my_flutter_app/screen/home/home_view_v2.dart';
import 'package:my_flutter_app/screen/shop_home/shop_home_binding.dart';
import 'package:my_flutter_app/screen/shop_home/shop_home_view.dart';

void main() async {
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

late Alice alice;

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final storage = GetStorage();

  @override
  void initState() {
    alice = Alice(
      showNotification: true,
      showInspectorOnShake: true,
      maxCallsCount: 1000,
    );
    super.initState();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      navigatorKey: kDebugMode ? alice.getNavigatorKey() : null,
      title: 'Flutter Demooo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        useMaterial3: true,
      ),
      home:
          (storage.read("is_login") != null && storage.read("is_login") == true)
              ? const ShopHomePage()
              : const ShopHomePage(),
      initialBinding:
          (storage.read("is_login") != null && storage.read("is_login") == true)
              ? ShopHomeBinding()
              : ShopHomeBinding(),
      getPages: AppPages.pages,
    );
  }
}
