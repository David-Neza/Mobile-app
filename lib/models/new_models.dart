class CategoriesModel {
  String? image;
  String? route;
  String? text1;
  String? text2;

  CategoriesModel({this.image, this.route, this.text1, this.text2});

  CategoriesModel.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    route = json['route'];
    text1 = json['text_1'];
    text2 = json['text_2'];
  }
}
