import 'package:dalgeurak_meal_application/routes/pages.dart';
import 'package:dimigoin/routes/pages.dart';
import 'package:dimigoin/utils/root.dart';
import 'package:dalgeurak_widget_package/dalgeurak_widget_package.dart';
import 'package:dimigoin_flutter_plugin/dimigoin_flutter_plugin.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DimigoinFlutterPlugin().initializeApp();
  DalgeurakWidgetPackage().initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "디미고인",
      theme: ThemeData(
        primaryColor: const Color(0xffE83C77)
      ),
      builder: (context, child) => Scaffold(
        body: GestureDetector(
          onTap: () {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: child,
        ),
      ),
      home: Root(),
      getPages: [...DimigoinPages.pages, ...DalgeurakMealApplicationPages.pages]
    );
  }
}
