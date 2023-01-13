import 'package:dimigoin/routes/pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
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
      getPages: DimigoinPages.pages
    );
  }
}
