import 'package:clds/controllers/home_dashboard/authentication_Controller.dart';
import 'package:get/get.dart';

import '../../models/new_models.dart';
import '../../services/database.dart';
import '../../utils/lists_consts.dart';

class HomeDashboardController extends GetxController {
  final _authController = Get.find<AuthenticationController>();
  final _dbService = DatabaseService();
  RxList<CategoriesModel> categories = <CategoriesModel>[].obs;
  RxBool isLoading = false.obs;

  void getCAtegories() async {
    isLoading.value = true;
    var user =
        await _dbService.getUser(uid: _authController.userr.value.uid).first;

    if (user.isAdmin!) {
      List<CategoriesModel> categoriesResponse = dashboardCategoriesList
          .map((item) => CategoriesModel.fromJson(item))
          .toList();
      categories.value = categoriesResponse;
    } else {
      List<CategoriesModel> categoriesResponse = userDashboardCategoriesList
          .map((item) => CategoriesModel.fromJson(item))
          .toList();
      categories.value = categoriesResponse;
    }
    isLoading.value = false;
  }

  @override
  void onInit() {
    getCAtegories();
    super.onInit();
  }
}
