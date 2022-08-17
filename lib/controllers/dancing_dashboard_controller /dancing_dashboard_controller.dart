import 'package:clds/models/user.dart';
import 'package:clds/routes/route_link.dart';
import 'package:clds/services/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../constants/images.dart';
import '../../models/new_models.dart';

class DancingDashboardController extends GetxController {
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

  static const List dancingCategoriesList = [
    {
      "image": Images.danceImage,
      "text_1": "Lesson1",
      "text_2": "Men's dance",
      "route": RouteLinks.homeLesson1
    },
    {
      "image": Images.danceImage,
      "text_1": "Lesson",
      "text_2": "Women's dance",
      "route": RouteLinks.homeLesson1
    },
  ];

  getCAtegories() async {
    // check user position and display categories according to their positions
    List<CategoriesModel> categoriesResponse = dancingCategoriesList
        .map((item) => CategoriesModel.fromJson(item))
        .toList();
    categories.value = categoriesResponse;
  }

  void getData() async {
    isLoading.value = true;
    await getCAtegories();
    isLoading.value = false;
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
