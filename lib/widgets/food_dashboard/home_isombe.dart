import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../constants/colors.dart';
import '../../constants/sizeConfig.dart';
import '../../constants/text_styles.dart';

class HomeIsombe extends StatefulWidget {
  const HomeIsombe({Key? key}) : super(key: key);

  @override
  State<HomeIsombe> createState() => _HomeIsombeState();
}

class _HomeIsombeState extends State<HomeIsombe> {
  String youtubeUrl = "https://www.youtube.com/watch?v=CutwYjTVmWI&t=2s";
  late YoutubePlayerController ytbController;
  @override
  void initState() {
    super.initState();
    ytbController = YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId(youtubeUrl)!,
        flags: const YoutubePlayerFlags(autoPlay: false));
  }

  @override
  void deactivate() {
    ytbController.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    ytbController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
        player: YoutubePlayer(controller: ytbController),
        builder: (context, player) {
          return Scaffold(
              body: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.widthMultiplier * 4),
            child: SafeArea(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  SizedBox(
                    height: SizeConfig.heightMultiplier * 4,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () => Get.back(),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: SizeConfig.widthMultiplier * 2.5),
                          height: SizeConfig.heightMultiplier * 6,
                          width: SizeConfig.widthMultiplier * 16,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: greyLight,
                          ),
                          child:
                              const Center(child: Icon(Icons.arrow_back_ios)),
                        ),
                      ),
                      SizedBox(
                        width: SizeConfig.widthMultiplier * 12,
                      ),
                      Text("How to cook isombe",
                          style: TextAppStyles.titleBoldText),
                    ],
                  ),
                  SizedBox(
                    height: SizeConfig.heightMultiplier * 4,
                  ),
                  player,
                ])),
          ));
        });
  }
}
