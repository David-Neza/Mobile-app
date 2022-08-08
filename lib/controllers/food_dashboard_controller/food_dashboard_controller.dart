import 'package:get/get.dart';

import '../../constants/images.dart';
import '../../models/new_models.dart';

class FoodDashboardController extends GetxController {
  RxList<CategoriesModel> categories = <CategoriesModel>[].obs;

  static const List foodCategoriesList = [
    {
      "image": Images.inkinyImage,
      "text_1": "Isombe",
      "text_2": "Learn",
      "route": ""
    },
    {
      "image": Images.inkonoImage,
      "text_1": "Imvange",
      "text_2": "pots,baskets ..",
      "route": ""
    },
    {
      "image": Images.danceImage,
      "text_1": "Dancing",
      "text_2": "Guhamiriza",
      "route": ""
    },
    {
      "image": Images.ibihazaImage,
      "text_1": "Rwandan Foods",
      "text_2": "Recipes",
      "route": ""
    },
  ];

  void getCAtegories() async {
    // check user position and display categories according to their positions
    List<CategoriesModel> categoriesResponse = foodCategoriesList
        .map((item) => CategoriesModel.fromJson(item))
        .toList();
    categories.value = categoriesResponse;
  }

  @override
  void onInit() {
    getCAtegories();
    super.onInit();
  }
}
