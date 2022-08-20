// ignore_for_file: prefer_const_constructors

import 'package:clds/constants/colors.dart';
import 'package:clds/constants/sizeConfig.dart';
import 'package:clds/constants/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
// import 'package:youtube_player_flutter/youtube_player_flutter.dart';


class HomeTarihinda extends StatefulWidget {
  const HomeTarihinda({Key? key}) : super(key: key);

  @override
  State<HomeTarihinda> createState() => _HomeTarihindaState();
}

class _HomeTarihindaState extends State<HomeTarihinda> {
  VideoPlayerController? _controller;
  bool _isLoading = false;
  String youtubeUrl =
      "https://firebasestorage.googleapis.com/v0/b/mobile-64269.appspot.com/o/yt5s.com-C%C3%A9cile%20Kayirebwa-%20Tarihinda-(480p).mp4?alt=media&token=45ec67b3-3637-4c9c-90a1-b5e4a1f77f56";
  // late YoutubePlayerController ytbController;
  @override
  void initState() {
    _isLoading = true;
    _controller = VideoPlayerController.network(youtubeUrl)
      ..initialize().then((_) {
        setState(() {
          _isLoading = true;
        });
      });
    super.initState();
  }

  // @override
  // void deactivate() {
  //   ytbController.pause();
  //   super.deactivate();
  // }

  // @override
  // void dispose() {
  //   ytbController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier * 4),
      child: SafeArea(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                child: const Center(child: Icon(Icons.arrow_back_ios)),
              ),
            ),
            SizedBox(
              width: SizeConfig.widthMultiplier * 12,
            ),
            Text("Cecile Kayirebwa -Tarihinda", style: TextAppStyles.titleBoldText),
          ],
        ),
        SizedBox(
          height: SizeConfig.heightMultiplier * 4,
        ),
        _isLoading
            ? Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.widthMultiplier * 4),
                child: Container(
                  height: 300,
                  width: double.infinity,
                  child: VideoPlayer(_controller!),
                ),
              )
            : Center(
                child: CircularProgressIndicator(),
              ),
        SizedBox(
          height: SizeConfig.heightMultiplier * 2,
        ),
        Center(
          child: Container(
            width: size.width * 0.9,
            height: size.height * 0.07,
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: ElevatedButton(
              style: ButtonStyle(
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.black)),
              child:
                  _controller!.value.isPlaying ? Text('Pause') : Text('Play'),
              onPressed: () {
                setState(() {
                  _controller!.value.isPlaying
                      ? _controller!.pause()
                      : _controller!.play();
                });
              },
            ),
          ),
        )
      ])),
    ));
  }
}
