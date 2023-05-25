import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_assesment/api_endpoints.dart';
import 'package:flutter_assesment/controller/main_controller.dart';
import 'package:flutter_assesment/models/cat_model.dart';
import 'package:flutter_assesment/views/detail_page.dart';
import 'package:flutter_assesment/views/fav_model.dart';
import 'package:flutter_assesment/views/home_view.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var currentIndex = 0.obs;

  List<Widget> pages = [
    HomeView(),
    FavView(),
  ];

  void changePage(int index) {
    setState(() {
      currentIndex.value = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Fav',
            ),
          ],
          currentIndex: currentIndex.value,
          selectedItemColor: Colors.pink,
          onTap: changePage,
        ),
        body: Center(child: pages.elementAt(currentIndex.value)));
  }
}
