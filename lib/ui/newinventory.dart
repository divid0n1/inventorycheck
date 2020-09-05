import 'dart:io';
import 'dart:typed_data';
import 'package:esys_flutter_share/esys_flutter_share.dart';
import 'package:flutter/services.dart';
import 'package:inventorycheck/GenPdf/GenPdf.dart';
import 'package:inventorycheck/NotifierList/BdfourPhoto.dart';
import 'package:inventorycheck/NotifierList/BdfourText.dart';
import 'package:inventorycheck/NotifierList/BedroomPhoto.dart';
import 'package:inventorycheck/NotifierList/BedroomText.dart';
import 'package:inventorycheck/NotifierList/ExteriorPhoto.dart';
import 'package:inventorycheck/NotifierList/ExteriorText.dart';
import 'package:inventorycheck/NotifierList/HallwayPhoto.dart';
import 'package:inventorycheck/NotifierList/HallwayText.dart';
import 'package:inventorycheck/NotifierList/KeysText.dart';
import 'package:inventorycheck/NotifierList/KitchenPhoto.dart';
import 'package:inventorycheck/NotifierList/KitchenText.dart';
import 'package:inventorycheck/NotifierList/MeterText.dart';
import 'package:inventorycheck/NotifierList/SmotePhoto.dart';
import 'package:inventorycheck/NotifierList/SmoteText.dart';
import 'package:inventorycheck/notify/textnotifier.dart';
import 'package:inventorycheck/ui/Category.dart';
import 'package:inventorycheck/ui/ElecMeter.dart';
import 'package:inventorycheck/ui/apphome.dart';
import 'package:flutter/material.dart';
import 'package:inventorycheck/ui/InventKey.dart';
import 'package:inventorycheck/ui/introInvent.dart';
import 'package:inventorycheck/ui/smokeDe.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:provider/provider.dart';
import 'package:inventorycheck/notify/imagesnotifier.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NewInventory extends StatelessWidget {

  final pdf = pw.Document();

  var pdffilename;




  @override
  Widget build(BuildContext context) {

      //New List
    ExtFrameNotifier extFrameNotifier = Provider.of<ExtFrameNotifier>(context);
    ExtExdoorNotifier extExdoorNotifier = Provider.of<ExtExdoorNotifier>(context);
    ExtIndoorNotifier extIndoorNotifier = Provider.of<ExtIndoorNotifier>(context);
    ExtCeilingNotifier extCeilingNotifier = Provider.of<ExtCeilingNotifier>(context);
    ExtLightNotifier extLightNotifier = Provider.of<ExtLightNotifier>(context);
    ExtWallsNotifier extWallsNotifier = Provider.of<ExtWallsNotifier>(context);
    ExtWindowsNotifier extWindowsNotifier = Provider.of<ExtWindowsNotifier>(context);
    ExtFramePhNotifier extFramePhNotifier = Provider.of<ExtFramePhNotifier>(context);
    ExtExdoorPhNotifier extExdoorPhNotifier = Provider.of<ExtExdoorPhNotifier>(context);
    ExtIndoorPhNotifier extIndoorPhNotifier = Provider.of<ExtIndoorPhNotifier>(context);
    ExtCeilingPhNotifier extCeilingPhNotifier = Provider.of<ExtCeilingPhNotifier>(context);
    ExtLightPhNotifier extLightPhNotifier = Provider.of<ExtLightPhNotifier>(context);
    ExtWallsPhNotifier extWallsPhNotifier = Provider.of<ExtWallsPhNotifier>(context);
    ExtWindowsPhNotifier extWindowsPhNotifier = Provider.of<ExtWindowsPhNotifier>(context);
    HalFrameNotifier halFrameNotifier = Provider.of<HalFrameNotifier>(context);
    HalExdoorNotifier halExdoorNotifier = Provider.of<HalExdoorNotifier>(context);
    HalIndoorNotifier halIndoorNotifier = Provider.of<HalIndoorNotifier>(context);
    HalCeilingNotifier halCeilingNotifier = Provider.of<HalCeilingNotifier>(context);
    HalLightNotifier halLightNotifier = Provider.of<HalLightNotifier>(context);
    HalWallsNotifier halWallsNotifier = Provider.of<HalWallsNotifier>(context);
    HalWindowsNotifier halWindowsNotifier = Provider.of<HalWindowsNotifier>(context);
    HalFramePhNotifier halFramePhNotifier = Provider.of<HalFramePhNotifier>(context);
    HalExdoorPhNotifier halExdoorPhNotifier = Provider.of<HalExdoorPhNotifier>(context);
    HalIndoorPhNotifier halIndoorPhNotifier = Provider.of<HalIndoorPhNotifier>(context);
    HalCeilingPhNotifier halCeilingPhNotifier = Provider.of<HalCeilingPhNotifier>(context);
    HalLightPhNotifier halLightPhNotifier = Provider.of<HalLightPhNotifier>(context);
    HalWallsPhNotifier halWallsPhNotifier = Provider.of<HalWallsPhNotifier>(context);
    HalWindowsPhNotifier halWindowsPhNotifier = Provider.of<HalWindowsPhNotifier>(context);
    SmoFrameNotifier smoFrameNotifier = Provider.of<SmoFrameNotifier>(context);
    SmoExdoorNotifier smoExdoorNotifier = Provider.of<SmoExdoorNotifier>(context);
    SmoIndoorNotifier smoIndoorNotifier = Provider.of<SmoIndoorNotifier>(context);
    SmoCeilingNotifier smoCeilingNotifier = Provider.of<SmoCeilingNotifier>(context);
    SmoLightNotifier smoLightNotifier = Provider.of<SmoLightNotifier>(context);
    SmoWallsNotifier smoWallsNotifier = Provider.of<SmoWallsNotifier>(context);
    SmoWindowsNotifier smoWindowsNotifier = Provider.of<SmoWindowsNotifier>(context);
    SmoFramePhNotifier smoFramePhNotifier = Provider.of<SmoFramePhNotifier>(context);
    SmoExdoorPhNotifier smoExdoorPhNotifier = Provider.of<SmoExdoorPhNotifier>(context);
    SmoIndoorPhNotifier smoIndoorPhNotifier = Provider.of<SmoIndoorPhNotifier>(context);
    SmoCeilingPhNotifier smoCeilingPhNotifier = Provider.of<SmoCeilingPhNotifier>(context);
    SmoLightPhNotifier smoLightPhNotifier = Provider.of<SmoLightPhNotifier>(context);
    SmoWallsPhNotifier smoWallsPhNotifier = Provider.of<SmoWallsPhNotifier>(context);
    SmoWindowsPhNotifier smoWindowsPhNotifier = Provider.of<SmoWindowsPhNotifier>(context);
    KitFrameNotifier kitFrameNotifier = Provider.of<KitFrameNotifier>(context);
    KitExdoorNotifier kitExdoorNotifier = Provider.of<KitExdoorNotifier>(context);
    KitIndoorNotifier kitIndoorNotifier = Provider.of<KitIndoorNotifier>(context);
    KitCeilingNotifier kitCeilingNotifier = Provider.of<KitCeilingNotifier>(context);
    KitLightNotifier kitLightNotifier = Provider.of<KitLightNotifier>(context);
    KitWallsNotifier kitWallsNotifier = Provider.of<KitWallsNotifier>(context);
    KitWindowsNotifier kitWindowsNotifier = Provider.of<KitWindowsNotifier>(context);
    KitFramePhNotifier kitFramePhNotifier = Provider.of<KitFramePhNotifier>(context);
    KitExdoorPhNotifier kitExdoorPhNotifier = Provider.of<KitExdoorPhNotifier>(context);
    KitIndoorPhNotifier kitIndoorPhNotifier = Provider.of<KitIndoorPhNotifier>(context);
    KitCeilingPhNotifier kitCeilingPhNotifier = Provider.of<KitCeilingPhNotifier>(context);
    KitLightPhNotifier kitLightPhNotifier = Provider.of<KitLightPhNotifier>(context);
    KitWallsPhNotifier kitWallsPhNotifier = Provider.of<KitWallsPhNotifier>(context);
    KitWindowsPhNotifier kitWindowsPhNotifier = Provider.of<KitWindowsPhNotifier>(context);
    BedFrameNotifier bedFrameNotifier = Provider.of<BedFrameNotifier>(context);
    BedExdoorNotifier bedExdoorNotifier = Provider.of<BedExdoorNotifier>(context);
    BedIndoorNotifier bedIndoorNotifier = Provider.of<BedIndoorNotifier>(context);
    BedCeilingNotifier bedCeilingNotifier = Provider.of<BedCeilingNotifier>(context);
    BedLightNotifier bedLightNotifier = Provider.of<BedLightNotifier>(context);
    BedWallsNotifier bedWallsNotifier = Provider.of<BedWallsNotifier>(context);
    BedWindowsNotifier bedWindowsNotifier = Provider.of<BedWindowsNotifier>(context);
    BedFramePhNotifier bedFramePhNotifier = Provider.of<BedFramePhNotifier>(context);
    BedExdoorPhNotifier bedExdoorPhNotifier = Provider.of<BedExdoorPhNotifier>(context);
    BedIndoorPhNotifier bedIndoorPhNotifier = Provider.of<BedIndoorPhNotifier>(context);
    BedCeilingPhNotifier bedCeilingPhNotifier = Provider.of<BedCeilingPhNotifier>(context);
    BedLightPhNotifier bedLightPhNotifier = Provider.of<BedLightPhNotifier>(context);
    BedWallsPhNotifier bedWallsPhNotifier = Provider.of<BedWallsPhNotifier>(context);
    BedWindowsPhNotifier bedWindowsPhNotifier = Provider.of<BedWindowsPhNotifier>(context);
    GasMeterNotifier gasMeterNotifier = Provider.of<GasMeterNotifier>(context);
    GasMeterPhNotifier gasMeterPhNotifier = Provider.of<GasMeterPhNotifier>(context);
    ElecMeterNotifier elecMeterNotifier = Provider.of<ElecMeterNotifier>(context);
    ElecMeterPhNotifier elecMeterPhNotifier = Provider.of<ElecMeterPhNotifier>(context);
    InventKeyNotifier inventKeyNotifier = Provider.of<InventKeyNotifier>(context);
    InventKeyPhNotifier inventKeyPhNotifier = Provider.of<InventKeyPhNotifier>(context);
    IntroImgNotify introImgNotify = Provider.of<IntroImgNotify>(context);
    IntroNotifier introNotifier = Provider.of<IntroNotifier>(context);
    SmokeDeNotifier smokeDeNotifier = Provider.of<SmokeDeNotifier>(context);
    SmokeDePhNotifier smokeDePhNotifier = Provider.of<SmokeDePhNotifier>(context);

    BdfourFrameNotifier bdfourFrameNotifier = Provider.of<BdfourFrameNotifier>(context);
    BdfourExdoorNotifier bdfourExdoorNotifier = Provider.of<BdfourExdoorNotifier>(context);
    BdfourIndoorNotifier bdfourIndoorNotifier = Provider.of<BdfourIndoorNotifier>(context);
    BdfourCeilingNotifier bdfourCeilingNotifier = Provider.of<BdfourCeilingNotifier>(context);
    BdfourLightNotifier bdfourLightNotifier = Provider.of<BdfourLightNotifier>(context);
    BdfourWallsNotifier bdfourWallsNotifier = Provider.of<BdfourWallsNotifier>(context);
    BdfourWindowsNotifier bdfourWindowsNotifier = Provider.of<BdfourWindowsNotifier>(context);
    BdfourFramePhNotifier bdfourFramePhNotifier = Provider.of<BdfourFramePhNotifier>(context);
    BdfourExdoorPhNotifier bdfourExdoorPhNotifier = Provider.of<BdfourExdoorPhNotifier>(context);
    BdfourIndoorPhNotifier bdfourIndoorPhNotifier = Provider.of<BdfourIndoorPhNotifier>(context);
    BdfourCeilingPhNotifier bdfourCeilingPhNotifier = Provider.of<BdfourCeilingPhNotifier>(context);
    BdfourLightPhNotifier bdfourLightPhNotifier = Provider.of<BdfourLightPhNotifier>(context);
    BdfourWallsPhNotifier bdfourWallsPhNotifier = Provider.of<BdfourWallsPhNotifier>(context);
    BdfourWindowsPhNotifier bdfourWindowsPhNotifier = Provider.of<BdfourWindowsPhNotifier>(context);


    _checkExterior(){
      if(introImgNotify.introImgList.isNotEmpty || introNotifier.introList.isNotEmpty
      /*extFrameNotifier.extFrameList.isNotEmpty || extExdoorNotifier.extExdoorList.isNotEmpty ||
          extIndoorNotifier.extIndoorList.isNotEmpty || extCeilingNotifier.extCeilingList.isNotEmpty ||
          extLightNotifier.extLightList.isNotEmpty || extWallsNotifier.extWallsList.isNotEmpty ||
          extWindowsNotifier.extWindowsList.isNotEmpty || extFramePhNotifier.extFramePhList.isNotEmpty ||
          extExdoorPhNotifier.extExdoorPhList.isNotEmpty || extIndoorPhNotifier.extIndoorPhList.isNotEmpty ||
          extCeilingPhNotifier.extCeilingPhList.isNotEmpty || extLightPhNotifier.extLightPhList.isNotEmpty ||
          extWallsPhNotifier.extWallsPhList.isNotEmpty || extWindowsPhNotifier.extWindowsPhList.isNotEmpty*/
      ){
        return Container( alignment: Alignment.centerRight,child: Icon( Icons.done,
          color: Color(0xff684c4c), size: 35.0, semanticLabel: 'Added', ));
      }else {return Container();}
    }
    _checkbd2(){
      if(extFrameNotifier.extFrameList.isNotEmpty || extExdoorNotifier.extExdoorList.isNotEmpty ||
          extIndoorNotifier.extIndoorList.isNotEmpty || extCeilingNotifier.extCeilingList.isNotEmpty ||
          extLightNotifier.extLightList.isNotEmpty || extWallsNotifier.extWallsList.isNotEmpty ||
          extWindowsNotifier.extWindowsList.isNotEmpty || extFramePhNotifier.extFramePhList.isNotEmpty ||
          extExdoorPhNotifier.extExdoorPhList.isNotEmpty || extIndoorPhNotifier.extIndoorPhList.isNotEmpty ||
          extCeilingPhNotifier.extCeilingPhList.isNotEmpty || extLightPhNotifier.extLightPhList.isNotEmpty ||
          extWallsPhNotifier.extWallsPhList.isNotEmpty || extWindowsPhNotifier.extWindowsPhList.isNotEmpty
      ){
        return Container( alignment: Alignment.centerRight,child: Icon( Icons.done,
          color: Color(0xff684c4c), size: 35.0, semanticLabel: 'Added', ));
      }else {return Container();}
    }
    _checkbd3(){
      if( smoFrameNotifier.smoFrameList.isNotEmpty || smoExdoorNotifier.smoExdoorList.isNotEmpty ||
          smoIndoorNotifier.smoIndoorList.isNotEmpty || smoCeilingNotifier.smoCeilingList.isNotEmpty ||
          smoLightNotifier.smoLightList.isNotEmpty || smoWallsNotifier.smoWallsList.isNotEmpty ||
          smoWindowsNotifier.smoWindowsList.isNotEmpty || smoFramePhNotifier.smoFramePhList.isNotEmpty ||
          smoExdoorPhNotifier.smoExdoorPhList.isNotEmpty || smoIndoorPhNotifier.smoIndoorPhList.isNotEmpty ||
          smoCeilingPhNotifier.smoCeilingPhList.isNotEmpty || smoLightPhNotifier.smoLightPhList.isNotEmpty ||
          smoWallsPhNotifier.smoWallsPhList.isNotEmpty || smoWindowsPhNotifier.smoWindowsPhList.isNotEmpty

      ){
        return Container( alignment: Alignment.centerRight,child: Icon( Icons.done,
          color: Color(0xff684c4c), size: 35.0, semanticLabel: 'Added', ));
      }else {return Container();}
    }

    _checkHallway(){
      if(halFrameNotifier.halFrameList.isNotEmpty || halExdoorNotifier.halExdoorList.isNotEmpty ||
          halIndoorNotifier.halIndoorList.isNotEmpty || halCeilingNotifier.halCeilingList.isNotEmpty ||
          halLightNotifier.halLightList.isNotEmpty || halWallsNotifier.halWallsList.isNotEmpty ||
          halWindowsNotifier.halWindowsList.isNotEmpty || halFramePhNotifier.halFramePhList.isNotEmpty ||
          halExdoorPhNotifier.halExdoorPhList.isNotEmpty || halIndoorPhNotifier.halIndoorPhList.isNotEmpty ||
          halCeilingPhNotifier.halCeilingPhList.isNotEmpty || halLightPhNotifier.halLightPhList.isNotEmpty ||
          halWallsPhNotifier.halWallsPhList.isNotEmpty || halWindowsPhNotifier.halWindowsPhList.isNotEmpty

      ){
        return Container( alignment: Alignment.centerRight,child: Icon( Icons.done,
          color: Color(0xff684c4c), size: 35.0, semanticLabel: 'Added', ));
      }else {return Container();}
    }

    _checkSmote(){
      if(smokeDeNotifier.smokeDeList.isNotEmpty || smokeDePhNotifier.smokeDePhList.isNotEmpty ){
        return Container( alignment: Alignment.centerRight,child: Icon( Icons.done,
          color: Color(0xff684c4c), size: 35.0, semanticLabel: 'Added', ));
      }else {return Container();}
    }
    _checkKitchen(){
      if(kitFrameNotifier.kitFrameList.isNotEmpty || kitExdoorNotifier.kitExdoorList.isNotEmpty ||
          kitIndoorNotifier.kitIndoorList.isNotEmpty || kitCeilingNotifier.kitCeilingList.isNotEmpty ||
          kitLightNotifier.kitLightList.isNotEmpty || kitWallsNotifier.kitWallsList.isNotEmpty ||
          kitWindowsNotifier.kitWindowsList.isNotEmpty || kitFramePhNotifier.kitFramePhList.isNotEmpty ||
          kitExdoorPhNotifier.kitExdoorPhList.isNotEmpty || kitIndoorPhNotifier.kitIndoorPhList.isNotEmpty ||
          kitCeilingPhNotifier.kitCeilingPhList.isNotEmpty || kitLightPhNotifier.kitLightPhList.isNotEmpty ||
          kitWallsPhNotifier.kitWallsPhList.isNotEmpty || kitWindowsPhNotifier.kitWindowsPhList.isNotEmpty

      ){
        return Container( alignment: Alignment.centerRight,child: Icon( Icons.done,
          color: Color(0xff684c4c), size: 35.0, semanticLabel: 'Added', ));
      }else {return Container();}
    }
    _checkBedroom(){
      if(bedFrameNotifier.bedFrameList.isNotEmpty || bedExdoorNotifier.bedExdoorList.isNotEmpty ||
          bedIndoorNotifier.bedIndoorList.isNotEmpty || bedCeilingNotifier.bedCeilingList.isNotEmpty ||
          bedLightNotifier.bedLightList.isNotEmpty || bedWallsNotifier.bedWallsList.isNotEmpty ||
          bedWindowsNotifier.bedWindowsList.isNotEmpty || bedFramePhNotifier.bedFramePhList.isNotEmpty ||
          bedExdoorPhNotifier.bedExdoorPhList.isNotEmpty || bedIndoorPhNotifier.bedIndoorPhList.isNotEmpty ||
          bedCeilingPhNotifier.bedCeilingPhList.isNotEmpty || bedLightPhNotifier.bedLightPhList.isNotEmpty ||
          bedWallsPhNotifier.bedWallsPhList.isNotEmpty || bedWindowsPhNotifier.bedWindowsPhList.isNotEmpty

      ){
        return Container( alignment: Alignment.centerRight,child: Icon( Icons.done,
          color: Color(0xff684c4c), size: 35.0, semanticLabel: 'Added', ));
      }else {return Container();}
    }
    _checkMeter(){
      if(gasMeterNotifier.gasMeterList.isNotEmpty || gasMeterPhNotifier.gasMeterPhList.isNotEmpty ||
          elecMeterNotifier.elecMeterList.isNotEmpty || elecMeterPhNotifier.elecMeterPhList.isNotEmpty
      ){
        return Container( alignment: Alignment.centerRight,child: Icon( Icons.done,
          color: Color(0xff684c4c), size: 35.0, semanticLabel: 'Added', ));
      }else {return Container();}
    }
    _checkkeys(){
      if(inventKeyNotifier.inventKeyList.isNotEmpty || inventKeyPhNotifier.inventKeyPhList.isNotEmpty
      ){ return Container( alignment: Alignment.centerRight,child: Icon( Icons.done,
          color: Color(0xff684c4c), size: 35.0, semanticLabel: 'Added', ));
      }else {return Container();}
    }
    _checkBdfourroom(){
      if(bdfourFrameNotifier.bdfourFrameList.isNotEmpty || bdfourExdoorNotifier.bdfourExdoorList.isNotEmpty ||
          bdfourIndoorNotifier.bdfourIndoorList.isNotEmpty || bdfourCeilingNotifier.bdfourCeilingList.isNotEmpty ||
          bdfourLightNotifier.bdfourLightList.isNotEmpty || bdfourWallsNotifier.bdfourWallsList.isNotEmpty ||
          bdfourWindowsNotifier.bdfourWindowsList.isNotEmpty || bdfourFramePhNotifier.bdfourFramePhList.isNotEmpty ||
          bdfourExdoorPhNotifier.bdfourExdoorPhList.isNotEmpty || bdfourIndoorPhNotifier.bdfourIndoorPhList.isNotEmpty ||
          bdfourCeilingPhNotifier.bdfourCeilingPhList.isNotEmpty || bdfourLightPhNotifier.bdfourLightPhList.isNotEmpty ||
          bdfourWallsPhNotifier.bdfourWallsPhList.isNotEmpty || bdfourWindowsPhNotifier.bdfourWindowsPhList.isNotEmpty

      ){
        return Container( alignment: Alignment.centerRight,child: Icon( Icons.done,
          color: Color(0xff684c4c), size: 35.0, semanticLabel: 'Added', ));
      }else {return Container();}
    }

    Widget _btnexterior() {
      return Container(
        decoration: BoxDecoration(
          borderRadius: new BorderRadius.only(
              topLeft: const Radius.circular(25.0),
              topRight: const Radius.circular(25.0),
              bottomLeft: const Radius.circular(25.0),
              bottomRight: const Radius.circular(25.0)),
          color: Colors.white.withOpacity(0.6),
          border: new Border.all(color: Colors.blueGrey),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 1,
              offset: Offset(5, 5),
            ),
          ],
        ),
        height: 55,
        width: 240,
        child: Stack(
          children: <Widget>[
            Center(
                child: Text(
                  "Exterior",
                  style: TextStyle(
                    color: Color(0xff684c4c),
                    fontFamily: 'alice',
                    fontSize: 25,
                  ),
                )),
            _checkExterior(),
          ],
        ),
      );
    }
    Widget _btnhallway() {
      return Container(
        decoration: BoxDecoration(
          borderRadius: new BorderRadius.only(
              topLeft: const Radius.circular(25.0),
              topRight: const Radius.circular(25.0),
              bottomLeft: const Radius.circular(25.0),
              bottomRight: const Radius.circular(25.0)),
          color: Colors.white.withOpacity(0.7),
          border: new Border.all(color: Colors.blueGrey),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              offset: Offset(5, 5),
            ),
          ],
        ),
        height: 55,
        width: 240,
        child: Stack(
          children: <Widget>[
            Center(
                child: Text(
                  "Hallway",
                  style: TextStyle(
                    color: Color(0xff684c4c),
                    fontFamily: 'alice',
                    fontSize: 25,
                  ),
                )),
            _checkHallway(),
          ],
        ),
      );
    }
    Widget _btnsmotedetect() {
      return Container(
        decoration: BoxDecoration(
          borderRadius: new BorderRadius.only(
              topLeft: const Radius.circular(25.0),
              topRight: const Radius.circular(25.0),
              bottomLeft: const Radius.circular(25.0),
              bottomRight: const Radius.circular(25.0)),
          color: Colors.white.withOpacity(0.7),
          border: new Border.all(color: Colors.blueGrey),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              offset: Offset(5, 5),
            ),
          ],
        ),
        height: 55,
        width: 240,
        child: Stack(
          children: <Widget>[
            Center(
                child: Text(
                  "Smoke Detector",
                  style: TextStyle(
                    color: Color(0xff684c4c),
                    fontFamily: 'alice',
                    fontSize: 25,
                  ),
                )),
            _checkSmote(),
          ],
        ),
      );
    }
    Widget _btnkitchen() {
      return Container(
        decoration: BoxDecoration(
          borderRadius: new BorderRadius.only(
              topLeft: const Radius.circular(25.0),
              topRight: const Radius.circular(25.0),
              bottomLeft: const Radius.circular(25.0),
              bottomRight: const Radius.circular(25.0)),
          color: Colors.white.withOpacity(0.7),
          border: new Border.all(color: Colors.blueGrey),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              offset: Offset(5, 5),
            ),
          ],
        ),
        height: 55,
        width: 240,
        child: Stack(
          children: <Widget>[
            Center(
                child: Text(
                  "Kitchen",
                  style: TextStyle(
                    color: Color(0xff684c4c),
                    fontFamily: 'alice',
                    fontSize: 25,
                  ),
                )),
            _checkKitchen(),
          ],
        ),
      );
    }
    Widget _btnbedroom() {
      return Container(
        decoration: BoxDecoration(
          borderRadius: new BorderRadius.only(
              topLeft: const Radius.circular(25.0),
              topRight: const Radius.circular(25.0),
              bottomLeft: const Radius.circular(25.0),
              bottomRight: const Radius.circular(25.0)),
          color: Colors.white.withOpacity(0.7),
          border: new Border.all(color: Colors.blueGrey),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              offset: Offset(5, 5),
            ),
          ],
        ),
        height: 55,
        width: 240,
        child: Stack(
          children: <Widget>[
            Center(
                child: Text(
                  "Bedroom 1",
                  style: TextStyle(
                    color: Color(0xff684c4c),
                    fontFamily: 'alice',
                    fontSize: 25,
                  ),
                )),
            _checkBedroom(),
          ],
        ),
      );
    }
    Widget _btnkeys() {
      return Container(
        decoration: BoxDecoration(
          borderRadius: new BorderRadius.only(
              topLeft: const Radius.circular(25.0),
              topRight: const Radius.circular(25.0),
              bottomLeft: const Radius.circular(25.0),
              bottomRight: const Radius.circular(25.0)),
          color: Colors.white.withOpacity(0.7),
          border: new Border.all(color: Colors.blueGrey),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              offset: Offset(5, 5),
            ),
          ],
        ),
        height: 55,
        width: 240,
        child: Stack(
          children: <Widget>[
            Center(
                child: Text(
                  "Keys",
                  style: TextStyle(
                    color: Color(0xff684c4c),
                    fontFamily: 'alice',
                    fontSize: 25,
                  ),
                )),
            _checkkeys(),
          ],
        ),
      );
    }
    Widget _btnmeter() {
      return Container(
        decoration: BoxDecoration(
          borderRadius: new BorderRadius.only(
              topLeft: const Radius.circular(25.0),
              topRight: const Radius.circular(25.0),
              bottomLeft: const Radius.circular(25.0),
              bottomRight: const Radius.circular(25.0)),
          color: Colors.white.withOpacity(0.7),
          border: new Border.all(color: Colors.blueGrey),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              offset: Offset(5, 5),
            ),
          ],
        ),
        height: 55,
        width: 240,
        child: Stack(
          children: <Widget>[
            Center(
                child: Text(
                  "Meter readings",
                  style: TextStyle(
                    color: Color(0xff684c4c),
                    fontFamily: 'alice',
                    fontSize: 25,
                  ),
                )),
            _checkMeter(),

          ],
        ),
      );
    }
    Widget _btnbdfourroom() {
      return Container(
        decoration: BoxDecoration(
          borderRadius: new BorderRadius.only(
              topLeft: const Radius.circular(25.0),
              topRight: const Radius.circular(25.0),
              bottomLeft: const Radius.circular(25.0),
              bottomRight: const Radius.circular(25.0)),
          color: Colors.white.withOpacity(0.7),
          border: new Border.all(color: Colors.blueGrey),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              offset: Offset(5, 5),
            ),
          ],
        ),
        height: 55,
        width: 240,
        child: Stack(
          children: <Widget>[
            Center(
                child: Text(
                  "Bedroom 4",
                  style: TextStyle(
                    color: Color(0xff684c4c),
                    fontFamily: 'alice',
                    fontSize: 25,
                  ),
                )),
            _checkBdfourroom(),
          ],
        ),
      );
    }
    Widget _btnbd2() {
      return Container(
        decoration: BoxDecoration(
          borderRadius: new BorderRadius.only(
              topLeft: const Radius.circular(25.0),
              topRight: const Radius.circular(25.0),
              bottomLeft: const Radius.circular(25.0),
              bottomRight: const Radius.circular(25.0)),
          color: Colors.white.withOpacity(0.7),
          border: new Border.all(color: Colors.blueGrey),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              offset: Offset(5, 5),
            ),
          ],
        ),
        height: 55,
        width: 240,
        child: Stack(
          children: <Widget>[
            Center(
                child: Text(
                  "Bedroom 2",
                  style: TextStyle(
                    color: Color(0xff684c4c),
                    fontFamily: 'alice',
                    fontSize: 25,
                  ),
                )),
            _checkbd2(),
          ],
        ),
      );
    }
    Widget _btnbd3() {
      return Container(
        decoration: BoxDecoration(
          borderRadius: new BorderRadius.only(
              topLeft: const Radius.circular(25.0),
              topRight: const Radius.circular(25.0),
              bottomLeft: const Radius.circular(25.0),
              bottomRight: const Radius.circular(25.0)),
          color: Colors.white.withOpacity(0.7),
          border: new Border.all(color: Colors.blueGrey),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              offset: Offset(5, 5),
            ),
          ],
        ),
        height: 55,
        width: 240,
        child: Stack(
          children: <Widget>[
            Center(
                child: Text(
                  "Bedroom 3",
                  style: TextStyle(
                    color: Color(0xff684c4c),
                    fontFamily: 'alice',
                    fontSize: 25,
                  ),
                )),
            _checkbd3(),
          ],
        ),
      );
    }


var genpdf = GenPdf();





/*

    writeOnPdfAddPage() async {
      var pwtheme = pw.Theme.withFont(
        base: pw.Font.ttf(await rootBundle.load("assets/arimo.ttf")),
      );

      pdf.addPage(pw.MultiPage(
        theme: pwtheme,
        pageFormat: PdfPageFormat.a5,
        margin: pw.EdgeInsets.all(5),
        build: (pw.Context context) {
          return <pw.Widget>[
            pw.Header(
                level: 0, child: pw.Text('CheckInventory PDF: ${pdffilename}')),
            pw.Text(
              'Description: ${exteriorNotifier.exteriorList.last.description}',
              style: pw.TextStyle(
                fontSize: 18,
              ),
            ),
            pw.Text(
              'Quantity: ${exteriorNotifier.exteriorList.last.quantity}',
              style: pw.TextStyle(
                fontSize: 18,
              ),
            ),
            pw.Text(
              'Colour: ${exteriorNotifier.exteriorList.last.colour}',
              style: pw.TextStyle(
                fontSize: 18,
              ),
            ),
            pw.Text(
              'Condition: ${exteriorNotifier.exteriorList.last.condition}',
              style: pw.TextStyle(
                fontSize: 18,
              ),
            ),
            pw.Container(
              height: 50,
              width: 100,
            ),
            pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                crossAxisAlignment: pw.CrossAxisAlignment.center,
                children: <pw.Widget>[
                  pw.SizedBox(
                    height: 100,
                  ),
//                pw.Container(height: 200, width: 200,
//                  child:
//                  pw.Image(
//          PdfImage.file(pdf.document, bytes: (exteriorImgNotifier.exteriorImgList.elementAt(0).imagesfloor).readAsBytesSync(),),height: 230,width: 230,fit: pw.BoxFit.contain,),
//                    ),

//                  pw.Image(
//                      PdfImage.file(pdf.document, bytes: (exteriorImgNotifier.exteriorImgList.elementAt(1).imagesfloor).readAsBytesSync(),),height: 230,width: 230,fit: pw.BoxFit.contain,),
                ]),
//            pw.Row(
//                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
//                crossAxisAlignment: pw.CrossAxisAlignment.center,
//                children: <pw.Widget>[
//
//                    pw.Image(
//                        PdfImage.file(pdf.document, bytes: (exteriorImgNotifier.exteriorImgList.elementAt(2).imagesfloor).readAsBytesSync(),), height: 100,width: 100,fit: pw.BoxFit.contain,),
//
//
//                    pw.Image(
//                        PdfImage.file(pdf.document, bytes: (exteriorImgNotifier.exteriorImgList.elementAt(3).imagesfloor).readAsBytesSync(),),height: 100,width: 100,fit: pw.BoxFit.contain,),
//
//                ]
//            ),
          ];
        },
      ));
    }


    writeOnPdfAddImage() async {
//      for (var i = 0; i < exteriorImgNotifier.exteriorImgList.length; i++)
//      {
      int i = 0;
      while (i < exteriorImgNotifier.exteriorImgList.length) {
        var imag = PdfImage.file(
          pdf.document,
          bytes: File(exteriorImgNotifier.exteriorImgList[i].imagesfloor.path)
              .readAsBytesSync(),
        );
        i++;
        var myTheme = pw.Theme.withFont(
          base: pw.Font.ttf(await rootBundle.load("assets/arimo.ttf")),
        );

        pdf.addPage(pw.MultiPage(
          theme: myTheme,
          pageFormat: PdfPageFormat.a5,
          margin: pw.EdgeInsets.all(32),
          build: (pw.Context context) {
            return <pw.Widget>[
              pw.Header(level: 0, child: pw.Text("new pdf Title")),
              pw.Container(
                height: 200,
                width: 200,
                child: pw.Image(imag),
              ),
            ];
          },
        ));
      }
    }
*/

    Future savePdf() async {
//      Directory documentDirectory = await getApplicationDocumentsDirectory();
      Directory documentDirectory = await getApplicationDocumentsDirectory();

      String documentPath = documentDirectory.path;
      final time = DateTime.now().millisecondsSinceEpoch;
      pdffilename = 'inven';

      File file = await File("$documentPath/$pdffilename$time.pdf");
//    final time = DateTime.now().millisecondsSinceEpoch;

//    print(documentPath.toUpperCase());
//    File file = File("$documentPath/transaction$time.pdf");
      print(file);
//      print(exdata.length);
//      String formattedTime = DateFormat.Hm().format(now);
//   final output = await getTemporaryDirectory();
//   final file = File("${output.path}/example.pdf");
     await file.writeAsBytesSync(pdf.save());
      print(file);
       final ByteData bytes = await rootBundle.load(file.path);
       await Share.file('Share your report', 'Inventory ${introNotifier.introList.last.description}.pdf', bytes.buffer.asUint8List(), '*/*');
//      Navigator.push(context,     MaterialPageRoute(builder: (context) => PdfViewer(path: file.path)));
//      SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
//      sharedPrefs.remove('addressp');
//      sharedPrefs.setString('addressp', file.path);

//      var addressp = '$pdffilename$time';
      var addressp = '${file.path}';
      SharedPreferences sharedPrefs = await SharedPreferences.getInstance();

      sharedPrefs.setString('addressp', addressp);
    }

    pdfview() async {
//      print('done');
//       Directory documentDirectory = await getApplicationDocumentsDirectory();
//       String documentPath = documentDirectory.path;
//
//       pdffilename = 'invent23';
//       final time = DateTime.now();
//       String fullPath = "$documentPath/{$pdffilename}.pdf";
//      final ByteData bytes = await rootBundle.load(fullPath);
//      await Share.file('pdf', 'pdf.pdf', bytes.buffer.asUint8List(), '*/*');

//       Navigator.push(context, MaterialPageRoute(builder: (context) => PdfViewer(path: fullPath)));
    }


    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/bg.png"), fit: BoxFit.cover)),
        child: Scaffold(
            appBar: PreferredSize(child: Container(), preferredSize: Size.fromHeight(0.0),),
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Column(
              children: <Widget>[
            Container(
            padding: EdgeInsets.only(top: 20),
              child: Center(
                child: Text(
              '${introNotifier.introList.last.description.toUpperCase()}',
//                "123 PORTLAND RD, LONDON",
                  style: TextStyle(
                    fontFamily: 'arimo',
                    fontSize: 25,
                  ),
                ),
              )),
                SizedBox(height: 20),
                InkWell(
                  onTap: () {
//                  Navigator.push(context,
//                      MaterialPageRoute(builder: (context) => Category(Route: '1')));
                  }, child: _btnexterior(), ),  //Exterior page
                SizedBox( height: 15, ),
                InkWell( onTap: () { Navigator.push(context, MaterialPageRoute(builder: (context) => homeKeys())); },
                  child: _btnkeys(), ),// keys
                SizedBox( height: 15, ), InkWell(
                  onTap: () { Navigator.push(context, MaterialPageRoute(builder: (context) => meterElec())); },
                  child: _btnmeter(),
                ),// meter elctric
                SizedBox( height: 15, ),
                InkWell(
                  onTap: () {
//                  Navigator.push(context,
//                      MaterialPageRoute(builder: (context) => Category(Route: '3',)));
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SmokeDetect()));
                  },
                  child: _btnsmotedetect(),
                ), //smote detector
                SizedBox( height: 15,),
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Category(Route: '2',)));
                  },
                  child: _btnhallway(),
                ), //hallway
                SizedBox( height: 15, ),
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Category(Route: '4',)));
                  },
                  child: _btnkitchen(),
                ), // kitchen
                SizedBox( height: 15, ),
                InkWell(onTap: () { Navigator.push(context, MaterialPageRoute(builder: (context) => Category(Route: '5',)));},
                  child: _btnbedroom(),),// bedroom
          SizedBox( height: 15, ),
                InkWell(onTap: () { Navigator.push(context, MaterialPageRoute(builder: (context) => Category(Route: '1',)));},
                  child: _btnbd2(),),SizedBox( height: 15, ),
                InkWell(onTap: () { Navigator.push(context, MaterialPageRoute(builder: (context) => Category(Route: '3',)));},
                  child: _btnbd3(),),SizedBox( height: 15, ),
          InkWell(
            onTap: () { Navigator.push(context, MaterialPageRoute(builder: (context) => Category(Route: '6',)));},
            child: _btnbdfourroom(), ),


                SizedBox( height: 100, ),
              ],
            ),
          ),
          floatingActionButton: Stack(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 31),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: FloatingActionButton(
//                      hoverColor: Colors.black,
//                      focusColor: Colors.red,
//                      splashColor: Colors.green,

                    heroTag: "exleft",
//                      mini: true,
                    backgroundColor: Colors.white,

//                      shape: RoundedRectangleBorder(co,borderRadius: BorderRadius.all(Radius.circular(50.0),Radius),),
//                      RoundedRectangleBorder(side: BorderSide(color: Colors.pink, width: 4.0)),

                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => IntroInvent()));

//                        Navigator.of(context).pushNamed('/newInventroy');
//                          Navigator.of(context).pushNamed('/newInventroy');
//                        print(images.length);
                    },
                    child: Icon(Icons.arrow_back_ios),

                    foregroundColor: Color(0xff684c4c),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 15),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: InkWell(
                    onTap: () async {
                      await genpdf.writeOnPdfCover(context);
                      await genpdf.writeOnPdfContent(context);
                      await genpdf.writeOnPdfChaabi(context);
                      await genpdf.writeOnPdfMeter(context);
                      await genpdf.writeOnPdfSmote(context);
                      await genpdf.writeOnPdfHallway(context);
                      await genpdf.writeOnPdfKitchen(context);
                      await genpdf.writeOnPdfBedroom(context);
                      await genpdf.writeOnPdfbd2(context);
                      await genpdf.writeOnPdfbd3(context);
                      await genpdf.writeOnPdfbd4(context);
//                      await writeOnPdfExterior();

//                        _Block(title: 'Tour bus driver');
                      await genpdf.savePdf(context);
                      await pdfview();
//                      await setValues();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: new BorderRadius.only(
                            topLeft: const Radius.circular(15.0),
                            topRight: const Radius.circular(15.0),
                            bottomLeft: const Radius.circular(15.0),
                            bottomRight: const Radius.circular(15.0)),
                        color: Color(0xff684c4c),
                        border: new Border.all(color: Colors.blueGrey),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 1,
                            offset: Offset(5, 5),
                          ),
                        ],
                      ),
                      height: 55,
                      width: 140,
                      child: Center(
                          child: Column(
                            children: <Widget>[
                              Text(
                                "GENERATE",
                                style: TextStyle(
                                  color: Color(0xffffffff),
//                                  fontFamily: 'alice',
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "REPORT",
                                style: TextStyle(
                                  color: Color(0xffffffff),
//                                  fontFamily: 'alice',
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            ],
                          )),
                    ),
                  ),
                ),
              ),
//                Align(
//                  alignment: Alignment.bottomRight,
//                  child: FloatingActionButton(
//
//                    heroTag: "exnext",
//                    mini: true,
//                    backgroundColor: Colors.deepPurpleAccent,
//                    onPressed: ()  {
//
////                      Navigator.pop(context, MaterialPageRoute(builder: (context) => TodosScreen()));
//                    },
//                    foregroundColor: Colors.white,
//                    child: Icon(Icons.plus_one),
//                  ),
//                ),
            ],
          ),
        ));
  }
}