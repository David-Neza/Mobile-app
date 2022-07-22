import 'package:clds/routes/route_link.dart';
import 'package:clds/routes/router.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'constants/sizeConfig.dart';
import 'constants/theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return OrientationBuilder (builder: (builder, orientation) {
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