import 'package:clds/controllers/admin_panel_dashboard_list.dart';
import 'package:clds/controllers/animals_controller%20/animals_controller.dart';
import 'package:clds/controllers/artifacts_controller/artifacts_controller.dart';
import 'package:clds/controllers/fruits_controller/fruits_controller.dart';
import 'package:clds/controllers/gmae_controllers/game_controller.dart';
import 'package:clds/controllers/greetings_controller/greetings_controller.dart';
import 'package:clds/controllers/home_dashboard/authentication_Controller.dart';
import 'package:clds/controllers/home_dashboard/home_dashboard_controller.dart';
import 'package:clds/controllers/learnFoods_controller/learnFoods_controller.dart';
import 'package:clds/controllers/rwanda_historical_places_controller%20/rwanda_historical_places_controller.dart';
import 'package:clds/controllers/rwanda_kings_controller%20/rwanda_kings_controller.dart';
import 'package:clds/controllers/rwandan_ceremonies_controller%20%20/rwandan_ceremonies_controller.dart';
import 'package:clds/controllers/sakwe_controllers/sakwe_controller.dart';
import 'package:get/get.dart';

import '../../controllers/admin_panel_cotnrollers/admin_panel_controller.dart';
import '../../controllers/food_dashboard_controller/food_dashboard_controller.dart';

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

class SakweSakweBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SakweController());
  }
}

class GreetingsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GreetingsController());
  }
}

class LearnFoodsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LearnFoodsController());
  }
}

class FruitsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FruitsController());
  }
}

class AnimalsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AnimalsController());
  }
}

class ArtifactsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ArtifactsController());
  }
}

class RwandanHistoricalPlacesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RwandanHistoricalPlacesController());
  }
}

class RwandaKingsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RwandaKingsController());
  }
}

class RwandanCeremoniesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RwandanCeremoniesController());
  }
}
 class HomeAdminPanelBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => AdminDashboardPanelListController());
  }
 }

class AdminPanelBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AdminPanelController());
  }
}


