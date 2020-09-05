import 'package:inventorycheck/NotifierList/KeysText.dart';
import 'package:inventorycheck/notify/audionotifier.dart';
import 'package:inventorycheck/notify/textnotifier.dart';
import 'package:inventorycheck/ui/apphome.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'NotifierList/BdfourPhoto.dart';
import 'NotifierList/BdfourText.dart';
import 'NotifierList/BedroomPhoto.dart';
import 'NotifierList/BedroomText.dart';
import 'NotifierList/ExteriorPhoto.dart';
import 'NotifierList/ExteriorText.dart';
import 'NotifierList/HallwayPhoto.dart';
import 'NotifierList/HallwayText.dart';
import 'NotifierList/KitchenPhoto.dart';
import 'NotifierList/KitchenText.dart';
import 'NotifierList/MeterText.dart';
import 'NotifierList/SmotePhoto.dart';
import 'NotifierList/SmoteText.dart';
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
          ChangeNotifierProvider(create: (context) => ExtFrameNotifier()),
          ChangeNotifierProvider(create: (context) => ExtExdoorNotifier()),
          ChangeNotifierProvider(create: (context) => ExtIndoorNotifier()),
          ChangeNotifierProvider(create: (context) => ExtCeilingNotifier()),
          ChangeNotifierProvider(create: (context) => ExtLightNotifier()),
          ChangeNotifierProvider(create: (context) => ExtWallsNotifier()),
          ChangeNotifierProvider(create: (context) => ExtWindowsNotifier()),
          ChangeNotifierProvider(create: (context) => HalFrameNotifier()),
          ChangeNotifierProvider(create: (context) => HalExdoorNotifier()),
          ChangeNotifierProvider(create: (context) => HalIndoorNotifier()),
          ChangeNotifierProvider(create: (context) => HalCeilingNotifier()),
          ChangeNotifierProvider(create: (context) => HalLightNotifier()),
          ChangeNotifierProvider(create: (context) => HalWallsNotifier()),
          ChangeNotifierProvider(create: (context) => HalWindowsNotifier()),
          ChangeNotifierProvider(create: (context) => SmoFrameNotifier()),
          ChangeNotifierProvider(create: (context) => SmoExdoorNotifier()),
          ChangeNotifierProvider(create: (context) => SmoIndoorNotifier()),
          ChangeNotifierProvider(create: (context) => SmoCeilingNotifier()),
          ChangeNotifierProvider(create: (context) => SmoLightNotifier()),
          ChangeNotifierProvider(create: (context) => SmoWallsNotifier()),
          ChangeNotifierProvider(create: (context) => SmoWindowsNotifier()),
          ChangeNotifierProvider(create: (context) => KitFrameNotifier()),
          ChangeNotifierProvider(create: (context) => KitExdoorNotifier()),
          ChangeNotifierProvider(create: (context) => KitIndoorNotifier()),
          ChangeNotifierProvider(create: (context) => KitCeilingNotifier()),
          ChangeNotifierProvider(create: (context) => KitLightNotifier()),
          ChangeNotifierProvider(create: (context) => KitWallsNotifier()),
          ChangeNotifierProvider(create: (context) => KitWindowsNotifier()),
          ChangeNotifierProvider(create: (context) => BedFrameNotifier()),
          ChangeNotifierProvider(create: (context) => BedExdoorNotifier()),
          ChangeNotifierProvider(create: (context) => BedIndoorNotifier()),
          ChangeNotifierProvider(create: (context) => BedCeilingNotifier()),
          ChangeNotifierProvider(create: (context) => BedLightNotifier()),
          ChangeNotifierProvider(create: (context) => BedWallsNotifier()),
          ChangeNotifierProvider(create: (context) => BedWindowsNotifier()),

          ChangeNotifierProvider(create: (context) => BedFramePhNotifier()),
          ChangeNotifierProvider(create: (context) => BedExdoorPhNotifier()),
          ChangeNotifierProvider(create: (context) => BedIndoorPhNotifier()),
          ChangeNotifierProvider(create: (context) => BedCeilingPhNotifier()),
          ChangeNotifierProvider(create: (context) => BedLightPhNotifier()),
          ChangeNotifierProvider(create: (context) => BedWallsPhNotifier()),
          ChangeNotifierProvider(create: (context) => BedWindowsPhNotifier()),
          ChangeNotifierProvider(create: (context) => ExtFramePhNotifier()),
          ChangeNotifierProvider(create: (context) => ExtExdoorPhNotifier()),
          ChangeNotifierProvider(create: (context) => ExtIndoorPhNotifier()),
          ChangeNotifierProvider(create: (context) => ExtCeilingPhNotifier()),
          ChangeNotifierProvider(create: (context) => ExtLightPhNotifier()),
          ChangeNotifierProvider(create: (context) => ExtWallsPhNotifier()),
          ChangeNotifierProvider(create: (context) => ExtWindowsPhNotifier()),
          ChangeNotifierProvider(create: (context) => HalFramePhNotifier()),
          ChangeNotifierProvider(create: (context) => HalExdoorPhNotifier()),
          ChangeNotifierProvider(create: (context) => HalIndoorPhNotifier()),
          ChangeNotifierProvider(create: (context) => HalCeilingPhNotifier()),
          ChangeNotifierProvider(create: (context) => HalLightPhNotifier()),
          ChangeNotifierProvider(create: (context) => HalWallsPhNotifier()),
          ChangeNotifierProvider(create: (context) => HalWindowsPhNotifier()),
          ChangeNotifierProvider(create: (context) => KitFramePhNotifier()),
          ChangeNotifierProvider(create: (context) => KitExdoorPhNotifier()),
          ChangeNotifierProvider(create: (context) => KitIndoorPhNotifier()),
          ChangeNotifierProvider(create: (context) => KitCeilingPhNotifier()),
          ChangeNotifierProvider(create: (context) => KitLightPhNotifier()),
          ChangeNotifierProvider(create: (context) => KitWallsPhNotifier()),
          ChangeNotifierProvider(create: (context) => KitWindowsPhNotifier()),
          ChangeNotifierProvider(create: (context) => SmoFramePhNotifier()),
          ChangeNotifierProvider(create: (context) => SmoExdoorPhNotifier()),
          ChangeNotifierProvider(create: (context) => SmoIndoorPhNotifier()),
          ChangeNotifierProvider(create: (context) => SmoCeilingPhNotifier()),
          ChangeNotifierProvider(create: (context) => SmoLightPhNotifier()),
          ChangeNotifierProvider(create: (context) => SmoWallsPhNotifier()),
          ChangeNotifierProvider(create: (context) => SmoWindowsPhNotifier()),

          ChangeNotifierProvider(create: (context) => GasMeterNotifier()),
          ChangeNotifierProvider(create: (context) => ElecMeterNotifier()),
          ChangeNotifierProvider(create: (context) => ElecMeterPhNotifier()),
          ChangeNotifierProvider(create: (context) => GasMeterPhNotifier()),
          ChangeNotifierProvider(create: (context) => InventKeyPhNotifier()),
          ChangeNotifierProvider(create: (context) => InventKeyNotifier()),

          ChangeNotifierProvider(create: (context) => SmokeDeNotifier()),
          ChangeNotifierProvider(create: (context) => SmokeDePhNotifier()),
          ChangeNotifierProvider(create: (context) => BdfourIndoorNotifier()),
          ChangeNotifierProvider(create: (context) => BdfourCeilingNotifier()),
          ChangeNotifierProvider(create: (context) => BdfourLightNotifier()),
          ChangeNotifierProvider(create: (context) => BdfourWallsNotifier()),
          ChangeNotifierProvider(create: (context) => BdfourWindowsNotifier()),
          ChangeNotifierProvider(create: (context) => BdfourFrameNotifier()),
          ChangeNotifierProvider(create: (context) => BdfourExdoorNotifier()),
          ChangeNotifierProvider(create: (context) => BdfourFramePhNotifier()),
          ChangeNotifierProvider(create: (context) => BdfourExdoorPhNotifier()),
          ChangeNotifierProvider(create: (context) => BdfourIndoorPhNotifier()),
          ChangeNotifierProvider(create: (context) => BdfourCeilingPhNotifier()),
          ChangeNotifierProvider(create: (context) => BdfourLightPhNotifier()),
          ChangeNotifierProvider(create: (context) => BdfourWallsPhNotifier()),
          ChangeNotifierProvider(create: (context) => BdfourWindowsPhNotifier()),




          //old
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
          ChangeNotifierProvider(create: (context) => ExteriorImgTanNotifier()),
          ChangeNotifierProvider(create: (context) => HallwayImgTanNotify()),
          ChangeNotifierProvider(create: (context) => SmoteImgTanNotify()),
          ChangeNotifierProvider(create: (context) => KitchenImgTanNotify()),
          ChangeNotifierProvider(create: (context) => BedroomImgTanNotify()),
          ChangeNotifierProvider(create: (context) => ChaabiImgTanNotify()),
          ChangeNotifierProvider(create: (context) => MeterImgTanNotify()),
          ChangeNotifierProvider(create: (context) => ExteriorTanNotifier()),
          ChangeNotifierProvider(create: (context) => HallwayTanNotifier()),
          ChangeNotifierProvider(create: (context) => SmoteTanNotifier()),
          ChangeNotifierProvider(create: (context) => KitchenTanNotifier()),
          ChangeNotifierProvider(create: (context) => BedroomTanNotifier()),
          ChangeNotifierProvider(create: (context) => ChaabiTanNotifier()),
          ChangeNotifierProvider(create: (context) => MeterreadingTanNotifier()),


          ChangeNotifierProvider(create: (context) => IntroImgNotify()),
          ChangeNotifierProvider(create: (context) => IntroNotifier()),






        ],
        child: MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AppHome(),
//      initialRoute:'/',
//      onGenerateRoute: Router.generateRoute,
    );
  }
}
