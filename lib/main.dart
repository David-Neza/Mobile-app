import 'package:clds/routes/route_link.dart';
import 'package:clds/routes/router.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';

import 'constants/sizeConfig.dart';
import 'constants/theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late AudioPlayer player;
  final Future<FirebaseApp> _fbApp = Firebase.initializeApp();

  @override
  void initState(){
    super.initState();
    player = AudioPlayer();
  }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return OrientationBuilder(builder: (builder, orientation) {
        SizeConfig().init(constraints, orientation);
        return GetMaterialApp(
          initialRoute: RouteLinks.wrapper,
          getPages: AppRouter.pages,
          // initialBinding: AuthBinding(),
          title: 'CLDS',
          debugShowCheckedModeBanner: false,
          theme: theme(),
        );
      });
    });
  }
}
