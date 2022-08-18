import 'package:clds/models/animals_model.dart';
import 'package:clds/models/artifacts_model.dart';
import 'package:clds/models/fruits_model.dart';
import 'package:clds/models/greetings_modal.dart';
import 'package:clds/models/historical_places.dart';
import 'package:clds/models/ibisakuzo_model.dart';
import 'package:clds/models/learnFoods_model.dart';
import 'package:clds/models/rwanda_kings_model.dart';
import 'package:clds/models/rwandan_ceremonies_model.dart';
import 'package:clds/models/rwandan_historical_places_model%20.dart';
import 'package:clds/widgets/learn_kinyarwanda/food.dart';
import 'package:clds/widgets/rwanda_history/historical_places.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/user.dart';

class DatabaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // create user
  Future<bool> createNewUser(
      {required UserModel user, required String name}) async {
    try {
      await _firestore.collection("users").doc(user.id).set({
        "name": name,
        "doc_id": user.id,
        "email": user.email,
        "is_Admin": false,
      });
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  // create food
  Future<bool> createNewFood(
      {required LearnFoodsModel food, required String uuid}) async {
    try {
      await _firestore
          .collection("foods")
          .doc(uuid)
          .set({"text": food.text, "image": food.image, "audio": food.audio});
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  // create food
  Future<bool> deleteFood({required String uuid}) async {
    try {
      await _firestore.collection("foods").doc(uuid).delete();

      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Stream<UserModel> getUser({required String uid}) {
    return _firestore.collection("users").doc(uid).snapshots().map(
        (event) => UserModel.fromDocumentSnapshot(documentSnapshot: event));
  }

  List<IbisakuzoModel> _ibisakuzoListFromSnaphot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return IbisakuzoModel.fromDocumentSnapshot(documentSnapshot: doc);
    }).toList();
  }

  Future<List<IbisakuzoModel>> getIbisakuzo() async {
    return await _firestore
        .collection("IbisakuzoList")
        .get()
        .then(_ibisakuzoListFromSnaphot);
  }


  List<GreetingsModel> _greetingsListFromSnaphot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return GreetingsModel.fromDocumentSnapshot(documentSnapshot: doc);
    }).toList();
  }

  Future<List<GreetingsModel>> getGreetings() async {
    return await _firestore
        .collection("greetings")
        .get()
        .then(_greetingsListFromSnaphot);
  }

  List<LearnFoodsModel> _leanFoodsListFromSnaphot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return LearnFoodsModel.fromDocumentSnapshot(documentSnapshot: doc);
    }).toList();
  }

  Future<List<LearnFoodsModel>> getLearnFoods() async {
    return await _firestore
        .collection("foods")
        .get()
        .then(_leanFoodsListFromSnaphot);
  }


  //Fruits model

   List<FruitsModel> _fruitsListFromSnaphot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return FruitsModel.fromDocumentSnapshot(documentSnapshot: doc);
    }).toList();
  }

  Future<List<FruitsModel>> getFruits() async {
    return await _firestore
        .collection("fruits")
        .get()
        .then(_fruitsListFromSnaphot);
  }

  Future<bool> createNewFruit(
      {required FruitsModel fruits, required String uuid}) async {
    try {
      await _firestore
          .collection("fruits")
          .doc(uuid)
          .set({"text": fruits.text, "image": fruits.image, "audio": fruits.audio});
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  // create food
  Future<bool> deleteFruit({required String uuid}) async {
    try {
      await _firestore.collection("fruits").doc(uuid).delete();

      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }


  //Animals model

   List<AnimalsModel> _animalsListFromSnaphot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return AnimalsModel.fromDocumentSnapshot(documentSnapshot: doc);
    }).toList();
  }

  Future<List<AnimalsModel>> getAnimals() async {
    return await _firestore
        .collection("animals")
        .get()
        .then(_animalsListFromSnaphot);
  }


  Future<bool> createNewAnimal(
      {required AnimalsModel animals, required String uuid}) async {
    try {
      await _firestore
          .collection("animals")
          .doc(uuid)
          .set({"text": animals.text, "image": animals.image, "audio": animals.audio});
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  // create food
  Future<bool> deleteAnimal({required String uuid}) async {
    try {
      await _firestore.collection("animals").doc(uuid).delete();

      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }



  //Artifacts model

   List<ArtifactsModel> _artifactsListFromSnaphot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return ArtifactsModel.fromDocumentSnapshot(documentSnapshot: doc);
    }).toList();
  }

  Future<List<ArtifactsModel>> getArtifacts() async {
    return await _firestore
        .collection("artifacts")
        .get()
        .then(_artifactsListFromSnaphot);
  }


  Future<bool> createNewArtifact(
      {required ArtifactsModel artifacts, required String uuid}) async {
    try {
      await _firestore
          .collection("artifacts")
          .doc(uuid)
          .set({"text": artifacts.text, "image": artifacts.image, "audio": artifacts.audio});
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  // Delete Artifact
  Future<bool> deleteArtifact({required String uuid}) async {
    try {
      await _firestore.collection("artifacts").doc(uuid).delete();

      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  ///////////////////////////////////////////////////
  
  //Historical Places model

   List<HistoricalPlacesModel> _histroicalPlacesListFromSnaphot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return HistoricalPlacesModel.fromDocumentSnapshot(documentSnapshot: doc);
    }).toList();
  }

  //List Historical Place
  
  Future<List<HistoricalPlacesModel>> getHistoricalPlaces() async {
    return await _firestore
        .collection("historicalPlaces")
        .get()
        .then(_histroicalPlacesListFromSnaphot);
  }

  //Create Historical Place

  Future<bool> createNewHistoricalPlace(
      {required HistoricalPlacesModel historicalPlaces, required String uuid}) async {
    try {
      await _firestore
          .collection("historicalPlaces")
          .doc(uuid)
          .set({"text": historicalPlaces.text, "image": historicalPlaces.image});
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  // Delete Historical Place
  Future<bool> deleteHistoricalPlace({required String uuid}) async {
    try {
      await _firestore.collection("historicalPlaces").doc(uuid).delete();

      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }


  //////////////////Rwanda Kings /////////////////////
  
  //Rwanda Kings model

   List<RwandaKingsModel> _rwandaKingsListFromSnaphot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return RwandaKingsModel.fromDocumentSnapshot(documentSnapshot: doc);
    }).toList();
  }

  Future<List<RwandaKingsModel>> getRwandaKings() async {
    return await _firestore
        .collection("rwandaKings")
        .get()
        .then(_rwandaKingsListFromSnaphot);
  }


  Future<bool> createNewRwandaKing(
      {required RwandaKingsModel rwandaKings, required String uuid}) async {
    try {
      await _firestore
          .collection("rwandaKings")
          .doc(uuid)
          .set({"name": rwandaKings.name, "description": rwandaKings.description, "image": rwandaKings.image});
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  // Delete Rwanda Kings
  Future<bool> deleteRwandaKing({required String uuid}) async {
    try {
      await _firestore.collection("rwandaKings").doc(uuid).delete();

      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  //////////////////Rwandan Ceremonies /////////////////////
  
  //Rwandan Ceremonies model

   List<RwandanCeremoniesModel> _rwandanCeremoniesListFromSnaphot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return RwandanCeremoniesModel.fromDocumentSnapshot(documentSnapshot: doc);
    }).toList();
  }

  Future<List<RwandanCeremoniesModel>> getRwandanCeremonies() async {
    return await _firestore
        .collection("rwandanCeremonies")
        .get()
        .then(_rwandanCeremoniesListFromSnaphot);
  }


  Future<bool> createNewRwandanCeremony(
      {required RwandanCeremoniesModel rwandanCeremonies, required String uuid}) async {
    try {
      await _firestore
          .collection("rwandanCeremonies")
          .doc(uuid)
          .set({"name": rwandanCeremonies.name, "description": rwandanCeremonies.description, "image": rwandanCeremonies.image});
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  // Delete Rwanda Kings
  Future<bool> deleteRwandanCeremony({required String uuid}) async {
    try {
      await _firestore.collection("rwandanCeremonies").doc(uuid).delete();

      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }


  //////////////////Rwandan Ceremonies /////////////////////
  
  //Rwandan Ceremonies model

   List<RwandanHistoricalPlacesModel> _rwandanHistoricalPlacesListFromSnaphot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return RwandanHistoricalPlacesModel.fromDocumentSnapshot(documentSnapshot: doc);
    }).toList();
  }

  Future<List<RwandanHistoricalPlacesModel>> getRwandanHistoricalPlaces() async {
    return await _firestore
        .collection("rwandanHistoricalPlaces")
        .get()
        .then(_rwandanHistoricalPlacesListFromSnaphot);
  }


  Future<bool> createNewRwandanHistoricalPlace(
      {required RwandanHistoricalPlacesModel  rwandanHistoricalPlaces, required String uuid}) async {
    try {
      await _firestore
          .collection("rwandanHistoricalPlaces")
          .doc(uuid)
          .set({"name": rwandanHistoricalPlaces.name, "description":  rwandanHistoricalPlaces.description, "image": rwandanHistoricalPlaces.image});
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  // Delete Rwandan Historical Places
  Future<bool> deleteRwandanHistoricalPlace({required String uuid}) async {
    try {
      await _firestore.collection("rwandanHistoricalPlaces").doc(uuid).delete();

      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
