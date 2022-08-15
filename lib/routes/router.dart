// ignore_for_file: prefer_const_constructors

import 'package:clds/routes/route_link.dart';
import 'package:clds/services/bindings/binding.dart';
import 'package:clds/services/wrapper.dart';
import 'package:clds/widgets/Entertainment/entertainment_page.dart';
import 'package:clds/widgets/Entertainment/sakwesakwe.dart';
import 'package:clds/widgets/admin_panel/Rwanda_history_dashboard_editing/Rwanda_history_dashboard.dart';
import 'package:clds/widgets/admin_panel/Rwanda_history_dashboard_editing/rwanda_kings_panel/home_Add_rwanda_king_panel.dart';
import 'package:clds/widgets/admin_panel/Rwanda_history_dashboard_editing/rwanda_kings_panel/home_rwanda_king_panel.dart';
import 'package:clds/widgets/admin_panel/animal_panel%20/home_Add_animal_panel.dart';
import 'package:clds/widgets/admin_panel/animal_panel%20/home_animal_panel.dart';
import 'package:clds/widgets/admin_panel/artifact_panel/home_Add_artifact_panel.dart';
import 'package:clds/widgets/admin_panel/artifact_panel/home_artifact_panel.dart';
import 'package:clds/widgets/admin_panel/fruit_panel/home_Add_fruit_panel.dart';
import 'package:clds/widgets/admin_panel/fruit_panel/home_fruit_panel.dart';
import 'package:clds/widgets/admin_panel/historical_place_panel%20/home_add_historical_places_panel.dart';
import 'package:clds/widgets/admin_panel/historical_place_panel%20/home_historical_places_panel.dart';
import 'package:clds/widgets/admin_panel/home_admin_panel.dart';
import 'package:clds/widgets/food_dashboard/food_dashboard.dart';
import 'package:clds/widgets/home_dashboard/home_dashboard.dart';
import 'package:clds/widgets/learn_kinyarwanda/animals.dart';
import 'package:clds/widgets/learn_kinyarwanda/artifacts.dart';
import 'package:clds/widgets/learn_kinyarwanda/food.dart';
import 'package:clds/widgets/learn_kinyarwanda/fruits.dart';
import 'package:clds/widgets/learn_kinyarwanda/greetings.dart';
import 'package:clds/widgets/login_page/login_page.dart';
import 'package:clds/widgets/registration_page/register_page.dart';
import 'package:clds/widgets/rwanda_history/historical_artifacts.dart';
import 'package:clds/widgets/rwanda_history/historical_places.dart';
import 'package:clds/widgets/rwanda_history/rwanda_history.dart';
import 'package:clds/widgets/rwanda_history/rwanda_kings.dart';
import 'package:get/get.dart';

import '../widgets/admin_panel/food_panel/home_add_food_panel.dart';
import '../widgets/admin_panel/food_panel/home_food_panel.dart';
import '../widgets/learn_kinyarwanda/home_learn_kinyarwanda.dart';
import '../widgets/learn_kinyarwanda/home_vocabulary.dart';

class AppRouter {
  static final pages = [
    // GetPage(name: RouteLinks.homeOnBoarding, page: () => HomeOnBoarding()),
    GetPage(
        binding: HomeWrapperBinding(),
        name: RouteLinks.wrapper,
        page: () => Wrapper()),
    GetPage(
        binding: HomeDashboardBinding(),
        name: RouteLinks.homeDashboard,
        page: () => HomeDashboard()),
    GetPage(name: RouteLinks.loginPage, page: () => LoginPage()),
    GetPage(name: RouteLinks.loginPage, page: () => LoginPage()),

    GetPage(name: RouteLinks.registerPage, page: () => RegisterPage()),

    GetPage(
        name: RouteLinks.learnKinyarwandaPage,
        page: () => HomeLearnKinyarwanda()),
    GetPage(
        binding: GamesBinding(),
        name: RouteLinks.learnKinyarwandaPage_1,
        page: () => HomeVocabulary()),

    GetPage(
        binding: HomeFoodBinding(),
        name: RouteLinks.foodDashboard,
        page: () => FoodDashboard()),

    GetPage(name: RouteLinks.entertainment, page: () => EntertainmentPage()),

    GetPage(
        binding: SakweSakweBinding(),
        name: RouteLinks.sakwesakwe,
        page: () => SakweSakwe()),


    GetPage(
        binding: GreetingsBinding(),
        name: RouteLinks.greetings,
        page: () => Greetings()),

    GetPage(
        binding: LearnFoodsBinding(),
        name: RouteLinks.learnFoods,
        page: () => LearnFoods()),
    GetPage(
        binding: AdminPanelBinding(),
        name: RouteLinks.adminPanel,
        page: () => HomeAdminPanel()),
    GetPage(name: RouteLinks.homeFoodPanel, page: () => HomeFoodPanel()),
    GetPage(name: RouteLinks.homeAddFoodPanel, page: () => HomeAddFoodPanel()),

    GetPage(name: RouteLinks.homeFruitsPanel, page: () => HomeFruitPanel()),
    GetPage(name: RouteLinks.homeAddFruitsPanel, page: () => HomeAddFruitPanel()),
    
    //Fruits routes
    GetPage(
        binding: FruitsBinding(),
        name: RouteLinks.learnFruits,
        page: () => LearnFruits()),

    //Fruits routes
    GetPage(
        binding: AnimalsBinding(),
        name: RouteLinks.learnAnimals,
        page: () => LearnAnimals()),
    GetPage(name: RouteLinks.homeAnimalsPanel, page: () => HomeAnimalPanel()),
    GetPage(name: RouteLinks.homeAddAnimalsPanel, page: () => HomeAddAnimalPanel()),
    
   GetPage(
        binding: ArtifactsBinding(),
        name: RouteLinks.learnArtifacts,
        page: () => LearnArtifacts()),
    GetPage(name: RouteLinks.homeArtifactsPanel, page: () => HomeArtifactPanel()),
    GetPage(name: RouteLinks.homeAddArtifactsPanel, page: () => HomeAddArtifactPanel()),
    
    GetPage(
      binding: HistoricalPlacesBinding(),
      name: RouteLinks.rwandaHistory, 
      page: () => RwandaHistory()),
    GetPage(name: RouteLinks.homeHistoricalPlacePanel, page: () => HomeHistoricalPlacePanel()),
    GetPage(name: RouteLinks.homeAddHistoricalPlacePanel, page: () => HomeAddHistoricalPlacePanel()),
    
    GetPage(
      binding: HistoricalPlacesBinding(),
      name: RouteLinks.historicalPlaces, 
      page: () => HistoricalPlaces()),


    GetPage(
        binding: ArtifactsBinding(),
        name: RouteLinks.historicalArtifacts,
        page: () => HistoricalArtifacts()),  

    //Rwanda Kings
    GetPage(
        binding: RwandaKingsBinding(),
        name: RouteLinks.rwandaKings,
        page: () => RwandaKings()),
    GetPage(name: RouteLinks.homeRwandaKingPanel, page: () => HomeRwandaKingPanel()),
     GetPage(name: RouteLinks.homeAddRwandanKingsPanel, page: () => HomeAddRwandaKingsPanel()),


    GetPage(name: RouteLinks.homeArtifactsPanel, page: () => HomeArtifactPanel()),
    GetPage(name: RouteLinks.homeAddArtifactsPanel, page: () => HomeAddArtifactPanel()),

  //Rwanda history dashboard
  GetPage(name: RouteLinks.rwandaHistoryDashboard, page: () => RwandaHistoryDashboard()),
     

  ];
}
