class AdminDashboardPanelModel {
  String? image;
  String? route;
  String? text1;

  AdminDashboardPanelModel({this.image, this.route, this.text1});

   AdminDashboardPanelModel.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    route = json['route'];
    text1 = json['text_1'];
  }
}
