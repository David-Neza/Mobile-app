import 'package:clds/models/admin_dashboard_panel.dart';
import 'package:clds/utils/admin_panel_dashboard_list.dart';
import 'package:get/get.dart';

class AdminDashboardPanelListController extends GetxController {
  RxList<AdminDashboardPanelModel> categories = <AdminDashboardPanelModel>[].obs;
  RxBool isLoading = false.obs;

  void getCAtegories() async {
    isLoading.value = true;
  
      List<AdminDashboardPanelModel> categoriesResponse =adminDashboardList
          .map((item) => AdminDashboardPanelModel.fromJson(item))
          .toList();
      categories.value = categoriesResponse;
    isLoading.value = false;
  }

  @override
  void onInit() {
    getCAtegories();
    super.onInit();
  }
}
