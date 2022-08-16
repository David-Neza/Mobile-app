import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class HomeIsombeController extends GetxController {
  String youtubeUrl = "https://www.youtube.com/watch?v=CutwYjTVmWI&t=2s";
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
