import 'package:amia_flutter_103/ui/views/views.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'controllers/controllers.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _initServices();
  runApp(MyApp());
}

Future<void> _initServices() async {
  await GetStorage.init();
  Get.put<StorageController>(StorageController());
  StorageController.to.getFirstLoadInfoFromStore();
  Get.put<ThemeController>(ThemeController());
  await ThemeController.to.getThemeModeFromStore();
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeController.to.lightTheme.themeData,
      darkTheme: ThemeController.to.darkTheme.themeData,
      themeMode: ThemeController.to.themeMode,
      home: HomeView(),
    );
  }
}
