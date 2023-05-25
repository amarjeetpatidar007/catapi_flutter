import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_assesment/api_endpoints.dart';
import 'package:flutter_assesment/controller/main_controller.dart';
import 'package:flutter_assesment/models/cat_model.dart';
import 'package:flutter_assesment/views/detail_page.dart';
import 'package:get/get.dart';

class FavView extends StatelessWidget {
  FavView({super.key});
  final MainController _controller = Get.put(MainController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Fav Cat List"),
      ),
      body: Obx(
        () {
          if (_controller.boxList.isEmpty) {
            return Center(
              child: Text("No Data"),
            );
          } else {
            return ListView.builder(
              itemCount: _controller.boxList.length,
              itemBuilder: (context, index) {
                final fav = _controller.boxList[index];

                return Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: CachedNetworkImage(
                            placeholder: (context, url) =>
                                CircularProgressIndicator(),
                            errorWidget: (context, url, error) =>
                                Icon(Icons.error),
                            imageUrl:
                                '${APIEndpoints.imageEndpoint}${fav.imageId}.jpg',
                            // height: 200,
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                        ListTile(
                            leading: CircleAvatar(child: Text(fav.countryCode)),
                            title: Text(fav.name),
                            subtitle: RichText(
                              text: TextSpan(children: [
                                const TextSpan(
                                    text: "Life Span : ",
                                    style: TextStyle(color: Colors.black)),
                                TextSpan(
                                    text: fav.lifeSpan,
                                    style: TextStyle(color: Colors.black))
                              ]),
                            )),
                      ],
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
