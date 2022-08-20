import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class HomeLesson2Controller extends GetxController {
  String youtubeUrl = "https://firebasestorage.googleapis.com/v0/b/mobile-64269.appspot.com/o/yt5s.com-Rwandan%20DANCE%20TUTORIAL%20for%20beginners..mp4?alt=media&token=4c4a89b4-4278-4705-8c20-12cfe78b0775";
  late YoutubePlayerController ytbController;

  // @override
  // void deactivate() {
  //   ytbController.dispose();
  //   super.deactivate();
  // }

  @override
  void dispose() {
    ytbController.dispose();
    super.dispose();
  }

  @override
  void onInit() {
    ytbController = YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId(youtubeUrl)!);
    super.onInit();
  }
}
