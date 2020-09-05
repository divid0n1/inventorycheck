import 'dart:collection';
import 'dart:io';
import 'dart:typed_data';
import 'package:esys_flutter_share/esys_flutter_share.dart';
import 'package:flutter/services.dart';
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
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:provider/provider.dart';
import 'package:inventorycheck/notify/imagesnotifier.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Pnum {
  final String pname;
  final String pid;
  Pnum({this.pname, this.pid});
}

class GenPdf  {

  final pdf = pw.Document();

  var pdffilename;



// cover page
    writeOnPdfCover(BuildContext context) async {
      IntroImgNotify introImgNotify = Provider.of<IntroImgNotify>(context);
      IntroNotifier introNotifier = Provider.of<IntroNotifier>(context);

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
                          pw.Container(child:introImgNotify.introImgList.isEmpty ? pw.Center(child:pw.Text('No Image'),) : pw.Image(PdfImage.file(pdf.document, bytes: File(introImgNotify.introImgList.last.imageintro.path).readAsBytesSync()),
                            height: 450, width: 750, fit: pw.BoxFit.fill, ),),

                        ]),
                  ),
                )
              ]),
            ];
          },
        ));
      }
    }

//Prefix page
    writeOnPdfContent(BuildContext context) async {
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

      List Pagelist =[];



      if(introImgNotify.introImgList.isNotEmpty || introNotifier.introList.isNotEmpty ){Pagelist.add(' ');}
      if(inventKeyNotifier.inventKeyList.isNotEmpty || inventKeyPhNotifier.inventKeyPhList.isNotEmpty){Pagelist.add('KEY');}
      if(elecMeterNotifier.elecMeterList.isNotEmpty || elecMeterPhNotifier.elecMeterPhList.isNotEmpty){Pagelist.add('METER READING');}
      if(gasMeterNotifier.gasMeterList.isNotEmpty || gasMeterPhNotifier.gasMeterPhList.isNotEmpty){Pagelist.add('METER READING');}
      if(smokeDeNotifier.smokeDeList.isNotEmpty || smokeDePhNotifier.smokeDePhList.isNotEmpty){Pagelist.add('SMOKE DETECTOR');}
      if(kitFrameNotifier.kitFrameList.isNotEmpty || kitFramePhNotifier.kitFramePhList.isNotEmpty){Pagelist.add('KITCHEN');}
      if(kitExdoorNotifier.kitExdoorList.isNotEmpty || kitExdoorPhNotifier.kitExdoorPhList.isNotEmpty){Pagelist.add('KITCHEN');}
      if(kitIndoorNotifier.kitIndoorList.isNotEmpty || kitIndoorPhNotifier.kitIndoorPhList.isNotEmpty){Pagelist.add('KITCHEN');}
      if(kitCeilingNotifier.kitCeilingList.isNotEmpty || kitCeilingPhNotifier.kitCeilingPhList.isNotEmpty){Pagelist.add('KITCHEN');}
      if(kitLightNotifier.kitLightList.isNotEmpty || kitLightPhNotifier.kitLightPhList.isNotEmpty){Pagelist.add('KITCHEN');}
      if(kitWallsNotifier.kitWallsList.isNotEmpty || kitWallsPhNotifier.kitWallsPhList.isNotEmpty){Pagelist.add('KITCHEN');}
      if(kitWindowsNotifier.kitWindowsList.isNotEmpty || kitWindowsPhNotifier.kitWindowsPhList.isNotEmpty){Pagelist.add('KITCHEN');}
      if(halFrameNotifier.halFrameList.isNotEmpty || halFramePhNotifier.halFramePhList.isNotEmpty){Pagelist.add('HALLWAY');}
      if(halExdoorNotifier.halExdoorList.isNotEmpty || halExdoorPhNotifier.halExdoorPhList.isNotEmpty){Pagelist.add('HALLWAY');}
      if(halIndoorNotifier.halIndoorList.isNotEmpty || halIndoorPhNotifier.halIndoorPhList.isNotEmpty){Pagelist.add('HALLWAY');}
      if(halCeilingNotifier.halCeilingList.isNotEmpty || halCeilingPhNotifier.halCeilingPhList.isNotEmpty){Pagelist.add('HALLWAY');}
      if(halLightNotifier.halLightList.isNotEmpty || halLightPhNotifier.halLightPhList.isNotEmpty){Pagelist.add('HALLWAY');}
      if(halWallsNotifier.halWallsList.isNotEmpty || halWallsPhNotifier.halWallsPhList.isNotEmpty){Pagelist.add('HALLWAY');}
      if(halWindowsNotifier.halWindowsList.isNotEmpty || halWindowsPhNotifier.halWindowsPhList.isNotEmpty){Pagelist.add('HALLWAY');}
      if(bedFrameNotifier.bedFrameList.isNotEmpty || bedFramePhNotifier.bedFramePhList.isNotEmpty){Pagelist.add('BEDROOM 1');}
      if(bedExdoorNotifier.bedExdoorList.isNotEmpty || bedExdoorPhNotifier.bedExdoorPhList.isNotEmpty){Pagelist.add('BEDROOM 1');}
      if(bedIndoorNotifier.bedIndoorList.isNotEmpty || bedIndoorPhNotifier.bedIndoorPhList.isNotEmpty){Pagelist.add('BEDROOM 1');}
      if(bedCeilingNotifier.bedCeilingList.isNotEmpty || bedCeilingPhNotifier.bedCeilingPhList.isNotEmpty){Pagelist.add('BEDROOM 1');}
      if(bedLightNotifier.bedLightList.isNotEmpty || bedLightPhNotifier.bedLightPhList.isNotEmpty){Pagelist.add('BEDROOM 1');}
      if(bedWallsNotifier.bedWallsList.isNotEmpty || bedWallsPhNotifier.bedWallsPhList.isNotEmpty){Pagelist.add('BEDROOM 1');}
      if(bedWindowsNotifier.bedWindowsList.isNotEmpty || bedWindowsPhNotifier.bedWindowsPhList.isNotEmpty){Pagelist.add('BEDROOM 1');}
      if(extFrameNotifier.extFrameList.isNotEmpty || extFramePhNotifier.extFramePhList.isNotEmpty){Pagelist.add('BEDROOM 2');}
      if(extExdoorNotifier.extExdoorList.isNotEmpty || extExdoorPhNotifier.extExdoorPhList.isNotEmpty){Pagelist.add('BEDROOM 2');}
      if(extIndoorNotifier.extIndoorList.isNotEmpty || extIndoorPhNotifier.extIndoorPhList.isNotEmpty){Pagelist.add('BEDROOM 2');}
      if(extCeilingNotifier.extCeilingList.isNotEmpty || extCeilingPhNotifier.extCeilingPhList.isNotEmpty){Pagelist.add('BEDROOM 2');}
      if(extLightNotifier.extLightList.isNotEmpty || extLightPhNotifier.extLightPhList.isNotEmpty){Pagelist.add('BEDROOM 2');}
      if(extWallsNotifier.extWallsList.isNotEmpty || extWallsPhNotifier.extWallsPhList.isNotEmpty){Pagelist.add('BEDROOM 2');}
      if(extWindowsNotifier.extWindowsList.isNotEmpty || extWindowsPhNotifier.extWindowsPhList.isNotEmpty){Pagelist.add('BEDROOM 2');}
      if(smoFrameNotifier.smoFrameList.isNotEmpty || smoFramePhNotifier.smoFramePhList.isNotEmpty){Pagelist.add('BEDROOM 3');}
      if(smoExdoorNotifier.smoExdoorList.isNotEmpty || smoExdoorPhNotifier.smoExdoorPhList.isNotEmpty){Pagelist.add('BEDROOM 3');}
      if(smoIndoorNotifier.smoIndoorList.isNotEmpty || smoIndoorPhNotifier.smoIndoorPhList.isNotEmpty){Pagelist.add('BEDROOM 3');}
      if(smoCeilingNotifier.smoCeilingList.isNotEmpty || smoCeilingPhNotifier.smoCeilingPhList.isNotEmpty){Pagelist.add('BEDROOM 3');}
      if(smoLightNotifier.smoLightList.isNotEmpty || smoLightPhNotifier.smoLightPhList.isNotEmpty){Pagelist.add('BEDROOM 3');}
      if(smoWallsNotifier.smoWallsList.isNotEmpty || smoWallsPhNotifier.smoWallsPhList.isNotEmpty){Pagelist.add('BEDROOM 3');}
      if(smoWindowsNotifier.smoWindowsList.isNotEmpty || smoWindowsPhNotifier.smoWindowsPhList.isNotEmpty){Pagelist.add('BEDROOM 3');}
      if(bdfourFrameNotifier.bdfourFrameList.isNotEmpty || bdfourFramePhNotifier.bdfourFramePhList.isNotEmpty){Pagelist.add('BEDROOM 4');}
      if(bdfourExdoorNotifier.bdfourExdoorList.isNotEmpty || bdfourExdoorPhNotifier.bdfourExdoorPhList.isNotEmpty){Pagelist.add('BEDROOM 4');}
      if(bdfourIndoorNotifier.bdfourIndoorList.isNotEmpty || bdfourIndoorPhNotifier.bdfourIndoorPhList.isNotEmpty){Pagelist.add('BEDROOM 4');}
      if(bdfourCeilingNotifier.bdfourCeilingList.isNotEmpty || bdfourCeilingPhNotifier.bdfourCeilingPhList.isNotEmpty){Pagelist.add('BEDROOM 4');}
      if(bdfourLightNotifier.bdfourLightList.isNotEmpty || bdfourLightPhNotifier.bdfourLightPhList.isNotEmpty ){Pagelist.add('BEDROOM 4');}
      if(bdfourWallsNotifier.bdfourWallsList.isNotEmpty || bdfourWallsPhNotifier.bdfourWallsPhList.isNotEmpty){Pagelist.add('BEDROOM 4');}
      if(bdfourWindowsNotifier.bdfourWindowsList.isNotEmpty || bdfourWindowsPhNotifier.bdfourWindowsPhList.isNotEmpty){Pagelist.add('BEDROOM 4');}

      List content = [];
      List <Pnum> Pindex = [];
      var uniques = LinkedHashMap<String, bool>();
      for (var s in Pagelist){ uniques[s] = true;}
      for (var key in uniques.keys){
if('${Pagelist.indexWhere((element) => element == key)}' == '0' ){} else {
  Pindex.add(Pnum(pid: '$key',
      pname: '${Pagelist.indexWhere((element) => element == key)}'));
}
      }
      

      


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
pw.Container(height:600, width:320,child:pw.Container(padding:pw.EdgeInsets.only(left:1),child:pw.Row(crossAxisAlignment: pw.CrossAxisAlignment.center,children:<pw.Widget>[pw.Column(
    children:<pw.Widget>[
      pw.ListView.separated(
          separatorBuilder: (_, int index) => pw.Divider(),
          itemCount:Pindex.length,
          itemBuilder:(_, int index){return pw.Container(height:30,width:320,child:pw.Stack(children:<pw.Widget>[
            pw.Align(alignment: pw.Alignment.centerLeft,child: pw.Text('${Pindex[index].pid}',style:pw.TextStyle(fontSize:20,),),),
            pw.Align(alignment: pw.Alignment.centerRight,child: pw.Text(Pindex[index].pname,style:pw.TextStyle(fontSize:20,),),),
          ]));})
      ,]), ]),),),
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


//Hallway page
    writeOnPdfHallway(BuildContext context) async {
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
                          halFramePhNotifier.halFramePhList[n].photo.path).readAsBytesSync(),);return pw.Container(child: pw.Image(imag, height: 320,
                          width: 420, fit: pw.BoxFit.cover)); }, ), ), ), ]), ), ), ])), ]), ]; }, )); }
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
                          halExdoorPhNotifier.halExdoorPhList[n].photo.path).readAsBytesSync(),);return pw.Container(child: pw.Image(imag, height: 320,
                          width: 420, fit: pw.BoxFit.cover)); }, ), ), ), ]), ), ), ])), ]), ]; }, )); }

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
                          halIndoorPhNotifier.halIndoorPhList[n].photo.path).readAsBytesSync(),);return pw.Container(child: pw.Image(imag, height: 320,
                          width: 420, fit: pw.BoxFit.cover)); }, ), ), ), ]), ), ), ])), ]), ]; }, )); }
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
                          halCeilingPhNotifier.halCeilingPhList[n].photo.path).readAsBytesSync(),);return pw.Container(child: pw.Image(imag, height: 320,
                          width: 420, fit: pw.BoxFit.cover)); }, ), ), ), ]), ), ), ])), ]), ]; }, )); }



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
                          halLightPhNotifier.halLightPhList[n].photo.path).readAsBytesSync(),);return pw.Container(child: pw.Image(imag, height: 320,
                          width: 420, fit: pw.BoxFit.cover)); }, ), ), ), ]), ), ), ])), ]), ]; }, )); }
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
                          halWallsPhNotifier.halWallsPhList[n].photo.path).readAsBytesSync(),);return pw.Container(child: pw.Image(imag, height: 320,
                          width: 420, fit: pw.BoxFit.cover)); }, ), ), ), ]), ), ), ])), ]), ]; }, )); }
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
                          halWindowsPhNotifier.halWindowsPhList[n].photo.path).readAsBytesSync(),);return pw.Container(child: pw.Image(imag, height: 320,
                          width: 420, fit: pw.BoxFit.cover)); }, ), ), ), ]), ), ), ])), ]), ]; }, )); }


    }

// smoke detector
    writeOnPdfSmote(BuildContext context) async {
      SmokeDeNotifier smokeDeNotifier = Provider.of<SmokeDeNotifier>(context);
      SmokeDePhNotifier smokeDePhNotifier = Provider.of<SmokeDePhNotifier>(context);


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
                          smokeDePhNotifier.smokeDePhList[n].photo.path).readAsBytesSync(),);return pw.Container(  child: pw.Image(imag, height: 320,
                          width: 420, fit: pw.BoxFit.cover)); }, ), ), ), ]), ), ), ])), ]), ]; }, )); }
    }

//kitchen
    writeOnPdfKitchen(BuildContext context) async {
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
                          kitFramePhNotifier.kitFramePhList[n].photo.path).readAsBytesSync(),);return pw.Container(child: pw.Image(imag, height: 320,
                          width: 420, fit: pw.BoxFit.cover)); }, ), ), ), ]), ), ), ])), ]), ]; }, )); }
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
                          kitExdoorPhNotifier.kitExdoorPhList[n].photo.path).readAsBytesSync(),);return pw.Container(child: pw.Image(imag, height: 320,
                          width: 420, fit: pw.BoxFit.cover)); }, ), ), ), ]), ), ), ])), ]), ]; }, )); }
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
                          kitIndoorPhNotifier.kitIndoorPhList[n].photo.path).readAsBytesSync(),);return pw.Container(child: pw.Image(imag, height: 320,
                          width: 420, fit: pw.BoxFit.cover)); }, ), ), ), ]), ), ), ])), ]), ]; }, )); }
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
                          kitCeilingPhNotifier.kitCeilingPhList[n].photo.path).readAsBytesSync(),);return pw.Container(child: pw.Image(imag, height: 320,
                          width: 420, fit: pw.BoxFit.cover)); }, ), ), ), ]), ), ), ])), ]), ]; }, )); }
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
                          kitLightPhNotifier.kitLightPhList[n].photo.path).readAsBytesSync(),);return pw.Container(child: pw.Image(imag, height: 320,
                          width: 420, fit: pw.BoxFit.cover)); }, ), ), ), ]), ), ), ])), ]), ]; }, )); }
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
                          kitWallsPhNotifier.kitWallsPhList[n].photo.path).readAsBytesSync(),);return pw.Container(child: pw.Image(imag, height: 320,
                          width: 420, fit: pw.BoxFit.cover)); }, ), ), ), ]), ), ), ])), ]), ]; }, )); }
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
                          kitWindowsPhNotifier.kitWindowsPhList[n].photo.path).readAsBytesSync(),);return pw.Container(child: pw.Image(imag, height: 320,
                          width: 420, fit: pw.BoxFit.cover)); }, ), ), ), ]), ), ), ])), ]), ]; }, )); }
    }


//bedroom 1
    writeOnPdfBedroom(BuildContext context) async {
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
                          bedFramePhNotifier.bedFramePhList[n].photo.path).readAsBytesSync(),);return pw.Container(child: pw.Image(imag, height: 320,
                          width: 420, fit: pw.BoxFit.cover)); }, ), ), ), ]), ), ), ])), ]), ]; }, )); }
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
                          bedExdoorPhNotifier.bedExdoorPhList[n].photo.path).readAsBytesSync(),);return pw.Container(child: pw.Image(imag, height: 320,
                          width: 420, fit: pw.BoxFit.cover)); }, ), ), ), ]), ), ), ])), ]), ]; }, )); }
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
                          bedIndoorPhNotifier.bedIndoorPhList[n].photo.path).readAsBytesSync(),);return pw.Container(child: pw.Image(imag, height: 320,
                          width: 420, fit: pw.BoxFit.cover)); }, ), ), ), ]), ), ), ])), ]), ]; }, )); }
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
                          bedCeilingPhNotifier.bedCeilingPhList[n].photo.path).readAsBytesSync(),);return pw.Container(child: pw.Image(imag, height: 320,
                          width: 420, fit: pw.BoxFit.cover)); }, ), ), ), ]), ), ), ])), ]), ]; }, )); }
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
                          bedLightPhNotifier.bedLightPhList[n].photo.path).readAsBytesSync(),);return pw.Container(child: pw.Image(imag, height: 320,
                          width: 420, fit: pw.BoxFit.cover)); }, ), ), ), ]), ), ), ])), ]), ]; }, )); }
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
                          bedWallsPhNotifier.bedWallsPhList[n].photo.path).readAsBytesSync(),);return pw.Container(child: pw.Image(imag, height: 320,
                          width: 420, fit: pw.BoxFit.cover)); }, ), ), ), ]), ), ), ])), ]), ]; }, )); }
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
                          bedWindowsPhNotifier.bedWindowsPhList[n].photo.path).readAsBytesSync(),);return pw.Container(child: pw.Image(imag, height: 320,
                          width: 420, fit: pw.BoxFit.cover)); }, ), ), ), ]), ), ), ])), ]), ]; }, )); }
    }


//Keys
    writeOnPdfChaabi(BuildContext context) async {
      InventKeyNotifier inventKeyNotifier = Provider.of<InventKeyNotifier>(context);
      InventKeyPhNotifier inventKeyPhNotifier = Provider.of<InventKeyPhNotifier>(context);

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
                      pw.Container(height: 670,width: 870,child: pw.Center(child: pw.Container(padding: pw.EdgeInsets.only(left:1,), child:inventKeyPhNotifier.inventKeyPhList.isEmpty ? pw.Center(child:pw.Text('No Image'),) : pw.Image(PdfImage.file( pdf.document, bytes: File(
                          inventKeyPhNotifier.inventKeyPhList.last.photo.path).readAsBytesSync(),), height: 446,
                          width: 580, fit: pw.BoxFit.cover)),), ), ]), ), ), ])), ]), ]; }, )); }
      }


//meter
    writeOnPdfMeter(BuildContext context) async {
      GasMeterNotifier gasMeterNotifier = Provider.of<GasMeterNotifier>(context);
      GasMeterPhNotifier gasMeterPhNotifier = Provider.of<GasMeterPhNotifier>(context);
      ElecMeterNotifier elecMeterNotifier = Provider.of<ElecMeterNotifier>(context);
      ElecMeterPhNotifier elecMeterPhNotifier = Provider.of<ElecMeterPhNotifier>(context);


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
                          elecMeterPhNotifier.elecMeterPhList[n].photo.path).readAsBytesSync(),);return pw.Container(child: pw.Image(imag, height: 320,
                          width: 420, fit: pw.BoxFit.contain)); }, ), ), ), ]), ), ), ])), ]), ]; }, )); }
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
                          gasMeterPhNotifier.gasMeterPhList[n].photo.path).readAsBytesSync(),);return pw.Container(child: pw.Image(imag, height: 320,
                          width: 420, fit: pw.BoxFit.cover)); }, ), ), ), ]), ), ), ])), ]), ]; }, )); }
    }

// bedroom 2
    writeOnPdfbd2(BuildContext context) async {
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
                    child: pw.Text('  Bedroom 2 Frame : ',
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
                          extFramePhNotifier.extFramePhList[n].photo.path).readAsBytesSync(),);return pw.Container(child: pw.Image(imag, height: 320,
                          width: 420, fit: pw.BoxFit.cover)); }, ), ), ), ]), ), ), ])), ]), ]; }, )); } //ifelse
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
                    child: pw.Text('  Bedroom 2 Door: ',
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
                          extExdoorPhNotifier.extExdoorPhList[n].photo.path).readAsBytesSync(),);return pw.Container(child: pw.Image(imag, height: 320,
                          width: 420, fit: pw.BoxFit.cover)); }, ), ), ), ]), ), ), ])), ]), ]; }, )); }
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
                    child: pw.Text('  Bedroom 2 Interior Door: ',
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
                          extIndoorPhNotifier.extIndoorPhList[n].photo.path).readAsBytesSync(),);return pw.Container(child: pw.Image(imag, height: 320,
                          width: 420, fit: pw.BoxFit.cover)); }, ), ), ), ]), ), ), ])), ]), ]; }, )); }
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
                    child: pw.Text('  Bedroom 2 Ceiling: ',
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
                          extCeilingPhNotifier.extCeilingPhList[n].photo.path).readAsBytesSync(),);return pw.Container(child: pw.Image(imag, height: 320,
                          width: 420, fit: pw.BoxFit.cover)); }, ), ), ), ]), ), ), ])), ]), ]; }, )); }
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
                    child: pw.Text('  Bedroom 2 Light: ',
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
                          extLightPhNotifier.extLightPhList[n].photo.path).readAsBytesSync(),);return pw.Container(child: pw.Image(imag, height: 320,
                          width: 420, fit: pw.BoxFit.cover)); }, ), ), ), ]), ), ), ])), ]), ]; }, )); }
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
                    child: pw.Text('  Bedroom 2 Walls: ',
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
                          extWallsPhNotifier.extWallsPhList[n].photo.path).readAsBytesSync(),);return pw.Container(child: pw.Image(imag, height: 320,
                          width: 420, fit: pw.BoxFit.cover)); }, ), ), ), ]), ), ), ])), ]), ]; }, )); }
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
                padding: pw.EdgeInsets.only(top: 1),child: pw.Column(mainAxisAlignment: pw.MainAxisAlignment.start, crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: <pw.Widget>[ pw.SizedBox(height:100,), pw.Container( padding: pw.EdgeInsets.only(left: 20,), child: pw.Container(padding: pw.EdgeInsets.only
                  (top: 10,left: 10,),decoration: pw.BoxDecoration(color: PdfColor.fromInt(0xffffffff),), height: 40, width: 1145,child: pw.Row(children: <pw.Widget>[
                  pw.Container( height: 35, width: 270,decoration: const pw.BoxDecoration(color: PdfColor.fromInt(0xffc7d0d8), borderRadius: 6),
                    child: pw.Text('  Bedroom 2 Windows: ',
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
                          extWindowsPhNotifier.extWindowsPhList[n].photo.path).readAsBytesSync(),);return pw.Container(child: pw.Image(imag, height: 320,
                          width: 420, fit: pw.BoxFit.cover)); }, ), ), ), ]), ), ), ])), ]), ]; }, )); }
    }


//bedroom 3
    writeOnPdfbd3(BuildContext context) async {
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


      if (smoFrameNotifier.smoFrameList.isNotEmpty || smoFramePhNotifier.smoFramePhList.isNotEmpty) {
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
                    child: pw.Text('  Bedroom 3 Frame : ',
                        style: pw.TextStyle(font: alice, fontSize: 22)),),pw.SizedBox(width: 15,), pw.Container( height: 35, width: 270,
                    decoration: const pw.BoxDecoration(color: PdfColor.fromInt(0xfff3ded4), borderRadius: 6), child: pw.Text(
                        '  Quanity: ${smoFrameNotifier.smoFrameList.isNotEmpty ? smoFrameNotifier.smoFrameList.last.quantity : ' NA'}',
                        style: pw.TextStyle(font: alice,fontSize: 20,)),), pw.SizedBox( width: 15, ), pw.Container(height: 35,width: 270,
                    decoration: const pw.BoxDecoration( color: PdfColor.fromInt(0xfff3ded4), borderRadius: 6), child: pw.Text(
                        '  Colour: ${smoFrameNotifier.smoFrameList.isNotEmpty ? smoFrameNotifier.smoFrameList.last.colour : ' NA'}',
                        style: pw.TextStyle( font: alice,fontSize: 20,)),), pw.SizedBox(width: 15,),pw.Container(height: 35, width: 270,
                    decoration: const pw.BoxDecoration( color: PdfColor.fromInt(0xfff3ded4), borderRadius: 6), child: pw.Text(
                        '  Conditions and Cleaning: ${smoFrameNotifier.smoFrameList.isNotEmpty ? smoFrameNotifier.smoFrameList.last.condition : ' NA'}',
                        style: pw.TextStyle(font: alice,fontSize: 20, )),),])),),pw.Container(padding: pw.EdgeInsets.only(left: 20),
                  child: pw.Container(decoration: pw.BoxDecoration(color: PdfColor.fromInt(0xffffffff),), width: 1145, padding: pw.EdgeInsets.only(left: 8),
                    child: pw.Row(children: <pw.Widget>[ pw.SizedBox(width: 5, ),pw.Container( child: pw.Text(
                      '  Description : ${smoFrameNotifier.smoFrameList.isNotEmpty ? smoFrameNotifier.smoFrameList.last.description : '  NA'}',
                      style: pw.TextStyle(font: alice, fontSize: 20,),),width: 270,height: 630,decoration: pw.BoxDecoration( color: PdfColor.fromInt(0xfff3ded4)), ),
                      pw.Container(height: 670,width: 870,child: pw.GridView(crossAxisCount: 2,childAspectRatio: 01.01,children: List<pw.Widget>.generate(
                        smoFramePhNotifier.smoFramePhList.length, (int n) {var imag = PdfImage.file( pdf.document, bytes: File(
                          smoFramePhNotifier.smoFramePhList[n].photo.path).readAsBytesSync(),);return pw.Container(child: pw.Image(imag, height: 320,
                          width: 420, fit: pw.BoxFit.cover)); }, ), ), ), ]), ), ), ])), ]), ]; }, )); } //ifelse
      if (smoExdoorNotifier.smoExdoorList.isNotEmpty || smoExdoorPhNotifier.smoExdoorPhList.isNotEmpty) {
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
                    child: pw.Text('  Bedroom 3 Door: ',
                        style: pw.TextStyle(font: alice, fontSize: 22)),),pw.SizedBox(width: 15,), pw.Container( height: 35, width: 270,
                    decoration: const pw.BoxDecoration(color: PdfColor.fromInt(0xfff3ded4), borderRadius: 6), child: pw.Text(
                        '  Quanity: ${smoExdoorNotifier.smoExdoorList.isNotEmpty ? smoExdoorNotifier.smoExdoorList.last.quantity : ' NA'}',
                        style: pw.TextStyle(font: alice,fontSize: 20,)),), pw.SizedBox( width: 15, ), pw.Container(height: 35,width: 270,
                    decoration: const pw.BoxDecoration( color: PdfColor.fromInt(0xfff3ded4), borderRadius: 6), child: pw.Text(
                        '  Colour: ${smoExdoorNotifier.smoExdoorList.isNotEmpty ? smoExdoorNotifier.smoExdoorList.last.colour : ' NA'}',
                        style: pw.TextStyle( font: alice,fontSize: 20,)),), pw.SizedBox(width: 15,),pw.Container(height: 35, width: 270,
                    decoration: const pw.BoxDecoration( color: PdfColor.fromInt(0xfff3ded4), borderRadius: 6), child: pw.Text(
                        '  Conditions and Cleaning: ${smoExdoorNotifier.smoExdoorList.isNotEmpty ? smoExdoorNotifier.smoExdoorList.last.condition : ' NA'}',
                        style: pw.TextStyle(font: alice,fontSize: 20, )),),])),),pw.Container(padding: pw.EdgeInsets.only(left: 20),
                  child: pw.Container(decoration: pw.BoxDecoration(color: PdfColor.fromInt(0xffffffff),), width: 1145, padding: pw.EdgeInsets.only(left: 8),
                    child: pw.Row(children: <pw.Widget>[ pw.SizedBox(width: 5, ),pw.Container( child: pw.Text(
                      '  Description : ${smoExdoorNotifier.smoExdoorList.isNotEmpty ? smoExdoorNotifier.smoExdoorList.last.description : '  NA'}',
                      style: pw.TextStyle(font: alice, fontSize: 20,),),width: 270,height: 630,decoration: pw.BoxDecoration( color: PdfColor.fromInt(0xfff3ded4)), ),
                      pw.Container(height: 670,width: 870,child: pw.GridView(crossAxisCount: 2,childAspectRatio: 01.01,children: List<pw.Widget>.generate(
                        smoExdoorPhNotifier.smoExdoorPhList.length, (int n) {var imag = PdfImage.file( pdf.document, bytes: File(
                          smoExdoorPhNotifier.smoExdoorPhList[n].photo.path).readAsBytesSync(),);return pw.Container(child: pw.Image(imag, height: 320,
                          width: 420, fit: pw.BoxFit.cover)); }, ), ), ), ]), ), ), ])), ]), ]; }, )); }
      if (smoIndoorNotifier.smoIndoorList.isNotEmpty || smoIndoorPhNotifier.smoIndoorPhList.isNotEmpty) {
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
                    child: pw.Text('  Bedroom 3 Interior Door: ',
                        style: pw.TextStyle(font: alice, fontSize: 22)),),pw.SizedBox(width: 15,), pw.Container( height: 35, width: 270,
                    decoration: const pw.BoxDecoration(color: PdfColor.fromInt(0xfff3ded4), borderRadius: 6), child: pw.Text(
                        '  Quanity: ${smoIndoorNotifier.smoIndoorList.isNotEmpty ? smoIndoorNotifier.smoIndoorList.last.quantity : ' NA'}',
                        style: pw.TextStyle(font: alice,fontSize: 20,)),), pw.SizedBox( width: 15, ), pw.Container(height: 35,width: 270,
                    decoration: const pw.BoxDecoration( color: PdfColor.fromInt(0xfff3ded4), borderRadius: 6), child: pw.Text(
                        '  Colour: ${smoIndoorNotifier.smoIndoorList.isNotEmpty ? smoIndoorNotifier.smoIndoorList.last.colour : ' NA'}',
                        style: pw.TextStyle( font: alice,fontSize: 20,)),), pw.SizedBox(width: 15,),pw.Container(height: 35, width: 270,
                    decoration: const pw.BoxDecoration( color: PdfColor.fromInt(0xfff3ded4), borderRadius: 6), child: pw.Text(
                        '  Conditions and Cleaning: ${smoIndoorNotifier.smoIndoorList.isNotEmpty ? smoIndoorNotifier.smoIndoorList.last.condition : ' NA'}',
                        style: pw.TextStyle(font: alice,fontSize: 20, )),),])),),pw.Container(padding: pw.EdgeInsets.only(left: 20),
                  child: pw.Container(decoration: pw.BoxDecoration(color: PdfColor.fromInt(0xffffffff),), width: 1145, padding: pw.EdgeInsets.only(left: 8),
                    child: pw.Row(children: <pw.Widget>[ pw.SizedBox(width: 5, ),pw.Container( child: pw.Text(
                      '  Description : ${smoIndoorNotifier.smoIndoorList.isNotEmpty ? smoIndoorNotifier.smoIndoorList.last.description : '  NA'}',
                      style: pw.TextStyle(font: alice, fontSize: 20,),),width: 270,height: 630,decoration: pw.BoxDecoration( color: PdfColor.fromInt(0xfff3ded4)), ),
                      pw.Container(height: 670,width: 870,child: pw.GridView(crossAxisCount: 2,childAspectRatio: 01.01,children: List<pw.Widget>.generate(
                        smoIndoorPhNotifier.smoIndoorPhList.length, (int n) {var imag = PdfImage.file( pdf.document, bytes: File(
                          smoIndoorPhNotifier.smoIndoorPhList[n].photo.path).readAsBytesSync(),);return pw.Container(child: pw.Image(imag, height: 320,
                          width: 420, fit: pw.BoxFit.cover)); }, ), ), ), ]), ), ), ])), ]), ]; }, )); }
      if (smoCeilingNotifier.smoCeilingList.isNotEmpty || smoCeilingPhNotifier.smoCeilingPhList.isNotEmpty) {
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
                    child: pw.Text('  Bedroom 3 Ceiling: ',
                        style: pw.TextStyle(font: alice, fontSize: 22)),),pw.SizedBox(width: 15,), pw.Container( height: 35, width: 270,
                    decoration: const pw.BoxDecoration(color: PdfColor.fromInt(0xfff3ded4), borderRadius: 6), child: pw.Text(
                        '  Quanity: ${smoCeilingNotifier.smoCeilingList.isNotEmpty ? smoCeilingNotifier.smoCeilingList.last.quantity : ' NA'}',
                        style: pw.TextStyle(font: alice,fontSize: 20,)),), pw.SizedBox( width: 15, ), pw.Container(height: 35,width: 270,
                    decoration: const pw.BoxDecoration( color: PdfColor.fromInt(0xfff3ded4), borderRadius: 6), child: pw.Text(
                        '  Colour: ${smoCeilingNotifier.smoCeilingList.isNotEmpty ? smoCeilingNotifier.smoCeilingList.last.colour : ' NA'}',
                        style: pw.TextStyle( font: alice,fontSize: 20,)),), pw.SizedBox(width: 15,),pw.Container(height: 35, width: 270,
                    decoration: const pw.BoxDecoration( color: PdfColor.fromInt(0xfff3ded4), borderRadius: 6), child: pw.Text(
                        '  Conditions and Cleaning: ${smoCeilingNotifier.smoCeilingList.isNotEmpty ? smoCeilingNotifier.smoCeilingList.last.condition : ' NA'}',
                        style: pw.TextStyle(font: alice,fontSize: 20, )),),])),),pw.Container(padding: pw.EdgeInsets.only(left: 20),
                  child: pw.Container(decoration: pw.BoxDecoration(color: PdfColor.fromInt(0xffffffff),), width: 1145, padding: pw.EdgeInsets.only(left: 8),
                    child: pw.Row(children: <pw.Widget>[ pw.SizedBox(width: 5, ),pw.Container( child: pw.Text(
                      '  Description : ${smoCeilingNotifier.smoCeilingList.isNotEmpty ? smoCeilingNotifier.smoCeilingList.last.description : '  NA'}',
                      style: pw.TextStyle(font: alice, fontSize: 20,),),width: 270,height: 630,decoration: pw.BoxDecoration( color: PdfColor.fromInt(0xfff3ded4)), ),
                      pw.Container(height: 670,width: 870,child: pw.GridView(crossAxisCount: 2,childAspectRatio: 01.01,children: List<pw.Widget>.generate(
                        smoCeilingPhNotifier.smoCeilingPhList.length, (int n) {var imag = PdfImage.file( pdf.document, bytes: File(
                          smoCeilingPhNotifier.smoCeilingPhList[n].photo.path).readAsBytesSync(),);return pw.Container(child: pw.Image(imag, height: 320,
                          width: 420, fit: pw.BoxFit.cover)); }, ), ), ), ]), ), ), ])), ]), ]; }, )); }
      if (smoLightNotifier.smoLightList.isNotEmpty || smoLightPhNotifier.smoLightPhList.isNotEmpty) {
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
                    child: pw.Text('  Bedroom 3 Light: ',
                        style: pw.TextStyle(font: alice, fontSize: 22)),),pw.SizedBox(width: 15,), pw.Container( height: 35, width: 270,
                    decoration: const pw.BoxDecoration(color: PdfColor.fromInt(0xfff3ded4), borderRadius: 6), child: pw.Text(
                        '  Quanity: ${smoLightNotifier.smoLightList.isNotEmpty ? smoLightNotifier.smoLightList.last.quantity : ' NA'}',
                        style: pw.TextStyle(font: alice,fontSize: 20,)),), pw.SizedBox( width: 15, ), pw.Container(height: 35,width: 270,
                    decoration: const pw.BoxDecoration( color: PdfColor.fromInt(0xfff3ded4), borderRadius: 6), child: pw.Text(
                        '  Colour: ${smoLightNotifier.smoLightList.isNotEmpty ? smoLightNotifier.smoLightList.last.colour : ' NA'}',
                        style: pw.TextStyle( font: alice,fontSize: 20,)),), pw.SizedBox(width: 15,),pw.Container(height: 35, width: 270,
                    decoration: const pw.BoxDecoration( color: PdfColor.fromInt(0xfff3ded4), borderRadius: 6), child: pw.Text(
                        '  Conditions and Cleaning: ${smoLightNotifier.smoLightList.isNotEmpty ? smoLightNotifier.smoLightList.last.condition : ' NA'}',
                        style: pw.TextStyle(font: alice,fontSize: 20, )),),])),),pw.Container(padding: pw.EdgeInsets.only(left: 20),
                  child: pw.Container(decoration: pw.BoxDecoration(color: PdfColor.fromInt(0xffffffff),), width: 1145, padding: pw.EdgeInsets.only(left: 8),
                    child: pw.Row(children: <pw.Widget>[ pw.SizedBox(width: 5, ),pw.Container( child: pw.Text(
                      '  Description : ${smoLightNotifier.smoLightList.isNotEmpty ? smoLightNotifier.smoLightList.last.description : '  NA'}',
                      style: pw.TextStyle(font: alice, fontSize: 20,),),width: 270,height: 630,decoration: pw.BoxDecoration( color: PdfColor.fromInt(0xfff3ded4)), ),
                      pw.Container(height: 670,width: 870,child: pw.GridView(crossAxisCount: 2,childAspectRatio: 01.01,children: List<pw.Widget>.generate(
                        smoLightPhNotifier.smoLightPhList.length, (int n) {var imag = PdfImage.file( pdf.document, bytes: File(
                          smoLightPhNotifier.smoLightPhList[n].photo.path).readAsBytesSync(),);return pw.Container(child: pw.Image(imag, height: 320,
                          width: 420, fit: pw.BoxFit.cover)); }, ), ), ), ]), ), ), ])), ]), ]; }, )); }
      if (smoWallsNotifier.smoWallsList.isNotEmpty || smoWallsPhNotifier.smoWallsPhList.isNotEmpty) {
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
                    child: pw.Text('  Bedroom 3 Walls: ',
                        style: pw.TextStyle(font: alice, fontSize: 22)),),pw.SizedBox(width: 15,), pw.Container( height: 35, width: 270,
                    decoration: const pw.BoxDecoration(color: PdfColor.fromInt(0xfff3ded4), borderRadius: 6), child: pw.Text(
                        '  Quanity: ${smoWallsNotifier.smoWallsList.isNotEmpty ? smoWallsNotifier.smoWallsList.last.quantity : ' NA'}',
                        style: pw.TextStyle(font: alice,fontSize: 20,)),), pw.SizedBox( width: 15, ), pw.Container(height: 35,width: 270,
                    decoration: const pw.BoxDecoration( color: PdfColor.fromInt(0xfff3ded4), borderRadius: 6), child: pw.Text(
                        '  Colour: ${smoWallsNotifier.smoWallsList.isNotEmpty ? smoWallsNotifier.smoWallsList.last.colour : ' NA'}',
                        style: pw.TextStyle( font: alice,fontSize: 20,)),), pw.SizedBox(width: 15,),pw.Container(height: 35, width: 270,
                    decoration: const pw.BoxDecoration( color: PdfColor.fromInt(0xfff3ded4), borderRadius: 6), child: pw.Text(
                        '  Conditions and Cleaning: ${smoWallsNotifier.smoWallsList.isNotEmpty ? smoWallsNotifier.smoWallsList.last.condition : ' NA'}',
                        style: pw.TextStyle(font: alice,fontSize: 20, )),),])),),pw.Container(padding: pw.EdgeInsets.only(left: 20),
                  child: pw.Container(decoration: pw.BoxDecoration(color: PdfColor.fromInt(0xffffffff),), width: 1145, padding: pw.EdgeInsets.only(left: 8),
                    child: pw.Row(children: <pw.Widget>[ pw.SizedBox(width: 5, ),pw.Container( child: pw.Text(
                      '  Description : ${smoWallsNotifier.smoWallsList.isNotEmpty ? smoWallsNotifier.smoWallsList.last.description : '  NA'}',
                      style: pw.TextStyle(font: alice, fontSize: 20,),),width: 270,height: 630,decoration: pw.BoxDecoration( color: PdfColor.fromInt(0xfff3ded4)), ),
                      pw.Container(height: 670,width: 870,child: pw.GridView(crossAxisCount: 2,childAspectRatio: 01.01,children: List<pw.Widget>.generate(
                        smoWallsPhNotifier.smoWallsPhList.length, (int n) {var imag = PdfImage.file( pdf.document, bytes: File(
                          smoWallsPhNotifier.smoWallsPhList[n].photo.path).readAsBytesSync(),);return pw.Container(child: pw.Image(imag, height: 320,
                          width: 420, fit: pw.BoxFit.cover)); }, ), ), ), ]), ), ), ])), ]), ]; }, )); }
      if (smoWindowsNotifier.smoWindowsList.isNotEmpty || smoWindowsPhNotifier.smoWindowsPhList.isNotEmpty) {
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
                    child: pw.Text('  Bedroom 3 Windows: ',
                        style: pw.TextStyle(font: alice, fontSize: 22)),),pw.SizedBox(width: 15,), pw.Container( height: 35, width: 270,
                    decoration: const pw.BoxDecoration(color: PdfColor.fromInt(0xfff3ded4), borderRadius: 6), child: pw.Text(
                        '  Quanity: ${smoWindowsNotifier.smoWindowsList.isNotEmpty ? smoWindowsNotifier.smoWindowsList.last.quantity : ' NA'}',
                        style: pw.TextStyle(font: alice,fontSize: 20,)),), pw.SizedBox( width: 15, ), pw.Container(height: 35,width: 270,
                    decoration: const pw.BoxDecoration( color: PdfColor.fromInt(0xfff3ded4), borderRadius: 6), child: pw.Text(
                        '  Colour: ${smoWindowsNotifier.smoWindowsList.isNotEmpty ? smoWindowsNotifier.smoWindowsList.last.colour : ' NA'}',
                        style: pw.TextStyle( font: alice,fontSize: 20,)),), pw.SizedBox(width: 15,),pw.Container(height: 35, width: 270,
                    decoration: const pw.BoxDecoration( color: PdfColor.fromInt(0xfff3ded4), borderRadius: 6), child: pw.Text(
                        '  Conditions and Cleaning: ${smoWindowsNotifier.smoWindowsList.isNotEmpty ? smoWindowsNotifier.smoWindowsList.last.condition : ' NA'}',
                        style: pw.TextStyle(font: alice,fontSize: 20, )),),])),),pw.Container(padding: pw.EdgeInsets.only(left: 20),
                  child: pw.Container(decoration: pw.BoxDecoration(color: PdfColor.fromInt(0xffffffff),), width: 1145, padding: pw.EdgeInsets.only(left: 8),
                    child: pw.Row(children: <pw.Widget>[ pw.SizedBox(width: 5, ),pw.Container( child: pw.Text(
                      '  Description : ${smoWindowsNotifier.smoWindowsList.isNotEmpty ? smoWindowsNotifier.smoWindowsList.last.description : '  NA'}',
                      style: pw.TextStyle(font: alice, fontSize: 20,),),width: 270,height: 630,decoration: pw.BoxDecoration( color: PdfColor.fromInt(0xfff3ded4)), ),
                      pw.Container(height: 670,width: 870,child: pw.GridView(crossAxisCount: 2,childAspectRatio: 01.01,children: List<pw.Widget>.generate(
                        smoWindowsPhNotifier.smoWindowsPhList.length, (int n) {var imag = PdfImage.file( pdf.document, bytes: File(
                          smoWindowsPhNotifier.smoWindowsPhList[n].photo.path).readAsBytesSync(),);return pw.Container(child: pw.Image(imag, height: 320,
                          width: 420, fit: pw.BoxFit.cover)); }, ), ), ), ]), ), ), ])), ]), ]; }, )); }
    }


//bedroom 4
    writeOnPdfbd4(BuildContext context) async {
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

      if (bdfourFrameNotifier.bdfourFrameList.isNotEmpty || bdfourFramePhNotifier.bdfourFramePhList.isNotEmpty) {
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
                    child: pw.Text('  Bedroom 4 Frame : ',
                        style: pw.TextStyle(font: alice, fontSize: 22)),),pw.SizedBox(width: 15,), pw.Container( height: 35, width: 270,
                    decoration: const pw.BoxDecoration(color: PdfColor.fromInt(0xfff3ded4), borderRadius: 6), child: pw.Text(
                        '  Quanity: ${bdfourFrameNotifier.bdfourFrameList.isNotEmpty ? bdfourFrameNotifier.bdfourFrameList.last.quantity : ' NA'}',
                        style: pw.TextStyle(font: alice,fontSize: 20,)),), pw.SizedBox( width: 15, ), pw.Container(height: 35,width: 270,
                    decoration: const pw.BoxDecoration( color: PdfColor.fromInt(0xfff3ded4), borderRadius: 6), child: pw.Text(
                        '  Colour: ${bdfourFrameNotifier.bdfourFrameList.isNotEmpty ? bdfourFrameNotifier.bdfourFrameList.last.colour : ' NA'}',
                        style: pw.TextStyle( font: alice,fontSize: 20,)),), pw.SizedBox(width: 15,),pw.Container(height: 35, width: 270,
                    decoration: const pw.BoxDecoration( color: PdfColor.fromInt(0xfff3ded4), borderRadius: 6), child: pw.Text(
                        '  Conditions and Cleaning: ${bdfourFrameNotifier.bdfourFrameList.isNotEmpty ? bdfourFrameNotifier.bdfourFrameList.last.condition : ' NA'}',
                        style: pw.TextStyle(font: alice,fontSize: 20, )),),])),),pw.Container(padding: pw.EdgeInsets.only(left: 20),
                  child: pw.Container(decoration: pw.BoxDecoration(color: PdfColor.fromInt(0xffffffff),), width: 1145, padding: pw.EdgeInsets.only(left: 8),
                    child: pw.Row(children: <pw.Widget>[ pw.SizedBox(width: 5, ),pw.Container( child: pw.Text(
                      '  Description : ${bdfourFrameNotifier.bdfourFrameList.isNotEmpty ? bdfourFrameNotifier.bdfourFrameList.last.description : '  NA'}',
                      style: pw.TextStyle(font: alice, fontSize: 20,),),width: 270,height: 630,decoration: pw.BoxDecoration( color: PdfColor.fromInt(0xfff3ded4)), ),
                      pw.Container(height: 670,width: 870,child: pw.GridView(crossAxisCount: 2,childAspectRatio: 01.01,children: List<pw.Widget>.generate(
                        bdfourFramePhNotifier.bdfourFramePhList.length, (int n) {var imag = PdfImage.file( pdf.document, bytes: File(
                          bdfourFramePhNotifier.bdfourFramePhList[n].photo.path).readAsBytesSync(),);return pw.Container(child: pw.Image(imag, height: 320,
                          width: 420, fit: pw.BoxFit.cover)); }, ), ), ), ]), ), ), ])), ]), ]; }, )); } //ifelse
      if (bdfourExdoorNotifier.bdfourExdoorList.isNotEmpty || bdfourExdoorPhNotifier.bdfourExdoorPhList.isNotEmpty) {
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
                    child: pw.Text('  Bedroom 4 Door: ',
                        style: pw.TextStyle(font: alice, fontSize: 22)),),pw.SizedBox(width: 15,), pw.Container( height: 35, width: 270,
                    decoration: const pw.BoxDecoration(color: PdfColor.fromInt(0xfff3ded4), borderRadius: 6), child: pw.Text(
                        '  Quanity: ${bdfourExdoorNotifier.bdfourExdoorList.isNotEmpty ? bdfourExdoorNotifier.bdfourExdoorList.last.quantity : ' NA'}',
                        style: pw.TextStyle(font: alice,fontSize: 20,)),), pw.SizedBox( width: 15, ), pw.Container(height: 35,width: 270,
                    decoration: const pw.BoxDecoration( color: PdfColor.fromInt(0xfff3ded4), borderRadius: 6), child: pw.Text(
                        '  Colour: ${bdfourExdoorNotifier.bdfourExdoorList.isNotEmpty ? bdfourExdoorNotifier.bdfourExdoorList.last.colour : ' NA'}',
                        style: pw.TextStyle( font: alice,fontSize: 20,)),), pw.SizedBox(width: 15,),pw.Container(height: 35, width: 270,
                    decoration: const pw.BoxDecoration( color: PdfColor.fromInt(0xfff3ded4), borderRadius: 6), child: pw.Text(
                        '  Conditions and Cleaning: ${bdfourExdoorNotifier.bdfourExdoorList.isNotEmpty ? bdfourExdoorNotifier.bdfourExdoorList.last.condition : ' NA'}',
                        style: pw.TextStyle(font: alice,fontSize: 20, )),),])),),pw.Container(padding: pw.EdgeInsets.only(left: 20),
                  child: pw.Container(decoration: pw.BoxDecoration(color: PdfColor.fromInt(0xffffffff),), width: 1145, padding: pw.EdgeInsets.only(left: 8),
                    child: pw.Row(children: <pw.Widget>[ pw.SizedBox(width: 5, ),pw.Container( child: pw.Text(
                      '  Description : ${bdfourExdoorNotifier.bdfourExdoorList.isNotEmpty ? bdfourExdoorNotifier.bdfourExdoorList.last.description : '  NA'}',
                      style: pw.TextStyle(font: alice, fontSize: 20,),),width: 270,height: 630,decoration: pw.BoxDecoration( color: PdfColor.fromInt(0xfff3ded4)), ),
                      pw.Container(height: 670,width: 870,child: pw.GridView(crossAxisCount: 2,childAspectRatio: 01.01,children: List<pw.Widget>.generate(
                        bdfourExdoorPhNotifier.bdfourExdoorPhList.length, (int n) {var imag = PdfImage.file( pdf.document, bytes: File(
                          bdfourExdoorPhNotifier.bdfourExdoorPhList[n].photo.path).readAsBytesSync(),);return pw.Container(child: pw.Image(imag, height: 320,
                          width: 420, fit: pw.BoxFit.cover)); }, ), ), ), ]), ), ), ])), ]), ]; }, )); }
      if (bdfourIndoorNotifier.bdfourIndoorList.isNotEmpty || bdfourIndoorPhNotifier.bdfourIndoorPhList.isNotEmpty) {
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
                    child: pw.Text('  Bedroom 4 Interior Door: ',
                        style: pw.TextStyle(font: alice, fontSize: 22)),),pw.SizedBox(width: 15,), pw.Container( height: 35, width: 270,
                    decoration: const pw.BoxDecoration(color: PdfColor.fromInt(0xfff3ded4), borderRadius: 6), child: pw.Text(
                        '  Quanity: ${bdfourIndoorNotifier.bdfourIndoorList.isNotEmpty ? bdfourIndoorNotifier.bdfourIndoorList.last.quantity : ' NA'}',
                        style: pw.TextStyle(font: alice,fontSize: 20,)),), pw.SizedBox( width: 15, ), pw.Container(height: 35,width: 270,
                    decoration: const pw.BoxDecoration( color: PdfColor.fromInt(0xfff3ded4), borderRadius: 6), child: pw.Text(
                        '  Colour: ${bdfourIndoorNotifier.bdfourIndoorList.isNotEmpty ? bdfourIndoorNotifier.bdfourIndoorList.last.colour : ' NA'}',
                        style: pw.TextStyle( font: alice,fontSize: 20,)),), pw.SizedBox(width: 15,),pw.Container(height: 35, width: 270,
                    decoration: const pw.BoxDecoration( color: PdfColor.fromInt(0xfff3ded4), borderRadius: 6), child: pw.Text(
                        '  Conditions and Cleaning: ${bdfourIndoorNotifier.bdfourIndoorList.isNotEmpty ? bdfourIndoorNotifier.bdfourIndoorList.last.condition : ' NA'}',
                        style: pw.TextStyle(font: alice,fontSize: 20, )),),])),),pw.Container(padding: pw.EdgeInsets.only(left: 20),
                  child: pw.Container(decoration: pw.BoxDecoration(color: PdfColor.fromInt(0xffffffff),), width: 1145, padding: pw.EdgeInsets.only(left: 8),
                    child: pw.Row(children: <pw.Widget>[ pw.SizedBox(width: 5, ),pw.Container( child: pw.Text(
                      '  Description : ${bdfourIndoorNotifier.bdfourIndoorList.isNotEmpty ? bdfourIndoorNotifier.bdfourIndoorList.last.description : '  NA'}',
                      style: pw.TextStyle(font: alice, fontSize: 20,),),width: 270,height: 630,decoration: pw.BoxDecoration( color: PdfColor.fromInt(0xfff3ded4)), ),
                      pw.Container(height: 670,width: 870,child: pw.GridView(crossAxisCount: 2,childAspectRatio: 01.01,children: List<pw.Widget>.generate(
                        bdfourIndoorPhNotifier.bdfourIndoorPhList.length, (int n) {var imag = PdfImage.file( pdf.document, bytes: File(
                          bdfourIndoorPhNotifier.bdfourIndoorPhList[n].photo.path).readAsBytesSync(),);return pw.Container(child: pw.Image(imag, height: 320,
                          width: 420, fit: pw.BoxFit.cover)); }, ), ), ), ]), ), ), ])), ]), ]; }, )); }
      if (bdfourCeilingNotifier.bdfourCeilingList.isNotEmpty || bdfourCeilingPhNotifier.bdfourCeilingPhList.isNotEmpty) {
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
                    child: pw.Text('  Bedroom 4 Ceiling: ',
                        style: pw.TextStyle(font: alice, fontSize: 22)),),pw.SizedBox(width: 15,), pw.Container( height: 35, width: 270,
                    decoration: const pw.BoxDecoration(color: PdfColor.fromInt(0xfff3ded4), borderRadius: 6), child: pw.Text(
                        '  Quanity: ${bdfourCeilingNotifier.bdfourCeilingList.isNotEmpty ? bdfourCeilingNotifier.bdfourCeilingList.last.quantity : ' NA'}',
                        style: pw.TextStyle(font: alice,fontSize: 20,)),), pw.SizedBox( width: 15, ), pw.Container(height: 35,width: 270,
                    decoration: const pw.BoxDecoration( color: PdfColor.fromInt(0xfff3ded4), borderRadius: 6), child: pw.Text(
                        '  Colour: ${bdfourCeilingNotifier.bdfourCeilingList.isNotEmpty ? bdfourCeilingNotifier.bdfourCeilingList.last.colour : ' NA'}',
                        style: pw.TextStyle( font: alice,fontSize: 20,)),), pw.SizedBox(width: 15,),pw.Container(height: 35, width: 270,
                    decoration: const pw.BoxDecoration( color: PdfColor.fromInt(0xfff3ded4), borderRadius: 6), child: pw.Text(
                        '  Conditions and Cleaning: ${bdfourCeilingNotifier.bdfourCeilingList.isNotEmpty ? bdfourCeilingNotifier.bdfourCeilingList.last.condition : ' NA'}',
                        style: pw.TextStyle(font: alice,fontSize: 20, )),),])),),pw.Container(padding: pw.EdgeInsets.only(left: 20),
                  child: pw.Container(decoration: pw.BoxDecoration(color: PdfColor.fromInt(0xffffffff),), width: 1145, padding: pw.EdgeInsets.only(left: 8),
                    child: pw.Row(children: <pw.Widget>[ pw.SizedBox(width: 5, ),pw.Container( child: pw.Text(
                      '  Description : ${bdfourCeilingNotifier.bdfourCeilingList.isNotEmpty ? bdfourCeilingNotifier.bdfourCeilingList.last.description : '  NA'}',
                      style: pw.TextStyle(font: alice, fontSize: 20,),),width: 270,height: 630,decoration: pw.BoxDecoration( color: PdfColor.fromInt(0xfff3ded4)), ),
                      pw.Container(height: 670,width: 870,child: pw.GridView(crossAxisCount: 2,childAspectRatio: 01.01,children: List<pw.Widget>.generate(
                        bdfourCeilingPhNotifier.bdfourCeilingPhList.length, (int n) {var imag = PdfImage.file( pdf.document, bytes: File(
                          bdfourCeilingPhNotifier.bdfourCeilingPhList[n].photo.path).readAsBytesSync(),);return pw.Container(child: pw.Image(imag, height: 320,
                          width: 420, fit: pw.BoxFit.cover)); }, ), ), ), ]), ), ), ])), ]), ]; }, )); }
      if (bdfourLightNotifier.bdfourLightList.isNotEmpty || bdfourLightPhNotifier.bdfourLightPhList.isNotEmpty) {
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
                    child: pw.Text('  Bedroom 4 Light: ',
                        style: pw.TextStyle(font: alice, fontSize: 22)),),pw.SizedBox(width: 15,), pw.Container( height: 35, width: 270,
                    decoration: const pw.BoxDecoration(color: PdfColor.fromInt(0xfff3ded4), borderRadius: 6), child: pw.Text(
                        '  Quanity: ${bdfourLightNotifier.bdfourLightList.isNotEmpty ? bdfourLightNotifier.bdfourLightList.last.quantity : ' NA'}',
                        style: pw.TextStyle(font: alice,fontSize: 20,)),), pw.SizedBox( width: 15, ), pw.Container(height: 35,width: 270,
                    decoration: const pw.BoxDecoration( color: PdfColor.fromInt(0xfff3ded4), borderRadius: 6), child: pw.Text(
                        '  Colour: ${bdfourLightNotifier.bdfourLightList.isNotEmpty ? bdfourLightNotifier.bdfourLightList.last.colour : ' NA'}',
                        style: pw.TextStyle( font: alice,fontSize: 20,)),), pw.SizedBox(width: 15,),pw.Container(height: 35, width: 270,
                    decoration: const pw.BoxDecoration( color: PdfColor.fromInt(0xfff3ded4), borderRadius: 6), child: pw.Text(
                        '  Conditions and Cleaning: ${bdfourLightNotifier.bdfourLightList.isNotEmpty ? bdfourLightNotifier.bdfourLightList.last.condition : ' NA'}',
                        style: pw.TextStyle(font: alice,fontSize: 20, )),),])),),pw.Container(padding: pw.EdgeInsets.only(left: 20),
                  child: pw.Container(decoration: pw.BoxDecoration(color: PdfColor.fromInt(0xffffffff),), width: 1145, padding: pw.EdgeInsets.only(left: 8),
                    child: pw.Row(children: <pw.Widget>[ pw.SizedBox(width: 5, ),pw.Container( child: pw.Text(
                      '  Description : ${bdfourLightNotifier.bdfourLightList.isNotEmpty ? bdfourLightNotifier.bdfourLightList.last.description : '  NA'}',
                      style: pw.TextStyle(font: alice, fontSize: 20,),),width: 270,height: 630,decoration: pw.BoxDecoration( color: PdfColor.fromInt(0xfff3ded4)), ),
                      pw.Container(height: 670,width: 870,child: pw.GridView(crossAxisCount: 2,childAspectRatio: 01.01,children: List<pw.Widget>.generate(
                        bdfourLightPhNotifier.bdfourLightPhList.length, (int n) {var imag = PdfImage.file( pdf.document, bytes: File(
                          bdfourLightPhNotifier.bdfourLightPhList[n].photo.path).readAsBytesSync(),);return pw.Container(child: pw.Image(imag, height: 320,
                          width: 420, fit: pw.BoxFit.cover)); }, ), ), ), ]), ), ), ])), ]), ]; }, )); }
      if (bdfourWallsNotifier.bdfourWallsList.isNotEmpty || bdfourWallsPhNotifier.bdfourWallsPhList.isNotEmpty) {
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
                    child: pw.Text('  Bedroom 4 Walls: ',
                        style: pw.TextStyle(font: alice, fontSize: 22)),),pw.SizedBox(width: 15,), pw.Container( height: 35, width: 270,
                    decoration: const pw.BoxDecoration(color: PdfColor.fromInt(0xfff3ded4), borderRadius: 6), child: pw.Text(
                        '  Quanity: ${bdfourWallsNotifier.bdfourWallsList.isNotEmpty ? bdfourWallsNotifier.bdfourWallsList.last.quantity : ' NA'}',
                        style: pw.TextStyle(font: alice,fontSize: 20,)),), pw.SizedBox( width: 15, ), pw.Container(height: 35,width: 270,
                    decoration: const pw.BoxDecoration( color: PdfColor.fromInt(0xfff3ded4), borderRadius: 6), child: pw.Text(
                        '  Colour: ${bdfourWallsNotifier.bdfourWallsList.isNotEmpty ? bdfourWallsNotifier.bdfourWallsList.last.colour : ' NA'}',
                        style: pw.TextStyle( font: alice,fontSize: 20,)),), pw.SizedBox(width: 15,),pw.Container(height: 35, width: 270,
                    decoration: const pw.BoxDecoration( color: PdfColor.fromInt(0xfff3ded4), borderRadius: 6), child: pw.Text(
                        '  Conditions and Cleaning: ${bdfourWallsNotifier.bdfourWallsList.isNotEmpty ? bdfourWallsNotifier.bdfourWallsList.last.condition : ' NA'}',
                        style: pw.TextStyle(font: alice,fontSize: 20, )),),])),),pw.Container(padding: pw.EdgeInsets.only(left: 20),
                  child: pw.Container(decoration: pw.BoxDecoration(color: PdfColor.fromInt(0xffffffff),), width: 1145, padding: pw.EdgeInsets.only(left: 8),
                    child: pw.Row(children: <pw.Widget>[ pw.SizedBox(width: 5, ),pw.Container( child: pw.Text(
                      '  Description : ${bdfourWallsNotifier.bdfourWallsList.isNotEmpty ? bdfourWallsNotifier.bdfourWallsList.last.description : '  NA'}',
                      style: pw.TextStyle(font: alice, fontSize: 20,),),width: 270,height: 630,decoration: pw.BoxDecoration( color: PdfColor.fromInt(0xfff3ded4)), ),
                      pw.Container(height: 670,width: 870,child: pw.GridView(crossAxisCount: 2,childAspectRatio: 01.01,children: List<pw.Widget>.generate(
                        bdfourWallsPhNotifier.bdfourWallsPhList.length, (int n) {var imag = PdfImage.file( pdf.document, bytes: File(
                          bdfourWallsPhNotifier.bdfourWallsPhList[n].photo.path).readAsBytesSync(),);return pw.Container(child: pw.Image(imag, height: 320,
                          width: 420, fit: pw.BoxFit.cover)); }, ), ), ), ]), ), ), ])), ]), ]; }, )); }
      if (bdfourWindowsNotifier.bdfourWindowsList.isNotEmpty || bdfourWindowsPhNotifier.bdfourWindowsPhList.isNotEmpty) {
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
                    child: pw.Text('  Bedroom 4 Windows: ',
                        style: pw.TextStyle(font: alice, fontSize: 22)),),pw.SizedBox(width: 15,), pw.Container( height: 35, width: 270,
                    decoration: const pw.BoxDecoration(color: PdfColor.fromInt(0xfff3ded4), borderRadius: 6), child: pw.Text(
                        '  Quanity: ${bdfourWindowsNotifier.bdfourWindowsList.isNotEmpty ? bdfourWindowsNotifier.bdfourWindowsList.last.quantity : ' NA'}',
                        style: pw.TextStyle(font: alice,fontSize: 20,)),), pw.SizedBox( width: 15, ), pw.Container(height: 35,width: 270,
                    decoration: const pw.BoxDecoration( color: PdfColor.fromInt(0xfff3ded4), borderRadius: 6), child: pw.Text(
                        '  Colour: ${bdfourWindowsNotifier.bdfourWindowsList.isNotEmpty ? bdfourWindowsNotifier.bdfourWindowsList.last.colour : ' NA'}',
                        style: pw.TextStyle( font: alice,fontSize: 20,)),), pw.SizedBox(width: 15,),pw.Container(height: 35, width: 270,
                    decoration: const pw.BoxDecoration( color: PdfColor.fromInt(0xfff3ded4), borderRadius: 6), child: pw.Text(
                        '  Conditions and Cleaning: ${bdfourWindowsNotifier.bdfourWindowsList.isNotEmpty ? bdfourWindowsNotifier.bdfourWindowsList.last.condition : ' NA'}',
                        style: pw.TextStyle(font: alice,fontSize: 20, )),),])),),pw.Container(padding: pw.EdgeInsets.only(left: 20),
                  child: pw.Container(decoration: pw.BoxDecoration(color: PdfColor.fromInt(0xffffffff),), width: 1145, padding: pw.EdgeInsets.only(left: 8),
                    child: pw.Row(children: <pw.Widget>[ pw.SizedBox(width: 5, ),pw.Container( child: pw.Text(
                      '  Description : ${bdfourWindowsNotifier.bdfourWindowsList.isNotEmpty ? bdfourWindowsNotifier.bdfourWindowsList.last.description : '  NA'}',
                      style: pw.TextStyle(font: alice, fontSize: 20,),),width: 270,height: 630,decoration: pw.BoxDecoration( color: PdfColor.fromInt(0xfff3ded4)), ),
                      pw.Container(height: 670,width: 870,child: pw.GridView(crossAxisCount: 2,childAspectRatio: 01.01,children: List<pw.Widget>.generate(
                        bdfourWindowsPhNotifier.bdfourWindowsPhList.length, (int n) {var imag = PdfImage.file( pdf.document, bytes: File(
                          bdfourWindowsPhNotifier.bdfourWindowsPhList[n].photo.path).readAsBytesSync(),);return pw.Container(child: pw.Image(imag, height: 320,
                          width: 420, fit: pw.BoxFit.cover)); }, ), ), ), ]), ), ), ])), ]), ]; }, )); }
    }


//save pdf
    Future savePdf(BuildContext context) async {
      IntroNotifier introNotifier = Provider.of<IntroNotifier>(context);
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

 //pdf view
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

  }