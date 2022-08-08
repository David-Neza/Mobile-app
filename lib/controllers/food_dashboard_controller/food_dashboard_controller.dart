import 'package:get/get.dart';

import '../../models/new_models.dart';
import '../../utils/food_lists.dart';

class FoodDashboardController extends GetxController {
  RxList<CategoriesModel> categories = <CategoriesModel>[].obs;

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
