import 'package:get/get.dart';

import '../../models/new_models.dart';
import '../../utils/lists_consts.dart';

class HomeDashboardController extends GetxController {
  RxList<CategoriesModel> categories = <CategoriesModel>[].obs;

  void getCAtegories() async {
    // check user position and display categories according to their positions
    List<CategoriesModel> categoriesResponse = dashboardCategoriesList
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
