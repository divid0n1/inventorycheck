import 'dart:io';
import 'dart:typed_data';
import 'package:esys_flutter_share/esys_flutter_share.dart';
import 'package:flutter/services.dart';
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
      if(smokeDeNotifier.smokeDeList.isNotEmpty || smokeDePhNotifier.smokeDePhList.isNotEmpty
//      smoFrameNotifier.smoFrameList.isNotEmpty || smoExdoorNotifier.smoExdoorList.isNotEmpty ||
//          smoIndoorNotifier.smoIndoorList.isNotEmpty || smoCeilingNotifier.smoCeilingList.isNotEmpty ||
//          smoLightNotifier.smoLightList.isNotEmpty || smoWallsNotifier.smoWallsList.isNotEmpty ||
//          smoWindowsNotifier.smoWindowsList.isNotEmpty || smoFramePhNotifier.smoFramePhList.isNotEmpty ||
//          smoExdoorPhNotifier.smoExdoorPhList.isNotEmpty || smoIndoorPhNotifier.smoIndoorPhList.isNotEmpty ||
//          smoCeilingPhNotifier.smoCeilingPhList.isNotEmpty || smoLightPhNotifier.smoLightPhList.isNotEmpty ||
//          smoWallsPhNotifier.smoWallsPhList.isNotEmpty || smoWindowsPhNotifier.smoWindowsPhList.isNotEmpty

      ){
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





    writeOnPdfCover() async {
      if (introNotifier.introList.isNotEmpty) {
        final font = await rootBundle.load("assets/herrvon.ttf");
        final herrvon = pw.Font.ttf(font);
        final fonta = await rootBundle.load("assets/alive.ttf");
        final alice = pw.Font.ttf(fonta);
        final fontb = await rootBundle.load("assets/arimo.ttf");
        final arimo = pw.Font.ttf(fontb);
        var pwtheme = pw.Theme.withFont(
          base: pw.Font.ttf(await rootBundle.load("assets/arimo.ttf")),
        );
        PdfImage _bgm;

        // Create a PDF document.
        _bgm = PdfImage.file(
          pdf.document,
          bytes: (await rootBundle.load('assets/bgm.jpg')).buffer.asUint8List(),
        );

        pdf.addPage(pw.MultiPage(
          theme: pwtheme,
          pageFormat: PdfPageFormat.a3.landscape,
          margin: pw.EdgeInsets.all(1),
          build: (pw.Context context) {
            return <pw.Widget>[
              pw.Stack(children: <pw.Widget>[
                pw.Container(
                  child: pw.Image(_bgm, height: 831, fit: pw.BoxFit.cover),
                ),
                pw.Container(
                  padding: pw.EdgeInsets.only(
                    top: 10,
                  ),
                  child: pw.Row(children: <pw.Widget>[
                    pw.Text('    Check Inventory',
                        style: pw.TextStyle(
                          font: herrvon,
                          fontSize: 50.0,
                        )),
                    pw.SizedBox(
                      width: 750,
                    ),
                    pw.Column(children: <pw.Widget>[
                      pw.Text('POWERED BY'),
                      pw.UrlLink(
                        destination: 'https://www.eutopianlettings.co.uk',
                        child: pw.Text('EUTOPIANLETTINGS.CO.UK'),
                      ),
                    ])
                  ]),
                ),
                pw.Container(
                  padding: pw.EdgeInsets.only(
                    top: 75,
                    left: 30,
                  ),
                  child: pw.Container(
                    padding: pw.EdgeInsets.only(
                      top: 20,
                      left: 150,
                    ),
                    height: 700,
                    width: 1115,
                    decoration: pw.BoxDecoration(
                      color: PdfColor.fromInt(0xffffffff),
                    ),
                    child: pw.Column(
                        mainAxisAlignment: pw.MainAxisAlignment.start,
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: <pw.Widget>[
//      pw.SizedBox(height:100,),
                          pw.Column(
                              mainAxisAlignment: pw.MainAxisAlignment.start,
                              crossAxisAlignment: pw.CrossAxisAlignment.start,
                              children: <pw.Widget>[
                                pw.Container(
                                  height: 40,
                                  width: 370,
                                  decoration: const pw.BoxDecoration(
                                      color: PdfColor.fromInt(0xfff3ded4),
                                      borderRadius: 6),
                                  child: pw.Center(
                                      child: pw.Text('INVENTORY AND CHECK IN: ',
                                          style: pw.TextStyle(
                                            fontSize: 23,
                                          ))),
                                ),
                                pw.SizedBox(
                                  height: 10,
                                ),
                                pw.Container(
                                    padding: pw.EdgeInsets.only(
                                      left: 55,
                                    ),
                                    child: pw.Column(children: <pw.Widget>[
                                      pw.Container(
                                        height: 35,
                                        width: 450,
                                        decoration: const pw.BoxDecoration(
                                            color: PdfColor.fromInt(0xffffffff),
                                            borderRadius: 6),
                                        child: pw.Text(
                                            'Property Address: ${introNotifier.introList.isNotEmpty ? introNotifier.introList.last.description : 'NA'}',
                                            style: pw.TextStyle(
                                              font: alice,
                                              fontSize: 23,
                                            )),
                                      ),
                                      pw.SizedBox(
                                        width: 10,
                                      ),
                                      pw.Container(
                                        height: 35,
                                        width: 450,
                                        decoration: const pw.BoxDecoration(
                                            color: PdfColor.fromInt(0xffffffff),
                                            borderRadius: 6),
                                        child: pw.Text(
                                            'Reference Number: ${introNotifier.introList.isNotEmpty ? introNotifier.introList.last.quantity : 'NA'}',
                                            style: pw.TextStyle(
                                              font: alice,
                                              fontSize: 23,
                                            )),
                                      ),
                                      pw.SizedBox(
                                        width: 10,
                                      ),
                                      pw.Container(
                                        height: 35,
                                        width: 450,
                                        decoration: const pw.BoxDecoration(
                                            color: PdfColor.fromInt(0xffffffff),
                                            borderRadius: 6),
                                        child: pw.Text(
                                            'Date of inspection: ${introNotifier.introList.isNotEmpty ? introNotifier.introList.last.colour : 'NA'}',
                                            style: pw.TextStyle(
                                              font: alice,
                                              fontSize: 23,
                                            )),
                                      ),
                                    ]))
                              ]),
                          pw.SizedBox(
                            height: 10,
                          ),
                          pw.Image(
                            PdfImage.file(pdf.document,
                                bytes: File(introImgNotify
                                        .introImgList.last.imageintro.path)
                                    .readAsBytesSync()),
                            height: 450,
                            width: 750,
                            fit: pw.BoxFit.fill,
                          ),

                        ]),
                  ),
                )
              ]),
            ];
          },
        ));
      }


    }

    writeOnPdfContent() async {
      List content = [];
      if(introNotifier.introList.isNotEmpty || introImgNotify.introImgList.isNotEmpty     ){content.add('EXTERIOR');}
      if (inventKeyNotifier.inventKeyList.isNotEmpty || inventKeyPhNotifier.inventKeyPhList.isNotEmpty) { content.add('KEYS '); }
      if (elecMeterNotifier.elecMeterList.isNotEmpty || elecMeterPhNotifier.elecMeterPhList.isNotEmpty ||
              gasMeterNotifier.gasMeterList.isNotEmpty || gasMeterPhNotifier.gasMeterPhList.isNotEmpty) { content.add('METER READING'); }
      if (smokeDeNotifier.smokeDeList.isNotEmpty || smokeDePhNotifier.smokeDePhList.isNotEmpty) { content.add('SMOKE DETECTOR'); }

      if (kitFrameNotifier.kitFrameList.isNotEmpty || kitFramePhNotifier.kitFramePhList.isNotEmpty || kitExdoorNotifier.kitExdoorList.isNotEmpty ||
          kitExdoorPhNotifier.kitExdoorPhList.isNotEmpty || kitIndoorNotifier.kitIndoorList.isNotEmpty || kitIndoorPhNotifier.kitIndoorPhList.isNotEmpty ||
      kitCeilingNotifier.kitCeilingList.isNotEmpty || kitCeilingPhNotifier.kitCeilingPhList.isNotEmpty || kitLightNotifier.kitLightList.isNotEmpty ||
          kitLightPhNotifier.kitLightPhList.isNotEmpty || kitWallsNotifier.kitWallsList.isNotEmpty || kitWallsPhNotifier.kitWallsPhList.isNotEmpty ||
          kitWindowsNotifier.kitWindowsList.isNotEmpty || kitWindowsPhNotifier.kitWindowsPhList.isNotEmpty ) { content.add('KITCHEN'); }


     /* if (extFrameNotifier.extFrameList.isNotEmpty || extFramePhNotifier.extFramePhList.isNotEmpty) { content.add('Exterior Frames'); }
      if (extExdoorNotifier.extExdoorList.isNotEmpty || extExdoorPhNotifier.extExdoorPhList.isNotEmpty) {content.add('Exterior Doors'); }
      if (extIndoorNotifier.extIndoorList.isNotEmpty || extIndoorPhNotifier.extIndoorPhList.isNotEmpty) { content.add('Interior Doors');}
      if (extCeilingNotifier.extCeilingList.isNotEmpty || extCeilingPhNotifier.extCeilingPhList.isNotEmpty) {content.add('Exterior Ceiling'); }
      if (extLightNotifier.extLightList.isNotEmpty || extLightPhNotifier.extLightPhList.isNotEmpty) {content.add('Exterior Lights'); }
      if (extWallsNotifier.extWallsList.isNotEmpty || extWallsPhNotifier.extWallsPhList.isNotEmpty) {content.add('Exterior Walls'); }
      if (extWindowsNotifier.extWindowsList.isNotEmpty || extWindowsPhNotifier.extWindowsPhList.isNotEmpty) { content.add('Exterior Windows');}
        if (smoFrameNotifier.smoFrameList.isNotEmpty || smoFramePhNotifier.smoFramePhList.isNotEmpty) { content.add('Smote Detecor Frame '); }
      if ( smoExdoorNotifier.smoExdoorList.isNotEmpty || smoExdoorPhNotifier.smoExdoorPhList.isNotEmpty) { content.add('Smote Detecor Door '); }
      if (smoIndoorNotifier.smoIndoorList.isNotEmpty || smoIndoorPhNotifier.smoIndoorPhList.isNotEmpty) { content.add('Smote Detecor Interior '); }
      if ( smoCeilingNotifier.smoCeilingList.isNotEmpty || smoCeilingPhNotifier.smoCeilingPhList.isNotEmpty) { content.add('Smote Detecor Ceiling '); }
      if ( smoLightNotifier.smoLightList.isNotEmpty || smoLightPhNotifier.smoLightPhList.isNotEmpty) { content.add('Smote Detecor Lights '); }
      if (smoWallsNotifier.smoWallsList.isNotEmpty || smoWallsPhNotifier.smoWallsPhList.isNotEmpty) { content.add('Smote Detecor Walls '); }
      if (smoWindowsNotifier.smoWindowsList.isNotEmpty || smoWindowsPhNotifier.smoWindowsPhList.isNotEmpty) { content.add('Smote Detecor Windows '); }
      */
      if (halFrameNotifier.halFrameList.isNotEmpty || halFramePhNotifier.halFramePhList.isNotEmpty || halExdoorNotifier.halExdoorList.isNotEmpty ||
          halExdoorPhNotifier.halExdoorPhList.isNotEmpty || halIndoorNotifier.halIndoorList.isNotEmpty || halIndoorPhNotifier.halIndoorPhList.isNotEmpty ||
          halCeilingNotifier.halCeilingList.isNotEmpty || halCeilingPhNotifier.halCeilingPhList.isNotEmpty || halLightNotifier.halLightList.isNotEmpty ||
          halLightPhNotifier.halLightPhList.isNotEmpty || halWallsNotifier.halWallsList.isNotEmpty || halWallsPhNotifier.halWallsPhList.isNotEmpty ||
          halWindowsNotifier.halWindowsList.isNotEmpty || halWindowsPhNotifier.halWindowsPhList.isNotEmpty ) { content.add('HALLWAYS');}


      if (bedFrameNotifier.bedFrameList.isNotEmpty || bedFramePhNotifier.bedFramePhList.isNotEmpty || bedExdoorNotifier.bedExdoorList.isNotEmpty ||
          bedExdoorPhNotifier.bedExdoorPhList.isNotEmpty || bedIndoorNotifier.bedIndoorList.isNotEmpty || bedIndoorPhNotifier.bedIndoorPhList.isNotEmpty ||
          bedCeilingNotifier.bedCeilingList.isNotEmpty || bedCeilingPhNotifier.bedCeilingPhList.isNotEmpty || bedLightNotifier.bedLightList.isNotEmpty ||
          bedLightPhNotifier.bedLightPhList.isNotEmpty || bedWallsNotifier.bedWallsList.isNotEmpty || bedWallsPhNotifier.bedWallsPhList.isNotEmpty ||
          bedWindowsNotifier.bedWindowsList.isNotEmpty || bedWindowsPhNotifier.bedWindowsPhList.isNotEmpty   ) { content.add('BEDROOMS '); }

      final font = await rootBundle.load("assets/herrvon.ttf");      final herrvon = pw.Font.ttf(font);
      final fonta = await rootBundle.load("assets/alive.ttf");      final alice = pw.Font.ttf(fonta);
      final fontb = await rootBundle.load("assets/arimo.ttf");      final arimo = pw.Font.ttf(fontb);
      var pwtheme = pw.Theme.withFont( base: pw.Font.ttf(await rootBundle.load("assets/arimo.ttf")),  );
      PdfImage _bgm;
      _bgm = PdfImage.file(pdf.document, bytes: (await rootBundle.load('assets/bgm.jpg')).buffer.asUint8List(), );
      pdf.addPage(pw.MultiPage(         theme: pwtheme,         pageFormat: PdfPageFormat.a3.landscape,
        margin: pw.EdgeInsets.all(1),
        build: (pw.Context context) {
          return <pw.Widget>[ pw.Stack(children: <pw.Widget>[
              pw.Container( child: pw.Image(_bgm, height: 831, fit: pw.BoxFit.cover), ),
              pw.Container( padding: pw.EdgeInsets.only(top: 10,),child: pw.Row(children: <pw.Widget>[
                  pw.Text('    Check Inventory', style: pw.TextStyle(font: herrvon,fontSize: 50.0,)), pw.SizedBox(width: 750,                  ),
                  pw.Column(children: <pw.Widget>[
                    pw.Text('POWERED BY'),pw.UrlLink( destination: 'https://www.eutopianlettings.co.uk', child: pw.Text('EUTOPIANLETTINGS.CO.UK'),),])]),
              ),
              pw.Container( padding: pw.EdgeInsets.only(top: 75, left: 30,),
                child: pw.Container(
                  padding: pw.EdgeInsets.only(left: 370,),
                  height: 700,width: 1115,decoration: pw.BoxDecoration(color: PdfColor.fromInt(0xffffffff),                  ),
                  child: pw.Column(
                      mainAxisAlignment: pw.MainAxisAlignment.start,
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: <pw.Widget>[
                        pw.Column(
                            mainAxisAlignment: pw.MainAxisAlignment.start,
                            crossAxisAlignment: pw.CrossAxisAlignment.start,
                            children: <pw.Widget>[
                              pw.Container(
                                height: 40,
                                width: 320,
                                decoration: const pw.BoxDecoration(
                                    color: PdfColor.fromInt(0xfff3ded4),
                                    borderRadius: 6),
                                child: pw.Center(child:pw.Text('Content',
                                            style: pw.TextStyle(fontSize: 23,))),),
pw.Container(height:600, width:320,child:pw.Container(padding:pw.EdgeInsets.only(left:50),child:pw.Row(crossAxisAlignment: pw.CrossAxisAlignment.center,children:<pw.Widget>[pw.Column(
    children:<pw.Widget>[
      pw.ListView.separated(
          separatorBuilder: (_, int index) => pw.Divider(),
          itemCount:content.length,
          itemBuilder:(_, int index){return pw.Text(content[index],style:pw.TextStyle(fontSize:20,),textAlign: pw.TextAlign.left);})
      ,]),/*pw.Column(mainAxisAlignment: pw.MainAxisAlignment.start,
    crossAxisAlignment: pw.CrossAxisAlignment.start,children:<pw.Widget>[
      pw.ListView.separated(
          separatorBuilder: (_, int index) => pw.Divider(),
          itemCount:content.length,
          itemBuilder:(_, int index){
            return pw.Row(children:<pw.Widget>[pw.Text(index), *//*pw.Text('.......     Page -'), pw.Text('${index+1}',style:pw.TextStyle(fontSize:20,))*//*]);
          }
      )
      ,])*/]),),),
                              pw.SizedBox(
                                height: 10,
                              ),
                            ]),
                        pw.SizedBox(
                          height: 10,
                        ),
                      ]),
                ),
              )
            ]),
          ];
        },
      ));
    }

    writeOnPdfExterior() async {
      if (extFrameNotifier.extFrameList.isNotEmpty || extFramePhNotifier.extFramePhList.isNotEmpty) {
        final font = await rootBundle.load("assets/herrvon.ttf"); final herrvon = pw.Font.ttf(font);
        final fonta = await rootBundle.load("assets/alive.ttf");  final alice = pw.Font.ttf(fonta);
        final fontb = await rootBundle.load("assets/arimo.ttf");  final arimo = pw.Font.ttf(fontb);
        var pwtheme = pw.Theme.withFont( base: pw.Font.ttf(await rootBundle.load("assets/arimo.ttf")),);
        PdfImage _bgm;  _bgm = PdfImage.file( pdf.document, bytes: (await rootBundle.load('assets/bgm.jpg')).buffer.asUint8List(), );
        pdf.addPage(pw.MultiPage(theme: pwtheme, pageFormat: PdfPageFormat.a3.landscape, margin: pw.EdgeInsets.all(1),
          build: (pw.Context context) { return <pw.Widget>[pw.Stack(children: <pw.Widget>[pw.Container(child: pw.Image(_bgm, height: 831, fit: pw.BoxFit.cover),),
                pw.Container(padding: pw.EdgeInsets.only(top: 10,), child: pw.Row(children: <pw.Widget>[pw.Text('    Check Inventory',style: pw.TextStyle(
                          font: herrvon, fontSize: 50.0, )),pw.SizedBox( width: 750,), pw.Column(children: <pw.Widget>[pw.Text('POWERED BY'), pw.UrlLink(
                  destination: 'https://www.eutopianlettings.co.uk', child: pw.Text('EUTOPIANLETTINGS.CO.UK'), ), ]) ]), ), pw.Container(
                    padding: pw.EdgeInsets.only(top: 1),child: pw.Column(mainAxisAlignment: pw.MainAxisAlignment.start, crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: <pw.Widget>[ pw.SizedBox(height:100,), pw.Container( padding: pw.EdgeInsets.only(left: 20,), child: pw.Container(padding: pw.EdgeInsets.only
                          (top: 10,left: 10,),decoration: pw.BoxDecoration(color: PdfColor.fromInt(0xffffffff),), height: 40, width: 1145,child: pw.Row(children: <pw.Widget>[
                            pw.Container( height: 35, width: 270,decoration: const pw.BoxDecoration(color: PdfColor.fromInt(0xffc7d0d8), borderRadius: 6),
                                    child: pw.Text('  Exterior Frame : ',
                                        style: pw.TextStyle(font: alice, fontSize: 22)),),pw.SizedBox(width: 15,), pw.Container( height: 35, width: 270,
                                    decoration: const pw.BoxDecoration(color: PdfColor.fromInt(0xfff3ded4), borderRadius: 6), child: pw.Text(
                                        '  Quanity: ${extFrameNotifier.extFrameList.isNotEmpty ? extFrameNotifier.extFrameList.last.quantity : ' NA'}',
                                        style: pw.TextStyle(font: alice,fontSize: 20,)),), pw.SizedBox( width: 15, ), pw.Container(height: 35,width: 270,
                                    decoration: const pw.BoxDecoration( color: PdfColor.fromInt(0xfff3ded4), borderRadius: 6), child: pw.Text(
                                        '  Colour: ${extFrameNotifier.extFrameList.isNotEmpty ? extFrameNotifier.extFrameList.last.colour : ' NA'}',
                                        style: pw.TextStyle( font: alice,fontSize: 20,)),), pw.SizedBox(width: 15,),pw.Container(height: 35, width: 270,
                                    decoration: const pw.BoxDecoration( color: PdfColor.fromInt(0xfff3ded4), borderRadius: 6), child: pw.Text(
                                        '  Cleanliness: ${extFrameNotifier.extFrameList.isNotEmpty ? extFrameNotifier.extFrameList.last.condition : ' NA'}',
                                        style: pw.TextStyle(font: alice,fontSize: 20, )),),])),),pw.Container(padding: pw.EdgeInsets.only(left: 20),
                            child: pw.Container(decoration: pw.BoxDecoration(color: PdfColor.fromInt(0xffffffff),), width: 1145, padding: pw.EdgeInsets.only(left: 8),
                              child: pw.Row(children: <pw.Widget>[ pw.SizedBox(width: 5, ),pw.Container( child: pw.Text(
                                '  Description : ${extFrameNotifier.extFrameList.isNotEmpty ? extFrameNotifier.extFrameList.last.description : '  NA'}',
                                    style: pw.TextStyle(font: alice, fontSize: 20,),),width: 270,height: 630,decoration: pw.BoxDecoration( color: PdfColor.fromInt(0xfff3ded4)), ),
                                pw.Container(height: 670,width: 870,child: pw.GridView(crossAxisCount: 2,childAspectRatio: 01.01,children: List<pw.Widget>.generate(
                                      extFramePhNotifier.extFramePhList.length, (int n) {var imag = PdfImage.file( pdf.document, bytes: File(
                                    extFramePhNotifier.extFramePhList[n].photo.path).readAsBytesSync(),);return pw.Container(child: pw.Image(imag, height: 290,
                                                width: 400, fit: pw.BoxFit.cover)); }, ), ), ), ]), ), ), ])), ]), ]; }, )); } //ifelse
      if (extExdoorNotifier.extExdoorList.isNotEmpty || extExdoorPhNotifier.extExdoorPhList.isNotEmpty) {
        final font = await rootBundle.load("assets/herrvon.ttf"); final herrvon = pw.Font.ttf(font);
        final fonta = await rootBundle.load("assets/alive.ttf");  final alice = pw.Font.ttf(fonta);
        final fontb = await rootBundle.load("assets/arimo.ttf");  final arimo = pw.Font.ttf(fontb);
        var pwtheme = pw.Theme.withFont( base: pw.Font.ttf(await rootBundle.load("assets/arimo.ttf")),);
        PdfImage _bgm;  _bgm = PdfImage.file( pdf.document, bytes: (await rootBundle.load('assets/bgm.jpg')).buffer.asUint8List(), );
        pdf.addPage(pw.MultiPage(theme: pwtheme, pageFormat: PdfPageFormat.a3.landscape, margin: pw.EdgeInsets.all(1),
          build: (pw.Context context) { return <pw.Widget>[pw.Stack(children: <pw.Widget>[pw.Container(child: pw.Image(_bgm, height: 831, fit: pw.BoxFit.cover),),
            pw.Container(padding: pw.EdgeInsets.only(top: 10,), child: pw.Row(children: <pw.Widget>[pw.Text('    Check Inventory',style: pw.TextStyle(
              font: herrvon, fontSize: 50.0, )),pw.SizedBox( width: 750,), pw.Column(children: <pw.Widget>[pw.Text('POWERED BY'), pw.UrlLink(
              destination: 'https://www.eutopianlettings.co.uk', child: pw.Text('EUTOPIANLETTINGS.CO.UK'), ), ]) ]), ), pw.Container(
                padding: pw.EdgeInsets.only(top: 1),child: pw.Column(mainAxisAlignment: pw.MainAxisAlignment.start, crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: <pw.Widget>[ pw.SizedBox(height:100,), pw.Container( padding: pw.EdgeInsets.only(left: 20,), child: pw.Container(padding: pw.EdgeInsets.only
                  (top: 10,left: 10,),decoration: pw.BoxDecoration(color: PdfColor.fromInt(0xffffffff),), height: 40, width: 1145,child: pw.Row(children: <pw.Widget>[
                  pw.Container( height: 35, width: 270,decoration: const pw.BoxDecoration(color: PdfColor.fromInt(0xffc7d0d8), borderRadius: 6),
                    child: pw.Text('  Exterior Door: ',
                        style: pw.TextStyle(font: alice, fontSize: 22)),),pw.SizedBox(width: 15,), pw.Container( height: 35, width: 270,
                    decoration: const pw.BoxDecoration(color: PdfColor.fromInt(0xfff3ded4), borderRadius: 6), child: pw.Text(
                        '  Quanity: ${extExdoorNotifier.extExdoorList.isNotEmpty ? extExdoorNotifier.extExdoorList.last.quantity : ' NA'}',
                        style: pw.TextStyle(font: alice,fontSize: 20,)),), pw.SizedBox( width: 15, ), pw.Container(height: 35,width: 270,
                    decoration: const pw.BoxDecoration( color: PdfColor.fromInt(0xfff3ded4), borderRadius: 6), child: pw.Text(
                        '  Colour: ${extExdoorNotifier.extExdoorList.isNotEmpty ? extExdoorNotifier.extExdoorList.last.colour : ' NA'}',
                        style: pw.TextStyle( font: alice,fontSize: 20,)),), pw.SizedBox(width: 15,),pw.Container(height: 35, width: 270,
                    decoration: const pw.BoxDecoration( color: PdfColor.fromInt(0xfff3ded4), borderRadius: 6), child: pw.Text(
                        '  Cleanliness: ${extExdoorNotifier.extExdoorList.isNotEmpty ? extExdoorNotifier.extExdoorList.last.condition : ' NA'}',
                        style: pw.TextStyle(font: alice,fontSize: 20, )),),])),),pw.Container(padding: pw.EdgeInsets.only(left: 20),
                  child: pw.Container(decoration: pw.BoxDecoration(color: PdfColor.fromInt(0xffffffff),), width: 1145, padding: pw.EdgeInsets.only(left: 8),
                    child: pw.Row(children: <pw.Widget>[ pw.SizedBox(width: 5, ),pw.Container( child: pw.Text(
                      '  Description : ${extExdoorNotifier.extExdoorList.isNotEmpty ? extExdoorNotifier.extExdoorList.last.description : '  NA'}',
                      style: pw.TextStyle(font: alice, fontSize: 20,),),width: 270,height: 630,decoration: pw.BoxDecoration( color: PdfColor.fromInt(0xfff3ded4)), ),
                      pw.Container(height: 670,width: 870,child: pw.GridView(crossAxisCount: 2,childAspectRatio: 01.01,children: List<pw.Widget>.generate(
                        extExdoorPhNotifier.extExdoorPhList.length, (int n) {var imag = PdfImage.file( pdf.document, bytes: File(
                          extExdoorPhNotifier.extExdoorPhList[n].photo.path).readAsBytesSync(),);return pw.Container(child: pw.Image(imag, height: 290,
                          width: 400, fit: pw.BoxFit.cover)); }, ), ), ), ]), ), ), ])), ]), ]; }, )); }
      if (extIndoorNotifier.extIndoorList.isNotEmpty || extIndoorPhNotifier.extIndoorPhList.isNotEmpty) {
        final font = await rootBundle.load("assets/herrvon.ttf"); final herrvon = pw.Font.ttf(font);
        final fonta = await rootBundle.load("assets/alive.ttf");  final alice = pw.Font.ttf(fonta);
        final fontb = await rootBundle.load("assets/arimo.ttf");  final arimo = pw.Font.ttf(fontb);
        var pwtheme = pw.Theme.withFont( base: pw.Font.ttf(await rootBundle.load("assets/arimo.ttf")),);
        PdfImage _bgm;  _bgm = PdfImage.file( pdf.document, bytes: (await rootBundle.load('assets/bgm.jpg')).buffer.asUint8List(), );
        pdf.addPage(pw.MultiPage(theme: pwtheme, pageFormat: PdfPageFormat.a3.landscape, margin: pw.EdgeInsets.all(1),
          build: (pw.Context context) { return <pw.Widget>[pw.Stack(children: <pw.Widget>[pw.Container(child: pw.Image(_bgm, height: 831, fit: pw.BoxFit.cover),),
            pw.Container(padding: pw.EdgeInsets.only(top: 10,), child: pw.Row(children: <pw.Widget>[pw.Text('    Check Inventory',style: pw.TextStyle(
              font: herrvon, fontSize: 50.0, )),pw.SizedBox( width: 750,), pw.Column(children: <pw.Widget>[pw.Text('POWERED BY'), pw.UrlLink(
              destination: 'https://www.eutopianlettings.co.uk', child: pw.Text('EUTOPIANLETTINGS.CO.UK'), ), ]) ]), ), pw.Container(
                padding: pw.EdgeInsets.only(top: 1),child: pw.Column(mainAxisAlignment: pw.MainAxisAlignment.start, crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: <pw.Widget>[ pw.SizedBox(height:100,), pw.Container( padding: pw.EdgeInsets.only(left: 20,), child: pw.Container(padding: pw.EdgeInsets.only
                  (top: 10,left: 10,),decoration: pw.BoxDecoration(color: PdfColor.fromInt(0xffffffff),), height: 40, width: 1145,child: pw.Row(children: <pw.Widget>[
                  pw.Container( height: 35, width: 270,decoration: const pw.BoxDecoration(color: PdfColor.fromInt(0xffc7d0d8), borderRadius: 6),
                    child: pw.Text('  Exterior Interior Door: ',
                        style: pw.TextStyle(font: alice, fontSize: 22)),),pw.SizedBox(width: 15,), pw.Container( height: 35, width: 270,
                    decoration: const pw.BoxDecoration(color: PdfColor.fromInt(0xfff3ded4), borderRadius: 6), child: pw.Text(
                        '  Quanity: ${extIndoorNotifier.extIndoorList.isNotEmpty ? extIndoorNotifier.extIndoorList.last.quantity : ' NA'}',
                        style: pw.TextStyle(font: alice,fontSize: 20,)),), pw.SizedBox( width: 15, ), pw.Container(height: 35,width: 270,
                    decoration: const pw.BoxDecoration( color: PdfColor.fromInt(0xfff3ded4), borderRadius: 6), child: pw.Text(
                        '  Colour: ${extIndoorNotifier.extIndoorList.isNotEmpty ? extIndoorNotifier.extIndoorList.last.colour : ' NA'}',
                        style: pw.TextStyle( font: alice,fontSize: 20,)),), pw.SizedBox(width: 15,),pw.Container(height: 35, width: 270,
                    decoration: const pw.BoxDecoration( color: PdfColor.fromInt(0xfff3ded4), borderRadius: 6), child: pw.Text(
                        '  Cleanliness: ${extIndoorNotifier.extIndoorList.isNotEmpty ? extIndoorNotifier.extIndoorList.last.condition : ' NA'}',
                        style: pw.TextStyle(font: alice,fontSize: 20, )),),])),),pw.Container(padding: pw.EdgeInsets.only(left: 20),
                  child: pw.Container(decoration: pw.BoxDecoration(color: PdfColor.fromInt(0xffffffff),), width: 1145, padding: pw.EdgeInsets.only(left: 8),
                    child: pw.Row(children: <pw.Widget>[ pw.SizedBox(width: 5, ),pw.Container( child: pw.Text(
                      '  Description : ${extIndoorNotifier.extIndoorList.isNotEmpty ? extIndoorNotifier.extIndoorList.last.description : '  NA'}',
                      style: pw.TextStyle(font: alice, fontSize: 20,),),width: 270,height: 630,decoration: pw.BoxDecoration( color: PdfColor.fromInt(0xfff3ded4)), ),
                      pw.Container(height: 670,width: 870,child: pw.GridView(crossAxisCount: 2,childAspectRatio: 01.01,children: List<pw.Widget>.generate(
                        extIndoorPhNotifier.extIndoorPhList.length, (int n) {var imag = PdfImage.file( pdf.document, bytes: File(
                          extIndoorPhNotifier.extIndoorPhList[n].photo.path).readAsBytesSync(),);return pw.Container(child: pw.Image(imag, height: 290,
                          width: 400, fit: pw.BoxFit.cover)); }, ), ), ), ]), ), ), ])), ]), ]; }, )); }
      if (extCeilingNotifier.extCeilingList.isNotEmpty || extCeilingPhNotifier.extCeilingPhList.isNotEmpty) {
        final font = await rootBundle.load("assets/herrvon.ttf"); final herrvon = pw.Font.ttf(font);
        final fonta = await rootBundle.load("assets/alive.ttf");  final alice = pw.Font.ttf(fonta);
        final fontb = await rootBundle.load("assets/arimo.ttf");  final arimo = pw.Font.ttf(fontb);
        var pwtheme = pw.Theme.withFont( base: pw.Font.ttf(await rootBundle.load("assets/arimo.ttf")),);
        PdfImage _bgm;  _bgm = PdfImage.file( pdf.document, bytes: (await rootBundle.load('assets/bgm.jpg')).buffer.asUint8List(), );
        pdf.addPage(pw.MultiPage(theme: pwtheme, pageFormat: PdfPageFormat.a3.landscape, margin: pw.EdgeInsets.all(1),
          build: (pw.Context context) { return <pw.Widget>[pw.Stack(children: <pw.Widget>[pw.Container(child: pw.Image(_bgm, height: 831, fit: pw.BoxFit.cover),),
            pw.Container(padding: pw.EdgeInsets.only(top: 10,), child: pw.Row(children: <pw.Widget>[pw.Text('    Check Inventory',style: pw.TextStyle(
              font: herrvon, fontSize: 50.0, )),pw.SizedBox( width: 750,), pw.Column(children: <pw.Widget>[pw.Text('POWERED BY'), pw.UrlLink(
              destination: 'https://www.eutopianlettings.co.uk', child: pw.Text('EUTOPIANLETTINGS.CO.UK'), ), ]) ]), ), pw.Container(
                padding: pw.EdgeInsets.only(top: 1),child: pw.Column(mainAxisAlignment: pw.MainAxisAlignment.start, crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: <pw.Widget>[ pw.SizedBox(height:100,), pw.Container( padding: pw.EdgeInsets.only(left: 20,), child: pw.Container(padding: pw.EdgeInsets.only
                  (top: 10,left: 10,),decoration: pw.BoxDecoration(color: PdfColor.fromInt(0xffffffff),), height: 40, width: 1145,child: pw.Row(children: <pw.Widget>[
                  pw.Container( height: 35, width: 270,decoration: const pw.BoxDecoration(color: PdfColor.fromInt(0xffc7d0d8), borderRadius: 6),
                    child: pw.Text('  Exterior Ceiling: ',
                        style: pw.TextStyle(font: alice, fontSize: 22)),),pw.SizedBox(width: 15,), pw.Container( height: 35, width: 270,
                    decoration: const pw.BoxDecoration(color: PdfColor.fromInt(0xfff3ded4), borderRadius: 6), child: pw.Text(
                        '  Quanity: ${extCeilingNotifier.extCeilingList.isNotEmpty ? extCeilingNotifier.extCeilingList.last.quantity : ' NA'}',
                        style: pw.TextStyle(font: alice,fontSize: 20,)),), pw.SizedBox( width: 15, ), pw.Container(height: 35,width: 270,
                    decoration: const pw.BoxDecoration( color: PdfColor.fromInt(0xfff3ded4), borderRadius: 6), child: pw.Text(
                        '  Colour: ${extCeilingNotifier.extCeilingList.isNotEmpty ? extCeilingNotifier.extCeilingList.last.colour : ' NA'}',
                        style: pw.TextStyle( font: alice,fontSize: 20,)),), pw.SizedBox(width: 15,),pw.Container(height: 35, width: 270,
                    decoration: const pw.BoxDecoration( color: PdfColor.fromInt(0xfff3ded4), borderRadius: 6), child: pw.Text(
                        '  Cleanliness: ${extCeilingNotifier.extCeilingList.isNotEmpty ? extCeilingNotifier.extCeilingList.last.condition : ' NA'}',
                        style: pw.TextStyle(font: alice,fontSize: 20, )),),])),),pw.Container(padding: pw.EdgeInsets.only(left: 20),
                  child: pw.Container(decoration: pw.BoxDecoration(color: PdfColor.fromInt(0xffffffff),), width: 1145, padding: pw.EdgeInsets.only(left: 8),
                    child: pw.Row(children: <pw.Widget>[ pw.SizedBox(width: 5, ),pw.Container( child: pw.Text(
                      '  Description : ${extCeilingNotifier.extCeilingList.isNotEmpty ? extCeilingNotifier.extCeilingList.last.description : '  NA'}',
                      style: pw.TextStyle(font: alice, fontSize: 20,),),width: 270,height: 630,decoration: pw.BoxDecoration( color: PdfColor.fromInt(0xfff3ded4)), ),
                      pw.Container(height: 670,width: 870,child: pw.GridView(crossAxisCount: 2,childAspectRatio: 01.01,children: List<pw.Widget>.generate(
                        extCeilingPhNotifier.extCeilingPhList.length, (int n) {var imag = PdfImage.file( pdf.document, bytes: File(
                          extCeilingPhNotifier.extCeilingPhList[n].photo.path).readAsBytesSync(),);return pw.Container(child: pw.Image(imag, height: 290,
                          width: 400, fit: pw.BoxFit.cover)); }, ), ), ), ]), ), ), ])), ]), ]; }, )); }
      if (extLightNotifier.extLightList.isNotEmpty || extLightPhNotifier.extLightPhList.isNotEmpty) {
        final font = await rootBundle.load("assets/herrvon.ttf"); final herrvon = pw.Font.ttf(font);
        final fonta = await rootBundle.load("assets/alive.ttf");  final alice = pw.Font.ttf(fonta);
        final fontb = await rootBundle.load("assets/arimo.ttf");  final arimo = pw.Font.ttf(fontb);
        var pwtheme = pw.Theme.withFont( base: pw.Font.ttf(await rootBundle.load("assets/arimo.ttf")),);
        PdfImage _bgm;  _bgm = PdfImage.file( pdf.document, bytes: (await rootBundle.load('assets/bgm.jpg')).buffer.asUint8List(), );
        pdf.addPage(pw.MultiPage(theme: pwtheme, pageFormat: PdfPageFormat.a3.landscape, margin: pw.EdgeInsets.all(1),
          build: (pw.Context context) { return <pw.Widget>[pw.Stack(children: <pw.Widget>[pw.Container(child: pw.Image(_bgm, height: 831, fit: pw.BoxFit.cover),),
            pw.Container(padding: pw.EdgeInsets.only(top: 10,), child: pw.Row(children: <pw.Widget>[pw.Text('    Check Inventory',style: pw.TextStyle(
              font: herrvon, fontSize: 50.0, )),pw.SizedBox( width: 750,), pw.Column(children: <pw.Widget>[pw.Text('POWERED BY'), pw.UrlLink(
              destination: 'https://www.eutopianlettings.co.uk', child: pw.Text('EUTOPIANLETTINGS.CO.UK'), ), ]) ]), ), pw.Container(
                padding: pw.EdgeInsets.only(top: 1),child: pw.Column(mainAxisAlignment: pw.MainAxisAlignment.start, crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: <pw.Widget>[ pw.SizedBox(height:100,), pw.Container( padding: pw.EdgeInsets.only(left: 20,), child: pw.Container(padding: pw.EdgeInsets.only
                  (top: 10,left: 10,),decoration: pw.BoxDecoration(color: PdfColor.fromInt(0xffffffff),), height: 40, width: 1145,child: pw.Row(children: <pw.Widget>[
                  pw.Container( height: 35, width: 270,decoration: const pw.BoxDecoration(color: PdfColor.fromInt(0xffc7d0d8), borderRadius: 6),
                    child: pw.Text('  Exterior Light: ',
                        style: pw.TextStyle(font: alice, fontSize: 22)),),pw.SizedBox(width: 15,), pw.Container( height: 35, width: 270,
                    decoration: const pw.BoxDecoration(color: PdfColor.fromInt(0xfff3ded4), borderRadius: 6), child: pw.Text(
                        '  Quanity: ${extLightNotifier.extLightList.isNotEmpty ? extLightNotifier.extLightList.last.quantity : ' NA'}',
                        style: pw.TextStyle(font: alice,fontSize: 20,)),), pw.SizedBox( width: 15, ), pw.Container(height: 35,width: 270,
                    decoration: const pw.BoxDecoration( color: PdfColor.fromInt(0xfff3ded4), borderRadius: 6), child: pw.Text(
                        '  Colour: ${extLightNotifier.extLightList.isNotEmpty ? extLightNotifier.extLightList.last.colour : ' NA'}',
                        style: pw.TextStyle( font: alice,fontSize: 20,)),), pw.SizedBox(width: 15,),pw.Container(height: 35, width: 270,
                    decoration: const pw.BoxDecoration( color: PdfColor.fromInt(0xfff3ded4), borderRadius: 6), child: pw.Text(
                        '  Cleanliness: ${extLightNotifier.extLightList.isNotEmpty ? extLightNotifier.extLightList.last.condition : ' NA'}',
                        style: pw.TextStyle(font: alice,fontSize: 20, )),),])),),pw.Container(padding: pw.EdgeInsets.only(left: 20),
                  child: pw.Container(decoration: pw.BoxDecoration(color: PdfColor.fromInt(0xffffffff),), width: 1145, padding: pw.EdgeInsets.only(left: 8),
                    child: pw.Row(children: <pw.Widget>[ pw.SizedBox(width: 5, ),pw.Container( child: pw.Text(
                      '  Description : ${extLightNotifier.extLightList.isNotEmpty ? extLightNotifier.extLightList.last.description : '  NA'}',
                      style: pw.TextStyle(font: alice, fontSize: 20,),),width: 270,height: 630,decoration: pw.BoxDecoration( color: PdfColor.fromInt(0xfff3ded4)), ),
                      pw.Container(height: 670,width: 870,child: pw.GridView(crossAxisCount: 2,childAspectRatio: 01.01,children: List<pw.Widget>.generate(
                        extLightPhNotifier.extLightPhList.length, (int n) {var imag = PdfImage.file( pdf.document, bytes: File(
                          extLightPhNotifier.extLightPhList[n].photo.path).readAsBytesSync(),);return pw.Container(child: pw.Image(imag, height: 290,
                          width: 400, fit: pw.BoxFit.cover)); }, ), ), ), ]), ), ), ])), ]), ]; }, )); }
      if (extWallsNotifier.extWallsList.isNotEmpty || extWallsPhNotifier.extWallsPhList.isNotEmpty) {
        final font = await rootBundle.load("assets/herrvon.ttf"); final herrvon = pw.Font.ttf(font);
        final fonta = await rootBundle.load("assets/alive.ttf");  final alice = pw.Font.ttf(fonta);
        final fontb = await rootBundle.load("assets/arimo.ttf");  final arimo = pw.Font.ttf(fontb);
        var pwtheme = pw.Theme.withFont( base: pw.Font.ttf(await rootBundle.load("assets/arimo.ttf")),);
        PdfImage _bgm;  _bgm = PdfImage.file( pdf.document, bytes: (await rootBundle.load('assets/bgm.jpg')).buffer.asUint8List(), );
        pdf.addPage(pw.MultiPage(theme: pwtheme, pageFormat: PdfPageFormat.a3.landscape, margin: pw.EdgeInsets.all(1),
          build: (pw.Context context) { return <pw.Widget>[pw.Stack(children: <pw.Widget>[pw.Container(child: pw.Image(_bgm, height: 831, fit: pw.BoxFit.cover),),
            pw.Container(padding: pw.EdgeInsets.only(top: 10,), child: pw.Row(children: <pw.Widget>[pw.Text('    Check Inventory',style: pw.TextStyle(
              font: herrvon, fontSize: 50.0, )),pw.SizedBox( width: 750,), pw.Column(children: <pw.Widget>[pw.Text('POWERED BY'), pw.UrlLink(
              destination: 'https://www.eutopianlettings.co.uk', child: pw.Text('EUTOPIANLETTINGS.CO.UK'), ), ]) ]), ), pw.Container(
                padding: pw.EdgeInsets.only(top: 1),child: pw.Column(mainAxisAlignment: pw.MainAxisAlignment.start, crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: <pw.Widget>[ pw.SizedBox(height:100,), pw.Container( padding: pw.EdgeInsets.only(left: 20,), child: pw.Container(padding: pw.EdgeInsets.only
                  (top: 10,left: 10,),decoration: pw.BoxDecoration(color: PdfColor.fromInt(0xffffffff),), height: 40, width: 1145,child: pw.Row(children: <pw.Widget>[
                  pw.Container( height: 35, width: 270,decoration: const pw.BoxDecoration(color: PdfColor.fromInt(0xffc7d0d8), borderRadius: 6),
                    child: pw.Text('  Exterior Walls: ',
                        style: pw.TextStyle(font: alice, fontSize: 22)),),pw.SizedBox(width: 15,), pw.Container( height: 35, width: 270,
                    decoration: const pw.BoxDecoration(color: PdfColor.fromInt(0xfff3ded4), borderRadius: 6), child: pw.Text(
                        '  Quanity: ${extWallsNotifier.extWallsList.isNotEmpty ? extWallsNotifier.extWallsList.last.quantity : ' NA'}',
                        style: pw.TextStyle(font: alice,fontSize: 20,)),), pw.SizedBox( width: 15, ), pw.Container(height: 35,width: 270,
                    decoration: const pw.BoxDecoration( color: PdfColor.fromInt(0xfff3ded4), borderRadius: 6), child: pw.Text(
                        '  Colour: ${extWallsNotifier.extWallsList.isNotEmpty ? extWallsNotifier.extWallsList.last.colour : ' NA'}',
                        style: pw.TextStyle( font: alice,fontSize: 20,)),), pw.SizedBox(width: 15,),pw.Container(height: 35, width: 270,
                    decoration: const pw.BoxDecoration( color: PdfColor.fromInt(0xfff3ded4), borderRadius: 6), child: pw.Text(
                        '  Cleanliness: ${extWallsNotifier.extWallsList.isNotEmpty ? extWallsNotifier.extWallsList.last.condition : ' NA'}',
                        style: pw.TextStyle(font: alice,fontSize: 20, )),),])),),pw.Container(padding: pw.EdgeInsets.only(left: 20),
                  child: pw.Container(decoration: pw.BoxDecoration(color: PdfColor.fromInt(0xffffffff),), width: 1145, padding: pw.EdgeInsets.only(left: 8),
                    child: pw.Row(children: <pw.Widget>[ pw.SizedBox(width: 5, ),pw.Container( child: pw.Text(
                      '  Description : ${extWallsNotifier.extWallsList.isNotEmpty ? extWallsNotifier.extWallsList.last.description : '  NA'}',
                      style: pw.TextStyle(font: alice, fontSize: 20,),),width: 270,height: 630,decoration: pw.BoxDecoration( color: PdfColor.fromInt(0xfff3ded4)), ),
                      pw.Container(height: 670,width: 870,child: pw.GridView(crossAxisCount: 2,childAspectRatio: 01.01,children: List<pw.Widget>.generate(
                        extWallsPhNotifier.extWallsPhList.length, (int n) {var imag = PdfImage.file( pdf.document, bytes: File(
                          extWallsPhNotifier.extWallsPhList[n].photo.path).readAsBytesSync(),);return pw.Container(child: pw.Image(imag, height: 290,
                          width: 400, fit: pw.BoxFit.cover)); }, ), ), ), ]), ), ), ])), ]), ]; }, )); }
      if (extWindowsNotifier.extWindowsList.isNotEmpty || extWindowsPhNotifier.extWindowsPhList.isNotEmpty) {
        final font = await rootBundle.load("assets/herrvon.ttf"); final herrvon = pw.Font.ttf(font);
        final fonta = await rootBundle.load("assets/alive.ttf");  final alice = pw.Font.ttf(fonta);
        final fontb = await rootBundle.load("assets/arimo.ttf");  final arimo = pw.Font.ttf(fontb);
        var pwtheme = pw.Theme.withFont( base: pw.Font.ttf(await rootBundle.load("assets/arimo.ttf")),);
        PdfImage _bgm;  _bgm = PdfImage.file( pdf.document, bytes: (await rootBundle.load('assets/bgm.jpg')).buffer.asUint8List(), );
        pdf.addPage(pw.MultiPage(theme: pwtheme, pageFormat: PdfPageFormat.a3.landscape, margin: pw.EdgeInsets.all(1),
          build: (pw.Context context) { return <pw.Widget>[pw.Stack(children: <pw.Widget>[pw.Container(child: pw.Image(_bgm, height: 831, fit: pw.BoxFit.cover),),
            pw.Container(padding: pw.EdgeInsets.only(top: 10,), child: pw.Row(children: <pw.Widget>[pw.Text('    Check Inventory',style: pw.TextStyle(
              font: herrvon, fontSize: 50.0, )),pw.SizedBox( width: 750,), pw.Column(children: <pw.Widget>[pw.Text('POWERED BY'), pw.UrlLink(
              destination: 'https://www.eutopianlettings.co.uk', child: pw.Text('EUTOPIANLETTINGS.CO.UK'), ), ]) ]), ), pw.Container(
                padding: pw.EdgeInsets.only(top: 100),child: pw.Column(mainAxisAlignment: pw.MainAxisAlignment.start, crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: <pw.Widget>[ pw.SizedBox(height:100,), pw.Container( padding: pw.EdgeInsets.only(left: 20,), child: pw.Container(padding: pw.EdgeInsets.only
                  (top: 10,left: 10,),decoration: pw.BoxDecoration(color: PdfColor.fromInt(0xffffffff),), height: 40, width: 1145,child: pw.Row(children: <pw.Widget>[
                  pw.Container( height: 35, width: 270,decoration: const pw.BoxDecoration(color: PdfColor.fromInt(0xffc7d0d8), borderRadius: 6),
                    child: pw.Text('  Exterior Windows: ',
                        style: pw.TextStyle(font: alice, fontSize: 22)),),pw.SizedBox(width: 15,), pw.Container( height: 35, width: 270,
                    decoration: const pw.BoxDecoration(color: PdfColor.fromInt(0xfff3ded4), borderRadius: 6), child: pw.Text(
                        '  Quanity: ${extWindowsNotifier.extWindowsList.isNotEmpty ? extWindowsNotifier.extWindowsList.last.quantity : ' NA'}',
                        style: pw.TextStyle(font: alice,fontSize: 20,)),), pw.SizedBox( width: 15, ), pw.Container(height: 35,width: 270,
                    decoration: const pw.BoxDecoration( color: PdfColor.fromInt(0xfff3ded4), borderRadius: 6), child: pw.Text(
                        '  Colour: ${extWindowsNotifier.extWindowsList.isNotEmpty ? extWindowsNotifier.extWindowsList.last.colour : ' NA'}',
                        style: pw.TextStyle( font: alice,fontSize: 20,)),), pw.SizedBox(width: 15,),pw.Container(height: 35, width: 270,
                    decoration: const pw.BoxDecoration( color: PdfColor.fromInt(0xfff3ded4), borderRadius: 6), child: pw.Text(
                        '  Cleanliness: ${extWindowsNotifier.extWindowsList.isNotEmpty ? extWindowsNotifier.extWindowsList.last.condition : ' NA'}',
                        style: pw.TextStyle(font: alice,fontSize: 20, )),),])),),pw.Container(padding: pw.EdgeInsets.only(left: 20),
                  child: pw.Container(decoration: pw.BoxDecoration(color: PdfColor.fromInt(0xffffffff),), width: 1145, padding: pw.EdgeInsets.only(left: 8),
                    child: pw.Row(children: <pw.Widget>[ pw.SizedBox(width: 5, ),pw.Container( child: pw.Text(
                      '  Description : ${extWindowsNotifier.extWindowsList.isNotEmpty ? extWindowsNotifier.extWindowsList.last.description : '  NA'}',
                      style: pw.TextStyle(font: alice, fontSize: 20,),),width: 270,height: 630,decoration: pw.BoxDecoration( color: PdfColor.fromInt(0xfff3ded4)), ),
                      pw.Container(height: 670,width: 870,child: pw.GridView(crossAxisCount: 2,childAspectRatio: 01.01,children: List<pw.Widget>.generate(
                        extWindowsPhNotifier.extWindowsPhList.length, (int n) {var imag = PdfImage.file( pdf.document, bytes: File(
                          extWindowsPhNotifier.extWindowsPhList[n].photo.path).readAsBytesSync(),);return pw.Container(child: pw.Image(imag, height: 290,
                          width: 400, fit: pw.BoxFit.cover)); }, ), ), ), ]), ), ), ])), ]), ]; }, )); }
    }

    writeOnPdfHallway() async {
      if (halFrameNotifier.halFrameList.isNotEmpty || halFramePhNotifier.halFramePhList.isNotEmpty) {
        final font = await rootBundle.load("assets/herrvon.ttf"); final herrvon = pw.Font.ttf(font);
        final fonta = await rootBundle.load("assets/alive.ttf");  final alice = pw.Font.ttf(fonta);
        final fontb = await rootBundle.load("assets/arimo.ttf");  final arimo = pw.Font.ttf(fontb);
        var pwtheme = pw.Theme.withFont( base: pw.Font.ttf(await rootBundle.load("assets/arimo.ttf")),);
        PdfImage _bgm;  _bgm = PdfImage.file( pdf.document, bytes: (await rootBundle.load('assets/bgm.jpg')).buffer.asUint8List(), );
        pdf.addPage(pw.MultiPage(theme: pwtheme, pageFormat: PdfPageFormat.a3.landscape, margin: pw.EdgeInsets.all(1),
          build: (pw.Context context) { return <pw.Widget>[pw.Stack(children: <pw.Widget>[pw.Container(child: pw.Image(_bgm, height: 831, fit: pw.BoxFit.cover),),
            pw.Container(padding: pw.EdgeInsets.only(top: 10,), child: pw.Row(children: <pw.Widget>[pw.Text('    Check Inventory',style: pw.TextStyle(
              font: herrvon, fontSize: 50.0, )),pw.SizedBox( width: 750,), pw.Column(children: <pw.Widget>[pw.Text('POWERED BY'), pw.UrlLink(
              destination: 'https://www.eutopianlettings.co.uk', child: pw.Text('EUTOPIANLETTINGS.CO.UK'), ), ]) ]), ), pw.Container(
                padding: pw.EdgeInsets.only(top: 1),child: pw.Column(mainAxisAlignment: pw.MainAxisAlignment.start, crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: <pw.Widget>[ pw.SizedBox(height:100,), pw.Container( padding: pw.EdgeInsets.only(left: 20,), child: pw.Container(padding: pw.EdgeInsets.only
                  (top: 10,left: 10,),decoration: pw.BoxDecoration(color: PdfColor.fromInt(0xffffffff),), height: 40, width: 1145,child: pw.Row(children: <pw.Widget>[
                  pw.Container( height: 35, width: 270,decoration: const pw.BoxDecoration(color: PdfColor.fromInt(0xffc7d0d8), borderRadius: 6),
                    child: pw.Text('  HALLWAYS DOORS & FRAME: ',
                        style: pw.TextStyle(font: alice, fontSize: 22)),),pw.SizedBox(width: 15,), pw.Container( height: 35, width: 270,
                    decoration: const pw.BoxDecoration(color: PdfColor.fromInt(0xfff3ded4), borderRadius: 6), child: pw.Text(
                        '  Quanity: ${halFrameNotifier.halFrameList.isNotEmpty ? halFrameNotifier.halFrameList.last.quantity : ' NA'}',
                        style: pw.TextStyle(font: alice,fontSize: 20,)),), pw.SizedBox( width: 15, ), pw.Container(height: 35,width: 270,
                    decoration: const pw.BoxDecoration( color: PdfColor.fromInt(0xfff3ded4), borderRadius: 6), child: pw.Text(
                        '  Colour: ${halFrameNotifier.halFrameList.isNotEmpty ? halFrameNotifier.halFrameList.last.colour : ' NA'}',
                        style: pw.TextStyle( font: alice,fontSize: 20,)),), pw.SizedBox(width: 15,),pw.Container(height: 35, width: 270,
                    decoration: const pw.BoxDecoration( color: PdfColor.fromInt(0xfff3ded4), borderRadius: 6), child: pw.Text(
                        '  Cleanliness: ${halFrameNotifier.halFrameList.isNotEmpty ? halFrameNotifier.halFrameList.last.condition : ' NA'}',
                        style: pw.TextStyle(font: alice,fontSize: 20, )),),])),),pw.Container(padding: pw.EdgeInsets.only(left: 20),
                  child: pw.Container(decoration: pw.BoxDecoration(color: PdfColor.fromInt(0xffffffff),), width: 1145, padding: pw.EdgeInsets.only(left: 8),
                    child: pw.Row(children: <pw.Widget>[ pw.SizedBox(width: 5, ),pw.Container( child: pw.Text(
                      '  Description : ${halFrameNotifier.halFrameList.isNotEmpty ? halFrameNotifier.halFrameList.last.description : '  NA'}',
                      style: pw.TextStyle(font: alice, fontSize: 20,),),width: 270,height: 630,decoration: pw.BoxDecoration( color: PdfColor.fromInt(0xfff3ded4)), ),
                      pw.Container(height: 670,width: 870,child: pw.GridView(crossAxisCount: 2,childAspectRatio: 01.01,children: List<pw.Widget>.generate(
                        halFramePhNotifier.halFramePhList.length, (int n) {var imag = PdfImage.file( pdf.document, bytes: File(
                          halFramePhNotifier.halFramePhList[n].photo.path).readAsBytesSync(),);return pw.Container(child: pw.Image(imag, height: 290,
                          width: 400, fit: pw.BoxFit.contain)); }, ), ), ), ]), ), ), ])), ]), ]; }, )); }
      if (halExdoorNotifier.halExdoorList.isNotEmpty || halExdoorPhNotifier.halExdoorPhList.isNotEmpty) {
        final font = await rootBundle.load("assets/herrvon.ttf"); final herrvon = pw.Font.ttf(font);
        final fonta = await rootBundle.load("assets/alive.ttf");  final alice = pw.Font.ttf(fonta);
        final fontb = await rootBundle.load("assets/arimo.ttf");  final arimo = pw.Font.ttf(fontb);
        var pwtheme = pw.Theme.withFont( base: pw.Font.ttf(await rootBundle.load("assets/arimo.ttf")),);
        PdfImage _bgm;  _bgm = PdfImage.file( pdf.document, bytes: (await rootBundle.load('assets/bgm.jpg')).buffer.asUint8List(), );
        pdf.addPage(pw.MultiPage(theme: pwtheme, pageFormat: PdfPageFormat.a3.landscape, margin: pw.EdgeInsets.all(1),
          build: (pw.Context context) { return <pw.Widget>[pw.Stack(children: <pw.Widget>[pw.Container(child: pw.Image(_bgm, height: 831, fit: pw.BoxFit.cover),),
            pw.Container(padding: pw.EdgeInsets.only(top: 10,), child: pw.Row(children: <pw.Widget>[pw.Text('    Check Inventory',style: pw.TextStyle(
              font: herrvon, fontSize: 50.0, )),pw.SizedBox( width: 750,), pw.Column(children: <pw.Widget>[pw.Text('POWERED BY'), pw.UrlLink(
              destination: 'https://www.eutopianlettings.co.uk', child: pw.Text('EUTOPIANLETTINGS.CO.UK'), ), ]) ]), ), pw.Container(
                padding: pw.EdgeInsets.only(top: 1),child: pw.Column(mainAxisAlignment: pw.MainAxisAlignment.start, crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: <pw.Widget>[ pw.SizedBox(height:100,), pw.Container( padding: pw.EdgeInsets.only(left: 20,), child: pw.Container(padding: pw.EdgeInsets.only
                  (top: 10,left: 10,),decoration: pw.BoxDecoration(color: PdfColor.fromInt(0xffffffff),), height: 40, width: 1145,child: pw.Row(children: <pw.Widget>[
                  pw.Container( height: 35, width: 270,decoration: const pw.BoxDecoration(color: PdfColor.fromInt(0xffc7d0d8), borderRadius: 6),
                    child: pw.Text('  HALLWAY DOOR EXTERIOR: ',
                        style: pw.TextStyle(font: alice, fontSize: 22)),),pw.SizedBox(width: 15,), pw.Container( height: 35, width: 270,
                    decoration: const pw.BoxDecoration(color: PdfColor.fromInt(0xfff3ded4), borderRadius: 6), child: pw.Text(
                        '  Quanity: ${halExdoorNotifier.halExdoorList.isNotEmpty ? halExdoorNotifier.halExdoorList.last.quantity : ' NA'}',
                        style: pw.TextStyle(font: alice,fontSize: 20,)),), pw.SizedBox( width: 15, ), pw.Container(height: 35,width: 270,
                    decoration: const pw.BoxDecoration( color: PdfColor.fromInt(0xfff3ded4), borderRadius: 6), child: pw.Text(
                        '  Colour: ${halExdoorNotifier.halExdoorList.isNotEmpty ? halExdoorNotifier.halExdoorList.last.colour : ' NA'}',
                        style: pw.TextStyle( font: alice,fontSize: 20,)),), pw.SizedBox(width: 15,),pw.Container(height: 35, width: 270,
                    decoration: const pw.BoxDecoration( color: PdfColor.fromInt(0xfff3ded4), borderRadius: 6), child: pw.Text(
                        '  Cleanliness: ${halExdoorNotifier.halExdoorList.isNotEmpty ? halExdoorNotifier.halExdoorList.last.condition : ' NA'}',
                        style: pw.TextStyle(font: alice,fontSize: 20, )),),])),),pw.Container(padding: pw.EdgeInsets.only(left: 20),
                  child: pw.Container(decoration: pw.BoxDecoration(color: PdfColor.fromInt(0xffffffff),), width: 1145, padding: pw.EdgeInsets.only(left: 8),
                    child: pw.Row(children: <pw.Widget>[ pw.SizedBox(width: 5, ),pw.Container( child: pw.Text(
                      '  Description : ${halExdoorNotifier.halExdoorList.isNotEmpty ? halExdoorNotifier.halExdoorList.last.description : '  NA'}',
                      style: pw.TextStyle(font: alice, fontSize: 20,),),width: 270,height: 630,decoration: pw.BoxDecoration( color: PdfColor.fromInt(0xfff3ded4)), ),
                      pw.Container(height: 670,width: 870,child: pw.GridView(crossAxisCount: 2,childAspectRatio: 01.01,children: List<pw.Widget>.generate(
                        halExdoorPhNotifier.halExdoorPhList.length, (int n) {var imag = PdfImage.file( pdf.document, bytes: File(
                          halExdoorPhNotifier.halExdoorPhList[n].photo.path).readAsBytesSync(),);return pw.Container(child: pw.Image(imag, height: 290,
                          width: 400, fit: pw.BoxFit.contain)); }, ), ), ), ]), ), ), ])), ]), ]; }, )); }

      if (halIndoorNotifier.halIndoorList.isNotEmpty || halIndoorPhNotifier.halIndoorPhList.isNotEmpty) {
        final font = await rootBundle.load("assets/herrvon.ttf"); final herrvon = pw.Font.ttf(font);
        final fonta = await rootBundle.load("assets/alive.ttf");  final alice = pw.Font.ttf(fonta);
        final fontb = await rootBundle.load("assets/arimo.ttf");  final arimo = pw.Font.ttf(fontb);
        var pwtheme = pw.Theme.withFont( base: pw.Font.ttf(await rootBundle.load("assets/arimo.ttf")),);
        PdfImage _bgm;  _bgm = PdfImage.file( pdf.document, bytes: (await rootBundle.load('assets/bgm.jpg')).buffer.asUint8List(), );
        pdf.addPage(pw.MultiPage(theme: pwtheme, pageFormat: PdfPageFormat.a3.landscape, margin: pw.EdgeInsets.all(1),
          build: (pw.Context context) { return <pw.Widget>[pw.Stack(children: <pw.Widget>[pw.Container(child: pw.Image(_bgm, height: 831, fit: pw.BoxFit.cover),),
            pw.Container(padding: pw.EdgeInsets.only(top: 10,), child: pw.Row(children: <pw.Widget>[pw.Text('    Check Inventory',style: pw.TextStyle(
              font: herrvon, fontSize: 50.0, )),pw.SizedBox( width: 750,), pw.Column(children: <pw.Widget>[pw.Text('POWERED BY'), pw.UrlLink(
              destination: 'https://www.eutopianlettings.co.uk', child: pw.Text('EUTOPIANLETTINGS.CO.UK'), ), ]) ]), ), pw.Container(
                padding: pw.EdgeInsets.only(top: 1),child: pw.Column(mainAxisAlignment: pw.MainAxisAlignment.start, crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: <pw.Widget>[ pw.SizedBox(height:100,), pw.Container( padding: pw.EdgeInsets.only(left: 20,), child: pw.Container(padding: pw.EdgeInsets.only
                  (top: 10,left: 10,),decoration: pw.BoxDecoration(color: PdfColor.fromInt(0xffffffff),), height: 40, width: 1145,child: pw.Row(children: <pw.Widget>[
                  pw.Container( height: 35, width: 270,decoration: const pw.BoxDecoration(color: PdfColor.fromInt(0xffc7d0d8), borderRadius: 6),
                    child: pw.Text('  Hallway Interior Door: ',
                        style: pw.TextStyle(font: alice, fontSize: 22)),),pw.SizedBox(width: 15,), pw.Container( height: 35, width: 270,
                    decoration: const pw.BoxDecoration(color: PdfColor.fromInt(0xfff3ded4), borderRadius: 6), child: pw.Text(
                        '  Quanity: ${halIndoorNotifier.halIndoorList.isNotEmpty ? halIndoorNotifier.halIndoorList.last.quantity : ' NA'}',
                        style: pw.TextStyle(font: alice,fontSize: 20,)),), pw.SizedBox( width: 15, ), pw.Container(height: 35,width: 270,
                    decoration: const pw.BoxDecoration( color: PdfColor.fromInt(0xfff3ded4), borderRadius: 6), child: pw.Text(
                        '  Colour: ${halIndoorNotifier.halIndoorList.isNotEmpty ? halIndoorNotifier.halIndoorList.last.colour : ' NA'}',
                        style: pw.TextStyle( font: alice,fontSize: 20,)),), pw.SizedBox(width: 15,),pw.Container(height: 35, width: 270,
                    decoration: const pw.BoxDecoration( color: PdfColor.fromInt(0xfff3ded4), borderRadius: 6), child: pw.Text(
                        '  Cleanliness: ${halIndoorNotifier.halIndoorList.isNotEmpty ? halIndoorNotifier.halIndoorList.last.condition : ' NA'}',
                        style: pw.TextStyle(font: alice,fontSize: 20, )),),])),),pw.Container(padding: pw.EdgeInsets.only(left: 20),
                  child: pw.Container(decoration: pw.BoxDecoration(color: PdfColor.fromInt(0xffffffff),), width: 1145, padding: pw.EdgeInsets.only(left: 8),
                    child: pw.Row(children: <pw.Widget>[ pw.SizedBox(width: 5, ),pw.Container( child: pw.Text(
                      '  Description : ${halIndoorNotifier.halIndoorList.isNotEmpty ? halIndoorNotifier.halIndoorList.last.description : '  NA'}',
                      style: pw.TextStyle(font: alice, fontSize: 20,),),width: 270,height: 630,decoration: pw.BoxDecoration( color: PdfColor.fromInt(0xfff3ded4)), ),
                      pw.Container(height: 670,width: 870,child: pw.GridView(crossAxisCount: 2,childAspectRatio: 01.01,children: List<pw.Widget>.generate(
                        halIndoorPhNotifier.halIndoorPhList.length, (int n) {var imag = PdfImage.file( pdf.document, bytes: File(
                          halIndoorPhNotifier.halIndoorPhList[n].photo.path).readAsBytesSync(),);return pw.Container(child: pw.Image(imag, height: 290,
                          width: 400, fit: pw.BoxFit.contain)); }, ), ), ), ]), ), ), ])), ]), ]; }, )); }
      if (halCeilingNotifier.halCeilingList.isNotEmpty || halCeilingPhNotifier.halCeilingPhList.isNotEmpty) {
        final font = await rootBundle.load("assets/herrvon.ttf"); final herrvon = pw.Font.ttf(font);
        final fonta = await rootBundle.load("assets/alive.ttf");  final alice = pw.Font.ttf(fonta);
        final fontb = await rootBundle.load("assets/arimo.ttf");  final arimo = pw.Font.ttf(fontb);
        var pwtheme = pw.Theme.withFont( base: pw.Font.ttf(await rootBundle.load("assets/arimo.ttf")),);
        PdfImage _bgm;  _bgm = PdfImage.file( pdf.document, bytes: (await rootBundle.load('assets/bgm.jpg')).buffer.asUint8List(), );
        pdf.addPage(pw.MultiPage(theme: pwtheme, pageFormat: PdfPageFormat.a3.landscape, margin: pw.EdgeInsets.all(1),
          build: (pw.Context context) { return <pw.Widget>[pw.Stack(children: <pw.Widget>[pw.Container(child: pw.Image(_bgm, height: 831, fit: pw.BoxFit.cover),),
            pw.Container(padding: pw.EdgeInsets.only(top: 10,), child: pw.Row(children: <pw.Widget>[pw.Text('    Check Inventory',style: pw.TextStyle(
              font: herrvon, fontSize: 50.0, )),pw.SizedBox( width: 750,), pw.Column(children: <pw.Widget>[pw.Text('POWERED BY'), pw.UrlLink(
              destination: 'https://www.eutopianlettings.co.uk', child: pw.Text('EUTOPIANLETTINGS.CO.UK'), ), ]) ]), ), pw.Container(
                padding: pw.EdgeInsets.only(top: 1),child: pw.Column(mainAxisAlignment: pw.MainAxisAlignment.start, crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: <pw.Widget>[ pw.SizedBox(height:100,), pw.Container( padding: pw.EdgeInsets.only(left: 20,), child: pw.Container(padding: pw.EdgeInsets.only
                  (top: 10,left: 10,),decoration: pw.BoxDecoration(color: PdfColor.fromInt(0xffffffff),), height: 40, width: 1145,child: pw.Row(children: <pw.Widget>[
                  pw.Container( height: 35, width: 270,decoration: const pw.BoxDecoration(color: PdfColor.fromInt(0xffc7d0d8), borderRadius: 6),
                    child: pw.Text('  Hallway Ceiling: ',
                        style: pw.TextStyle(font: alice, fontSize: 22)),),pw.SizedBox(width: 15,), pw.Container( height: 35, width: 270,
                    decoration: const pw.BoxDecoration(color: PdfColor.fromInt(0xfff3ded4), borderRadius: 6), child: pw.Text(
                        '  Quanity: ${halCeilingNotifier.halCeilingList.isNotEmpty ? halCeilingNotifier.halCeilingList.last.quantity : ' NA'}',
                        style: pw.TextStyle(font: alice,fontSize: 20,)),), pw.SizedBox( width: 15, ), pw.Container(height: 35,width: 270,
                    decoration: const pw.BoxDecoration( color: PdfColor.fromInt(0xfff3ded4), borderRadius: 6), child: pw.Text(
                        '  Colour: ${halCeilingNotifier.halCeilingList.isNotEmpty ? halCeilingNotifier.halCeilingList.last.colour : ' NA'}',
                        style: pw.TextStyle( font: alice,fontSize: 20,)),), pw.SizedBox(width: 15,),pw.Container(height: 35, width: 270,
                    decoration: const pw.BoxDecoration( color: PdfColor.fromInt(0xfff3ded4), borderRadius: 6), child: pw.Text(
                        '  Cleanliness: ${halCeilingNotifier.halCeilingList.isNotEmpty ? halCeilingNotifier.halCeilingList.last.condition : ' NA'}',
                        style: pw.TextStyle(font: alice,fontSize: 20, )),),])),),pw.Container(padding: pw.EdgeInsets.only(left: 20),
                  child: pw.Container(decoration: pw.BoxDecoration(color: PdfColor.fromInt(0xffffffff),), width: 1145, padding: pw.EdgeInsets.only(left: 8),
                    child: pw.Row(children: <pw.Widget>[ pw.SizedBox(width: 5, ),pw.Container( child: pw.Text(
                      '  Description : ${halCeilingNotifier.halCeilingList.isNotEmpty ? halCeilingNotifier.halCeilingList.last.description : '  NA'}',
                      style: pw.TextStyle(font: alice, fontSize: 20,),),width: 270,height: 630,decoration: pw.BoxDecoration( color: PdfColor.fromInt(0xfff3ded4)), ),
                      pw.Container(height: 670,width: 870,child: pw.GridView(crossAxisCount: 2,childAspectRatio: 01.01,children: List<pw.Widget>.generate(
                        halCeilingPhNotifier.halCeilingPhList.length, (int n) {var imag = PdfImage.file( pdf.document, bytes: File(
                          halCeilingPhNotifier.halCeilingPhList[n].photo.path).readAsBytesSync(),);return pw.Container(child: pw.Image(imag, height: 290,
                          width: 400, fit: pw.BoxFit.contain)); }, ), ), ), ]), ), ), ])), ]), ]; }, )); }



      if (halLightNotifier.halLightList.isNotEmpty || halLightPhNotifier.halLightPhList.isNotEmpty) {
        final font = await rootBundle.load("assets/herrvon.ttf"); final herrvon = pw.Font.ttf(font);
        final fonta = await rootBundle.load("assets/alive.ttf");  final alice = pw.Font.ttf(fonta);
        final fontb = await rootBundle.load("assets/arimo.ttf");  final arimo = pw.Font.ttf(fontb);
        var pwtheme = pw.Theme.withFont( base: pw.Font.ttf(await rootBundle.load("assets/arimo.ttf")),);
        PdfImage _bgm;  _bgm = PdfImage.file( pdf.document, bytes: (await rootBundle.load('assets/bgm.jpg')).buffer.asUint8List(), );
        pdf.addPage(pw.MultiPage(theme: pwtheme, pageFormat: PdfPageFormat.a3.landscape, margin: pw.EdgeInsets.all(1),
          build: (pw.Context context) { return <pw.Widget>[pw.Stack(children: <pw.Widget>[pw.Container(child: pw.Image(_bgm, height: 831, fit: pw.BoxFit.cover),),
            pw.Container(padding: pw.EdgeInsets.only(top: 10,), child: pw.Row(children: <pw.Widget>[pw.Text('    Check Inventory',style: pw.TextStyle(
              font: herrvon, fontSize: 50.0, )),pw.SizedBox( width: 750,), pw.Column(children: <pw.Widget>[pw.Text('POWERED BY'), pw.UrlLink(
              destination: 'https://www.eutopianlettings.co.uk', child: pw.Text('EUTOPIANLETTINGS.CO.UK'), ), ]) ]), ), pw.Container(
                padding: pw.EdgeInsets.only(top: 1),child: pw.Column(mainAxisAlignment: pw.MainAxisAlignment.start, crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: <pw.Widget>[ pw.SizedBox(height:100,), pw.Container( padding: pw.EdgeInsets.only(left: 20,), child: pw.Container(padding: pw.EdgeInsets.only
                  (top: 10,left: 10,),decoration: pw.BoxDecoration(color: PdfColor.fromInt(0xffffffff),), height: 40, width: 1145,child: pw.Row(children: <pw.Widget>[
                  pw.Container( height: 35, width: 270,decoration: const pw.BoxDecoration(color: PdfColor.fromInt(0xffc7d0d8), borderRadius: 6),
                    child: pw.Text('  Hallway Light: ',
                        style: pw.TextStyle(font: alice, fontSize: 22)),),pw.SizedBox(width: 15,), pw.Container( height: 35, width: 270,
                    decoration: const pw.BoxDecoration(color: PdfColor.fromInt(0xfff3ded4), borderRadius: 6), child: pw.Text(
                        '  Quanity: ${halLightNotifier.halLightList.isNotEmpty ? halLightNotifier.halLightList.last.quantity : ' NA'}',
                        style: pw.TextStyle(font: alice,fontSize: 20,)),), pw.SizedBox( width: 15, ), pw.Container(height: 35,width: 270,
                    decoration: const pw.BoxDecoration( color: PdfColor.fromInt(0xfff3ded4), borderRadius: 6), child: pw.Text(
                        '  Colour: ${halLightNotifier.halLightList.isNotEmpty ? halLightNotifier.halLightList.last.colour : ' NA'}',
                        style: pw.TextStyle( font: alice,fontSize: 20,)),), pw.SizedBox(width: 15,),pw.Container(height: 35, width: 270,
                    decoration: const pw.BoxDecoration( color: PdfColor.fromInt(0xfff3ded4), borderRadius: 6), child: pw.Text(
                        '  Cleanliness: ${halLightNotifier.halLightList.isNotEmpty ? halLightNotifier.halLightList.last.condition : ' NA'}',
                        style: pw.TextStyle(font: alice,fontSize: 20, )),),])),),pw.Container(padding: pw.EdgeInsets.only(left: 20),
                  child: pw.Container(decoration: pw.BoxDecoration(color: PdfColor.fromInt(0xffffffff),), width: 1145, padding: pw.EdgeInsets.only(left: 8),
                    child: pw.Row(children: <pw.Widget>[ pw.SizedBox(width: 5, ),pw.Container( child: pw.Text(
                      '  Description : ${halLightNotifier.halLightList.isNotEmpty ? halLightNotifier.halLightList.last.description : '  NA'}',
                      style: pw.TextStyle(font: alice, fontSize: 20,),),width: 270,height: 630,decoration: pw.BoxDecoration( color: PdfColor.fromInt(0xfff3ded4)), ),
                      pw.Container(height: 670,width: 870,child: pw.GridView(crossAxisCount: 2,childAspectRatio: 01.01,children: List<pw.Widget>.generate(
                        halLightPhNotifier.halLightPhList.length, (int n) {var imag = PdfImage.file( pdf.document, bytes: File(
                          halLightPhNotifier.halLightPhList[n].photo.path).readAsBytesSync(),);return pw.Container(child: pw.Image(imag, height: 290,
                          width: 400, fit: pw.BoxFit.contain)); }, ), ), ), ]), ), ), ])), ]), ]; }, )); }
      if (halWallsNotifier.halWallsList.isNotEmpty || halWallsPhNotifier.halWallsPhList.isNotEmpty) {
        final font = await rootBundle.load("assets/herrvon.ttf"); final herrvon = pw.Font.ttf(font);
        final fonta = await rootBundle.load("assets/alive.ttf");  final alice = pw.Font.ttf(fonta);
        final fontb = await rootBundle.load("assets/arimo.ttf");  final arimo = pw.Font.ttf(fontb);
        var pwtheme = pw.Theme.withFont( base: pw.Font.ttf(await rootBundle.load("assets/arimo.ttf")),);
        PdfImage _bgm;  _bgm = PdfImage.file( pdf.document, bytes: (await rootBundle.load('assets/bgm.jpg')).buffer.asUint8List(), );
        pdf.addPage(pw.MultiPage(theme: pwtheme, pageFormat: PdfPageFormat.a3.landscape, margin: pw.EdgeInsets.all(1),
          build: (pw.Context context) { return <pw.Widget>[pw.Stack(children: <pw.Widget>[pw.Container(child: pw.Image(_bgm, height: 831, fit: pw.BoxFit.cover),),
            pw.Container(padding: pw.EdgeInsets.only(top: 10,), child: pw.Row(children: <pw.Widget>[pw.Text('    Check Inventory',style: pw.TextStyle(
              font: herrvon, fontSize: 50.0, )),pw.SizedBox( width: 750,), pw.Column(children: <pw.Widget>[pw.Text('POWERED BY'), pw.UrlLink(
              destination: 'https://www.eutopianlettings.co.uk', child: pw.Text('EUTOPIANLETTINGS.CO.UK'), ), ]) ]), ), pw.Container(
                padding: pw.EdgeInsets.only(top: 1),child: pw.Column(mainAxisAlignment: pw.MainAxisAlignment.start, crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: <pw.Widget>[ pw.SizedBox(height:100,), pw.Container( padding: pw.EdgeInsets.only(left: 20,), child: pw.Container(padding: pw.EdgeInsets.only
                  (top: 10,left: 10,),decoration: pw.BoxDecoration(color: PdfColor.fromInt(0xffffffff),), height: 40, width: 1145,child: pw.Row(children: <pw.Widget>[
                  pw.Container( height: 35, width: 270,decoration: const pw.BoxDecoration(color: PdfColor.fromInt(0xffc7d0d8), borderRadius: 6),
                    child: pw.Text('  Hallway Walls: ',
                        style: pw.TextStyle(font: alice, fontSize: 22)),),pw.SizedBox(width: 15,), pw.Container( height: 35, width: 270,
                    decoration: const pw.BoxDecoration(color: PdfColor.fromInt(0xfff3ded4), borderRadius: 6), child: pw.Text(
                        '  Quanity: ${halWallsNotifier.halWallsList.isNotEmpty ? halWallsNotifier.halWallsList.last.quantity : ' NA'}',
                        style: pw.TextStyle(font: alice,fontSize: 20,)),), pw.SizedBox( width: 15, ), pw.Container(height: 35,width: 270,
                    decoration: const pw.BoxDecoration( color: PdfColor.fromInt(0xfff3ded4), borderRadius: 6), child: pw.Text(
                        '  Colour: ${halWallsNotifier.halWallsList.isNotEmpty ? halWallsNotifier.halWallsList.last.colour : ' NA'}',
                        style: pw.TextStyle( font: alice,fontSize: 20,)),), pw.SizedBox(width: 15,),pw.Container(height: 35, width: 270,
                    decoration: const pw.BoxDecoration( color: PdfColor.fromInt(0xfff3ded4), borderRadius: 6), child: pw.Text(
                        '  Cleanliness: ${halWallsNotifier.halWallsList.isNotEmpty ? halWallsNotifier.halWallsList.last.condition : ' NA'}',
                        style: pw.TextStyle(font: alice,fontSize: 20, )),),])),),pw.Container(padding: pw.EdgeInsets.only(left: 20),
                  child: pw.Container(decoration: pw.BoxDecoration(color: PdfColor.fromInt(0xffffffff),), width: 1145, padding: pw.EdgeInsets.only(left: 8),
                    child: pw.Row(children: <pw.Widget>[ pw.SizedBox(width: 5, ),pw.Container( child: pw.Text(
                      '  Description : ${halWallsNotifier.halWallsList.isNotEmpty ? halWallsNotifier.halWallsList.last.description : '  NA'}',
                      style: pw.TextStyle(font: alice, fontSize: 20,),),width: 270,height: 630,decoration: pw.BoxDecoration( color: PdfColor.fromInt(0xfff3ded4)), ),
                      pw.Container(height: 670,width: 870,child: pw.GridView(crossAxisCount: 2,childAspectRatio: 01.01,children: List<pw.Widget>.generate(
                        halWallsPhNotifier.halWallsPhList.length, (int n) {var imag = PdfImage.file( pdf.document, bytes: File(
                          halWallsPhNotifier.halWallsPhList[n].photo.path).readAsBytesSync(),);return pw.Container(child: pw.Image(imag, height: 290,
                          width: 400, fit: pw.BoxFit.contain)); }, ), ), ), ]), ), ), ])), ]), ]; }, )); }
      if (halWindowsNotifier.halWindowsList.isNotEmpty || halWindowsPhNotifier.halWindowsPhList.isNotEmpty) {
        final font = await rootBundle.load("assets/herrvon.ttf"); final herrvon = pw.Font.ttf(font);
        final fonta = await rootBundle.load("assets/alive.ttf");  final alice = pw.Font.ttf(fonta);
        final fontb = await rootBundle.load("assets/arimo.ttf");  final arimo = pw.Font.ttf(fontb);
        var pwtheme = pw.Theme.withFont( base: pw.Font.ttf(await rootBundle.load("assets/arimo.ttf")),);
        PdfImage _bgm;  _bgm = PdfImage.file( pdf.document, bytes: (await rootBundle.load('assets/bgm.jpg')).buffer.asUint8List(), );
        pdf.addPage(pw.MultiPage(theme: pwtheme, pageFormat: PdfPageFormat.a3.landscape, margin: pw.EdgeInsets.all(1),
          build: (pw.Context context) { return <pw.Widget>[pw.Stack(children: <pw.Widget>[pw.Container(child: pw.Image(_bgm, height: 831, fit: pw.BoxFit.cover),),
            pw.Container(padding: pw.EdgeInsets.only(top: 10,), child: pw.Row(children: <pw.Widget>[pw.Text('    Check Inventory',style: pw.TextStyle(
              font: herrvon, fontSize: 50.0, )),pw.SizedBox( width: 750,), pw.Column(children: <pw.Widget>[pw.Text('POWERED BY'), pw.UrlLink(
              destination: 'https://www.eutopianlettings.co.uk', child: pw.Text('EUTOPIANLETTINGS.CO.UK'), ), ]) ]), ), pw.Container(
                padding: pw.EdgeInsets.only(top: 1),child: pw.Column(mainAxisAlignment: pw.MainAxisAlignment.start, crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: <pw.Widget>[ pw.SizedBox(height:100,), pw.Container( padding: pw.EdgeInsets.only(left: 20,), child: pw.Container(padding: pw.EdgeInsets.only
                  (top: 10,left: 10,),decoration: pw.BoxDecoration(color: PdfColor.fromInt(0xffffffff),), height: 40, width: 1145,child: pw.Row(children: <pw.Widget>[
                  pw.Container( height: 35, width: 270,decoration: const pw.BoxDecoration(color: PdfColor.fromInt(0xffc7d0d8), borderRadius: 6),
                    child: pw.Text('  Hallway Windows: ',
                        style: pw.TextStyle(font: alice, fontSize: 22)),),pw.SizedBox(width: 15,), pw.Container( height: 35, width: 270,
                    decoration: const pw.BoxDecoration(color: PdfColor.fromInt(0xfff3ded4), borderRadius: 6), child: pw.Text(
                        '  Quanity: ${halWindowsNotifier.halWindowsList.isNotEmpty ? halWindowsNotifier.halWindowsList.last.quantity : ' NA'}',
                        style: pw.TextStyle(font: alice,fontSize: 20,)),), pw.SizedBox( width: 15, ), pw.Container(height: 35,width: 270,
                    decoration: const pw.BoxDecoration( color: PdfColor.fromInt(0xfff3ded4), borderRadius: 6), child: pw.Text(
                        '  Colour: ${halWindowsNotifier.halWindowsList.isNotEmpty ? halWindowsNotifier.halWindowsList.last.colour : ' NA'}',
                        style: pw.TextStyle( font: alice,fontSize: 20,)),), pw.SizedBox(width: 15,),pw.Container(height: 35, width: 270,
                    decoration: const pw.BoxDecoration( color: PdfColor.fromInt(0xfff3ded4), borderRadius: 6), child: pw.Text(
                        '  Cleanliness: ${halWindowsNotifier.halWindowsList.isNotEmpty ? halWindowsNotifier.halWindowsList.last.condition : ' NA'}',
                        style: pw.TextStyle(font: alice,fontSize: 20, )),),])),),pw.Container(padding: pw.EdgeInsets.only(left: 20),
                  child: pw.Container(decoration: pw.BoxDecoration(color: PdfColor.fromInt(0xffffffff),), width: 1145, padding: pw.EdgeInsets.only(left: 8),
                    child: pw.Row(children: <pw.Widget>[ pw.SizedBox(width: 5, ),pw.Container( child: pw.Text(
                      '  Description : ${halWindowsNotifier.halWindowsList.isNotEmpty ? halWindowsNotifier.halWindowsList.last.description : '  NA'}',
                      style: pw.TextStyle(font: alice, fontSize: 20,),),width: 270,height: 630,decoration: pw.BoxDecoration( color: PdfColor.fromInt(0xfff3ded4)), ),
                      pw.Container(height: 670,width: 870,child: pw.GridView(crossAxisCount: 2,childAspectRatio: 01.01,children: List<pw.Widget>.generate(
                        halWindowsPhNotifier.halWindowsPhList.length, (int n) {var imag = PdfImage.file( pdf.document, bytes: File(
                          halWindowsPhNotifier.halWindowsPhList[n].photo.path).readAsBytesSync(),);return pw.Container(child: pw.Image(imag, height: 290,
                          width: 400, fit: pw.BoxFit.contain)); }, ), ), ), ]), ), ), ])), ]), ]; }, )); }


    }

    writeOnPdfSmote() async {
      if (smokeDeNotifier.smokeDeList.isNotEmpty || smokeDePhNotifier.smokeDePhList.isNotEmpty) {
        final font = await rootBundle.load("assets/herrvon.ttf"); final herrvon = pw.Font.ttf(font);
        final fonta = await rootBundle.load("assets/alive.ttf");  final alice = pw.Font.ttf(fonta);
        final fontb = await rootBundle.load("assets/arimo.ttf");  final arimo = pw.Font.ttf(fontb);
        var pwtheme = pw.Theme.withFont( base: pw.Font.ttf(await rootBundle.load("assets/arimo.ttf")),);
        PdfImage _bgm;  _bgm = PdfImage.file( pdf.document, bytes: (await rootBundle.load('assets/bgm.jpg')).buffer.asUint8List(), );
        pdf.addPage(pw.MultiPage(theme: pwtheme, pageFormat: PdfPageFormat.a3.landscape, margin: pw.EdgeInsets.all(1),
          build: (pw.Context context) { return <pw.Widget>[pw.Stack(children: <pw.Widget>[pw.Container(child: pw.Image(_bgm, height: 831, fit: pw.BoxFit.cover),),
            pw.Container(padding: pw.EdgeInsets.only(top: 10,), child: pw.Row(children: <pw.Widget>[pw.Text('    Check Inventory',style: pw.TextStyle(
              font: herrvon, fontSize: 50.0, )),pw.SizedBox( width: 750,), pw.Column(children: <pw.Widget>[pw.Text('POWERED BY'), pw.UrlLink(
              destination: 'https://www.eutopianlettings.co.uk', child: pw.Text('EUTOPIANLETTINGS.CO.UK'), ), ]) ]), ), pw.Container(
                padding: pw.EdgeInsets.only(top: 1),child: pw.Column(mainAxisAlignment: pw.MainAxisAlignment.start, crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: <pw.Widget>[ pw.SizedBox(height:100,), pw.Container( padding: pw.EdgeInsets.only(left: 20,), child: pw.Container(padding: pw.EdgeInsets.only
                  (top: 10,left: 10,),decoration: pw.BoxDecoration(color: PdfColor.fromInt(0xffffffff),), height: 40, width: 1145,child: pw.Row(children: <pw.Widget>[
                  pw.Container( height: 35, width: 270,decoration: const pw.BoxDecoration(color: PdfColor.fromInt(0xffc7d0d8), borderRadius: 6),
                    child: pw.Text('  SMOKE DETECTOR: ',
                        style: pw.TextStyle(font: alice, fontSize: 22)),),pw.SizedBox(width: 15,), pw.Container( height: 35, width: 270,
                    decoration: const pw.BoxDecoration(color: PdfColor.fromInt(0xfff3ded4), borderRadius: 6), child: pw.Text(
                        '  Quanity: ${smokeDeNotifier.smokeDeList.isNotEmpty ? smokeDeNotifier.smokeDeList.last.quantity : ' NA'}',
                        style: pw.TextStyle(font: alice,fontSize: 20,)),), pw.SizedBox( width: 15, ),  ])),),pw.Container(padding: pw.EdgeInsets.only(left: 20),
                  child: pw.Container(decoration: pw.BoxDecoration(color: PdfColor.fromInt(0xffffffff),), width: 1145, padding: pw.EdgeInsets.only(left: 8),
                    child: pw.Row(children: <pw.Widget>[ pw.SizedBox(width: 5, ),pw.Container( child: pw.Text(
                      '  Location : ${smokeDeNotifier.smokeDeList.isNotEmpty ? smokeDeNotifier.smokeDeList.last.description : '  NA'}',
                      style: pw.TextStyle(font: alice, fontSize: 20,),),width: 270,height: 630,decoration: pw.BoxDecoration( color: PdfColor.fromInt(0xfff3ded4)), ),
                      pw.Container(height: 670,width: 870,child: pw.GridView(crossAxisCount: 2,childAspectRatio: 01.01,children: List<pw.Widget>.generate(
                        smokeDePhNotifier.smokeDePhList.length, (int n) {var imag = PdfImage.file( pdf.document, bytes: File(
                          smokeDePhNotifier.smokeDePhList[n].photo.path).readAsBytesSync(),);return pw.Container(  child: pw.Image(imag, height: 290,
                          width: 400, fit: pw.BoxFit.contain)); }, ), ), ), ]), ), ), ])), ]), ]; }, )); }
    }

    writeOnPdfKitchen() async {
      if (kitFrameNotifier.kitFrameList.isNotEmpty || kitFramePhNotifier.kitFramePhList.isNotEmpty) {
        final font = await rootBundle.load("assets/herrvon.ttf"); final herrvon = pw.Font.ttf(font);
        final fonta = await rootBundle.load("assets/alive.ttf");  final alice = pw.Font.ttf(fonta);
        final fontb = await rootBundle.load("assets/arimo.ttf");  final arimo = pw.Font.ttf(fontb);
        var pwtheme = pw.Theme.withFont( base: pw.Font.ttf(await rootBundle.load("assets/arimo.ttf")),);
        PdfImage _bgm;  _bgm = PdfImage.file( pdf.document, bytes: (await rootBundle.load('assets/bgm.jpg')).buffer.asUint8List(), );
        pdf.addPage(pw.MultiPage(theme: pwtheme, pageFormat: PdfPageFormat.a3.landscape, margin: pw.EdgeInsets.all(1),
          build: (pw.Context context) { return <pw.Widget>[pw.Stack(children: <pw.Widget>[pw.Container(child: pw.Image(_bgm, height: 831, fit: pw.BoxFit.cover),),
            pw.Container(padding: pw.EdgeInsets.only(top: 10,), child: pw.Row(children: <pw.Widget>[pw.Text('    Check Inventory',style: pw.TextStyle(
              font: herrvon, fontSize: 50.0, )),pw.SizedBox( width: 750,), pw.Column(children: <pw.Widget>[pw.Text('POWERED BY'), pw.UrlLink(
              destination: 'https://www.eutopianlettings.co.uk', child: pw.Text('EUTOPIANLETTINGS.CO.UK'), ), ]) ]), ), pw.Container(
                padding: pw.EdgeInsets.only(top: 1),child: pw.Column(mainAxisAlignment: pw.MainAxisAlignment.start, crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: <pw.Widget>[ pw.SizedBox(height:100,), pw.Container( padding: pw.EdgeInsets.only(left: 20,), child: pw.Container(padding: pw.EdgeInsets.only
                  (top: 10,left: 10,),decoration: pw.BoxDecoration(color: PdfColor.fromInt(0xffffffff),), height: 40, width: 1145,child: pw.Row(children: <pw.Widget>[
                  pw.Container( height: 35, width: 270,decoration: const pw.BoxDecoration(color: PdfColor.fromInt(0xffc7d0d8), borderRadius: 6),
                    child: pw.Text('  Kitchen Frames: ',
                        style: pw.TextStyle(font: alice, fontSize: 22)),),pw.SizedBox(width: 15,), pw.Container( height: 35, width: 270,
                    decoration: const pw.BoxDecoration(color: PdfColor.fromInt(0xfff3ded4), borderRadius: 6), child: pw.Text(
                        '  Quanity: ${kitFrameNotifier.kitFrameList.isNotEmpty ? kitFrameNotifier.kitFrameList.last.quantity : ' NA'}',
                        style: pw.TextStyle(font: alice,fontSize: 20,)),), pw.SizedBox( width: 15, ), pw.Container(height: 35,width: 270,
                    decoration: const pw.BoxDecoration( color: PdfColor.fromInt(0xfff3ded4), borderRadius: 6), child: pw.Text(
                        '  Colour: ${kitFrameNotifier.kitFrameList.isNotEmpty ? kitFrameNotifier.kitFrameList.last.colour : ' NA'}',
                        style: pw.TextStyle( font: alice,fontSize: 20,)),), pw.SizedBox(width: 15,),pw.Container(height: 35, width: 270,
                    decoration: const pw.BoxDecoration( color: PdfColor.fromInt(0xfff3ded4), borderRadius: 6), child: pw.Text(
                        '  Cleanliness: ${kitFrameNotifier.kitFrameList.isNotEmpty ? kitFrameNotifier.kitFrameList.last.condition : ' NA'}',
                        style: pw.TextStyle(font: alice,fontSize: 20, )),),])),),pw.Container(padding: pw.EdgeInsets.only(left: 20),
                  child: pw.Container(decoration: pw.BoxDecoration(color: PdfColor.fromInt(0xffffffff),), width: 1145, padding: pw.EdgeInsets.only(left: 8),
                    child: pw.Row(children: <pw.Widget>[ pw.SizedBox(width: 5, ),pw.Container( child: pw.Text(
                      '  Description : ${kitFrameNotifier.kitFrameList.isNotEmpty ? kitFrameNotifier.kitFrameList.last.description : '  NA'}',
                      style: pw.TextStyle(font: alice, fontSize: 20,),),width: 270,height: 630,decoration: pw.BoxDecoration( color: PdfColor.fromInt(0xfff3ded4)), ),
                      pw.Container(height: 670,width: 870,child: pw.GridView(crossAxisCount: 2,childAspectRatio: 01.01,children: List<pw.Widget>.generate(
                        kitFramePhNotifier.kitFramePhList.length, (int n) {var imag = PdfImage.file( pdf.document, bytes: File(
                          kitFramePhNotifier.kitFramePhList[n].photo.path).readAsBytesSync(),);return pw.Container(child: pw.Image(imag, height: 290,
                          width: 400, fit: pw.BoxFit.contain)); }, ), ), ), ]), ), ), ])), ]), ]; }, )); }
      if (kitExdoorNotifier.kitExdoorList.isNotEmpty || kitExdoorPhNotifier.kitExdoorPhList.isNotEmpty) {
        final font = await rootBundle.load("assets/herrvon.ttf"); final herrvon = pw.Font.ttf(font);
        final fonta = await rootBundle.load("assets/alive.ttf");  final alice = pw.Font.ttf(fonta);
        final fontb = await rootBundle.load("assets/arimo.ttf");  final arimo = pw.Font.ttf(fontb);
        var pwtheme = pw.Theme.withFont( base: pw.Font.ttf(await rootBundle.load("assets/arimo.ttf")),);
        PdfImage _bgm;  _bgm = PdfImage.file( pdf.document, bytes: (await rootBundle.load('assets/bgm.jpg')).buffer.asUint8List(), );
        pdf.addPage(pw.MultiPage(theme: pwtheme, pageFormat: PdfPageFormat.a3.landscape, margin: pw.EdgeInsets.all(1),
          build: (pw.Context context) { return <pw.Widget>[pw.Stack(children: <pw.Widget>[pw.Container(child: pw.Image(_bgm, height: 831, fit: pw.BoxFit.cover),),
            pw.Container(padding: pw.EdgeInsets.only(top: 10,), child: pw.Row(children: <pw.Widget>[pw.Text('    Check Inventory',style: pw.TextStyle(
              font: herrvon, fontSize: 50.0, )),pw.SizedBox( width: 750,), pw.Column(children: <pw.Widget>[pw.Text('POWERED BY'), pw.UrlLink(
              destination: 'https://www.eutopianlettings.co.uk', child: pw.Text('EUTOPIANLETTINGS.CO.UK'), ), ]) ]), ), pw.Container(
                padding: pw.EdgeInsets.only(top: 1),child: pw.Column(mainAxisAlignment: pw.MainAxisAlignment.start, crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: <pw.Widget>[ pw.SizedBox(height:100,), pw.Container( padding: pw.EdgeInsets.only(left: 20,), child: pw.Container(padding: pw.EdgeInsets.only
                  (top: 10,left: 10,),decoration: pw.BoxDecoration(color: PdfColor.fromInt(0xffffffff),), height: 40, width: 1145,child: pw.Row(children: <pw.Widget>[
                  pw.Container( height: 35, width: 270,decoration: const pw.BoxDecoration(color: PdfColor.fromInt(0xffc7d0d8), borderRadius: 6),
                    child: pw.Text('  Kitchen Door: ',
                        style: pw.TextStyle(font: alice, fontSize: 22)),),pw.SizedBox(width: 15,), pw.Container( height: 35, width: 270,
                    decoration: const pw.BoxDecoration(color: PdfColor.fromInt(0xfff3ded4), borderRadius: 6), child: pw.Text(
                        '  Quanity: ${kitExdoorNotifier.kitExdoorList.isNotEmpty ? kitExdoorNotifier.kitExdoorList.last.quantity : ' NA'}',
                        style: pw.TextStyle(font: alice,fontSize: 20,)),), pw.SizedBox( width: 15, ), pw.Container(height: 35,width: 270,
                    decoration: const pw.BoxDecoration( color: PdfColor.fromInt(0xfff3ded4), borderRadius: 6), child: pw.Text(
                        '  Colour: ${kitExdoorNotifier.kitExdoorList.isNotEmpty ? kitExdoorNotifier.kitExdoorList.last.colour : ' NA'}',
                        style: pw.TextStyle( font: alice,fontSize: 20,)),), pw.SizedBox(width: 15,),pw.Container(height: 35, width: 270,
                    decoration: const pw.BoxDecoration( color: PdfColor.fromInt(0xfff3ded4), borderRadius: 6), child: pw.Text(
                        '  Cleanliness: ${kitExdoorNotifier.kitExdoorList.isNotEmpty ? kitExdoorNotifier.kitExdoorList.last.condition : ' NA'}',
                        style: pw.TextStyle(font: alice,fontSize: 20, )),),])),),pw.Container(padding: pw.EdgeInsets.only(left: 20),
                  child: pw.Container(decoration: pw.BoxDecoration(color: PdfColor.fromInt(0xffffffff),), width: 1145, padding: pw.EdgeInsets.only(left: 8),
                    child: pw.Row(children: <pw.Widget>[ pw.SizedBox(width: 5, ),pw.Container( child: pw.Text(
                      '  Description : ${kitExdoorNotifier.kitExdoorList.isNotEmpty ? kitExdoorNotifier.kitExdoorList.last.description : '  NA'}',
                      style: pw.TextStyle(font: alice, fontSize: 20,),),width: 270,height: 630,decoration: pw.BoxDecoration( color: PdfColor.fromInt(0xfff3ded4)), ),
                      pw.Container(height: 670,width: 870,child: pw.GridView(crossAxisCount: 2,childAspectRatio: 01.01,children: List<pw.Widget>.generate(
                        kitExdoorPhNotifier.kitExdoorPhList.length, (int n) {var imag = PdfImage.file( pdf.document, bytes: File(
                          kitExdoorPhNotifier.kitExdoorPhList[n].photo.path).readAsBytesSync(),);return pw.Container(child: pw.Image(imag, height: 290,
                          width: 400, fit: pw.BoxFit.contain)); }, ), ), ), ]), ), ), ])), ]), ]; }, )); }
      if (kitIndoorNotifier.kitIndoorList.isNotEmpty || kitIndoorPhNotifier.kitIndoorPhList.isNotEmpty) {
        final font = await rootBundle.load("assets/herrvon.ttf"); final herrvon = pw.Font.ttf(font);
        final fonta = await rootBundle.load("assets/alive.ttf");  final alice = pw.Font.ttf(fonta);
        final fontb = await rootBundle.load("assets/arimo.ttf");  final arimo = pw.Font.ttf(fontb);
        var pwtheme = pw.Theme.withFont( base: pw.Font.ttf(await rootBundle.load("assets/arimo.ttf")),);
        PdfImage _bgm;  _bgm = PdfImage.file( pdf.document, bytes: (await rootBundle.load('assets/bgm.jpg')).buffer.asUint8List(), );
        pdf.addPage(pw.MultiPage(theme: pwtheme, pageFormat: PdfPageFormat.a3.landscape, margin: pw.EdgeInsets.all(1),
          build: (pw.Context context) { return <pw.Widget>[pw.Stack(children: <pw.Widget>[pw.Container(child: pw.Image(_bgm, height: 831, fit: pw.BoxFit.cover),),
            pw.Container(padding: pw.EdgeInsets.only(top: 10,), child: pw.Row(children: <pw.Widget>[pw.Text('    Check Inventory',style: pw.TextStyle(
              font: herrvon, fontSize: 50.0, )),pw.SizedBox( width: 750,), pw.Column(children: <pw.Widget>[pw.Text('POWERED BY'), pw.UrlLink(
              destination: 'https://www.eutopianlettings.co.uk', child: pw.Text('EUTOPIANLETTINGS.CO.UK'), ), ]) ]), ), pw.Container(
                padding: pw.EdgeInsets.only(top: 1),child: pw.Column(mainAxisAlignment: pw.MainAxisAlignment.start, crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: <pw.Widget>[ pw.SizedBox(height:100,), pw.Container( padding: pw.EdgeInsets.only(left: 20,), child: pw.Container(padding: pw.EdgeInsets.only
                  (top: 10,left: 10,),decoration: pw.BoxDecoration(color: PdfColor.fromInt(0xffffffff),), height: 40, width: 1145,child: pw.Row(children: <pw.Widget>[
                  pw.Container( height: 35, width: 270,decoration: const pw.BoxDecoration(color: PdfColor.fromInt(0xffc7d0d8), borderRadius: 6),
                    child: pw.Text('  Kitchen Interior: ',
                        style: pw.TextStyle(font: alice, fontSize: 22)),),pw.SizedBox(width: 15,), pw.Container( height: 35, width: 270,
                    decoration: const pw.BoxDecoration(color: PdfColor.fromInt(0xfff3ded4), borderRadius: 6), child: pw.Text(
                        '  Quanity: ${kitIndoorNotifier.kitIndoorList.isNotEmpty ? kitIndoorNotifier.kitIndoorList.last.quantity : ' NA'}',
                        style: pw.TextStyle(font: alice,fontSize: 20,)),), pw.SizedBox( width: 15, ), pw.Container(height: 35,width: 270,
                    decoration: const pw.BoxDecoration( color: PdfColor.fromInt(0xfff3ded4), borderRadius: 6), child: pw.Text(
                        '  Colour: ${kitIndoorNotifier.kitIndoorList.isNotEmpty ? kitIndoorNotifier.kitIndoorList.last.colour : ' NA'}',
                        style: pw.TextStyle( font: alice,fontSize: 20,)),), pw.SizedBox(width: 15,),pw.Container(height: 35, width: 270,
                    decoration: const pw.BoxDecoration( color: PdfColor.fromInt(0xfff3ded4), borderRadius: 6), child: pw.Text(
                        '  Cleanliness: ${kitIndoorNotifier.kitIndoorList.isNotEmpty ? kitIndoorNotifier.kitIndoorList.last.condition : ' NA'}',
                        style: pw.TextStyle(font: alice,fontSize: 20, )),),])),),pw.Container(padding: pw.EdgeInsets.only(left: 20),
                  child: pw.Container(decoration: pw.BoxDecoration(color: PdfColor.fromInt(0xffffffff),), width: 1145, padding: pw.EdgeInsets.only(left: 8),
                    child: pw.Row(children: <pw.Widget>[ pw.SizedBox(width: 5, ),pw.Container( child: pw.Text(
                      '  Description : ${kitIndoorNotifier.kitIndoorList.isNotEmpty ? kitIndoorNotifier.kitIndoorList.last.description : '  NA'}',
                      style: pw.TextStyle(font: alice, fontSize: 20,),),width: 270,height: 630,decoration: pw.BoxDecoration( color: PdfColor.fromInt(0xfff3ded4)), ),
                      pw.Container(height: 670,width: 870,child: pw.GridView(crossAxisCount: 2,childAspectRatio: 01.01,children: List<pw.Widget>.generate(
                        kitIndoorPhNotifier.kitIndoorPhList.length, (int n) {var imag = PdfImage.file( pdf.document, bytes: File(
                          kitIndoorPhNotifier.kitIndoorPhList[n].photo.path).readAsBytesSync(),);return pw.Container(child: pw.Image(imag, height: 290,
                          width: 400, fit: pw.BoxFit.contain)); }, ), ), ), ]), ), ), ])), ]), ]; }, )); }
      if (kitCeilingNotifier.kitCeilingList.isNotEmpty || kitCeilingPhNotifier.kitCeilingPhList.isNotEmpty) {
        final font = await rootBundle.load("assets/herrvon.ttf"); final herrvon = pw.Font.ttf(font);
        final fonta = await rootBundle.load("assets/alive.ttf");  final alice = pw.Font.ttf(fonta);
        final fontb = await rootBundle.load("assets/arimo.ttf");  final arimo = pw.Font.ttf(fontb);
        var pwtheme = pw.Theme.withFont( base: pw.Font.ttf(await rootBundle.load("assets/arimo.ttf")),);
        PdfImage _bgm;  _bgm = PdfImage.file( pdf.document, bytes: (await rootBundle.load('assets/bgm.jpg')).buffer.asUint8List(), );
        pdf.addPage(pw.MultiPage(theme: pwtheme, pageFormat: PdfPageFormat.a3.landscape, margin: pw.EdgeInsets.all(1),
          build: (pw.Context context) { return <pw.Widget>[pw.Stack(children: <pw.Widget>[pw.Container(child: pw.Image(_bgm, height: 831, fit: pw.BoxFit.cover),),
            pw.Container(padding: pw.EdgeInsets.only(top: 10,), child: pw.Row(children: <pw.Widget>[pw.Text('    Check Inventory',style: pw.TextStyle(
              font: herrvon, fontSize: 50.0, )),pw.SizedBox( width: 750,), pw.Column(children: <pw.Widget>[pw.Text('POWERED BY'), pw.UrlLink(
              destination: 'https://www.eutopianlettings.co.uk', child: pw.Text('EUTOPIANLETTINGS.CO.UK'), ), ]) ]), ), pw.Container(
                padding: pw.EdgeInsets.only(top: 1),child: pw.Column(mainAxisAlignment: pw.MainAxisAlignment.start, crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: <pw.Widget>[ pw.SizedBox(height:100,), pw.Container( padding: pw.EdgeInsets.only(left: 20,), child: pw.Container(padding: pw.EdgeInsets.only
                  (top: 10,left: 10,),decoration: pw.BoxDecoration(color: PdfColor.fromInt(0xffffffff),), height: 40, width: 1145,child: pw.Row(children: <pw.Widget>[
                  pw.Container( height: 35, width: 270,decoration: const pw.BoxDecoration(color: PdfColor.fromInt(0xffc7d0d8), borderRadius: 6),
                    child: pw.Text('  Kitchen Ceiling: ',
                        style: pw.TextStyle(font: alice, fontSize: 22)),),pw.SizedBox(width: 15,), pw.Container( height: 35, width: 270,
                    decoration: const pw.BoxDecoration(color: PdfColor.fromInt(0xfff3ded4), borderRadius: 6), child: pw.Text(
                        '  Quanity: ${kitCeilingNotifier.kitCeilingList.isNotEmpty ? kitCeilingNotifier.kitCeilingList.last.quantity : ' NA'}',
                        style: pw.TextStyle(font: alice,fontSize: 20,)),), pw.SizedBox( width: 15, ), pw.Container(height: 35,width: 270,
                    decoration: const pw.BoxDecoration( color: PdfColor.fromInt(0xfff3ded4), borderRadius: 6), child: pw.Text(
                        '  Colour: ${kitCeilingNotifier.kitCeilingList.isNotEmpty ? kitCeilingNotifier.kitCeilingList.last.colour : ' NA'}',
                        style: pw.TextStyle( font: alice,fontSize: 20,)),), pw.SizedBox(width: 15,),pw.Container(height: 35, width: 270,
                    decoration: const pw.BoxDecoration( color: PdfColor.fromInt(0xfff3ded4), borderRadius: 6), child: pw.Text(
                        '  Cleanliness: ${kitCeilingNotifier.kitCeilingList.isNotEmpty ? kitCeilingNotifier.kitCeilingList.last.condition : ' NA'}',
                        style: pw.TextStyle(font: alice,fontSize: 20, )),),])),),pw.Container(padding: pw.EdgeInsets.only(left: 20),
                  child: pw.Container(decoration: pw.BoxDecoration(color: PdfColor.fromInt(0xffffffff),), width: 1145, padding: pw.EdgeInsets.only(left: 8),
                    child: pw.Row(children: <pw.Widget>[ pw.SizedBox(width: 5, ),pw.Container( child: pw.Text(
                      '  Description : ${kitCeilingNotifier.kitCeilingList.isNotEmpty ? kitCeilingNotifier.kitCeilingList.last.description : '  NA'}',
                      style: pw.TextStyle(font: alice, fontSize: 20,),),width: 270,height: 630,decoration: pw.BoxDecoration( color: PdfColor.fromInt(0xfff3ded4)), ),
                      pw.Container(height: 670,width: 870,child: pw.GridView(crossAxisCount: 2,childAspectRatio: 01.01,children: List<pw.Widget>.generate(
                        kitCeilingPhNotifier.kitCeilingPhList.length, (int n) {var imag = PdfImage.file( pdf.document, bytes: File(
                          kitCeilingPhNotifier.kitCeilingPhList[n].photo.path).readAsBytesSync(),);return pw.Container(child: pw.Image(imag, height: 290,
                          width: 400, fit: pw.BoxFit.contain)); }, ), ), ), ]), ), ), ])), ]), ]; }, )); }
      if (kitLightNotifier.kitLightList.isNotEmpty || kitLightPhNotifier.kitLightPhList.isNotEmpty) {
        final font = await rootBundle.load("assets/herrvon.ttf"); final herrvon = pw.Font.ttf(font);
        final fonta = await rootBundle.load("assets/alive.ttf");  final alice = pw.Font.ttf(fonta);
        final fontb = await rootBundle.load("assets/arimo.ttf");  final arimo = pw.Font.ttf(fontb);
        var pwtheme = pw.Theme.withFont( base: pw.Font.ttf(await rootBundle.load("assets/arimo.ttf")),);
        PdfImage _bgm;  _bgm = PdfImage.file( pdf.document, bytes: (await rootBundle.load('assets/bgm.jpg')).buffer.asUint8List(), );
        pdf.addPage(pw.MultiPage(theme: pwtheme, pageFormat: PdfPageFormat.a3.landscape, margin: pw.EdgeInsets.all(1),
          build: (pw.Context context) { return <pw.Widget>[pw.Stack(children: <pw.Widget>[pw.Container(child: pw.Image(_bgm, height: 831, fit: pw.BoxFit.cover),),
            pw.Container(padding: pw.EdgeInsets.only(top: 10,), child: pw.Row(children: <pw.Widget>[pw.Text('    Check Inventory',style: pw.TextStyle(
              font: herrvon, fontSize: 50.0, )),pw.SizedBox( width: 750,), pw.Column(children: <pw.Widget>[pw.Text('POWERED BY'), pw.UrlLink(
              destination: 'https://www.eutopianlettings.co.uk', child: pw.Text('EUTOPIANLETTINGS.CO.UK'), ), ]) ]), ), pw.Container(
                padding: pw.EdgeInsets.only(top: 1),child: pw.Column(mainAxisAlignment: pw.MainAxisAlignment.start, crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: <pw.Widget>[ pw.SizedBox(height:100,), pw.Container( padding: pw.EdgeInsets.only(left: 20,), child: pw.Container(padding: pw.EdgeInsets.only
                  (top: 10,left: 10,),decoration: pw.BoxDecoration(color: PdfColor.fromInt(0xffffffff),), height: 40, width: 1145,child: pw.Row(children: <pw.Widget>[
                  pw.Container( height: 35, width: 270,decoration: const pw.BoxDecoration(color: PdfColor.fromInt(0xffc7d0d8), borderRadius: 6),
                    child: pw.Text('  Kitchen Light: ',
                        style: pw.TextStyle(font: alice, fontSize: 22)),),pw.SizedBox(width: 15,), pw.Container( height: 35, width: 270,
                    decoration: const pw.BoxDecoration(color: PdfColor.fromInt(0xfff3ded4), borderRadius: 6), child: pw.Text(
                        '  Quanity: ${kitLightNotifier.kitLightList.isNotEmpty ? kitLightNotifier.kitLightList.last.quantity : ' NA'}',
                        style: pw.TextStyle(font: alice,fontSize: 20,)),), pw.SizedBox( width: 15, ), pw.Container(height: 35,width: 270,
                    decoration: const pw.BoxDecoration( color: PdfColor.fromInt(0xfff3ded4), borderRadius: 6), child: pw.Text(
                        '  Colour: ${kitLightNotifier.kitLightList.isNotEmpty ? kitLightNotifier.kitLightList.last.colour : ' NA'}',
                        style: pw.TextStyle( font: alice,fontSize: 20,)),), pw.SizedBox(width: 15,),pw.Container(height: 35, width: 270,
                    decoration: const pw.BoxDecoration( color: PdfColor.fromInt(0xfff3ded4), borderRadius: 6), child: pw.Text(
                        '  Cleanliness: ${kitLightNotifier.kitLightList.isNotEmpty ? kitLightNotifier.kitLightList.last.condition : ' NA'}',
                        style: pw.TextStyle(font: alice,fontSize: 20, )),),])),),pw.Container(padding: pw.EdgeInsets.only(left: 20),
                  child: pw.Container(decoration: pw.BoxDecoration(color: PdfColor.fromInt(0xffffffff),), width: 1145, padding: pw.EdgeInsets.only(left: 8),
                    child: pw.Row(children: <pw.Widget>[ pw.SizedBox(width: 5, ),pw.Container( child: pw.Text(
                      '  Description : ${kitLightNotifier.kitLightList.isNotEmpty ? kitLightNotifier.kitLightList.last.description : '  NA'}',
                      style: pw.TextStyle(font: alice, fontSize: 20,),),width: 270,height: 630,decoration: pw.BoxDecoration( color: PdfColor.fromInt(0xfff3ded4)), ),
                      pw.Container(height: 670,width: 870,child: pw.GridView(crossAxisCount: 2,childAspectRatio: 01.01,children: List<pw.Widget>.generate(
                        kitLightPhNotifier.kitLightPhList.length, (int n) {var imag = PdfImage.file( pdf.document, bytes: File(
                          kitLightPhNotifier.kitLightPhList[n].photo.path).readAsBytesSync(),);return pw.Container(child: pw.Image(imag, height: 290,
                          width: 400, fit: pw.BoxFit.contain)); }, ), ), ), ]), ), ), ])), ]), ]; }, )); }
      if (kitWallsNotifier.kitWallsList.isNotEmpty || kitWallsPhNotifier.kitWallsPhList.isNotEmpty) {
        final font = await rootBundle.load("assets/herrvon.ttf"); final herrvon = pw.Font.ttf(font);
        final fonta = await rootBundle.load("assets/alive.ttf");  final alice = pw.Font.ttf(fonta);
        final fontb = await rootBundle.load("assets/arimo.ttf");  final arimo = pw.Font.ttf(fontb);
        var pwtheme = pw.Theme.withFont( base: pw.Font.ttf(await rootBundle.load("assets/arimo.ttf")),);
        PdfImage _bgm;  _bgm = PdfImage.file( pdf.document, bytes: (await rootBundle.load('assets/bgm.jpg')).buffer.asUint8List(), );
        pdf.addPage(pw.MultiPage(theme: pwtheme, pageFormat: PdfPageFormat.a3.landscape, margin: pw.EdgeInsets.all(1),
          build: (pw.Context context) { return <pw.Widget>[pw.Stack(children: <pw.Widget>[pw.Container(child: pw.Image(_bgm, height: 831, fit: pw.BoxFit.cover),),
            pw.Container(padding: pw.EdgeInsets.only(top: 10,), child: pw.Row(children: <pw.Widget>[pw.Text('    Check Inventory',style: pw.TextStyle(
              font: herrvon, fontSize: 50.0, )),pw.SizedBox( width: 750,), pw.Column(children: <pw.Widget>[pw.Text('POWERED BY'), pw.UrlLink(
              destination: 'https://www.eutopianlettings.co.uk', child: pw.Text('EUTOPIANLETTINGS.CO.UK'), ), ]) ]), ), pw.Container(
                padding: pw.EdgeInsets.only(top: 1),child: pw.Column(mainAxisAlignment: pw.MainAxisAlignment.start, crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: <pw.Widget>[ pw.SizedBox(height:100,), pw.Container( padding: pw.EdgeInsets.only(left: 20,), child: pw.Container(padding: pw.EdgeInsets.only
                  (top: 10,left: 10,),decoration: pw.BoxDecoration(color: PdfColor.fromInt(0xffffffff),), height: 40, width: 1145,child: pw.Row(children: <pw.Widget>[
                  pw.Container( height: 35, width: 270,decoration: const pw.BoxDecoration(color: PdfColor.fromInt(0xffc7d0d8), borderRadius: 6),
                    child: pw.Text('  Kitchen Walls: ',
                        style: pw.TextStyle(font: alice, fontSize: 22)),),pw.SizedBox(width: 15,), pw.Container( height: 35, width: 270,
                    decoration: const pw.BoxDecoration(color: PdfColor.fromInt(0xfff3ded4), borderRadius: 6), child: pw.Text(
                        '  Quanity: ${kitWallsNotifier.kitWallsList.isNotEmpty ? kitWallsNotifier.kitWallsList.last.quantity : ' NA'}',
                        style: pw.TextStyle(font: alice,fontSize: 20,)),), pw.SizedBox( width: 15, ), pw.Container(height: 35,width: 270,
                    decoration: const pw.BoxDecoration( color: PdfColor.fromInt(0xfff3ded4), borderRadius: 6), child: pw.Text(
                        '  Colour: ${kitWallsNotifier.kitWallsList.isNotEmpty ? kitWallsNotifier.kitWallsList.last.colour : ' NA'}',
                        style: pw.TextStyle( font: alice,fontSize: 20,)),), pw.SizedBox(width: 15,),pw.Container(height: 35, width: 270,
                    decoration: const pw.BoxDecoration( color: PdfColor.fromInt(0xfff3ded4), borderRadius: 6), child: pw.Text(
                        '  Cleanliness: ${kitWallsNotifier.kitWallsList.isNotEmpty ? kitWallsNotifier.kitWallsList.last.condition : ' NA'}',
                        style: pw.TextStyle(font: alice,fontSize: 20, )),),])),),pw.Container(padding: pw.EdgeInsets.only(left: 20),
                  child: pw.Container(decoration: pw.BoxDecoration(color: PdfColor.fromInt(0xffffffff),), width: 1145, padding: pw.EdgeInsets.only(left: 8),
                    child: pw.Row(children: <pw.Widget>[ pw.SizedBox(width: 5, ),pw.Container( child: pw.Text(
                      '  Description : ${kitWallsNotifier.kitWallsList.isNotEmpty ? kitWallsNotifier.kitWallsList.last.description : '  NA'}',
                      style: pw.TextStyle(font: alice, fontSize: 20,),),width: 270,height: 630,decoration: pw.BoxDecoration( color: PdfColor.fromInt(0xfff3ded4)), ),
                      pw.Container(height: 670,width: 870,child: pw.GridView(crossAxisCount: 2,childAspectRatio: 01.01,children: List<pw.Widget>.generate(
                        kitWallsPhNotifier.kitWallsPhList.length, (int n) {var imag = PdfImage.file( pdf.document, bytes: File(
                          kitWallsPhNotifier.kitWallsPhList[n].photo.path).readAsBytesSync(),);return pw.Container(child: pw.Image(imag, height: 290,
                          width: 400, fit: pw.BoxFit.contain)); }, ), ), ), ]), ), ), ])), ]), ]; }, )); }
      if (kitWindowsNotifier.kitWindowsList.isNotEmpty || kitWindowsPhNotifier.kitWindowsPhList.isNotEmpty) {
        final font = await rootBundle.load("assets/herrvon.ttf"); final herrvon = pw.Font.ttf(font);
        final fonta = await rootBundle.load("assets/alive.ttf");  final alice = pw.Font.ttf(fonta);
        final fontb = await rootBundle.load("assets/arimo.ttf");  final arimo = pw.Font.ttf(fontb);
        var pwtheme = pw.Theme.withFont( base: pw.Font.ttf(await rootBundle.load("assets/arimo.ttf")),);
        PdfImage _bgm;  _bgm = PdfImage.file( pdf.document, bytes: (await rootBundle.load('assets/bgm.jpg')).buffer.asUint8List(), );
        pdf.addPage(pw.MultiPage(theme: pwtheme, pageFormat: PdfPageFormat.a3.landscape, margin: pw.EdgeInsets.all(1),
          build: (pw.Context context) { return <pw.Widget>[pw.Stack(children: <pw.Widget>[pw.Container(child: pw.Image(_bgm, height: 831, fit: pw.BoxFit.cover),),
            pw.Container(padding: pw.EdgeInsets.only(top: 10,), child: pw.Row(children: <pw.Widget>[pw.Text('    Check Inventory',style: pw.TextStyle(
              font: herrvon, fontSize: 50.0, )),pw.SizedBox( width: 750,), pw.Column(children: <pw.Widget>[pw.Text('POWERED BY'), pw.UrlLink(
              destination: 'https://www.eutopianlettings.co.uk', child: pw.Text('EUTOPIANLETTINGS.CO.UK'), ), ]) ]), ), pw.Container(
                padding: pw.EdgeInsets.only(top: 1),child: pw.Column(mainAxisAlignment: pw.MainAxisAlignment.start, crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: <pw.Widget>[ pw.SizedBox(height:100,), pw.Container( padding: pw.EdgeInsets.only(left: 20,), child: pw.Container(padding: pw.EdgeInsets.only
                  (top: 10,left: 10,),decoration: pw.BoxDecoration(color: PdfColor.fromInt(0xffffffff),), height: 40, width: 1145,child: pw.Row(children: <pw.Widget>[
                  pw.Container( height: 35, width: 270,decoration: const pw.BoxDecoration(color: PdfColor.fromInt(0xffc7d0d8), borderRadius: 6),
                    child: pw.Text('  Kitchen Windows: ',
                        style: pw.TextStyle(font: alice, fontSize: 22)),),pw.SizedBox(width: 15,), pw.Container( height: 35, width: 270,
                    decoration: const pw.BoxDecoration(color: PdfColor.fromInt(0xfff3ded4), borderRadius: 6), child: pw.Text(
                        '  Quanity: ${kitWindowsNotifier.kitWindowsList.isNotEmpty ? kitWindowsNotifier.kitWindowsList.last.quantity : ' NA'}',
                        style: pw.TextStyle(font: alice,fontSize: 20,)),), pw.SizedBox( width: 15, ), pw.Container(height: 35,width: 270,
                    decoration: const pw.BoxDecoration( color: PdfColor.fromInt(0xfff3ded4), borderRadius: 6), child: pw.Text(
                        '  Colour: ${kitWindowsNotifier.kitWindowsList.isNotEmpty ? kitWindowsNotifier.kitWindowsList.last.colour : ' NA'}',
                        style: pw.TextStyle( font: alice,fontSize: 20,)),), pw.SizedBox(width: 15,),pw.Container(height: 35, width: 270,
                    decoration: const pw.BoxDecoration( color: PdfColor.fromInt(0xfff3ded4), borderRadius: 6), child: pw.Text(
                        '  Cleanliness: ${kitWindowsNotifier.kitWindowsList.isNotEmpty ? kitWindowsNotifier.kitWindowsList.last.condition : ' NA'}',
                        style: pw.TextStyle(font: alice,fontSize: 20, )),),])),),pw.Container(padding: pw.EdgeInsets.only(left: 20),
                  child: pw.Container(decoration: pw.BoxDecoration(color: PdfColor.fromInt(0xffffffff),), width: 1145, padding: pw.EdgeInsets.only(left: 8),
                    child: pw.Row(children: <pw.Widget>[ pw.SizedBox(width: 5, ),pw.Container( child: pw.Text(
                      '  Description : ${kitWindowsNotifier.kitWindowsList.isNotEmpty ? kitWindowsNotifier.kitWindowsList.last.description : '  NA'}',
                      style: pw.TextStyle(font: alice, fontSize: 20,),),width: 270,height: 630,decoration: pw.BoxDecoration( color: PdfColor.fromInt(0xfff3ded4)), ),
                      pw.Container(height: 670,width: 870,child: pw.GridView(crossAxisCount: 2,childAspectRatio: 01.01,children: List<pw.Widget>.generate(
                        kitWindowsPhNotifier.kitWindowsPhList.length, (int n) {var imag = PdfImage.file( pdf.document, bytes: File(
                          kitWindowsPhNotifier.kitWindowsPhList[n].photo.path).readAsBytesSync(),);return pw.Container(child: pw.Image(imag, height: 290,
                          width: 400, fit: pw.BoxFit.contain)); }, ), ), ), ]), ), ), ])), ]), ]; }, )); }
    }

    writeOnPdfBedroom() async {
      if (bedFrameNotifier.bedFrameList.isNotEmpty || bedFramePhNotifier.bedFramePhList.isNotEmpty) {
        final font = await rootBundle.load("assets/herrvon.ttf"); final herrvon = pw.Font.ttf(font);
        final fonta = await rootBundle.load("assets/alive.ttf");  final alice = pw.Font.ttf(fonta);
        final fontb = await rootBundle.load("assets/arimo.ttf");  final arimo = pw.Font.ttf(fontb);
        var pwtheme = pw.Theme.withFont( base: pw.Font.ttf(await rootBundle.load("assets/arimo.ttf")),);
        PdfImage _bgm;  _bgm = PdfImage.file( pdf.document, bytes: (await rootBundle.load('assets/bgm.jpg')).buffer.asUint8List(), );
        pdf.addPage(pw.MultiPage(theme: pwtheme, pageFormat: PdfPageFormat.a3.landscape, margin: pw.EdgeInsets.all(1),
          build: (pw.Context context) { return <pw.Widget>[pw.Stack(children: <pw.Widget>[pw.Container(child: pw.Image(_bgm, height: 831, fit: pw.BoxFit.cover),),
            pw.Container(padding: pw.EdgeInsets.only(top: 10,), child: pw.Row(children: <pw.Widget>[pw.Text('    Check Inventory',style: pw.TextStyle(
              font: herrvon, fontSize: 50.0, )),pw.SizedBox( width: 750,), pw.Column(children: <pw.Widget>[pw.Text('POWERED BY'), pw.UrlLink(
              destination: 'https://www.eutopianlettings.co.uk', child: pw.Text('EUTOPIANLETTINGS.CO.UK'), ), ]) ]), ), pw.Container(
                padding: pw.EdgeInsets.only(top: 1),child: pw.Column(mainAxisAlignment: pw.MainAxisAlignment.start, crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: <pw.Widget>[ pw.SizedBox(height:100,), pw.Container( padding: pw.EdgeInsets.only(left: 20,), child: pw.Container(padding: pw.EdgeInsets.only
                  (top: 10,left: 10,),decoration: pw.BoxDecoration(color: PdfColor.fromInt(0xffffffff),), height: 40, width: 1145,child: pw.Row(children: <pw.Widget>[
                  pw.Container( height: 35, width: 270,decoration: const pw.BoxDecoration(color: PdfColor.fromInt(0xffc7d0d8), borderRadius: 6),
                    child: pw.Text('  Bedroom Frames: ',
                        style: pw.TextStyle(font: alice, fontSize: 22)),),pw.SizedBox(width: 15,), pw.Container( height: 35, width: 270,
                    decoration: const pw.BoxDecoration(color: PdfColor.fromInt(0xfff3ded4), borderRadius: 6), child: pw.Text(
                        '  Quanity: ${bedFrameNotifier.bedFrameList.isNotEmpty ? bedFrameNotifier.bedFrameList.last.quantity : ' NA'}',
                        style: pw.TextStyle(font: alice,fontSize: 20,)),), pw.SizedBox( width: 15, ), pw.Container(height: 35,width: 270,
                    decoration: const pw.BoxDecoration( color: PdfColor.fromInt(0xfff3ded4), borderRadius: 6), child: pw.Text(
                        '  Colour: ${bedFrameNotifier.bedFrameList.isNotEmpty ? bedFrameNotifier.bedFrameList.last.colour : ' NA'}',
                        style: pw.TextStyle( font: alice,fontSize: 20,)),), pw.SizedBox(width: 15,),pw.Container(height: 35, width: 270,
                    decoration: const pw.BoxDecoration( color: PdfColor.fromInt(0xfff3ded4), borderRadius: 6), child: pw.Text(
                        '  Cleanliness: ${bedFrameNotifier.bedFrameList.isNotEmpty ? bedFrameNotifier.bedFrameList.last.condition : ' NA'}',
                        style: pw.TextStyle(font: alice,fontSize: 20, )),),])),),pw.Container(padding: pw.EdgeInsets.only(left: 20),
                  child: pw.Container(decoration: pw.BoxDecoration(color: PdfColor.fromInt(0xffffffff),), width: 1145, padding: pw.EdgeInsets.only(left: 8),
                    child: pw.Row(children: <pw.Widget>[ pw.SizedBox(width: 5, ),pw.Container( child: pw.Text(
                      '  Description : ${bedFrameNotifier.bedFrameList.isNotEmpty ? bedFrameNotifier.bedFrameList.last.description : '  NA'}',
                      style: pw.TextStyle(font: alice, fontSize: 20,),),width: 270,height: 630,decoration: pw.BoxDecoration( color: PdfColor.fromInt(0xfff3ded4)), ),
                      pw.Container(height: 670,width: 870,child: pw.GridView(crossAxisCount: 2,childAspectRatio: 01.01,children: List<pw.Widget>.generate(
                        bedFramePhNotifier.bedFramePhList.length, (int n) {var imag = PdfImage.file( pdf.document, bytes: File(
                          bedFramePhNotifier.bedFramePhList[n].photo.path).readAsBytesSync(),);return pw.Container(child: pw.Image(imag, height: 290,
                          width: 400, fit: pw.BoxFit.contain)); }, ), ), ), ]), ), ), ])), ]), ]; }, )); }
      if (bedExdoorNotifier.bedExdoorList.isNotEmpty || bedExdoorPhNotifier.bedExdoorPhList.isNotEmpty) {
        final font = await rootBundle.load("assets/herrvon.ttf"); final herrvon = pw.Font.ttf(font);
        final fonta = await rootBundle.load("assets/alive.ttf");  final alice = pw.Font.ttf(fonta);
        final fontb = await rootBundle.load("assets/arimo.ttf");  final arimo = pw.Font.ttf(fontb);
        var pwtheme = pw.Theme.withFont( base: pw.Font.ttf(await rootBundle.load("assets/arimo.ttf")),);
        PdfImage _bgm;  _bgm = PdfImage.file( pdf.document, bytes: (await rootBundle.load('assets/bgm.jpg')).buffer.asUint8List(), );
        pdf.addPage(pw.MultiPage(theme: pwtheme, pageFormat: PdfPageFormat.a3.landscape, margin: pw.EdgeInsets.all(1),
          build: (pw.Context context) { return <pw.Widget>[pw.Stack(children: <pw.Widget>[pw.Container(child: pw.Image(_bgm, height: 831, fit: pw.BoxFit.cover),),
            pw.Container(padding: pw.EdgeInsets.only(top: 10,), child: pw.Row(children: <pw.Widget>[pw.Text('    Check Inventory',style: pw.TextStyle(
              font: herrvon, fontSize: 50.0, )),pw.SizedBox( width: 750,), pw.Column(children: <pw.Widget>[pw.Text('POWERED BY'), pw.UrlLink(
              destination: 'https://www.eutopianlettings.co.uk', child: pw.Text('EUTOPIANLETTINGS.CO.UK'), ), ]) ]), ), pw.Container(
                padding: pw.EdgeInsets.only(top: 1),child: pw.Column(mainAxisAlignment: pw.MainAxisAlignment.start, crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: <pw.Widget>[ pw.SizedBox(height:100,), pw.Container( padding: pw.EdgeInsets.only(left: 20,), child: pw.Container(padding: pw.EdgeInsets.only
                  (top: 10,left: 10,),decoration: pw.BoxDecoration(color: PdfColor.fromInt(0xffffffff),), height: 40, width: 1145,child: pw.Row(children: <pw.Widget>[
                  pw.Container( height: 35, width: 270,decoration: const pw.BoxDecoration(color: PdfColor.fromInt(0xffc7d0d8), borderRadius: 6),
                    child: pw.Text('  Bedroom Doors: ',
                        style: pw.TextStyle(font: alice, fontSize: 22)),),pw.SizedBox(width: 15,), pw.Container( height: 35, width: 270,
                    decoration: const pw.BoxDecoration(color: PdfColor.fromInt(0xfff3ded4), borderRadius: 6), child: pw.Text(
                        '  Quanity: ${bedExdoorNotifier.bedExdoorList.isNotEmpty ? bedExdoorNotifier.bedExdoorList.last.quantity : ' NA'}',
                        style: pw.TextStyle(font: alice,fontSize: 20,)),), pw.SizedBox( width: 15, ), pw.Container(height: 35,width: 270,
                    decoration: const pw.BoxDecoration( color: PdfColor.fromInt(0xfff3ded4), borderRadius: 6), child: pw.Text(
                        '  Colour: ${bedExdoorNotifier.bedExdoorList.isNotEmpty ? bedExdoorNotifier.bedExdoorList.last.colour : ' NA'}',
                        style: pw.TextStyle( font: alice,fontSize: 20,)),), pw.SizedBox(width: 15,),pw.Container(height: 35, width: 270,
                    decoration: const pw.BoxDecoration( color: PdfColor.fromInt(0xfff3ded4), borderRadius: 6), child: pw.Text(
                        '  Cleanliness: ${bedExdoorNotifier.bedExdoorList.isNotEmpty ? bedExdoorNotifier.bedExdoorList.last.condition : ' NA'}',
                        style: pw.TextStyle(font: alice,fontSize: 20, )),),])),),pw.Container(padding: pw.EdgeInsets.only(left: 20),
                  child: pw.Container(decoration: pw.BoxDecoration(color: PdfColor.fromInt(0xffffffff),), width: 1145, padding: pw.EdgeInsets.only(left: 8),
                    child: pw.Row(children: <pw.Widget>[ pw.SizedBox(width: 5, ),pw.Container( child: pw.Text(
                      '  Description : ${bedExdoorNotifier.bedExdoorList.isNotEmpty ? bedExdoorNotifier.bedExdoorList.last.description : '  NA'}',
                      style: pw.TextStyle(font: alice, fontSize: 20,),),width: 270,height: 630,decoration: pw.BoxDecoration( color: PdfColor.fromInt(0xfff3ded4)), ),
                      pw.Container(height: 670,width: 870,child: pw.GridView(crossAxisCount: 2,childAspectRatio: 01.01,children: List<pw.Widget>.generate(
                        bedExdoorPhNotifier.bedExdoorPhList.length, (int n) {var imag = PdfImage.file( pdf.document, bytes: File(
                          bedExdoorPhNotifier.bedExdoorPhList[n].photo.path).readAsBytesSync(),);return pw.Container(child: pw.Image(imag, height: 290,
                          width: 400, fit: pw.BoxFit.contain)); }, ), ), ), ]), ), ), ])), ]), ]; }, )); }
      if (bedIndoorNotifier.bedIndoorList.isNotEmpty || bedIndoorPhNotifier.bedIndoorPhList.isNotEmpty) {
        final font = await rootBundle.load("assets/herrvon.ttf"); final herrvon = pw.Font.ttf(font);
        final fonta = await rootBundle.load("assets/alive.ttf");  final alice = pw.Font.ttf(fonta);
        final fontb = await rootBundle.load("assets/arimo.ttf");  final arimo = pw.Font.ttf(fontb);
        var pwtheme = pw.Theme.withFont( base: pw.Font.ttf(await rootBundle.load("assets/arimo.ttf")),);
        PdfImage _bgm;  _bgm = PdfImage.file( pdf.document, bytes: (await rootBundle.load('assets/bgm.jpg')).buffer.asUint8List(), );
        pdf.addPage(pw.MultiPage(theme: pwtheme, pageFormat: PdfPageFormat.a3.landscape, margin: pw.EdgeInsets.all(1),
          build: (pw.Context context) { return <pw.Widget>[pw.Stack(children: <pw.Widget>[pw.Container(child: pw.Image(_bgm, height: 831, fit: pw.BoxFit.cover),),
            pw.Container(padding: pw.EdgeInsets.only(top: 10,), child: pw.Row(children: <pw.Widget>[pw.Text('    Check Inventory',style: pw.TextStyle(
              font: herrvon, fontSize: 50.0, )),pw.SizedBox( width: 750,), pw.Column(children: <pw.Widget>[pw.Text('POWERED BY'), pw.UrlLink(
              destination: 'https://www.eutopianlettings.co.uk', child: pw.Text('EUTOPIANLETTINGS.CO.UK'), ), ]) ]), ), pw.Container(
                padding: pw.EdgeInsets.only(top: 1),child: pw.Column(mainAxisAlignment: pw.MainAxisAlignment.start, crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: <pw.Widget>[ pw.SizedBox(height:100,), pw.Container( padding: pw.EdgeInsets.only(left: 20,), child: pw.Container(padding: pw.EdgeInsets.only
                  (top: 10,left: 10,),decoration: pw.BoxDecoration(color: PdfColor.fromInt(0xffffffff),), height: 40, width: 1145,child: pw.Row(children: <pw.Widget>[
                  pw.Container( height: 35, width: 270,decoration: const pw.BoxDecoration(color: PdfColor.fromInt(0xffc7d0d8), borderRadius: 6),
                    child: pw.Text('  Bedroom Interior: ',
                        style: pw.TextStyle(font: alice, fontSize: 22)),),pw.SizedBox(width: 15,), pw.Container( height: 35, width: 270,
                    decoration: const pw.BoxDecoration(color: PdfColor.fromInt(0xfff3ded4), borderRadius: 6), child: pw.Text(
                        '  Quanity: ${bedIndoorNotifier.bedIndoorList.isNotEmpty ? bedIndoorNotifier.bedIndoorList.last.quantity : ' NA'}',
                        style: pw.TextStyle(font: alice,fontSize: 20,)),), pw.SizedBox( width: 15, ), pw.Container(height: 35,width: 270,
                    decoration: const pw.BoxDecoration( color: PdfColor.fromInt(0xfff3ded4), borderRadius: 6), child: pw.Text(
                        '  Colour: ${bedIndoorNotifier.bedIndoorList.isNotEmpty ? bedIndoorNotifier.bedIndoorList.last.colour : ' NA'}',
                        style: pw.TextStyle( font: alice,fontSize: 20,)),), pw.SizedBox(width: 15,),pw.Container(height: 35, width: 270,
                    decoration: const pw.BoxDecoration( color: PdfColor.fromInt(0xfff3ded4), borderRadius: 6), child: pw.Text(
                        '  Cleanliness: ${bedIndoorNotifier.bedIndoorList.isNotEmpty ? bedIndoorNotifier.bedIndoorList.last.condition : ' NA'}',
                        style: pw.TextStyle(font: alice,fontSize: 20, )),),])),),pw.Container(padding: pw.EdgeInsets.only(left: 20),
                  child: pw.Container(decoration: pw.BoxDecoration(color: PdfColor.fromInt(0xffffffff),), width: 1145, padding: pw.EdgeInsets.only(left: 8),
                    child: pw.Row(children: <pw.Widget>[ pw.SizedBox(width: 5, ),pw.Container( child: pw.Text(
                      '  Description : ${bedIndoorNotifier.bedIndoorList.isNotEmpty ? bedIndoorNotifier.bedIndoorList.last.description : '  NA'}',
                      style: pw.TextStyle(font: alice, fontSize: 20,),),width: 270,height: 630,decoration: pw.BoxDecoration( color: PdfColor.fromInt(0xfff3ded4)), ),
                      pw.Container(height: 670,width: 870,child: pw.GridView(crossAxisCount: 2,childAspectRatio: 01.01,children: List<pw.Widget>.generate(
                        bedIndoorPhNotifier.bedIndoorPhList.length, (int n) {var imag = PdfImage.file( pdf.document, bytes: File(
                          bedIndoorPhNotifier.bedIndoorPhList[n].photo.path).readAsBytesSync(),);return pw.Container(child: pw.Image(imag, height: 290,
                          width: 400, fit: pw.BoxFit.contain)); }, ), ), ), ]), ), ), ])), ]), ]; }, )); }
      if (bedCeilingNotifier.bedCeilingList.isNotEmpty || bedCeilingPhNotifier.bedCeilingPhList.isNotEmpty) {
        final font = await rootBundle.load("assets/herrvon.ttf"); final herrvon = pw.Font.ttf(font);
        final fonta = await rootBundle.load("assets/alive.ttf");  final alice = pw.Font.ttf(fonta);
        final fontb = await rootBundle.load("assets/arimo.ttf");  final arimo = pw.Font.ttf(fontb);
        var pwtheme = pw.Theme.withFont( base: pw.Font.ttf(await rootBundle.load("assets/arimo.ttf")),);
        PdfImage _bgm;  _bgm = PdfImage.file( pdf.document, bytes: (await rootBundle.load('assets/bgm.jpg')).buffer.asUint8List(), );
        pdf.addPage(pw.MultiPage(theme: pwtheme, pageFormat: PdfPageFormat.a3.landscape, margin: pw.EdgeInsets.all(1),
          build: (pw.Context context) { return <pw.Widget>[pw.Stack(children: <pw.Widget>[pw.Container(child: pw.Image(_bgm, height: 831, fit: pw.BoxFit.cover),),
            pw.Container(padding: pw.EdgeInsets.only(top: 10,), child: pw.Row(children: <pw.Widget>[pw.Text('    Check Inventory',style: pw.TextStyle(
              font: herrvon, fontSize: 50.0, )),pw.SizedBox( width: 750,), pw.Column(children: <pw.Widget>[pw.Text('POWERED BY'), pw.UrlLink(
              destination: 'https://www.eutopianlettings.co.uk', child: pw.Text('EUTOPIANLETTINGS.CO.UK'), ), ]) ]), ), pw.Container(
                padding: pw.EdgeInsets.only(top: 1),child: pw.Column(mainAxisAlignment: pw.MainAxisAlignment.start, crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: <pw.Widget>[ pw.SizedBox(height:100,), pw.Container( padding: pw.EdgeInsets.only(left: 20,), child: pw.Container(padding: pw.EdgeInsets.only
                  (top: 10,left: 10,),decoration: pw.BoxDecoration(color: PdfColor.fromInt(0xffffffff),), height: 40, width: 1145,child: pw.Row(children: <pw.Widget>[
                  pw.Container( height: 35, width: 270,decoration: const pw.BoxDecoration(color: PdfColor.fromInt(0xffc7d0d8), borderRadius: 6),
                    child: pw.Text('  Bedroom Ceiling: ',
                        style: pw.TextStyle(font: alice, fontSize: 22)),),pw.SizedBox(width: 15,), pw.Container( height: 35, width: 270,
                    decoration: const pw.BoxDecoration(color: PdfColor.fromInt(0xfff3ded4), borderRadius: 6), child: pw.Text(
                        '  Quanity: ${bedCeilingNotifier.bedCeilingList.isNotEmpty ? bedCeilingNotifier.bedCeilingList.last.quantity : ' NA'}',
                        style: pw.TextStyle(font: alice,fontSize: 20,)),), pw.SizedBox( width: 15, ), pw.Container(height: 35,width: 270,
                    decoration: const pw.BoxDecoration( color: PdfColor.fromInt(0xfff3ded4), borderRadius: 6), child: pw.Text(
                        '  Colour: ${bedCeilingNotifier.bedCeilingList.isNotEmpty ? bedCeilingNotifier.bedCeilingList.last.colour : ' NA'}',
                        style: pw.TextStyle( font: alice,fontSize: 20,)),), pw.SizedBox(width: 15,),pw.Container(height: 35, width: 270,
                    decoration: const pw.BoxDecoration( color: PdfColor.fromInt(0xfff3ded4), borderRadius: 6), child: pw.Text(
                        '  Cleanliness: ${bedCeilingNotifier.bedCeilingList.isNotEmpty ? bedCeilingNotifier.bedCeilingList.last.condition : ' NA'}',
                        style: pw.TextStyle(font: alice,fontSize: 20, )),),])),),pw.Container(padding: pw.EdgeInsets.only(left: 20),
                  child: pw.Container(decoration: pw.BoxDecoration(color: PdfColor.fromInt(0xffffffff),), width: 1145, padding: pw.EdgeInsets.only(left: 8),
                    child: pw.Row(children: <pw.Widget>[ pw.SizedBox(width: 5, ),pw.Container( child: pw.Text(
                      '  Description : ${bedCeilingNotifier.bedCeilingList.isNotEmpty ? bedCeilingNotifier.bedCeilingList.last.description : '  NA'}',
                      style: pw.TextStyle(font: alice, fontSize: 20,),),width: 270,height: 630,decoration: pw.BoxDecoration( color: PdfColor.fromInt(0xfff3ded4)), ),
                      pw.Container(height: 670,width: 870,child: pw.GridView(crossAxisCount: 2,childAspectRatio: 01.01,children: List<pw.Widget>.generate(
                        bedCeilingPhNotifier.bedCeilingPhList.length, (int n) {var imag = PdfImage.file( pdf.document, bytes: File(
                          bedCeilingPhNotifier.bedCeilingPhList[n].photo.path).readAsBytesSync(),);return pw.Container(child: pw.Image(imag, height: 290,
                          width: 400, fit: pw.BoxFit.contain)); }, ), ), ), ]), ), ), ])), ]), ]; }, )); }
      if (bedLightNotifier.bedLightList.isNotEmpty || bedLightPhNotifier.bedLightPhList.isNotEmpty) {
        final font = await rootBundle.load("assets/herrvon.ttf"); final herrvon = pw.Font.ttf(font);
        final fonta = await rootBundle.load("assets/alive.ttf");  final alice = pw.Font.ttf(fonta);
        final fontb = await rootBundle.load("assets/arimo.ttf");  final arimo = pw.Font.ttf(fontb);
        var pwtheme = pw.Theme.withFont( base: pw.Font.ttf(await rootBundle.load("assets/arimo.ttf")),);
        PdfImage _bgm;  _bgm = PdfImage.file( pdf.document, bytes: (await rootBundle.load('assets/bgm.jpg')).buffer.asUint8List(), );
        pdf.addPage(pw.MultiPage(theme: pwtheme, pageFormat: PdfPageFormat.a3.landscape, margin: pw.EdgeInsets.all(1),
          build: (pw.Context context) { return <pw.Widget>[pw.Stack(children: <pw.Widget>[pw.Container(child: pw.Image(_bgm, height: 831, fit: pw.BoxFit.cover),),
            pw.Container(padding: pw.EdgeInsets.only(top: 10,), child: pw.Row(children: <pw.Widget>[pw.Text('    Check Inventory',style: pw.TextStyle(
              font: herrvon, fontSize: 50.0, )),pw.SizedBox( width: 750,), pw.Column(children: <pw.Widget>[pw.Text('POWERED BY'), pw.UrlLink(
              destination: 'https://www.eutopianlettings.co.uk', child: pw.Text('EUTOPIANLETTINGS.CO.UK'), ), ]) ]), ), pw.Container(
                padding: pw.EdgeInsets.only(top: 1),child: pw.Column(mainAxisAlignment: pw.MainAxisAlignment.start, crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: <pw.Widget>[ pw.SizedBox(height:100,), pw.Container( padding: pw.EdgeInsets.only(left: 20,), child: pw.Container(padding: pw.EdgeInsets.only
                  (top: 10,left: 10,),decoration: pw.BoxDecoration(color: PdfColor.fromInt(0xffffffff),), height: 40, width: 1145,child: pw.Row(children: <pw.Widget>[
                  pw.Container( height: 35, width: 270,decoration: const pw.BoxDecoration(color: PdfColor.fromInt(0xffc7d0d8), borderRadius: 6),
                    child: pw.Text('  Bedroom Light: ',
                        style: pw.TextStyle(font: alice, fontSize: 22)),),pw.SizedBox(width: 15,), pw.Container( height: 35, width: 270,
                    decoration: const pw.BoxDecoration(color: PdfColor.fromInt(0xfff3ded4), borderRadius: 6), child: pw.Text(
                        '  Quanity: ${bedLightNotifier.bedLightList.isNotEmpty ? bedLightNotifier.bedLightList.last.quantity : ' NA'}',
                        style: pw.TextStyle(font: alice,fontSize: 20,)),), pw.SizedBox( width: 15, ), pw.Container(height: 35,width: 270,
                    decoration: const pw.BoxDecoration( color: PdfColor.fromInt(0xfff3ded4), borderRadius: 6), child: pw.Text(
                        '  Colour: ${bedLightNotifier.bedLightList.isNotEmpty ? bedLightNotifier.bedLightList.last.colour : ' NA'}',
                        style: pw.TextStyle( font: alice,fontSize: 20,)),), pw.SizedBox(width: 15,),pw.Container(height: 35, width: 270,
                    decoration: const pw.BoxDecoration( color: PdfColor.fromInt(0xfff3ded4), borderRadius: 6), child: pw.Text(
                        '  Cleanliness: ${bedLightNotifier.bedLightList.isNotEmpty ? bedLightNotifier.bedLightList.last.condition : ' NA'}',
                        style: pw.TextStyle(font: alice,fontSize: 20, )),),])),),pw.Container(padding: pw.EdgeInsets.only(left: 20),
                  child: pw.Container(decoration: pw.BoxDecoration(color: PdfColor.fromInt(0xffffffff),), width: 1145, padding: pw.EdgeInsets.only(left: 8),
                    child: pw.Row(children: <pw.Widget>[ pw.SizedBox(width: 5, ),pw.Container( child: pw.Text(
                      '  Description : ${bedLightNotifier.bedLightList.isNotEmpty ? bedLightNotifier.bedLightList.last.description : '  NA'}',
                      style: pw.TextStyle(font: alice, fontSize: 20,),),width: 270,height: 630,decoration: pw.BoxDecoration( color: PdfColor.fromInt(0xfff3ded4)), ),
                      pw.Container(height: 670,width: 870,child: pw.GridView(crossAxisCount: 2,childAspectRatio: 01.01,children: List<pw.Widget>.generate(
                        bedLightPhNotifier.bedLightPhList.length, (int n) {var imag = PdfImage.file( pdf.document, bytes: File(
                          bedLightPhNotifier.bedLightPhList[n].photo.path).readAsBytesSync(),);return pw.Container(child: pw.Image(imag, height: 290,
                          width: 400, fit: pw.BoxFit.cover)); }, ), ), ), ]), ), ), ])), ]), ]; }, )); }
      if (bedWallsNotifier.bedWallsList.isNotEmpty || bedWallsPhNotifier.bedWallsPhList.isNotEmpty) {
        final font = await rootBundle.load("assets/herrvon.ttf"); final herrvon = pw.Font.ttf(font);
        final fonta = await rootBundle.load("assets/alive.ttf");  final alice = pw.Font.ttf(fonta);
        final fontb = await rootBundle.load("assets/arimo.ttf");  final arimo = pw.Font.ttf(fontb);
        var pwtheme = pw.Theme.withFont( base: pw.Font.ttf(await rootBundle.load("assets/arimo.ttf")),);
        PdfImage _bgm;  _bgm = PdfImage.file( pdf.document, bytes: (await rootBundle.load('assets/bgm.jpg')).buffer.asUint8List(), );
        pdf.addPage(pw.MultiPage(theme: pwtheme, pageFormat: PdfPageFormat.a3.landscape, margin: pw.EdgeInsets.all(1),
          build: (pw.Context context) { return <pw.Widget>[pw.Stack(children: <pw.Widget>[pw.Container(child: pw.Image(_bgm, height: 831, fit: pw.BoxFit.cover),),
            pw.Container(padding: pw.EdgeInsets.only(top: 10,), child: pw.Row(children: <pw.Widget>[pw.Text('    Check Inventory',style: pw.TextStyle(
              font: herrvon, fontSize: 50.0, )),pw.SizedBox( width: 750,), pw.Column(children: <pw.Widget>[pw.Text('POWERED BY'), pw.UrlLink(
              destination: 'https://www.eutopianlettings.co.uk', child: pw.Text('EUTOPIANLETTINGS.CO.UK'), ), ]) ]), ), pw.Container(
                padding: pw.EdgeInsets.only(top: 1),child: pw.Column(mainAxisAlignment: pw.MainAxisAlignment.start, crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: <pw.Widget>[ pw.SizedBox(height:100,), pw.Container( padding: pw.EdgeInsets.only(left: 20,), child: pw.Container(padding: pw.EdgeInsets.only
                  (top: 10,left: 10,),decoration: pw.BoxDecoration(color: PdfColor.fromInt(0xffffffff),), height: 40, width: 1145,child: pw.Row(children: <pw.Widget>[
                  pw.Container( height: 35, width: 270,decoration: const pw.BoxDecoration(color: PdfColor.fromInt(0xffc7d0d8), borderRadius: 6),
                    child: pw.Text('  Bedroom Walls: ',
                        style: pw.TextStyle(font: alice, fontSize: 22)),),pw.SizedBox(width: 15,), pw.Container( height: 35, width: 270,
                    decoration: const pw.BoxDecoration(color: PdfColor.fromInt(0xfff3ded4), borderRadius: 6), child: pw.Text(
                        '  Quanity: ${bedWallsNotifier.bedWallsList.isNotEmpty ? bedWallsNotifier.bedWallsList.last.quantity : ' NA'}',
                        style: pw.TextStyle(font: alice,fontSize: 20,)),), pw.SizedBox( width: 15, ), pw.Container(height: 35,width: 270,
                    decoration: const pw.BoxDecoration( color: PdfColor.fromInt(0xfff3ded4), borderRadius: 6), child: pw.Text(
                        '  Colour: ${bedWallsNotifier.bedWallsList.isNotEmpty ? bedWallsNotifier.bedWallsList.last.colour : ' NA'}',
                        style: pw.TextStyle( font: alice,fontSize: 20,)),), pw.SizedBox(width: 15,),pw.Container(height: 35, width: 270,
                    decoration: const pw.BoxDecoration( color: PdfColor.fromInt(0xfff3ded4), borderRadius: 6), child: pw.Text(
                        '  Cleanliness: ${bedWallsNotifier.bedWallsList.isNotEmpty ? bedWallsNotifier.bedWallsList.last.condition : ' NA'}',
                        style: pw.TextStyle(font: alice,fontSize: 20, )),),])),),pw.Container(padding: pw.EdgeInsets.only(left: 20),
                  child: pw.Container(decoration: pw.BoxDecoration(color: PdfColor.fromInt(0xffffffff),), width: 1145, padding: pw.EdgeInsets.only(left: 8),
                    child: pw.Row(children: <pw.Widget>[ pw.SizedBox(width: 5, ),pw.Container( child: pw.Text(
                      '  Description : ${bedWallsNotifier.bedWallsList.isNotEmpty ? bedWallsNotifier.bedWallsList.last.description : '  NA'}',
                      style: pw.TextStyle(font: alice, fontSize: 20,),),width: 270,height: 630,decoration: pw.BoxDecoration( color: PdfColor.fromInt(0xfff3ded4)), ),
                      pw.Container(height: 670,width: 870,child: pw.GridView(crossAxisCount: 2,childAspectRatio: 01.01,children: List<pw.Widget>.generate(
                        bedWallsPhNotifier.bedWallsPhList.length, (int n) {var imag = PdfImage.file( pdf.document, bytes: File(
                          bedWallsPhNotifier.bedWallsPhList[n].photo.path).readAsBytesSync(),);return pw.Container(child: pw.Image(imag, height: 290,
                          width: 400, fit: pw.BoxFit.cover)); }, ), ), ), ]), ), ), ])), ]), ]; }, )); }
      if (bedWindowsNotifier.bedWindowsList.isNotEmpty || bedWindowsPhNotifier.bedWindowsPhList.isNotEmpty) {
        final font = await rootBundle.load("assets/herrvon.ttf"); final herrvon = pw.Font.ttf(font);
        final fonta = await rootBundle.load("assets/alive.ttf");  final alice = pw.Font.ttf(fonta);
        final fontb = await rootBundle.load("assets/arimo.ttf");  final arimo = pw.Font.ttf(fontb);
        var pwtheme = pw.Theme.withFont( base: pw.Font.ttf(await rootBundle.load("assets/arimo.ttf")),);
        PdfImage _bgm;  _bgm = PdfImage.file( pdf.document, bytes: (await rootBundle.load('assets/bgm.jpg')).buffer.asUint8List(), );
        pdf.addPage(pw.MultiPage(theme: pwtheme, pageFormat: PdfPageFormat.a3.landscape, margin: pw.EdgeInsets.all(1),
          build: (pw.Context context) { return <pw.Widget>[pw.Stack(children: <pw.Widget>[pw.Container(child: pw.Image(_bgm, height: 831, fit: pw.BoxFit.cover),),
            pw.Container(padding: pw.EdgeInsets.only(top: 10,), child: pw.Row(children: <pw.Widget>[pw.Text('    Check Inventory',style: pw.TextStyle(
              font: herrvon, fontSize: 50.0, )),pw.SizedBox( width: 750,), pw.Column(children: <pw.Widget>[pw.Text('POWERED BY'), pw.UrlLink(
              destination: 'https://www.eutopianlettings.co.uk', child: pw.Text('EUTOPIANLETTINGS.CO.UK'), ), ]) ]), ), pw.Container(
                padding: pw.EdgeInsets.only(top: 1),child: pw.Column(mainAxisAlignment: pw.MainAxisAlignment.start, crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: <pw.Widget>[ pw.SizedBox(height:100,), pw.Container( padding: pw.EdgeInsets.only(left: 20,), child: pw.Container(padding: pw.EdgeInsets.only
                  (top: 10,left: 10,),decoration: pw.BoxDecoration(color: PdfColor.fromInt(0xffffffff),), height: 40, width: 1145,child: pw.Row(children: <pw.Widget>[
                  pw.Container( height: 35, width: 270,decoration: const pw.BoxDecoration(color: PdfColor.fromInt(0xffc7d0d8), borderRadius: 6),
                    child: pw.Text('  Bedroom Windows: ',
                        style: pw.TextStyle(font: alice, fontSize: 22)),),pw.SizedBox(width: 15,), pw.Container( height: 35, width: 270,
                    decoration: const pw.BoxDecoration(color: PdfColor.fromInt(0xfff3ded4), borderRadius: 6), child: pw.Text(
                        '  Quanity: ${bedWindowsNotifier.bedWindowsList.isNotEmpty ? bedWindowsNotifier.bedWindowsList.last.quantity : ' NA'}',
                        style: pw.TextStyle(font: alice,fontSize: 20,)),), pw.SizedBox( width: 15, ), pw.Container(height: 35,width: 270,
                    decoration: const pw.BoxDecoration( color: PdfColor.fromInt(0xfff3ded4), borderRadius: 6), child: pw.Text(
                        '  Colour: ${bedWindowsNotifier.bedWindowsList.isNotEmpty ? bedWindowsNotifier.bedWindowsList.last.colour : ' NA'}',
                        style: pw.TextStyle( font: alice,fontSize: 20,)),), pw.SizedBox(width: 15,),pw.Container(height: 35, width: 270,
                    decoration: const pw.BoxDecoration( color: PdfColor.fromInt(0xfff3ded4), borderRadius: 6), child: pw.Text(
                        '  Cleanliness: ${bedWindowsNotifier.bedWindowsList.isNotEmpty ? bedWindowsNotifier.bedWindowsList.last.condition : ' NA'}',
                        style: pw.TextStyle(font: alice,fontSize: 20, )),),])),),pw.Container(padding: pw.EdgeInsets.only(left: 20),
                  child: pw.Container(decoration: pw.BoxDecoration(color: PdfColor.fromInt(0xffffffff),), width: 1145, padding: pw.EdgeInsets.only(left: 8),
                    child: pw.Row(children: <pw.Widget>[ pw.SizedBox(width: 5, ),pw.Container( child: pw.Text(
                      '  Description : ${bedWindowsNotifier.bedWindowsList.isNotEmpty ? bedWindowsNotifier.bedWindowsList.last.description : '  NA'}',
                      style: pw.TextStyle(font: alice, fontSize: 20,),),width: 270,height: 630,decoration: pw.BoxDecoration( color: PdfColor.fromInt(0xfff3ded4)), ),
                      pw.Container(height: 670,width: 870,child: pw.GridView(crossAxisCount: 2,childAspectRatio: 01.01,children: List<pw.Widget>.generate(
                        bedWindowsPhNotifier.bedWindowsPhList.length, (int n) {var imag = PdfImage.file( pdf.document, bytes: File(
                          bedWindowsPhNotifier.bedWindowsPhList[n].photo.path).readAsBytesSync(),);return pw.Container(child: pw.Image(imag, height: 290,
                          width: 400, fit: pw.BoxFit.cover)); }, ), ), ), ]), ), ), ])), ]), ]; }, )); }
    }

    writeOnPdfChaabi() async {
      if (
      inventKeyNotifier.inventKeyList.isNotEmpty || inventKeyPhNotifier.inventKeyPhList.isNotEmpty) {
        final font = await rootBundle.load("assets/herrvon.ttf"); final herrvon = pw.Font.ttf(font);
        final fonta = await rootBundle.load("assets/alive.ttf");  final alice = pw.Font.ttf(fonta);
        final fontb = await rootBundle.load("assets/arimo.ttf");  final arimo = pw.Font.ttf(fontb);
        var pwtheme = pw.Theme.withFont( base: pw.Font.ttf(await rootBundle.load("assets/arimo.ttf")),);
        PdfImage _bgm;  _bgm = PdfImage.file( pdf.document, bytes: (await rootBundle.load('assets/bgm.jpg')).buffer.asUint8List(), );
        pdf.addPage(pw.MultiPage(theme: pwtheme, pageFormat: PdfPageFormat.a3.landscape, margin: pw.EdgeInsets.all(1),
          build: (pw.Context context) { return <pw.Widget>[pw.Stack(children: <pw.Widget>[pw.Container(child: pw.Image(_bgm, height: 831, fit: pw.BoxFit.cover),),
            pw.Container(padding: pw.EdgeInsets.only(top: 10,), child: pw.Row(children: <pw.Widget>[pw.Text('    Check Inventory',style: pw.TextStyle(
              font: herrvon, fontSize: 50.0, )),pw.SizedBox( width: 750,), pw.Column(children: <pw.Widget>[pw.Text('POWERED BY'), pw.UrlLink(
              destination: 'https://www.eutopianlettings.co.uk', child: pw.Text('EUTOPIANLETTINGS.CO.UK'), ), ]) ]), ), pw.Container(
                padding: pw.EdgeInsets.only(top: 1),child: pw.Column(mainAxisAlignment: pw.MainAxisAlignment.start, crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: <pw.Widget>[ pw.SizedBox(height:100,), pw.Container( padding: pw.EdgeInsets.only(left: 20,), child: pw.Container(padding: pw.EdgeInsets.only
                  (top: 10,left: 10,),decoration: pw.BoxDecoration(color: PdfColor.fromInt(0xffffffff),), height: 40, width: 1145,child: pw.Row(children: <pw.Widget>[
                  pw.Container( height: 35, width: 270,decoration: const pw.BoxDecoration(color: PdfColor.fromInt(0xffc7d0d8), borderRadius: 6),
                    child: pw.Text('  INVENTORY KEY: ',
                        style: pw.TextStyle(font: alice, fontSize: 22)),),pw.SizedBox(width: 15,), pw.Container( height: 35, width: 270,
                    decoration: const pw.BoxDecoration(color: PdfColor.fromInt(0xfff3ded4), borderRadius: 6), child: pw.Text(
                        '  Sets of Keys: ${inventKeyNotifier.inventKeyList.isNotEmpty ? inventKeyNotifier.inventKeyList.last.quantity : ' NA'}',
                        style: pw.TextStyle(font: alice,fontSize: 20,)),), pw.SizedBox( width: 15, ), pw.Container(height: 35,width: 270,
                    decoration: const pw.BoxDecoration( color: PdfColor.fromInt(0xfff3ded4), borderRadius: 6), child: pw.Text(
                        '  Keys in each set: ${inventKeyNotifier.inventKeyList.isNotEmpty ? inventKeyNotifier.inventKeyList.last.colour : ' NA'}',
                        style: pw.TextStyle( font: alice,fontSize: 20,)),), pw.SizedBox(width: 15,),pw.Container(height: 35, width: 270,
                    decoration: const pw.BoxDecoration( color: PdfColor.fromInt(0xffffffff), borderRadius: 6), child: pw.Text(
                        '    ',
                        style: pw.TextStyle(font: alice,fontSize: 20, )),),])),),pw.Container(padding: pw.EdgeInsets.only(left: 20),
                  child: pw.Container(decoration: pw.BoxDecoration(color: PdfColor.fromInt(0xffffffff),), width: 1145, padding: pw.EdgeInsets.only(left: 8),
                    child: pw.Row(children: <pw.Widget>[ pw.SizedBox(width: 5, ),pw.Container( child: pw.Text(
                      '  ',
                      style: pw.TextStyle(font: alice, fontSize: 20,),),width: 270,height: 630,decoration: pw.BoxDecoration( color: PdfColor.fromInt(0xfff3ded4)), ),
                      pw.Container(height: 670,width: 870,child: pw.Container(padding: pw.EdgeInsets.only(left:50,), child:inventKeyPhNotifier.inventKeyPhList.isEmpty ? pw.Center(child:pw.Text('No Image'),) : pw.Image(PdfImage.file( pdf.document, bytes: File(
                          inventKeyPhNotifier.inventKeyPhList.last.photo.path).readAsBytesSync(),), height: 600,
                          width: 800, fit: pw.BoxFit.contain)), ), ]), ), ), ])), ]), ]; }, )); }
      }

    writeOnPdfMeter() async {
      if (elecMeterNotifier.elecMeterList.isNotEmpty || elecMeterPhNotifier.elecMeterPhList.isNotEmpty) {
        final font = await rootBundle.load("assets/herrvon.ttf"); final herrvon = pw.Font.ttf(font);
        final fonta = await rootBundle.load("assets/alive.ttf");  final alice = pw.Font.ttf(fonta);
        final fontb = await rootBundle.load("assets/arimo.ttf");  final arimo = pw.Font.ttf(fontb);
        var pwtheme = pw.Theme.withFont( base: pw.Font.ttf(await rootBundle.load("assets/arimo.ttf")),);
        PdfImage _bgm;  _bgm = PdfImage.file( pdf.document, bytes: (await rootBundle.load('assets/bgm.jpg')).buffer.asUint8List(), );
        pdf.addPage(pw.MultiPage(theme: pwtheme, pageFormat: PdfPageFormat.a3.landscape, margin: pw.EdgeInsets.all(1),
          build: (pw.Context context) { return <pw.Widget>[pw.Stack(children: <pw.Widget>[pw.Container(child: pw.Image(_bgm, height: 831, fit: pw.BoxFit.cover),),
            pw.Container(padding: pw.EdgeInsets.only(top: 10,), child: pw.Row(children: <pw.Widget>[pw.Text('    Check Inventory',style: pw.TextStyle(
              font: herrvon, fontSize: 50.0, )),pw.SizedBox( width: 750,), pw.Column(children: <pw.Widget>[pw.Text('POWERED BY'), pw.UrlLink(
              destination: 'https://www.eutopianlettings.co.uk', child: pw.Text('EUTOPIANLETTINGS.CO.UK'), ), ]) ]), ), pw.Container(
                padding: pw.EdgeInsets.only(top: 1),child: pw.Column(mainAxisAlignment: pw.MainAxisAlignment.start, crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: <pw.Widget>[ pw.SizedBox(height:100,), pw.Container( padding: pw.EdgeInsets.only(left: 20,), child: pw.Container(padding: pw.EdgeInsets.only
                  (top: 10,left: 10,),decoration: pw.BoxDecoration(color: PdfColor.fromInt(0xffffffff),), height: 40, width: 1145,child: pw.Row(children: <pw.Widget>[
                  pw.Container( height: 35, width: 270,decoration: const pw.BoxDecoration(color: PdfColor.fromInt(0xffc7d0d8), borderRadius: 6),
                    child: pw.Text('  ELECTRIC METER: ',
                        style: pw.TextStyle(font: alice, fontSize: 22)),),pw.SizedBox(width: 15,), pw.Container( height: 35, width: 270,
                    decoration: const pw.BoxDecoration(color: PdfColor.fromInt(0xfff3ded4), borderRadius: 6), child: pw.Text(
                        '   Reading : ${elecMeterNotifier.elecMeterList.isNotEmpty ? elecMeterNotifier.elecMeterList.last.quantity : ' NA'}',
                        style: pw.TextStyle(font: alice,fontSize: 20,)),), pw.SizedBox( width: 15, ), /*pw.Container(height: 35,width: 270,
                    decoration: const pw.BoxDecoration( color: PdfColor.fromInt(0xfff3ded4), borderRadius: 6), child: pw.Text(
                        '  Reading: ${elecMeterNotifier.elecMeterList.isNotEmpty ? elecMeterNotifier.elecMeterList.last.colour : ' NA'}',
                        style: pw.TextStyle( font: alice,fontSize: 20,)),),*/ pw.SizedBox(width: 15,),pw.Container(height: 35, width: 270,
                    decoration: const pw.BoxDecoration( color: PdfColor.fromInt(0xfff3ded4), borderRadius: 6), child: pw.Text(
                        '   Serial  : ${elecMeterNotifier.elecMeterList.isNotEmpty ? elecMeterNotifier.elecMeterList.last.description : '  NA'}',
                        style: pw.TextStyle(font: alice,fontSize: 20, )),),])),),pw.Container(padding: pw.EdgeInsets.only(left: 20),
                  child: pw.Container(decoration: pw.BoxDecoration(color: PdfColor.fromInt(0xffffffff),), width: 1145, padding: pw.EdgeInsets.only(left: 8),
                    child: pw.Row(children: <pw.Widget>[ pw.SizedBox(width: 5, ),pw.Container( child: pw.Text(
                      '   Location: ${elecMeterNotifier.elecMeterList.isNotEmpty ? elecMeterNotifier.elecMeterList.last.condition : ' NA'}',
                      style: pw.TextStyle(font: alice, fontSize: 20,),),width: 270,height: 630,decoration: pw.BoxDecoration( color: PdfColor.fromInt(0xfff3ded4)), ),
                      pw.Container(height: 670,width: 870,child: pw.GridView(crossAxisCount: 2,childAspectRatio: 01.01,children: List<pw.Widget>.generate(
                        elecMeterPhNotifier.elecMeterPhList.length, (int n) {var imag = PdfImage.file( pdf.document, bytes: File(
                          elecMeterPhNotifier.elecMeterPhList[n].photo.path).readAsBytesSync(),);return pw.Container(child: pw.Image(imag, height: 290,
                          width: 400, fit: pw.BoxFit.contain)); }, ), ), ), ]), ), ), ])), ]), ]; }, )); }
      if (gasMeterNotifier.gasMeterList.isNotEmpty || gasMeterPhNotifier.gasMeterPhList.isNotEmpty) {
        final font = await rootBundle.load("assets/herrvon.ttf"); final herrvon = pw.Font.ttf(font);
        final fonta = await rootBundle.load("assets/alive.ttf");  final alice = pw.Font.ttf(fonta);
        final fontb = await rootBundle.load("assets/arimo.ttf");  final arimo = pw.Font.ttf(fontb);
        var pwtheme = pw.Theme.withFont( base: pw.Font.ttf(await rootBundle.load("assets/arimo.ttf")),);
        PdfImage _bgm;  _bgm = PdfImage.file( pdf.document, bytes: (await rootBundle.load('assets/bgm.jpg')).buffer.asUint8List(), );
        pdf.addPage(pw.MultiPage(theme: pwtheme, pageFormat: PdfPageFormat.a3.landscape, margin: pw.EdgeInsets.all(1),
          build: (pw.Context context) { return <pw.Widget>[pw.Stack(children: <pw.Widget>[pw.Container(child: pw.Image(_bgm, height: 831, fit: pw.BoxFit.cover),),
            pw.Container(padding: pw.EdgeInsets.only(top: 10,), child: pw.Row(children: <pw.Widget>[pw.Text('    Check Inventory',style: pw.TextStyle(
              font: herrvon, fontSize: 50.0, )),pw.SizedBox( width: 750,), pw.Column(children: <pw.Widget>[pw.Text('POWERED BY'), pw.UrlLink(
              destination: 'https://www.eutopianlettings.co.uk', child: pw.Text('EUTOPIANLETTINGS.CO.UK'), ), ]) ]), ), pw.Container(
                padding: pw.EdgeInsets.only(top: 1),child: pw.Column(mainAxisAlignment: pw.MainAxisAlignment.start, crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: <pw.Widget>[ pw.SizedBox(height:100,), pw.Container( padding: pw.EdgeInsets.only(left: 20,), child: pw.Container(padding: pw.EdgeInsets.only
                  (top: 10,left: 10,),decoration: pw.BoxDecoration(color: PdfColor.fromInt(0xffffffff),), height: 40, width: 1145,child: pw.Row(children: <pw.Widget>[
                  pw.Container( height: 35, width: 270,decoration: const pw.BoxDecoration(color: PdfColor.fromInt(0xffc7d0d8), borderRadius: 6),
                    child: pw.Text('  GAS METER: ',
                        style: pw.TextStyle(font: alice, fontSize: 22)),),pw.SizedBox(width: 15,), pw.Container( height: 35, width: 270,
                    decoration: const pw.BoxDecoration(color: PdfColor.fromInt(0xfff3ded4), borderRadius: 6), child: pw.Text(
                        '  Reading: ${gasMeterNotifier.gasMeterList.isNotEmpty ? gasMeterNotifier.gasMeterList.last.quantity : ' NA'}',
                        style: pw.TextStyle(font: alice,fontSize: 20,)),), pw.SizedBox( width: 15, ), /*pw.Container(height: 35,width: 270,
                    decoration: const pw.BoxDecoration( color: PdfColor.fromInt(0xfff3ded4), borderRadius: 6), child: pw.Text(
                        '  Reading: ${gasMeterNotifier.gasMeterList.isNotEmpty ? gasMeterNotifier.gasMeterList.last.colour : ' NA'}',
                        style: pw.TextStyle( font: alice,fontSize: 20,)),),*/ pw.SizedBox(width: 15,),pw.Container(height: 35, width: 270,
                    decoration: const pw.BoxDecoration( color: PdfColor.fromInt(0xfff3ded4), borderRadius: 6), child: pw.Text(
                        '  Serial : ${gasMeterNotifier.gasMeterList.isNotEmpty ? gasMeterNotifier.gasMeterList.last.description : '  NA'}',
                        style: pw.TextStyle(font: alice,fontSize: 20, )),),])),),pw.Container(padding: pw.EdgeInsets.only(left: 20),
                  child: pw.Container(decoration: pw.BoxDecoration(color: PdfColor.fromInt(0xffffffff),), width: 1145, padding: pw.EdgeInsets.only(left: 8),
                    child: pw.Row(children: <pw.Widget>[ pw.SizedBox(width: 5, ),pw.Container( child: pw.Text(
                      '  Location: ${gasMeterNotifier.gasMeterList.isNotEmpty ? gasMeterNotifier.gasMeterList.last.condition : ' NA'}',
                      style: pw.TextStyle(font: alice, fontSize: 20,),),width: 270,height: 630,decoration: pw.BoxDecoration( color: PdfColor.fromInt(0xfff3ded4)), ),
                      pw.Container(height: 670,width: 870,child: pw.GridView(crossAxisCount: 2,childAspectRatio: 01.01,children: List<pw.Widget>.generate(
                        gasMeterPhNotifier.gasMeterPhList.length, (int n) {var imag = PdfImage.file( pdf.document, bytes: File(
                          gasMeterPhNotifier.gasMeterPhList[n].photo.path).readAsBytesSync(),);return pw.Container(child: pw.Image(imag, height: 290,
                          width: 400, fit: pw.BoxFit.contain)); }, ), ), ), ]), ), ), ])), ]), ]; }, )); }
    }

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
       await Share.file('Share your report', '${introNotifier.introList.last.description}.pdf', bytes.buffer.asUint8List(), '*/*');
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
          backgroundColor: Colors.transparent,
          body: Column(
            children: <Widget>[
          Container(
          padding: EdgeInsets.only(top: 50),
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
              SizedBox(height: 55),
              InkWell(
                onTap: () {
//                  Navigator.push(context,
//                      MaterialPageRoute(builder: (context) => Category(Route: '1')));
                },
                child: _btnexterior(),
              ),  //Exterior page
              SizedBox(
                height: 15,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => homeKeys()));
                },
                child: _btnkeys(),
              ),// keys
              SizedBox(
                height: 15,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => meterElec()));
                },
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
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Category(Route: '5',)));
                },
                child: _btnbedroom(),
              ),// bedroom
            ],
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
                      await writeOnPdfCover();
                      await writeOnPdfContent();
                      await writeOnPdfChaabi();
                      await writeOnPdfMeter();
                      await writeOnPdfSmote();
                      await writeOnPdfHallway();
                      await writeOnPdfKitchen();
                      await writeOnPdfBedroom();
//                      await writeOnPdfExterior();

//                        _Block(title: 'Tour bus driver');
                      await savePdf();
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