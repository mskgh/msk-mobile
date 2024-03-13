import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Screens/splash_screen.dart';
import 'package:get/get.dart';
import 'dark theme/themeClass.dart';
import 'widgets/model/OrganizationDataProvider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => OrganizationDataProvider()),
        ChangeNotifierProvider(create: (context) => BusinessDataProvider()),
        ChangeNotifierProvider(create: (context) => WarehouseDataProvider()),
      ],
      child: const MyStoreKeeper(),
    ),
  );
}

class MyStoreKeeper extends StatefulWidget {
  const MyStoreKeeper({Key? key}) : super(key: key);

  @override
  State<MyStoreKeeper> createState() => _MyStoreKeeperState();
}

class _MyStoreKeeperState extends State<MyStoreKeeper> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      theme: ThemeClass.lightTheme,
      darkTheme: ThemeClass.darkTheme,
      home: const SplashScreen(),
    );
  }
}