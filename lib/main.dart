import 'package:flutter/material.dart';
import 'package:flutter_assesment/models/cat_db_model.dart';
import 'package:flutter_assesment/views/home_page.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(CatHiveDBModelAdapter());
  await Hive.openBox('catdb');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: HomePage(),
    );
  }
}
