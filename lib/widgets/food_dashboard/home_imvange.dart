// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
// import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../constants/colors.dart';
import '../../constants/sizeConfig.dart';
import '../../constants/text_styles.dart';

class HomeImvange extends StatefulWidget {
  const HomeImvange({Key? key}) : super(key: key);

  @override
  State<HomeImvange> createState() => _HomeImvangeState();
}

class _HomeImvangeState extends State<HomeImvange> {
  VideoPlayerController? _controller;
  bool _isLoading = false;
  String youtubeUrl =
      "https://firebasestorage.googleapis.com/v0/b/mobile-64269.appspot.com/o/yt5s.com-How%20to%20cook%20African's%20patatoes%20_%20uko%20wateka%20imvange%20iryoshye.mp4?alt=media&token=b1af99e7-fe22-4245-8415-a07acf75b8bb";
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
            Text("How to cook isombe", style: TextAppStyles.titleBoldText),
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
