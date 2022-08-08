import 'package:clds/controllers/gmae_controllers/game_controller.dart';
import 'package:clds/controllers/home_dashboard/home_dashboard_controller.dart';
import 'package:get/get.dart';

import '../../controllers/food_dashboard_controller/food_dashboard_controller.dart';
import '../../controllers/home_dashboard/authentication_controller.dart';

class HomeDashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeDashboardController());
  }
}

class HomeWrapperBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthenticationController());
    Get.lazyPut(() => HomeDashboardController());
  }
}

class GamesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GameController());
  }
}

class HomeFoodBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FoodDashboardController());
  }
}
