import 'package:inventorycheck/notify/audionotifier.dart';
import 'package:inventorycheck/notify/textnotifier.dart';
import 'package:inventorycheck/ui/apphome.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'notify/imagesnotifier.dart';

//void main() {
//  runApp(ChangeNotifierProvider(
//    builder:(context) => ExteriorNotifier(),
//    child: MyApp(),
//  ));
//}

void main() => runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => ExteriorNotifier()),
          ChangeNotifierProvider(create: (context) => HallwayNotifier()),
          ChangeNotifierProvider(create: (context) => SmoteNotifier()),
          ChangeNotifierProvider(create: (context) => KitchenNotifier()),
          ChangeNotifierProvider(create: (context) => BedroomNotifier()),
          ChangeNotifierProvider(create: (context) => ChaabiNotifier()),
          ChangeNotifierProvider(create: (context) => MeterreadingNotifier()),


          ChangeNotifierProvider(create: (context) => AudioRecNotifier()),
          ChangeNotifierProvider(create: (context) => AudioHallwayNotifier()),
          ChangeNotifierProvider(create: (context) => AudioSmoteNotifier()),
          ChangeNotifierProvider(create: (context) => AudioKitchenNotifier()),
          ChangeNotifierProvider(create: (context) => AudioBedroomNotifier()),
          ChangeNotifierProvider(create: (context) => AudioKeysNotifier()),
          ChangeNotifierProvider(create: (context) => AudioMeterNotifier()),


          ChangeNotifierProvider(create: (context) => ExteriorImgNotifier()),
          ChangeNotifierProvider(create: (context) => HallwayImgNotify()),
          ChangeNotifierProvider(create: (context) => SmoteImgNotify()),
          ChangeNotifierProvider(create: (context) => KitchenImgNotify()),
          ChangeNotifierProvider(create: (context) => BedroomImgNotify()),
          ChangeNotifierProvider(create: (context) => ChaabiImgNotify()),
          ChangeNotifierProvider(create: (context) => MeterImgNotify()),
    //Tan Img
          ChangeNotifierProvider(create: (context) => ExteriorImgTanNotifier()),
          ChangeNotifierProvider(create: (context) => HallwayImgTanNotify()),
          ChangeNotifierProvider(create: (context) => SmoteImgTanNotify()),
          ChangeNotifierProvider(create: (context) => KitchenImgTanNotify()),
          ChangeNotifierProvider(create: (context) => BedroomImgTanNotify()),
          ChangeNotifierProvider(create: (context) => ChaabiImgTanNotify()),
          ChangeNotifierProvider(create: (context) => MeterImgTanNotify()),

          //Tan Data
          ChangeNotifierProvider(create: (context) => ExteriorTanNotifier()),
          ChangeNotifierProvider(create: (context) => HallwayTanNotifier()),
          ChangeNotifierProvider(create: (context) => SmoteTanNotifier()),
          ChangeNotifierProvider(create: (context) => KitchenTanNotifier()),
          ChangeNotifierProvider(create: (context) => BedroomTanNotifier()),
          ChangeNotifierProvider(create: (context) => ChaabiTanNotifier()),
          ChangeNotifierProvider(create: (context) => MeterreadingTanNotifier()),




        ],
        child: MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AppHome(),
//      initialRoute:'/',
//      onGenerateRoute: Router.generateRoute,
    );
  }
}
