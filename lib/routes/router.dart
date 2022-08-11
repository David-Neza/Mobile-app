// ignore_for_file: prefer_const_constructors

import 'package:clds/routes/route_link.dart';
import 'package:clds/services/bindings/binding.dart';
import 'package:clds/services/wrapper.dart';
import 'package:clds/widgets/Artifacts/artifacts_page.dart';
import 'package:clds/widgets/Entertainment/entertainment_page.dart';
import 'package:clds/widgets/Entertainment/sakwesakwe.dart';
import 'package:clds/widgets/admin_panel/home_admin_panel.dart';
import 'package:clds/widgets/food_dashboard/food_dashboard.dart';
import 'package:clds/widgets/home_dashboard/home_dashboard.dart';
import 'package:clds/widgets/learn_kinyarwanda/food.dart';
import 'package:clds/widgets/learn_kinyarwanda/greetings.dart';
import 'package:clds/widgets/login_page/login_page.dart';
import 'package:clds/widgets/registration_page/register_page.dart';
import 'package:clds/widgets/visit_rwanda/visit_rwanda.dart';
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

    GetPage(name: RouteLinks.visitRwanda, page: () => VisitRwanda()),

    GetPage(name: RouteLinks.entertainment, page: () => EntertainmentPage()),

    GetPage(
        binding: SakweSakweBinding(),
        name: RouteLinks.sakwesakwe,
        page: () => SakweSakwe()),
    GetPage(
        binding: ArtifactsBinding(),
        name: RouteLinks.artifactsPage,
        page: () => ArtifactsPage()),

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
  ];
}
