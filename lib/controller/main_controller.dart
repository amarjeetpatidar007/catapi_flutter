import 'package:flutter_assesment/models/cat_db_model.dart';
import 'package:flutter_assesment/models/cat_model.dart';
import 'package:flutter_assesment/views/fav_model.dart';
import 'package:flutter_assesment/views/home_page.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;

class MainController extends GetxController {
  RxList<CatsModel> catBreeds = <CatsModel>[].obs;
  late final Box box;
  RxList<CatHiveDBModel> boxList = <CatHiveDBModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchCatBreeds();

    box = Hive.box('catdb');
    getAllFromDB();
  }

  @override
  void dispose() {
    // Closes all Hive boxes
    Hive.close();
    super.dispose();
  }

  addToDB(CatHiveDBModel catHiveDBModel) async {
    print(catHiveDBModel.toString());
    int isSaved = await box.add(catHiveDBModel);
  ;
    
    print("isSaved : $isSaved");
  }

  List<CatHiveDBModel> getAllFromDB() {
    int length = box.length;

    for (int i = 0; i < length; i++) {
      boxList.addIf(!boxList.contains(box.getAt(i)), box.getAt(i));
    }
    print(boxList);
    return boxList;
  }

  Future<void> fetchCatBreeds() async {
    final response =
        await http.get(Uri.parse('https://api.thecatapi.com/v1/breeds'));

    if (response.statusCode == 200) {
      List<CatsModel> list = catsModelFromJson(response.body);
      catBreeds.assignAll(list);
    } else {
      print('Failed to fetch cat breeds.');
    }
  }
}
