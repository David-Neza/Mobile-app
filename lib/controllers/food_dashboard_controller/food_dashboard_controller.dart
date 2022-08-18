import 'package:clds/models/user.dart';
import 'package:clds/routes/route_link.dart';
import 'package:clds/services/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../constants/images.dart';
import '../../models/new_models.dart';

class FoodDashboardController extends GetxController {
  RxBool isLoading = false.obs;
  RxList<CategoriesModel> categories = <CategoriesModel>[].obs;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final _databaseService = DatabaseService();

  List<UserModel> _usersListFromSnaphot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return UserModel.fromDocumentSnapshot(documentSnapshot: doc);
    }).toList();
  }

  Future<List<UserModel>> getUsers() async {
    return await _firestore
        .collection("Users")
        .get()
        .then(_usersListFromSnaphot);
  }

  getSampleUsers() async {
    var response = await getUsers();
    print("response :: ${response.length} :: ${response[0].name}");
  }

  // void getUsers() async {
  //   var response = await _firestore.collection("Users").get();
  //   print("herse is the response --- ${response.docs.length}");
  // }

  static const List foodCategoriesList = [
    {
      "image": Images.isombe,
      "text_1": "Isombe",
      "text_2": "Learn",
      "route": RouteLinks.homeIsombe
    },
    {
      "image": Images.imvange,
      "text_1": "Imvange",
      "text_2": "pots,baskets ..",
      "route": RouteLinks.homeImvange
    },
  ];

  getIbisakuzo() async {
    var response = await _databaseService.getIbisakuzo();
    print("ibisakuzo byacu ${response.length}");
  }

  getCAtegories() async {
    // check user position and display categories according to their positions
    List<CategoriesModel> categoriesResponse = foodCategoriesList
        .map((item) => CategoriesModel.fromJson(item))
        .toList();
    categories.value = categoriesResponse;
  }

  void getData() async {
    isLoading.value = true;
    await getCAtegories();
    // await getSampleUsers();
    await getIbisakuzo();
    isLoading.value = false;
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
