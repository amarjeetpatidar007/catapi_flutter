import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_assesment/api_endpoints.dart';
import 'package:flutter_assesment/controller/main_controller.dart';
import 'package:flutter_assesment/views/detail_page.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});
  final MainController _controller = Get.put(MainController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cat List"),
      ),
      body: Obx(
        () => ListView.builder(
          itemCount: _controller.catBreeds.length,
          itemBuilder: (context, index) {
            _controller.getAllFromDB();
            final breed = _controller.catBreeds[index];
            return GestureDetector(
              onTap: () {
                Get.to(() => DetailPage(catModel: breed));
              },
              child: Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Hero(
                          tag: breed.id,
                          child: CachedNetworkImage(
                            placeholder: (context, url) =>
                                CircularProgressIndicator(),
                            errorWidget: (context, url, error) =>
                                Icon(Icons.error),
                            imageUrl:
                                '${APIEndpoints.imageEndpoint}${breed.referenceImageId}.jpg',
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      ),
                      ListTile(
                          leading: CircleAvatar(child: Text(breed.countryCode)),
                          title: Text(breed.name),
                          trailing: CircleAvatar(
                              child: Text(breed.intelligence.toString())),
                          subtitle: RichText(
                            text: TextSpan(children: [
                              const TextSpan(
                                  text: "Life Span : ",
                                  style: TextStyle(color: Colors.black)),
                              TextSpan(
                                  text: breed.lifeSpan,
                                  style: TextStyle(color: Colors.black))
                            ]),
                          )),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
