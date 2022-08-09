import 'package:clds/controllers/gmae_controllers/game_controller.dart';
import 'package:clds/controllers/home_dashboard/authentication_Controller.dart';
import 'package:clds/controllers/home_dashboard/home_dashboard_controller.dart';
import 'package:get/get.dart';


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