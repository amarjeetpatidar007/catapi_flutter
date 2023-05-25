import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_assesment/api_endpoints.dart';
import 'package:flutter_assesment/controller/main_controller.dart';
import 'package:flutter_assesment/models/cat_db_model.dart';
import 'package:flutter_assesment/models/cat_model.dart';
import 'package:flutter_assesment/utils.dart';
import 'package:get/get.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key, required this.catModel});
  final CatsModel catModel;

  @override
  Widget build(BuildContext context) {
    final MainController _controller = Get.put(MainController());

    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Hero(
              tag: catModel.id,
              child: CachedNetworkImage(
                placeholder: (context, url) =>
                    const CircularProgressIndicator(),
                errorWidget: (context, url, error) => const Icon(Icons.error),
                imageUrl:
                    '${APIEndpoints.imageEndpoint}${catModel.referenceImageId}.jpg',
                // height: 200,
                height: getHeight(context) * 0.4,
                fit: BoxFit.fitWidth,

                imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          ),
          ListTile(
              leading: CircleAvatar(child: Text(catModel.countryCode)),
              title: Text(catModel.name),
              trailing: IconButton(
                  onPressed: () {
                    _controller.addToDB(CatHiveDBModel(
                        catId: catModel.id,
                        name: catModel.name,
                        imageId: catModel.referenceImageId.toString(),
                        lifeSpan: catModel.lifeSpan,
                        countryCode: catModel.countryCode));
                    Get.showSnackbar(
                      const GetSnackBar(
                        title: "Added to Fav",
                        message: 'Saved to Local DB Successfully',
                        icon: Icon(Icons.save_alt_rounded),
                        duration: Duration(seconds: 3),
                      ),
                    );
                  },
                  icon: const Icon(Icons.add)),
              subtitle: RichText(
                text: TextSpan(children: [
                  const TextSpan(
                      text: "Life Span : ",
                      style: TextStyle(color: Colors.black)),
                  TextSpan(
                      text: catModel.lifeSpan,
                      style: const TextStyle(color: Colors.black))
                ]),
              )),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                RichText(
                  text: TextSpan(children: [
                    TextSpan(
                        text: catModel.description,
                        style: const TextStyle(color: Colors.black))
                  ]),
                ),
                // RichText(
                //   text: TextSpan(children: [
                //     TextSpan(
                //         text: catModel.healthIssues.toString(),
                //         style: const TextStyle(color: Colors.black))
                //   ]),
                // ),
                // catModel.intelligence
              ],
            ),
          )
        ]),
      ),
    );
  }
}
