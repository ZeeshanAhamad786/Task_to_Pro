import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tasktopro/view/screens/authentication_screens/logo_screen.dart';
import 'package:tasktopro/view/screens/authentication_screens/splash_screen.dart';
import 'package:tasktopro/view/screens/bottom_navigation_screen/bottom_navigation_screen.dart';
Future<void> main() async {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(useMaterial3: true),
    home: const SplashScreen());
});
  }
}
