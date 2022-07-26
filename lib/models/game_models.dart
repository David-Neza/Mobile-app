class GameModel {
  String? image;
  String? text;
  String? textSub;
  int? id;

  GameModel({this.image, this.id, this.text});

  GameModel.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    text = json['text'];
    textSub = json['text_sub'];
    id = json['id'];
   
  }
}
