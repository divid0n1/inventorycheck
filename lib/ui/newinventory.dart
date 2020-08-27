import 'dart:io';
import 'dart:typed_data';
import 'package:esys_flutter_share/esys_flutter_share.dart';
import 'package:flutter/services.dart';
import 'package:inventorycheck/hasny/notiwidget.dart';
import 'package:inventorycheck/notify/textnotifier.dart';
import 'package:inventorycheck/ui/apphome.dart';
import 'package:flutter/material.dart';
import 'package:inventorycheck/ui/databedroom.dart';
import 'package:inventorycheck/ui/dataexterior.dart';
import 'package:inventorycheck/ui/datahallway.dart';
import 'package:inventorycheck/ui/datakeys.dart';
import 'package:inventorycheck/ui/datakitchen.dart';
import 'package:inventorycheck/ui/datameter.dart';
import 'package:inventorycheck/ui/datasmote.dart';
import 'package:inventorycheck/ui/pdfviewer.dart';

import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:provider/provider.dart';
import 'package:inventorycheck/model/imagedata.dart';
import 'package:inventorycheck/notify/imagesnotifier.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NewInventory extends StatelessWidget {
  Widget _buildtitle() {
    return Container(
        padding: EdgeInsets.only(top: 50),
        child: Center(
          child: Text(
            "123 PORTLAND RD, LONDON",
            style: TextStyle(
              fontFamily: 'arimo',
              fontSize: 25,
            ),
          ),
        ));
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
      child: Center(
          child: Text(
        "Exterior",
        style: TextStyle(
          color: Color(0xff684c4c),
          fontFamily: 'alice',
          fontSize: 25,
        ),
      )),
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
      child: Center(
          child: Text(
        "Hallway",
        style: TextStyle(
          color: Color(0xff684c4c),
          fontFamily: 'alice',
          fontSize: 25,
        ),
      )),
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
      child: Center(
          child: Text(
        "Ceiling",
        style: TextStyle(
          color: Color(0xff684c4c),
          fontFamily: 'alice',
          fontSize: 25,
        ),
      )),
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
      child: Center(
          child: Text(
        "Kitchen",
        style: TextStyle(
          color: Color(0xff684c4c),
          fontFamily: 'alice',
          fontSize: 25,
        ),
      )),
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
      child: Center(
          child: Text(
        "Bedroom 1",
        style: TextStyle(
          color: Color(0xff684c4c),
          fontFamily: 'alice',
          fontSize: 25,
        ),
      )),
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
      child: Center(
          child: Text(
        "Keys",
        style: TextStyle(
          color: Color(0xff684c4c),
          fontFamily: 'alice',
          fontSize: 25,
        ),
      )),
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
      child: Center(
          child: Text(
        "Meter readings",
        style: TextStyle(
          color: Color(0xff684c4c),
          fontFamily: 'alice',
          fontSize: 25,
        ),
      )),
    );
  }

  final pdf = pw.Document();

  var pdffilename;

  @override
  Widget build(BuildContext context) {
    ExteriorNotifier exteriorNotifier = Provider.of<ExteriorNotifier>(context);
    HallwayNotifier hallwayNotifier = Provider.of<HallwayNotifier>(context);
    SmoteNotifier smoteNotifier = Provider.of<SmoteNotifier>(context);
    KitchenNotifier kitchenNotifier = Provider.of<KitchenNotifier>(context);
    BedroomNotifier bedroomNotifier = Provider.of<BedroomNotifier>(context);
    ChaabiNotifier chaabiNotifier = Provider.of<ChaabiNotifier>(context);
    MeterreadingNotifier meterreadingNotifier =
        Provider.of<MeterreadingNotifier>(context);
    IntroNotifier introNotifier = Provider.of<IntroNotifier>(context);

    ExteriorImgNotifier exteriorImgNotifier =
        Provider.of<ExteriorImgNotifier>(context);
    HallwayImgNotify hallwayImgNotify = Provider.of<HallwayImgNotify>(context);
    SmoteImgNotify smoteImgNotify = Provider.of<SmoteImgNotify>(context);
    KitchenImgNotify kitchenImgNotify = Provider.of<KitchenImgNotify>(context);
    BedroomImgNotify bedroomImgNotify = Provider.of<BedroomImgNotify>(context);
    ChaabiImgNotify chaabiImgNotify = Provider.of<ChaabiImgNotify>(context);
    MeterImgNotify meterImgNotify = Provider.of<MeterImgNotify>(context);
    IntroImgNotify introImgNotify = Provider.of<IntroImgNotify>(context);

    ExteriorTanNotifier exteriorTanNotifier =
        Provider.of<ExteriorTanNotifier>(context);
    HallwayTanNotifier hallwayTanNotifier =
        Provider.of<HallwayTanNotifier>(context);
    SmoteTanNotifier smoteTanNotifier = Provider.of<SmoteTanNotifier>(context);
    KitchenTanNotifier kitchenTanNotifier =
        Provider.of<KitchenTanNotifier>(context);
    BedroomTanNotifier bedroomTanNotifier =
        Provider.of<BedroomTanNotifier>(context);
    ChaabiTanNotifier chaabiTanNotifier =
        Provider.of<ChaabiTanNotifier>(context);
    MeterreadingTanNotifier meterreadingTanNotifier =
        Provider.of<MeterreadingTanNotifier>(context);

    ExteriorImgTanNotifier exteriorImgTanNotifier =
        Provider.of<ExteriorImgTanNotifier>(context);
    HallwayImgTanNotify hallwayImgTanNotify =
        Provider.of<HallwayImgTanNotify>(context);
    SmoteImgTanNotify smoteImgTanNotify =
        Provider.of<SmoteImgTanNotify>(context);
    KitchenImgTanNotify kitchenImgTanNotify =
        Provider.of<KitchenImgTanNotify>(context);
    BedroomImgTanNotify bedroomImgTanNotify =
        Provider.of<BedroomImgTanNotify>(context);
    ChaabiImgTanNotify chaabiImgTanNotify =
        Provider.of<ChaabiImgTanNotify>(context);
    MeterImgTanNotify meterImgTanNotify =
        Provider.of<MeterImgTanNotify>(context);

   /* void setValues() async {
      print('I am null');
//      var addressp = introNotifier.introList.last.description;
      var addressp = introImgNotify.introImgList.last.imageintro.path;
      SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
      sharedPrefs.remove('addressp');
      sharedPrefs.setString('addressp', addressp);
      ;
      print('Values Set in Shared Prefs!!');
    }*/

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
                    pw.Text('Check Inventory',
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
                            fit: pw.BoxFit.cover,
                          ),

/*      pw.Row(children: <pw.Widget>[
        pw.Container(child:pw.Text('Description'),width:270, height:600,decoration: pw.BoxDecoration(color:PdfColor.fromInt(0xfff3ded4  )),),
        pw.Container(height:600, width:850,child:
        pw.GridView(crossAxisCount: 2,childAspectRatio: 1.5, children: List<pw.Widget>.generate(
          exteriorImgNotifier.exteriorImgList.length,
              (int n){
            var imag = PdfImage.file(
              pdf.document,
              bytes: File(exteriorImgNotifier
                  .exteriorImgList[n].imagesfloor.path)
                  .readAsBytesSync(),
            );
            return pw.Container(

                child: pw.Image(imag, height: 280, width: 400,fit:pw.BoxFit.cover));
          },
        ),),),
      ])*/
                        ]),
                  ),
                )
              ]),

//              pw.Header(level:0,
//                  child:pw.Row(children: <pw.Widget>[
//                    pw.Text('sdfkajsldkj'),
//
//                    pw.Container(child:pw.Image(_logol,height:55,width:100,fit: pw.BoxFit.fill,),),pw.SizedBox(width: 190,),
//
//                    pw.UrlLink(destination: 'https://www.eutopianlettings.co.uk', child:pw.Container( child:pw.Image(_logor,fit: pw.BoxFit.fill, height: 55,width: 100,)),),
//              ])),
//
////              pw.Header(level:0, child: pw.Text('Inventory Check PDF: ${pdffilename}')),
//              pw.Text('Address: ${introNotifier.introList.last.description}',style:pw.TextStyle(fontSize: 18,) ,),
//              pw.Text('Reference: ${introNotifier.introList.last.quantity}',style:pw.TextStyle(fontSize: 18,) ,),
//              pw.Text('Date: ${introNotifier.introList.last.colour}',style:pw.TextStyle(fontSize: 18,) ,),
////              pw.Container(height: 50,width: 100,),
//              pw.SizedBox(height:50,),
//              pw.Center(child:
//              pw.Image(PdfImage.file(pdf.document, bytes: File(introImgNotify.introImgList.last.imageintro.path).readAsBytesSync(),),height: 100,width: 100,)
//              ),
            ];
          },
        ));
      }

      /*  if (introImgNotify.introImgList.isNotEmpty){

        int i=0;
        while(i < exteriorImgNotifier.exteriorImgList.length){
          var imag = PdfImage.file(
            pdf.document,
            bytes: File(exteriorImgNotifier.exteriorImgList[i].imagesfloor.path).readAsBytesSync(),
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
                pw.Header(level: 0, child: pw.Text("Exterio Images")),
                pw.Container(height: 700,width: 600,
                  child: pw.Image(imag),),
              ];
            },
          ));
        }

      }*/
    }

    writeOnPdfContent() async {
      List content = [];
      if(introNotifier.introList.isNotEmpty || introImgNotify.introImgList.isNotEmpty){content.add('Index');content.add('Prefix');}
      if (exteriorNotifier.exteriorList.isNotEmpty || exteriorImgNotifier.exteriorImgList.isNotEmpty) { content.add('Exterior Walls'); }
      if (exteriorTanNotifier.exteriortanList.isNotEmpty || exteriorImgTanNotifier.exteriorImgTanList.isNotEmpty) {content.add('Exterior Windows'); }
      if (hallwayNotifier.hallwayList.isNotEmpty || hallwayImgNotify.hallwayImgList.isNotEmpty) { content.add('Hallway Doors');}
      if (hallwayTanNotifier.hallwayTanList.isNotEmpty || hallwayImgTanNotify.hallwayImgTanList.isNotEmpty) {content.add('Hallway Furniture'); }
      if (smoteNotifier.smoteList.isNotEmpty || smoteImgNotify.smoteImgList.isNotEmpty) {content.add('Smote Detector & Sockets'); }
      if (smoteTanNotifier.smoteTanList.isNotEmpty || smoteImgTanNotify.smoteImgTanList.isNotEmpty) {content.add('Switches & Sockets'); }
      if (kitchenNotifier.kitchenList.isNotEmpty || kitchenImgNotify.kitchenImgList.isNotEmpty) { content.add('Kitchen Interior');}
      if (kitchenTanNotifier.kitchenTanList.isNotEmpty || kitchenImgTanNotify.kitchenImgTanList.isNotEmpty) { content.add('Kitchen Skirting');}
      if (bedroomNotifier.bedroomList.isNotEmpty || bedroomImgNotify.bedroomImgList.isNotEmpty) { content.add('BedRoom Flooring'); }
      if (bedroomTanNotifier.bedroomTanList.isNotEmpty || bedroomImgTanNotify.bedroomImgTanList.isNotEmpty) { content.add('Bedroom Interior'); }
      if (chaabiNotifier.chaabiList.isNotEmpty || chaabiImgNotify.chaabiImgList.isNotEmpty) { content.add('Keys'); }
      if (chaabiTanNotifier.chaabiTanList.isNotEmpty || chaabiImgTanNotify.chaabiImgTanList.isNotEmpty) { content.add('Locks'); }
      if (meterreadingNotifier.meterreadingList.isNotEmpty || meterImgNotify.meterImgList.isNotEmpty) { content.add('Gas Meter'); }
      if (meterreadingTanNotifier.meterreadingTanList.isNotEmpty || meterImgTanNotify.meterImgTanList.isNotEmpty) { content.add('Electric Meter'); }

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
                  pw.Text('Check Inventory', style: pw.TextStyle(font: herrvon,fontSize: 50.0,)), pw.SizedBox(width: 750,                  ),
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
//      pw.SizedBox(height:100,),
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
      ,]),pw.Column(mainAxisAlignment: pw.MainAxisAlignment.start,
    crossAxisAlignment: pw.CrossAxisAlignment.start,children:<pw.Widget>[
      pw.ListView.separated(
          separatorBuilder: (_, int index) => pw.Divider(),
          itemCount:content.length,
          itemBuilder:(_, int index){
            return pw.Row(children:<pw.Widget>[pw.Text('.......     Page -'), pw.Text('${index+1}',style:pw.TextStyle(fontSize:20,))]);
          }
      )
      ,]),]),),),



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
      if (exteriorNotifier.exteriorList.isNotEmpty ||
          exteriorImgNotifier.exteriorImgList.isNotEmpty) {
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
                    padding: pw.EdgeInsets.only(top: 100),
                    child: pw.Column(
                        mainAxisAlignment: pw.MainAxisAlignment.start,
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: <pw.Widget>[
//                            pw.SizedBox(height:100,),
                          pw.Container(
                            padding: pw.EdgeInsets.only(
                              left: 20,
                            ),
                            child: pw.Container(
                                padding: pw.EdgeInsets.only(
                                  top: 10,
                                  left: 10,
                                ),
                                decoration: pw.BoxDecoration(
                                  color: PdfColor.fromInt(0xffffffff),
                                ),
                                height: 40,
                                width: 1145,
                                child: pw.Row(children: <pw.Widget>[
                                  pw.Container(
                                    height: 35,
                                    width: 270,
                                    decoration: const pw.BoxDecoration(
                                        color: PdfColor.fromInt(0xffc7d0d8),
                                        borderRadius: 6),
                                    child: pw.Text('  Exterior Walls: ',
                                        style: pw.TextStyle(
                                            font: alice, fontSize: 22)),
                                  ),
                                  pw.SizedBox(
                                    width: 15,
                                  ),
                                  pw.Container(
                                    height: 35,
                                    width: 270,
                                    decoration: const pw.BoxDecoration(
                                        color: PdfColor.fromInt(0xfff3ded4),
                                        borderRadius: 6),
                                    child: pw.Text(
                                        '  Quanity: ${exteriorNotifier.exteriorList.isNotEmpty ? exteriorNotifier.exteriorList.last.quantity : ' NA'}',
                                        style: pw.TextStyle(
                                          font: alice,
                                          fontSize: 20,
                                        )),
                                  ),
                                  pw.SizedBox(
                                    width: 15,
                                  ),
                                  pw.Container(
                                    height: 35,
                                    width: 270,
                                    decoration: const pw.BoxDecoration(
                                        color: PdfColor.fromInt(0xfff3ded4),
                                        borderRadius: 6),
                                    child: pw.Text(
                                        '  Colour: ${exteriorNotifier.exteriorList.isNotEmpty ? exteriorNotifier.exteriorList.last.colour : ' NA'}',
                                        style: pw.TextStyle(
                                          font: alice,
                                          fontSize: 20,
                                        )),
                                  ),
                                  pw.SizedBox(
                                    width: 15,
                                  ),
                                  pw.Container(
                                    height: 35,
                                    width: 270,
                                    decoration: const pw.BoxDecoration(
                                        color: PdfColor.fromInt(0xfff3ded4),
                                        borderRadius: 6),
                                    child: pw.Text(
                                        '  Cleanliness: ${exteriorNotifier.exteriorList.isNotEmpty ? exteriorNotifier.exteriorList.last.condition : ' NA'}',
                                        style: pw.TextStyle(
                                          font: alice,
                                          fontSize: 20,
                                        )),
                                  ),
                                ])),
                          ),
                          pw.Container(
                            padding: pw.EdgeInsets.only(left: 20),
                            child: pw.Container(
                              decoration: pw.BoxDecoration(
                                color: PdfColor.fromInt(0xffffffff),
                              ),
                              width: 1145,
                              padding: pw.EdgeInsets.only(left: 8),
                              child: pw.Row(children: <pw.Widget>[
                                pw.SizedBox(
                                  width: 5,
                                ),
                                pw.Container(
                                  child: pw.Text(
                                    '  Description : ${exteriorNotifier.exteriorList.isNotEmpty ? exteriorNotifier.exteriorList.last.description : '  NA'}',
                                    style: pw.TextStyle(
                                      font: alice,
                                      fontSize: 20,
                                    ),
                                  ),
                                  width: 270,
                                  height: 630,
                                  decoration: pw.BoxDecoration(
                                      color: PdfColor.fromInt(0xfff3ded4)),
                                ),
                                pw.Container(
                                  height: 670,
                                  width: 870,
                                  child: pw.GridView(
                                    crossAxisCount: 2,
                                    childAspectRatio: 01.01,
                                    children: List<pw.Widget>.generate(
                                      exteriorImgNotifier
                                          .exteriorImgList.length,
                                      (int n) {
                                        var imag = PdfImage.file(
                                          pdf.document,
                                          bytes: File(exteriorImgNotifier
                                                  .exteriorImgList[n]
                                                  .imagesfloor
                                                  .path)
                                              .readAsBytesSync(),
                                        );
                                        return pw.Container(
                                            child: pw.Image(imag,
                                                height: 290,
                                                width: 400,
                                                fit: pw.BoxFit.cover));
                                      },
                                    ),
                                  ),
                                ),
                              ]),
                            ),
                          ),
                        ])),
              ]),
            ];
          },
        ));
      } //ifelse
      if (exteriorTanNotifier.exteriortanList.isNotEmpty ||
          exteriorImgTanNotifier.exteriorImgTanList.isNotEmpty) {
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
                    padding: pw.EdgeInsets.only(top: 100),
                    child: pw.Column(
                        mainAxisAlignment: pw.MainAxisAlignment.start,
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: <pw.Widget>[
//                            pw.SizedBox(height:100,),
                          pw.Container(
                            padding: pw.EdgeInsets.only(
                              left: 20,
                            ),
                            child: pw.Container(
                                padding: pw.EdgeInsets.only(
                                  top: 10,
                                  left: 10,
                                ),
                                decoration: pw.BoxDecoration(
                                  color: PdfColor.fromInt(0xffffffff),
                                ),
                                height: 40,
                                width: 1145,
                                child: pw.Row(children: <pw.Widget>[
                                  pw.Container(
                                    height: 35,
                                    width: 270,
                                    decoration: const pw.BoxDecoration(
                                        color: PdfColor.fromInt(0xffc7d0d8),
                                        borderRadius: 6),
                                    child: pw.Text('  Exterior Walls: ',
                                        style: pw.TextStyle(
                                            font: alice, fontSize: 22)),
                                  ),
                                  pw.SizedBox(
                                    width: 15,
                                  ),
                                  pw.Container(
                                    height: 35,
                                    width: 270,
                                    decoration: const pw.BoxDecoration(
                                        color: PdfColor.fromInt(0xfff3ded4),
                                        borderRadius: 6),
                                    child: pw.Text(
                                        '  Quanity: ${exteriorTanNotifier.exteriortanList.isNotEmpty ? exteriorTanNotifier.exteriortanList.last.quantity : ' NA'}',
                                        style: pw.TextStyle(
                                          font: alice,
                                          fontSize: 20,
                                        )),
                                  ),
                                  pw.SizedBox(
                                    width: 15,
                                  ),
                                  pw.Container(
                                    height: 35,
                                    width: 270,
                                    decoration: const pw.BoxDecoration(
                                        color: PdfColor.fromInt(0xfff3ded4),
                                        borderRadius: 6),
                                    child: pw.Text(
                                        '  Colour: ${exteriorTanNotifier.exteriortanList.isNotEmpty ? exteriorTanNotifier.exteriortanList.last.colour : ' NA'}',
                                        style: pw.TextStyle(
                                          font: alice,
                                          fontSize: 20,
                                        )),
                                  ),
                                  pw.SizedBox(
                                    width: 15,
                                  ),
                                  pw.Container(
                                    height: 35,
                                    width: 270,
                                    decoration: const pw.BoxDecoration(
                                        color: PdfColor.fromInt(0xfff3ded4),
                                        borderRadius: 6),
                                    child: pw.Text(
                                        '  Cleanliness: ${exteriorTanNotifier.exteriortanList.isNotEmpty ? exteriorTanNotifier.exteriortanList.last.condition : ' NA'}',
                                        style: pw.TextStyle(
                                          font: alice,
                                          fontSize: 20,
                                        )),
                                  ),
                                ])),
                          ),
                          pw.Container(
                            padding: pw.EdgeInsets.only(left: 20),
                            child: pw.Container(
                              decoration: pw.BoxDecoration(
                                color: PdfColor.fromInt(0xffffffff),
                              ),
                              width: 1145,
                              padding: pw.EdgeInsets.only(left: 8),
                              child: pw.Row(children: <pw.Widget>[
                                pw.SizedBox(
                                  width: 5,
                                ),
                                pw.Container(
                                  child: pw.Text(
                                    '  Description : ${exteriorTanNotifier.exteriortanList.isNotEmpty ? exteriorTanNotifier.exteriortanList.last.description : '  NA'}',
                                    style: pw.TextStyle(
                                      font: alice,
                                      fontSize: 20,
                                    ),
                                  ),
                                  width: 270,
                                  height: 630,
                                  decoration: pw.BoxDecoration(
                                      color: PdfColor.fromInt(0xfff3ded4)),
                                ),
                                pw.Container(
                                  height: 670,
                                  width: 870,
                                  child: pw.GridView(
                                    crossAxisCount: 2,
                                    childAspectRatio: 01.01,
                                    children: List<pw.Widget>.generate(
                                      exteriorImgTanNotifier
                                          .exteriorImgTanList.length,
                                      (int n) {
                                        var imag = PdfImage.file(
                                          pdf.document,
                                          bytes: File(exteriorImgTanNotifier
                                                  .exteriorImgTanList[n]
                                                  .imagesfloortan
                                                  .path)
                                              .readAsBytesSync(),
                                        );
                                        return pw.Container(
                                            child: pw.Image(imag,
                                                height: 290,
                                                width: 400,
                                                fit: pw.BoxFit.cover));
                                      },
                                    ),
                                  ),
                                ),
                              ]),
                            ),
                          ),
                        ])),
              ]),
            ];
          },
        ));
      }
    }

    writeOnPdfHallway() async {
      if (hallwayNotifier.hallwayList.isNotEmpty ||
          hallwayImgNotify.hallwayImgList.isNotEmpty) {
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
                    padding: pw.EdgeInsets.only(top: 100),
                    child: pw.Column(
                        mainAxisAlignment: pw.MainAxisAlignment.start,
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: <pw.Widget>[
//                            pw.SizedBox(height:100,),
                          pw.Container(
                            padding: pw.EdgeInsets.only(
                              left: 20,
                            ),
                            child: pw.Container(
                                padding: pw.EdgeInsets.only(
                                  top: 10,
                                  left: 10,
                                ),
                                decoration: pw.BoxDecoration(
                                  color: PdfColor.fromInt(0xffffffff),
                                ),
                                height: 40,
                                width: 1145,
                                child: pw.Row(children: <pw.Widget>[
                                  pw.Container(
                                    height: 35,
                                    width: 270,
                                    decoration: const pw.BoxDecoration(
                                        color: PdfColor.fromInt(0xffc7d0d8),
                                        borderRadius: 6),
                                    child: pw.Text('  Exterior Walls: ',
                                        style: pw.TextStyle(
                                            font: alice, fontSize: 22)),
                                  ),
                                  pw.SizedBox(
                                    width: 15,
                                  ),
                                  pw.Container(
                                    height: 35,
                                    width: 270,
                                    decoration: const pw.BoxDecoration(
                                        color: PdfColor.fromInt(0xfff3ded4),
                                        borderRadius: 6),
                                    child: pw.Text(
                                        '  Quanity: ${hallwayNotifier.hallwayList.isNotEmpty ? hallwayNotifier.hallwayList.last.quantity : ' NA'}',
                                        style: pw.TextStyle(
                                          font: alice,
                                          fontSize: 20,
                                        )),
                                  ),
                                  pw.SizedBox(
                                    width: 15,
                                  ),
                                  pw.Container(
                                    height: 35,
                                    width: 270,
                                    decoration: const pw.BoxDecoration(
                                        color: PdfColor.fromInt(0xfff3ded4),
                                        borderRadius: 6),
                                    child: pw.Text(
                                        '  Colour: ${hallwayNotifier.hallwayList.isNotEmpty ? hallwayNotifier.hallwayList.last.colour : ' NA'}',
                                        style: pw.TextStyle(
                                          font: alice,
                                          fontSize: 20,
                                        )),
                                  ),
                                  pw.SizedBox(
                                    width: 15,
                                  ),
                                  pw.Container(
                                    height: 35,
                                    width: 270,
                                    decoration: const pw.BoxDecoration(
                                        color: PdfColor.fromInt(0xfff3ded4),
                                        borderRadius: 6),
                                    child: pw.Text(
                                        '  Cleanliness: ${hallwayNotifier.hallwayList.isNotEmpty ? hallwayNotifier.hallwayList.last.condition : ' NA'}',
                                        style: pw.TextStyle(
                                          font: alice,
                                          fontSize: 20,
                                        )),
                                  ),
                                ])),
                          ),
                          pw.Container(
                            padding: pw.EdgeInsets.only(left: 20),
                            child: pw.Container(
                              decoration: pw.BoxDecoration(
                                color: PdfColor.fromInt(0xffffffff),
                              ),
                              width: 1145,
                              padding: pw.EdgeInsets.only(left: 8),
                              child: pw.Row(children: <pw.Widget>[
                                pw.SizedBox(
                                  width: 5,
                                ),
                                pw.Container(
                                  child: pw.Text(
                                    '  Description : ${hallwayNotifier.hallwayList.isNotEmpty ? hallwayNotifier.hallwayList.last.description : '  NA'}',
                                    style: pw.TextStyle(
                                      font: alice,
                                      fontSize: 20,
                                    ),
                                  ),
                                  width: 270,
                                  height: 630,
                                  decoration: pw.BoxDecoration(
                                      color: PdfColor.fromInt(0xfff3ded4)),
                                ),
                                pw.Container(
                                  height: 670,
                                  width: 870,
                                  child: pw.GridView(
                                    crossAxisCount: 2,
                                    childAspectRatio: 01.01,
                                    children: List<pw.Widget>.generate(
                                      hallwayImgNotify.hallwayImgList.length,
                                      (int n) {
                                        var imag = PdfImage.file(
                                          pdf.document,
                                          bytes: File(hallwayImgNotify
                                                  .hallwayImgList[n]
                                                  .imagehallway
                                                  .path)
                                              .readAsBytesSync(),
                                        );
                                        return pw.Container(
                                            child: pw.Image(imag,
                                                height: 290,
                                                width: 400,
                                                fit: pw.BoxFit.cover));
                                      },
                                    ),
                                  ),
                                ),
                              ]),
                            ),
                          ),
                        ])),
              ]),
            ];
          },
        ));
      }
      if (hallwayTanNotifier.hallwayTanList.isNotEmpty ||
          hallwayImgTanNotify.hallwayImgTanList.isNotEmpty) {
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
                    padding: pw.EdgeInsets.only(top: 100),
                    child: pw.Column(
                        mainAxisAlignment: pw.MainAxisAlignment.start,
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: <pw.Widget>[
//                            pw.SizedBox(height:100,),
                          pw.Container(
                            padding: pw.EdgeInsets.only(
                              left: 20,
                            ),
                            child: pw.Container(
                                padding: pw.EdgeInsets.only(
                                  top: 10,
                                  left: 10,
                                ),
                                decoration: pw.BoxDecoration(
                                  color: PdfColor.fromInt(0xffffffff),
                                ),
                                height: 40,
                                width: 1145,
                                child: pw.Row(children: <pw.Widget>[
                                  pw.Container(
                                    height: 35,
                                    width: 270,
                                    decoration: const pw.BoxDecoration(
                                        color: PdfColor.fromInt(0xffc7d0d8),
                                        borderRadius: 6),
                                    child: pw.Text('  Exterior Walls: ',
                                        style: pw.TextStyle(
                                            font: alice, fontSize: 22)),
                                  ),
                                  pw.SizedBox(
                                    width: 15,
                                  ),
                                  pw.Container(
                                    height: 35,
                                    width: 270,
                                    decoration: const pw.BoxDecoration(
                                        color: PdfColor.fromInt(0xfff3ded4),
                                        borderRadius: 6),
                                    child: pw.Text(
                                        '  Quanity: ${hallwayTanNotifier.hallwayTanList.isNotEmpty ? hallwayTanNotifier.hallwayTanList.last.quantity : ' NA'}',
                                        style: pw.TextStyle(
                                          font: alice,
                                          fontSize: 20,
                                        )),
                                  ),
                                  pw.SizedBox(
                                    width: 15,
                                  ),
                                  pw.Container(
                                    height: 35,
                                    width: 270,
                                    decoration: const pw.BoxDecoration(
                                        color: PdfColor.fromInt(0xfff3ded4),
                                        borderRadius: 6),
                                    child: pw.Text(
                                        '  Colour: ${hallwayTanNotifier.hallwayTanList.isNotEmpty ? hallwayTanNotifier.hallwayTanList.last.colour : ' NA'}',
                                        style: pw.TextStyle(
                                          font: alice,
                                          fontSize: 20,
                                        )),
                                  ),
                                  pw.SizedBox(
                                    width: 15,
                                  ),
                                  pw.Container(
                                    height: 35,
                                    width: 270,
                                    decoration: const pw.BoxDecoration(
                                        color: PdfColor.fromInt(0xfff3ded4),
                                        borderRadius: 6),
                                    child: pw.Text(
                                        '  Cleanliness: ${hallwayTanNotifier.hallwayTanList.isNotEmpty ? hallwayTanNotifier.hallwayTanList.last.condition : ' NA'}',
                                        style: pw.TextStyle(
                                          font: alice,
                                          fontSize: 20,
                                        )),
                                  ),
                                ])),
                          ),
                          pw.Container(
                            padding: pw.EdgeInsets.only(left: 20),
                            child: pw.Container(
                              decoration: pw.BoxDecoration(
                                color: PdfColor.fromInt(0xffffffff),
                              ),
                              width: 1145,
                              padding: pw.EdgeInsets.only(left: 8),
                              child: pw.Row(children: <pw.Widget>[
                                pw.SizedBox(
                                  width: 5,
                                ),
                                pw.Container(
                                  child: pw.Text(
                                    '  Description : ${hallwayTanNotifier.hallwayTanList.isNotEmpty ? hallwayTanNotifier.hallwayTanList.last.description : '  NA'}',
                                    style: pw.TextStyle(
                                      font: alice,
                                      fontSize: 20,
                                    ),
                                  ),
                                  width: 270,
                                  height: 630,
                                  decoration: pw.BoxDecoration(
                                      color: PdfColor.fromInt(0xfff3ded4)),
                                ),
                                pw.Container(
                                  height: 670,
                                  width: 870,
                                  child: pw.GridView(
                                    crossAxisCount: 2,
                                    childAspectRatio: 01.01,
                                    children: List<pw.Widget>.generate(
                                      hallwayImgTanNotify
                                          .hallwayImgTanList.length,
                                      (int n) {
                                        var imag = PdfImage.file(
                                          pdf.document,
                                          bytes: File(hallwayImgTanNotify
                                                  .hallwayImgTanList[n]
                                                  .imagehallwaytan
                                                  .path)
                                              .readAsBytesSync(),
                                        );
                                        return pw.Container(
                                            child: pw.Image(imag,
                                                height: 290,
                                                width: 400,
                                                fit: pw.BoxFit.cover));
                                      },
                                    ),
                                  ),
                                ),
                              ]),
                            ),
                          ),
                        ])),
              ]),
            ];
          },
        ));
      }
    }

    writeOnPdfSmote() async {
      if (smoteNotifier.smoteList.isNotEmpty ||
          smoteImgNotify.smoteImgList.isNotEmpty) {
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
                    padding: pw.EdgeInsets.only(top: 100),
                    child: pw.Column(
                        mainAxisAlignment: pw.MainAxisAlignment.start,
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: <pw.Widget>[
//                            pw.SizedBox(height:100,),
                          pw.Container(
                            padding: pw.EdgeInsets.only(
                              left: 20,
                            ),
                            child: pw.Container(
                                padding: pw.EdgeInsets.only(
                                  top: 10,
                                  left: 10,
                                ),
                                decoration: pw.BoxDecoration(
                                  color: PdfColor.fromInt(0xffffffff),
                                ),
                                height: 40,
                                width: 1145,
                                child: pw.Row(children: <pw.Widget>[
                                  pw.Container(
                                    height: 35,
                                    width: 270,
                                    decoration: const pw.BoxDecoration(
                                        color: PdfColor.fromInt(0xffc7d0d8),
                                        borderRadius: 6),
                                    child: pw.Text('  Exterior Walls: ',
                                        style: pw.TextStyle(
                                            font: alice, fontSize: 22)),
                                  ),
                                  pw.SizedBox(
                                    width: 15,
                                  ),
                                  pw.Container(
                                    height: 35,
                                    width: 270,
                                    decoration: const pw.BoxDecoration(
                                        color: PdfColor.fromInt(0xfff3ded4),
                                        borderRadius: 6),
                                    child: pw.Text(
                                        '  Quanity: ${smoteNotifier.smoteList.isNotEmpty ? smoteNotifier.smoteList.last.quantity : ' NA'}',
                                        style: pw.TextStyle(
                                          font: alice,
                                          fontSize: 20,
                                        )),
                                  ),
                                  pw.SizedBox(
                                    width: 15,
                                  ),
                                  pw.Container(
                                    height: 35,
                                    width: 270,
                                    decoration: const pw.BoxDecoration(
                                        color: PdfColor.fromInt(0xfff3ded4),
                                        borderRadius: 6),
                                    child: pw.Text(
                                        '  Colour: ${smoteNotifier.smoteList.isNotEmpty ? smoteNotifier.smoteList.last.colour : ' NA'}',
                                        style: pw.TextStyle(
                                          font: alice,
                                          fontSize: 20,
                                        )),
                                  ),
                                  pw.SizedBox(
                                    width: 15,
                                  ),
                                  pw.Container(
                                    height: 35,
                                    width: 270,
                                    decoration: const pw.BoxDecoration(
                                        color: PdfColor.fromInt(0xfff3ded4),
                                        borderRadius: 6),
                                    child: pw.Text(
                                        '  Cleanliness: ${smoteNotifier.smoteList.isNotEmpty ? smoteNotifier.smoteList.last.condition : ' NA'}',
                                        style: pw.TextStyle(
                                          font: alice,
                                          fontSize: 20,
                                        )),
                                  ),
                                ])),
                          ),
                          pw.Container(
                            padding: pw.EdgeInsets.only(left: 20),
                            child: pw.Container(
                              decoration: pw.BoxDecoration(
                                color: PdfColor.fromInt(0xffffffff),
                              ),
                              width: 1145,
                              padding: pw.EdgeInsets.only(left: 8),
                              child: pw.Row(children: <pw.Widget>[
                                pw.SizedBox(
                                  width: 5,
                                ),
                                pw.Container(
                                  child: pw.Text(
                                    '  Description : ${smoteNotifier.smoteList.isNotEmpty ? smoteNotifier.smoteList.last.description : '  NA'}',
                                    style: pw.TextStyle(
                                      font: alice,
                                      fontSize: 20,
                                    ),
                                  ),
                                  width: 270,
                                  height: 630,
                                  decoration: pw.BoxDecoration(
                                      color: PdfColor.fromInt(0xfff3ded4)),
                                ),
                                pw.Container(
                                  height: 670,
                                  width: 870,
                                  child: pw.GridView(
                                    crossAxisCount: 2,
                                    childAspectRatio: 01.01,
                                    children: List<pw.Widget>.generate(
                                      smoteImgNotify.smoteImgList.length,
                                      (int n) {
                                        var imag = PdfImage.file(
                                          pdf.document,
                                          bytes: File(smoteImgNotify
                                                  .smoteImgList[n]
                                                  .imagessmote
                                                  .path)
                                              .readAsBytesSync(),
                                        );
                                        return pw.Container(
                                            child: pw.Image(imag,
                                                height: 290,
                                                width: 400,
                                                fit: pw.BoxFit.cover));
                                      },
                                    ),
                                  ),
                                ),
                              ]),
                            ),
                          ),
                        ])),
              ]),
            ];
          },
        ));
      }
      if (smoteTanNotifier.smoteTanList.isNotEmpty ||
          smoteImgTanNotify.smoteImgTanList.isNotEmpty) {
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
                    padding: pw.EdgeInsets.only(top: 100),
                    child: pw.Column(
                        mainAxisAlignment: pw.MainAxisAlignment.start,
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: <pw.Widget>[
//                            pw.SizedBox(height:100,),
                          pw.Container(
                            padding: pw.EdgeInsets.only(
                              left: 20,
                            ),
                            child: pw.Container(
                                padding: pw.EdgeInsets.only(
                                  top: 10,
                                  left: 10,
                                ),
                                decoration: pw.BoxDecoration(
                                  color: PdfColor.fromInt(0xffffffff),
                                ),
                                height: 40,
                                width: 1145,
                                child: pw.Row(children: <pw.Widget>[
                                  pw.Container(
                                    height: 35,
                                    width: 270,
                                    decoration: const pw.BoxDecoration(
                                        color: PdfColor.fromInt(0xffc7d0d8),
                                        borderRadius: 6),
                                    child: pw.Text('  Exterior Walls: ',
                                        style: pw.TextStyle(
                                            font: alice, fontSize: 22)),
                                  ),
                                  pw.SizedBox(
                                    width: 15,
                                  ),
                                  pw.Container(
                                    height: 35,
                                    width: 270,
                                    decoration: const pw.BoxDecoration(
                                        color: PdfColor.fromInt(0xfff3ded4),
                                        borderRadius: 6),
                                    child: pw.Text(
                                        '  Quanity: ${smoteTanNotifier.smoteTanList.isNotEmpty ? smoteTanNotifier.smoteTanList.last.quantity : ' NA'}',
                                        style: pw.TextStyle(
                                          font: alice,
                                          fontSize: 20,
                                        )),
                                  ),
                                  pw.SizedBox(
                                    width: 15,
                                  ),
                                  pw.Container(
                                    height: 35,
                                    width: 270,
                                    decoration: const pw.BoxDecoration(
                                        color: PdfColor.fromInt(0xfff3ded4),
                                        borderRadius: 6),
                                    child: pw.Text(
                                        '  Colour: ${smoteTanNotifier.smoteTanList.isNotEmpty ? smoteTanNotifier.smoteTanList.last.colour : ' NA'}',
                                        style: pw.TextStyle(
                                          font: alice,
                                          fontSize: 20,
                                        )),
                                  ),
                                  pw.SizedBox(
                                    width: 15,
                                  ),
                                  pw.Container(
                                    height: 35,
                                    width: 270,
                                    decoration: const pw.BoxDecoration(
                                        color: PdfColor.fromInt(0xfff3ded4),
                                        borderRadius: 6),
                                    child: pw.Text(
                                        '  Cleanliness: ${smoteTanNotifier.smoteTanList.isNotEmpty ? smoteTanNotifier.smoteTanList.last.condition : ' NA'}',
                                        style: pw.TextStyle(
                                          font: alice,
                                          fontSize: 20,
                                        )),
                                  ),
                                ])),
                          ),
                          pw.Container(
                            padding: pw.EdgeInsets.only(left: 20),
                            child: pw.Container(
                              decoration: pw.BoxDecoration(
                                color: PdfColor.fromInt(0xffffffff),
                              ),
                              width: 1145,
                              padding: pw.EdgeInsets.only(left: 8),
                              child: pw.Row(children: <pw.Widget>[
                                pw.SizedBox(
                                  width: 5,
                                ),
                                pw.Container(
                                  child: pw.Text(
                                    '  Description : ${smoteTanNotifier.smoteTanList.isNotEmpty ? smoteTanNotifier.smoteTanList.last.description : '  NA'}',
                                    style: pw.TextStyle(
                                      font: alice,
                                      fontSize: 20,
                                    ),
                                  ),
                                  width: 270,
                                  height: 630,
                                  decoration: pw.BoxDecoration(
                                      color: PdfColor.fromInt(0xfff3ded4)),
                                ),
                                pw.Container(
                                  height: 670,
                                  width: 870,
                                  child: pw.GridView(
                                    crossAxisCount: 2,
                                    childAspectRatio: 01.01,
                                    children: List<pw.Widget>.generate(
                                      smoteImgTanNotify.smoteImgTanList.length,
                                      (int n) {
                                        var imag = PdfImage.file(
                                          pdf.document,
                                          bytes: File(smoteImgTanNotify
                                                  .smoteImgTanList[n]
                                                  .imagessmotetan
                                                  .path)
                                              .readAsBytesSync(),
                                        );
                                        return pw.Container(
                                            child: pw.Image(imag,
                                                height: 290,
                                                width: 400,
                                                fit: pw.BoxFit.cover));
                                      },
                                    ),
                                  ),
                                ),
                              ]),
                            ),
                          ),
                        ])),
              ]),
            ];
          },
        ));
      }
    }

    writeOnPdfKitchen() async {
      if (kitchenNotifier.kitchenList.isNotEmpty ||
          kitchenImgNotify.kitchenImgList.isNotEmpty) {
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
                    padding: pw.EdgeInsets.only(top: 100),
                    child: pw.Column(
                        mainAxisAlignment: pw.MainAxisAlignment.start,
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: <pw.Widget>[
//                            pw.SizedBox(height:100,),
                          pw.Container(
                            padding: pw.EdgeInsets.only(
                              left: 20,
                            ),
                            child: pw.Container(
                                padding: pw.EdgeInsets.only(
                                  top: 10,
                                  left: 10,
                                ),
                                decoration: pw.BoxDecoration(
                                  color: PdfColor.fromInt(0xffffffff),
                                ),
                                height: 40,
                                width: 1145,
                                child: pw.Row(children: <pw.Widget>[
                                  pw.Container(
                                    height: 35,
                                    width: 270,
                                    decoration: const pw.BoxDecoration(
                                        color: PdfColor.fromInt(0xffc7d0d8),
                                        borderRadius: 6),
                                    child: pw.Text('  Exterior Walls: ',
                                        style: pw.TextStyle(
                                            font: alice, fontSize: 22)),
                                  ),
                                  pw.SizedBox(
                                    width: 15,
                                  ),
                                  pw.Container(
                                    height: 35,
                                    width: 270,
                                    decoration: const pw.BoxDecoration(
                                        color: PdfColor.fromInt(0xfff3ded4),
                                        borderRadius: 6),
                                    child: pw.Text(
                                        '  Quanity: ${kitchenNotifier.kitchenList.isNotEmpty ? kitchenNotifier.kitchenList.last.quantity : ' NA'}',
                                        style: pw.TextStyle(
                                          font: alice,
                                          fontSize: 20,
                                        )),
                                  ),
                                  pw.SizedBox(
                                    width: 15,
                                  ),
                                  pw.Container(
                                    height: 35,
                                    width: 270,
                                    decoration: const pw.BoxDecoration(
                                        color: PdfColor.fromInt(0xfff3ded4),
                                        borderRadius: 6),
                                    child: pw.Text(
                                        '  Colour: ${kitchenNotifier.kitchenList.isNotEmpty ? kitchenNotifier.kitchenList.last.colour : ' NA'}',
                                        style: pw.TextStyle(
                                          font: alice,
                                          fontSize: 20,
                                        )),
                                  ),
                                  pw.SizedBox(
                                    width: 15,
                                  ),
                                  pw.Container(
                                    height: 35,
                                    width: 270,
                                    decoration: const pw.BoxDecoration(
                                        color: PdfColor.fromInt(0xfff3ded4),
                                        borderRadius: 6),
                                    child: pw.Text(
                                        '  Cleanliness: ${kitchenNotifier.kitchenList.isNotEmpty ? kitchenNotifier.kitchenList.last.condition : ' NA'}',
                                        style: pw.TextStyle(
                                          font: alice,
                                          fontSize: 20,
                                        )),
                                  ),
                                ])),
                          ),
                          pw.Container(
                            padding: pw.EdgeInsets.only(left: 20),
                            child: pw.Container(
                              decoration: pw.BoxDecoration(
                                color: PdfColor.fromInt(0xffffffff),
                              ),
                              width: 1145,
                              padding: pw.EdgeInsets.only(left: 8),
                              child: pw.Row(children: <pw.Widget>[
                                pw.SizedBox(
                                  width: 5,
                                ),
                                pw.Container(
                                  child: pw.Text(
                                    '  Description : ${kitchenNotifier.kitchenList.isNotEmpty ? kitchenNotifier.kitchenList.last.description : '  NA'}',
                                    style: pw.TextStyle(
                                      font: alice,
                                      fontSize: 20,
                                    ),
                                  ),
                                  width: 270,
                                  height: 630,
                                  decoration: pw.BoxDecoration(
                                      color: PdfColor.fromInt(0xfff3ded4)),
                                ),
                                pw.Container(
                                  height: 670,
                                  width: 870,
                                  child: pw.GridView(
                                    crossAxisCount: 2,
                                    childAspectRatio: 01.01,
                                    children: List<pw.Widget>.generate(
                                      kitchenImgNotify.kitchenImgList.length,
                                      (int n) {
                                        var imag = PdfImage.file(
                                          pdf.document,
                                          bytes: File(kitchenImgNotify
                                                  .kitchenImgList[n]
                                                  .imagekitchen
                                                  .path)
                                              .readAsBytesSync(),
                                        );
                                        return pw.Container(
                                            child: pw.Image(imag,
                                                height: 290,
                                                width: 400,
                                                fit: pw.BoxFit.cover));
                                      },
                                    ),
                                  ),
                                ),
                              ]),
                            ),
                          ),
                        ])),
              ]),
            ];
          },
        ));
      }
      if (kitchenTanNotifier.kitchenTanList.isNotEmpty ||
          kitchenImgTanNotify.kitchenImgTanList.isNotEmpty) {
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
                    padding: pw.EdgeInsets.only(top: 100),
                    child: pw.Column(
                        mainAxisAlignment: pw.MainAxisAlignment.start,
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: <pw.Widget>[
//                            pw.SizedBox(height:100,),
                          pw.Container(
                            padding: pw.EdgeInsets.only(
                              left: 20,
                            ),
                            child: pw.Container(
                                padding: pw.EdgeInsets.only(
                                  top: 10,
                                  left: 10,
                                ),
                                decoration: pw.BoxDecoration(
                                  color: PdfColor.fromInt(0xffffffff),
                                ),
                                height: 40,
                                width: 1145,
                                child: pw.Row(children: <pw.Widget>[
                                  pw.Container(
                                    height: 35,
                                    width: 270,
                                    decoration: const pw.BoxDecoration(
                                        color: PdfColor.fromInt(0xffc7d0d8),
                                        borderRadius: 6),
                                    child: pw.Text('  Exterior Walls: ',
                                        style: pw.TextStyle(
                                            font: alice, fontSize: 22)),
                                  ),
                                  pw.SizedBox(
                                    width: 15,
                                  ),
                                  pw.Container(
                                    height: 35,
                                    width: 270,
                                    decoration: const pw.BoxDecoration(
                                        color: PdfColor.fromInt(0xfff3ded4),
                                        borderRadius: 6),
                                    child: pw.Text(
                                        '  Quanity: ${kitchenTanNotifier.kitchenTanList.isNotEmpty ? kitchenTanNotifier.kitchenTanList.last.quantity : ' NA'}',
                                        style: pw.TextStyle(
                                          font: alice,
                                          fontSize: 20,
                                        )),
                                  ),
                                  pw.SizedBox(
                                    width: 15,
                                  ),
                                  pw.Container(
                                    height: 35,
                                    width: 270,
                                    decoration: const pw.BoxDecoration(
                                        color: PdfColor.fromInt(0xfff3ded4),
                                        borderRadius: 6),
                                    child: pw.Text(
                                        '  Colour: ${kitchenTanNotifier.kitchenTanList.isNotEmpty ? kitchenTanNotifier.kitchenTanList.last.colour : ' NA'}',
                                        style: pw.TextStyle(
                                          font: alice,
                                          fontSize: 20,
                                        )),
                                  ),
                                  pw.SizedBox(
                                    width: 15,
                                  ),
                                  pw.Container(
                                    height: 35,
                                    width: 270,
                                    decoration: const pw.BoxDecoration(
                                        color: PdfColor.fromInt(0xfff3ded4),
                                        borderRadius: 6),
                                    child: pw.Text(
                                        '  Cleanliness: ${kitchenTanNotifier.kitchenTanList.isNotEmpty ? kitchenTanNotifier.kitchenTanList.last.condition : ' NA'}',
                                        style: pw.TextStyle(
                                          font: alice,
                                          fontSize: 20,
                                        )),
                                  ),
                                ])),
                          ),
                          pw.Container(
                            padding: pw.EdgeInsets.only(left: 20),
                            child: pw.Container(
                              decoration: pw.BoxDecoration(
                                color: PdfColor.fromInt(0xffffffff),
                              ),
                              width: 1145,
                              padding: pw.EdgeInsets.only(left: 8),
                              child: pw.Row(children: <pw.Widget>[
                                pw.SizedBox(
                                  width: 5,
                                ),
                                pw.Container(
                                  child: pw.Text(
                                    '  Description : ${kitchenTanNotifier.kitchenTanList.isNotEmpty ? kitchenTanNotifier.kitchenTanList.last.description : '  NA'}',
                                    style: pw.TextStyle(
                                      font: alice,
                                      fontSize: 20,
                                    ),
                                  ),
                                  width: 270,
                                  height: 630,
                                  decoration: pw.BoxDecoration(
                                      color: PdfColor.fromInt(0xfff3ded4)),
                                ),
                                pw.Container(
                                  height: 670,
                                  width: 870,
                                  child: pw.GridView(
                                    crossAxisCount: 2,
                                    childAspectRatio: 01.01,
                                    children: List<pw.Widget>.generate(
                                      kitchenImgTanNotify
                                          .kitchenImgTanList.length,
                                      (int n) {
                                        var imag = PdfImage.file(
                                          pdf.document,
                                          bytes: File(kitchenImgTanNotify
                                                  .kitchenImgTanList[n]
                                                  .imagekitchentan
                                                  .path)
                                              .readAsBytesSync(),
                                        );
                                        return pw.Container(
                                            child: pw.Image(imag,
                                                height: 290,
                                                width: 400,
                                                fit: pw.BoxFit.cover));
                                      },
                                    ),
                                  ),
                                ),
                              ]),
                            ),
                          ),
                        ])),
              ]),
            ];
          },
        ));
      }
    }

    writeOnPdfBedroom() async {
      if (bedroomNotifier.bedroomList.isNotEmpty ||
          bedroomImgNotify.bedroomImgList.isNotEmpty) {
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
                    padding: pw.EdgeInsets.only(top: 100),
                    child: pw.Column(
                        mainAxisAlignment: pw.MainAxisAlignment.start,
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: <pw.Widget>[
//                            pw.SizedBox(height:100,),
                          pw.Container(
                            padding: pw.EdgeInsets.only(
                              left: 20,
                            ),
                            child: pw.Container(
                                padding: pw.EdgeInsets.only(
                                  top: 10,
                                  left: 10,
                                ),
                                decoration: pw.BoxDecoration(
                                  color: PdfColor.fromInt(0xffffffff),
                                ),
                                height: 40,
                                width: 1145,
                                child: pw.Row(children: <pw.Widget>[
                                  pw.Container(
                                    height: 35,
                                    width: 270,
                                    decoration: const pw.BoxDecoration(
                                        color: PdfColor.fromInt(0xffc7d0d8),
                                        borderRadius: 6),
                                    child: pw.Text('  Exterior Walls: ',
                                        style: pw.TextStyle(
                                            font: alice, fontSize: 22)),
                                  ),
                                  pw.SizedBox(
                                    width: 15,
                                  ),
                                  pw.Container(
                                    height: 35,
                                    width: 270,
                                    decoration: const pw.BoxDecoration(
                                        color: PdfColor.fromInt(0xfff3ded4),
                                        borderRadius: 6),
                                    child: pw.Text(
                                        '  Quanity: ${bedroomNotifier.bedroomList.isNotEmpty ? bedroomNotifier.bedroomList.last.quantity : ' NA'}',
                                        style: pw.TextStyle(
                                          font: alice,
                                          fontSize: 20,
                                        )),
                                  ),
                                  pw.SizedBox(
                                    width: 15,
                                  ),
                                  pw.Container(
                                    height: 35,
                                    width: 270,
                                    decoration: const pw.BoxDecoration(
                                        color: PdfColor.fromInt(0xfff3ded4),
                                        borderRadius: 6),
                                    child: pw.Text(
                                        '  Colour: ${bedroomNotifier.bedroomList.isNotEmpty ? bedroomNotifier.bedroomList.last.colour : ' NA'}',
                                        style: pw.TextStyle(
                                          font: alice,
                                          fontSize: 20,
                                        )),
                                  ),
                                  pw.SizedBox(
                                    width: 15,
                                  ),
                                  pw.Container(
                                    height: 35,
                                    width: 270,
                                    decoration: const pw.BoxDecoration(
                                        color: PdfColor.fromInt(0xfff3ded4),
                                        borderRadius: 6),
                                    child: pw.Text(
                                        '  Cleanliness: ${bedroomNotifier.bedroomList.isNotEmpty ? bedroomNotifier.bedroomList.last.condition : ' NA'}',
                                        style: pw.TextStyle(
                                          font: alice,
                                          fontSize: 20,
                                        )),
                                  ),
                                ])),
                          ),
                          pw.Container(
                            padding: pw.EdgeInsets.only(left: 20),
                            child: pw.Container(
                              decoration: pw.BoxDecoration(
                                color: PdfColor.fromInt(0xffffffff),
                              ),
                              width: 1145,
                              padding: pw.EdgeInsets.only(left: 8),
                              child: pw.Row(children: <pw.Widget>[
                                pw.SizedBox(
                                  width: 5,
                                ),
                                pw.Container(
                                  child: pw.Text(
                                    '  Description : ${bedroomNotifier.bedroomList.isNotEmpty ? bedroomNotifier.bedroomList.last.description : '  NA'}',
                                    style: pw.TextStyle(
                                      font: alice,
                                      fontSize: 20,
                                    ),
                                  ),
                                  width: 270,
                                  height: 630,
                                  decoration: pw.BoxDecoration(
                                      color: PdfColor.fromInt(0xfff3ded4)),
                                ),
                                pw.Container(
                                  height: 670,
                                  width: 870,
                                  child: pw.GridView(
                                    crossAxisCount: 2,
                                    childAspectRatio: 01.01,
                                    children: List<pw.Widget>.generate(
                                      bedroomImgNotify.bedroomImgList.length,
                                      (int n) {
                                        var imag = PdfImage.file(
                                          pdf.document,
                                          bytes: File(bedroomImgNotify
                                                  .bedroomImgList[n]
                                                  .imagebedroom
                                                  .path)
                                              .readAsBytesSync(),
                                        );
                                        return pw.Container(
                                            child: pw.Image(imag,
                                                height: 290,
                                                width: 400,
                                                fit: pw.BoxFit.cover));
                                      },
                                    ),
                                  ),
                                ),
                              ]),
                            ),
                          ),
                        ])),
              ]),
            ];
          },
        ));
      }
      if (bedroomTanNotifier.bedroomTanList.isNotEmpty ||
          bedroomImgTanNotify.bedroomImgTanList.isNotEmpty) {
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
                    padding: pw.EdgeInsets.only(top: 100),
                    child: pw.Column(
                        mainAxisAlignment: pw.MainAxisAlignment.start,
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: <pw.Widget>[
//                            pw.SizedBox(height:100,),
                          pw.Container(
                            padding: pw.EdgeInsets.only(
                              left: 20,
                            ),
                            child: pw.Container(
                                padding: pw.EdgeInsets.only(
                                  top: 10,
                                  left: 10,
                                ),
                                decoration: pw.BoxDecoration(
                                  color: PdfColor.fromInt(0xffffffff),
                                ),
                                height: 40,
                                width: 1145,
                                child: pw.Row(children: <pw.Widget>[
                                  pw.Container(
                                    height: 35,
                                    width: 270,
                                    decoration: const pw.BoxDecoration(
                                        color: PdfColor.fromInt(0xffc7d0d8),
                                        borderRadius: 6),
                                    child: pw.Text('  Exterior Walls: ',
                                        style: pw.TextStyle(
                                            font: alice, fontSize: 22)),
                                  ),
                                  pw.SizedBox(
                                    width: 15,
                                  ),
                                  pw.Container(
                                    height: 35,
                                    width: 270,
                                    decoration: const pw.BoxDecoration(
                                        color: PdfColor.fromInt(0xfff3ded4),
                                        borderRadius: 6),
                                    child: pw.Text(
                                        '  Quanity: ${bedroomTanNotifier.bedroomTanList.isNotEmpty ? bedroomTanNotifier.bedroomTanList.last.quantity : ' NA'}',
                                        style: pw.TextStyle(
                                          font: alice,
                                          fontSize: 20,
                                        )),
                                  ),
                                  pw.SizedBox(
                                    width: 15,
                                  ),
                                  pw.Container(
                                    height: 35,
                                    width: 270,
                                    decoration: const pw.BoxDecoration(
                                        color: PdfColor.fromInt(0xfff3ded4),
                                        borderRadius: 6),
                                    child: pw.Text(
                                        '  Colour: ${bedroomTanNotifier.bedroomTanList.isNotEmpty ? bedroomTanNotifier.bedroomTanList.last.colour : ' NA'}',
                                        style: pw.TextStyle(
                                          font: alice,
                                          fontSize: 20,
                                        )),
                                  ),
                                  pw.SizedBox(
                                    width: 15,
                                  ),
                                  pw.Container(
                                    height: 35,
                                    width: 270,
                                    decoration: const pw.BoxDecoration(
                                        color: PdfColor.fromInt(0xfff3ded4),
                                        borderRadius: 6),
                                    child: pw.Text(
                                        '  Cleanliness: ${bedroomTanNotifier.bedroomTanList.isNotEmpty ? bedroomTanNotifier.bedroomTanList.last.condition : ' NA'}',
                                        style: pw.TextStyle(
                                          font: alice,
                                          fontSize: 20,
                                        )),
                                  ),
                                ])),
                          ),
                          pw.Container(
                            padding: pw.EdgeInsets.only(left: 20),
                            child: pw.Container(
                              decoration: pw.BoxDecoration(
                                color: PdfColor.fromInt(0xffffffff),
                              ),
                              width: 1145,
                              padding: pw.EdgeInsets.only(left: 8),
                              child: pw.Row(children: <pw.Widget>[
                                pw.SizedBox(
                                  width: 5,
                                ),
                                pw.Container(
                                  child: pw.Text(
                                    '  Description : ${bedroomTanNotifier.bedroomTanList.isNotEmpty ? bedroomTanNotifier.bedroomTanList.last.description : '  NA'}',
                                    style: pw.TextStyle(
                                      font: alice,
                                      fontSize: 20,
                                    ),
                                  ),
                                  width: 270,
                                  height: 630,
                                  decoration: pw.BoxDecoration(
                                      color: PdfColor.fromInt(0xfff3ded4)),
                                ),
                                pw.Container(
                                  height: 670,
                                  width: 870,
                                  child: pw.GridView(
                                    crossAxisCount: 2,
                                    childAspectRatio: 01.01,
                                    children: List<pw.Widget>.generate(
                                      bedroomImgTanNotify
                                          .bedroomImgTanList.length,
                                      (int n) {
                                        var imag = PdfImage.file(
                                          pdf.document,
                                          bytes: File(bedroomImgTanNotify
                                                  .bedroomImgTanList[n]
                                                  .imagebedroomtan
                                                  .path)
                                              .readAsBytesSync(),
                                        );
                                        return pw.Container(
                                            child: pw.Image(imag,
                                                height: 290,
                                                width: 400,
                                                fit: pw.BoxFit.cover));
                                      },
                                    ),
                                  ),
                                ),
                              ]),
                            ),
                          ),
                        ])),
              ]),
            ];
          },
        ));
      }
    }

    writeOnPdfChaabi() async {
      if (chaabiNotifier.chaabiList.isNotEmpty ||
          chaabiImgNotify.chaabiImgList.isNotEmpty) {
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
                    padding: pw.EdgeInsets.only(top: 100),
                    child: pw.Column(
                        mainAxisAlignment: pw.MainAxisAlignment.start,
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: <pw.Widget>[
//                            pw.SizedBox(height:100,),
                          pw.Container(
                            padding: pw.EdgeInsets.only(
                              left: 20,
                            ),
                            child: pw.Container(
                                padding: pw.EdgeInsets.only(
                                  top: 10,
                                  left: 10,
                                ),
                                decoration: pw.BoxDecoration(
                                  color: PdfColor.fromInt(0xffffffff),
                                ),
                                height: 40,
                                width: 1145,
                                child: pw.Row(children: <pw.Widget>[
                                  pw.Container(
                                    height: 35,
                                    width: 270,
                                    decoration: const pw.BoxDecoration(
                                        color: PdfColor.fromInt(0xffc7d0d8),
                                        borderRadius: 6),
                                    child: pw.Text('  Exterior Walls: ',
                                        style: pw.TextStyle(
                                            font: alice, fontSize: 22)),
                                  ),
                                  pw.SizedBox(
                                    width: 15,
                                  ),
                                  pw.Container(
                                    height: 35,
                                    width: 270,
                                    decoration: const pw.BoxDecoration(
                                        color: PdfColor.fromInt(0xfff3ded4),
                                        borderRadius: 6),
                                    child: pw.Text(
                                        '  Quanity: ${chaabiNotifier.chaabiList.isNotEmpty ? chaabiNotifier.chaabiList.last.quantity : ' NA'}',
                                        style: pw.TextStyle(
                                          font: alice,
                                          fontSize: 20,
                                        )),
                                  ),
                                  pw.SizedBox(
                                    width: 15,
                                  ),
                                  pw.Container(
                                    height: 35,
                                    width: 270,
                                    decoration: const pw.BoxDecoration(
                                        color: PdfColor.fromInt(0xfff3ded4),
                                        borderRadius: 6),
                                    child: pw.Text(
                                        '  Colour: ${chaabiNotifier.chaabiList.isNotEmpty ? chaabiNotifier.chaabiList.last.colour : ' NA'}',
                                        style: pw.TextStyle(
                                          font: alice,
                                          fontSize: 20,
                                        )),
                                  ),
                                  pw.SizedBox(
                                    width: 15,
                                  ),
                                  pw.Container(
                                    height: 35,
                                    width: 270,
                                    decoration: const pw.BoxDecoration(
                                        color: PdfColor.fromInt(0xfff3ded4),
                                        borderRadius: 6),
                                    child: pw.Text(
                                        '  Cleanliness: ${chaabiNotifier.chaabiList.isNotEmpty ? chaabiNotifier.chaabiList.last.condition : ' NA'}',
                                        style: pw.TextStyle(
                                          font: alice,
                                          fontSize: 20,
                                        )),
                                  ),
                                ])),
                          ),
                          pw.Container(
                            padding: pw.EdgeInsets.only(left: 20),
                            child: pw.Container(
                              decoration: pw.BoxDecoration(
                                color: PdfColor.fromInt(0xffffffff),
                              ),
                              width: 1145,
                              padding: pw.EdgeInsets.only(left: 8),
                              child: pw.Row(children: <pw.Widget>[
                                pw.SizedBox(
                                  width: 5,
                                ),
                                pw.Container(
                                  child: pw.Text(
                                    '  Description : ${chaabiNotifier.chaabiList.isNotEmpty ? chaabiNotifier.chaabiList.last.description : '  NA'}',
                                    style: pw.TextStyle(
                                      font: alice,
                                      fontSize: 20,
                                    ),
                                  ),
                                  width: 270,
                                  height: 630,
                                  decoration: pw.BoxDecoration(
                                      color: PdfColor.fromInt(0xfff3ded4)),
                                ),
                                pw.Container(
                                  height: 670,
                                  width: 870,
                                  child: pw.GridView(
                                    crossAxisCount: 2,
                                    childAspectRatio: 01.01,
                                    children: List<pw.Widget>.generate(
                                      chaabiImgNotify.chaabiImgList.length,
                                      (int n) {
                                        var imag = PdfImage.file(
                                          pdf.document,
                                          bytes: File(chaabiImgNotify
                                                  .chaabiImgList[n]
                                                  .imagechaabi
                                                  .path)
                                              .readAsBytesSync(),
                                        );
                                        return pw.Container(
                                            child: pw.Image(imag,
                                                height: 290,
                                                width: 400,
                                                fit: pw.BoxFit.cover));
                                      },
                                    ),
                                  ),
                                ),
                              ]),
                            ),
                          ),
                        ])),
              ]),
            ];
          },
        ));
      }
      if (chaabiTanNotifier.chaabiTanList.isNotEmpty ||
          chaabiImgTanNotify.chaabiImgTanList.isNotEmpty) {
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
                    padding: pw.EdgeInsets.only(top: 100),
                    child: pw.Column(
                        mainAxisAlignment: pw.MainAxisAlignment.start,
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: <pw.Widget>[
//                            pw.SizedBox(height:100,),
                          pw.Container(
                            padding: pw.EdgeInsets.only(
                              left: 20,
                            ),
                            child: pw.Container(
                                padding: pw.EdgeInsets.only(
                                  top: 10,
                                  left: 10,
                                ),
                                decoration: pw.BoxDecoration(
                                  color: PdfColor.fromInt(0xffffffff),
                                ),
                                height: 40,
                                width: 1145,
                                child: pw.Row(children: <pw.Widget>[
                                  pw.Container(
                                    height: 35,
                                    width: 270,
                                    decoration: const pw.BoxDecoration(
                                        color: PdfColor.fromInt(0xffc7d0d8),
                                        borderRadius: 6),
                                    child: pw.Text('  Exterior Walls: ',
                                        style: pw.TextStyle(
                                            font: alice, fontSize: 22)),
                                  ),
                                  pw.SizedBox(
                                    width: 15,
                                  ),
                                  pw.Container(
                                    height: 35,
                                    width: 270,
                                    decoration: const pw.BoxDecoration(
                                        color: PdfColor.fromInt(0xfff3ded4),
                                        borderRadius: 6),
                                    child: pw.Text(
                                        '  Quanity: ${chaabiTanNotifier.chaabiTanList.isNotEmpty ? chaabiTanNotifier.chaabiTanList.last.quantity : ' NA'}',
                                        style: pw.TextStyle(
                                          font: alice,
                                          fontSize: 20,
                                        )),
                                  ),
                                  pw.SizedBox(
                                    width: 15,
                                  ),
                                  pw.Container(
                                    height: 35,
                                    width: 270,
                                    decoration: const pw.BoxDecoration(
                                        color: PdfColor.fromInt(0xfff3ded4),
                                        borderRadius: 6),
                                    child: pw.Text(
                                        '  Colour: ${chaabiTanNotifier.chaabiTanList.isNotEmpty ? chaabiTanNotifier.chaabiTanList.last.colour : ' NA'}',
                                        style: pw.TextStyle(
                                          font: alice,
                                          fontSize: 20,
                                        )),
                                  ),
                                  pw.SizedBox(
                                    width: 15,
                                  ),
                                  pw.Container(
                                    height: 35,
                                    width: 270,
                                    decoration: const pw.BoxDecoration(
                                        color: PdfColor.fromInt(0xfff3ded4),
                                        borderRadius: 6),
                                    child: pw.Text(
                                        '  Cleanliness: ${chaabiTanNotifier.chaabiTanList.isNotEmpty ? chaabiTanNotifier.chaabiTanList.last.condition : ' NA'}',
                                        style: pw.TextStyle(
                                          font: alice,
                                          fontSize: 20,
                                        )),
                                  ),
                                ])),
                          ),
                          pw.Container(
                            padding: pw.EdgeInsets.only(left: 20),
                            child: pw.Container(
                              decoration: pw.BoxDecoration(
                                color: PdfColor.fromInt(0xffffffff),
                              ),
                              width: 1145,
                              padding: pw.EdgeInsets.only(left: 8),
                              child: pw.Row(children: <pw.Widget>[
                                pw.SizedBox(
                                  width: 5,
                                ),
                                pw.Container(
                                  child: pw.Text(
                                    '  Description : ${chaabiTanNotifier.chaabiTanList.isNotEmpty ? chaabiTanNotifier.chaabiTanList.last.description : '  NA'}',
                                    style: pw.TextStyle(
                                      font: alice,
                                      fontSize: 20,
                                    ),
                                  ),
                                  width: 270,
                                  height: 630,
                                  decoration: pw.BoxDecoration(
                                      color: PdfColor.fromInt(0xfff3ded4)),
                                ),
                                pw.Container(
                                  height: 670,
                                  width: 870,
                                  child: pw.GridView(
                                    crossAxisCount: 2,
                                    childAspectRatio: 01.01,
                                    children: List<pw.Widget>.generate(
                                      chaabiImgTanNotify
                                          .chaabiImgTanList.length,
                                      (int n) {
                                        var imag = PdfImage.file(
                                          pdf.document,
                                          bytes: File(chaabiImgTanNotify
                                                  .chaabiImgTanList[n]
                                                  .imagechaabitan
                                                  .path)
                                              .readAsBytesSync(),
                                        );
                                        return pw.Container(
                                            child: pw.Image(imag,
                                                height: 290,
                                                width: 400,
                                                fit: pw.BoxFit.cover));
                                      },
                                    ),
                                  ),
                                ),
                              ]),
                            ),
                          ),
                        ])),
              ]),
            ];
          },
        ));
      }
    }

    writeOnPdfMeter() async {
      if (meterreadingNotifier.meterreadingList.isNotEmpty ||
          meterImgNotify.meterImgList.isNotEmpty) {
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
                    padding: pw.EdgeInsets.only(top: 100),
                    child: pw.Column(
                        mainAxisAlignment: pw.MainAxisAlignment.start,
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: <pw.Widget>[
//                            pw.SizedBox(height:100,),
                          pw.Container(
                            padding: pw.EdgeInsets.only(
                              left: 20,
                            ),
                            child: pw.Container(
                                padding: pw.EdgeInsets.only(
                                  top: 10,
                                  left: 10,
                                ),
                                decoration: pw.BoxDecoration(
                                  color: PdfColor.fromInt(0xffffffff),
                                ),
                                height: 40,
                                width: 1145,
                                child: pw.Row(children: <pw.Widget>[
                                  pw.Container(
                                    height: 35,
                                    width: 270,
                                    decoration: const pw.BoxDecoration(
                                        color: PdfColor.fromInt(0xffc7d0d8),
                                        borderRadius: 6),
                                    child: pw.Text('  Exterior Walls: ',
                                        style: pw.TextStyle(
                                            font: alice, fontSize: 22)),
                                  ),
                                  pw.SizedBox(
                                    width: 15,
                                  ),
                                  pw.Container(
                                    height: 35,
                                    width: 270,
                                    decoration: const pw.BoxDecoration(
                                        color: PdfColor.fromInt(0xfff3ded4),
                                        borderRadius: 6),
                                    child: pw.Text(
                                        '  Quanity: ${meterreadingNotifier.meterreadingList.isNotEmpty ? meterreadingNotifier.meterreadingList.last.quantity : ' NA'}',
                                        style: pw.TextStyle(
                                          font: alice,
                                          fontSize: 20,
                                        )),
                                  ),
                                  pw.SizedBox(
                                    width: 15,
                                  ),
                                  pw.Container(
                                    height: 35,
                                    width: 270,
                                    decoration: const pw.BoxDecoration(
                                        color: PdfColor.fromInt(0xfff3ded4),
                                        borderRadius: 6),
                                    child: pw.Text(
                                        '  Colour: ${meterreadingNotifier.meterreadingList.isNotEmpty ? meterreadingNotifier.meterreadingList.last.colour : ' NA'}',
                                        style: pw.TextStyle(
                                          font: alice,
                                          fontSize: 20,
                                        )),
                                  ),
                                  pw.SizedBox(
                                    width: 15,
                                  ),
                                  pw.Container(
                                    height: 35,
                                    width: 270,
                                    decoration: const pw.BoxDecoration(
                                        color: PdfColor.fromInt(0xfff3ded4),
                                        borderRadius: 6),
                                    child: pw.Text(
                                        '  Cleanliness: ${meterreadingNotifier.meterreadingList.isNotEmpty ? meterreadingNotifier.meterreadingList.last.condition : ' NA'}',
                                        style: pw.TextStyle(
                                          font: alice,
                                          fontSize: 20,
                                        )),
                                  ),
                                ])),
                          ),
                          pw.Container(
                            padding: pw.EdgeInsets.only(left: 20),
                            child: pw.Container(
                              decoration: pw.BoxDecoration(
                                color: PdfColor.fromInt(0xffffffff),
                              ),
                              width: 1145,
                              padding: pw.EdgeInsets.only(left: 8),
                              child: pw.Row(children: <pw.Widget>[
                                pw.SizedBox(
                                  width: 5,
                                ),
                                pw.Container(
                                  child: pw.Text(
                                    '  Description : ${meterreadingNotifier.meterreadingList.isNotEmpty ? meterreadingNotifier.meterreadingList.last.description : '  NA'}',
                                    style: pw.TextStyle(
                                      font: alice,
                                      fontSize: 20,
                                    ),
                                  ),
                                  width: 270,
                                  height: 630,
                                  decoration: pw.BoxDecoration(
                                      color: PdfColor.fromInt(0xfff3ded4)),
                                ),
                                pw.Container(
                                  height: 670,
                                  width: 870,
                                  child: pw.GridView(
                                    crossAxisCount: 2,
                                    childAspectRatio: 01.01,
                                    children: List<pw.Widget>.generate(
                                      meterImgNotify.meterImgList.length,
                                      (int n) {
                                        var imag = PdfImage.file(
                                          pdf.document,
                                          bytes: File(meterImgNotify
                                                  .meterImgList[n]
                                                  .imagemeter
                                                  .path)
                                              .readAsBytesSync(),
                                        );
                                        return pw.Container(
                                            child: pw.Image(imag,
                                                height: 290,
                                                width: 400,
                                                fit: pw.BoxFit.cover));
                                      },
                                    ),
                                  ),
                                ),
                              ]),
                            ),
                          ),
                        ])),
              ]),
            ];
          },
        ));
      }
      if (meterreadingTanNotifier.meterreadingTanList.isNotEmpty ||
          meterImgTanNotify.meterImgTanList.isNotEmpty) {
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
                    padding: pw.EdgeInsets.only(top: 100),
                    child: pw.Column(
                        mainAxisAlignment: pw.MainAxisAlignment.start,
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: <pw.Widget>[
//                            pw.SizedBox(height:100,),
                          pw.Container(
                            padding: pw.EdgeInsets.only(
                              left: 20,
                            ),
                            child: pw.Container(
                                padding: pw.EdgeInsets.only(
                                  top: 10,
                                  left: 10,
                                ),
                                decoration: pw.BoxDecoration(
                                  color: PdfColor.fromInt(0xffffffff),
                                ),
                                height: 40,
                                width: 1145,
                                child: pw.Row(children: <pw.Widget>[
                                  pw.Container(
                                    height: 35,
                                    width: 270,
                                    decoration: const pw.BoxDecoration(
                                        color: PdfColor.fromInt(0xffc7d0d8),
                                        borderRadius: 6),
                                    child: pw.Text('  Exterior Walls: ',
                                        style: pw.TextStyle(
                                            font: alice, fontSize: 22)),
                                  ),
                                  pw.SizedBox(
                                    width: 15,
                                  ),
                                  pw.Container(
                                    height: 35,
                                    width: 270,
                                    decoration: const pw.BoxDecoration(
                                        color: PdfColor.fromInt(0xfff3ded4),
                                        borderRadius: 6),
                                    child: pw.Text(
                                        '  Quanity: ${meterreadingTanNotifier.meterreadingTanList.isNotEmpty ? meterreadingTanNotifier.meterreadingTanList.last.quantity : ' NA'}',
                                        style: pw.TextStyle(
                                          font: alice,
                                          fontSize: 20,
                                        )),
                                  ),
                                  pw.SizedBox(
                                    width: 15,
                                  ),
                                  pw.Container(
                                    height: 35,
                                    width: 270,
                                    decoration: const pw.BoxDecoration(
                                        color: PdfColor.fromInt(0xfff3ded4),
                                        borderRadius: 6),
                                    child: pw.Text(
                                        '  Colour: ${meterreadingTanNotifier.meterreadingTanList.isNotEmpty ? meterreadingTanNotifier.meterreadingTanList.last.colour : ' NA'}',
                                        style: pw.TextStyle(
                                          font: alice,
                                          fontSize: 20,
                                        )),
                                  ),
                                  pw.SizedBox(
                                    width: 15,
                                  ),
                                  pw.Container(
                                    height: 35,
                                    width: 270,
                                    decoration: const pw.BoxDecoration(
                                        color: PdfColor.fromInt(0xfff3ded4),
                                        borderRadius: 6),
                                    child: pw.Text(
                                        '  Cleanliness: ${meterreadingTanNotifier.meterreadingTanList.isNotEmpty ? meterreadingTanNotifier.meterreadingTanList.last.condition : ' NA'}',
                                        style: pw.TextStyle(
                                          font: alice,
                                          fontSize: 20,
                                        )),
                                  ),
                                ])),
                          ),
                          pw.Container(
                            padding: pw.EdgeInsets.only(left: 20),
                            child: pw.Container(
                              decoration: pw.BoxDecoration(
                                color: PdfColor.fromInt(0xffffffff),
                              ),
                              width: 1145,
                              padding: pw.EdgeInsets.only(left: 8),
                              child: pw.Row(children: <pw.Widget>[
                                pw.SizedBox(
                                  width: 5,
                                ),
                                pw.Container(
                                  child: pw.Text(
                                    '  Description : ${meterreadingTanNotifier.meterreadingTanList.isNotEmpty ? meterreadingTanNotifier.meterreadingTanList.last.description : '  NA'}',
                                    style: pw.TextStyle(
                                      font: alice,
                                      fontSize: 20,
                                    ),
                                  ),
                                  width: 270,
                                  height: 630,
                                  decoration: pw.BoxDecoration(
                                      color: PdfColor.fromInt(0xfff3ded4)),
                                ),
                                pw.Container(
                                  height: 670,
                                  width: 870,
                                  child: pw.GridView(
                                    crossAxisCount: 2,
                                    childAspectRatio: 01.01,
                                    children: List<pw.Widget>.generate(
                                      meterImgTanNotify.meterImgTanList.length,
                                      (int n) {
                                        var imag = PdfImage.file(
                                          pdf.document,
                                          bytes: File(meterImgTanNotify
                                                  .meterImgTanList[n]
                                                  .imagemetertan
                                                  .path)
                                              .readAsBytesSync(),
                                        );
                                        return pw.Container(
                                            child: pw.Image(imag,
                                                height: 290,
                                                width: 400,
                                                fit: pw.BoxFit.cover));
                                      },
                                    ),
                                  ),
                                ),
                              ]),
                            ),
                          ),
                        ])),
              ]),
            ];
          },
        ));
      }
    }


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

    Future savePdf() async {
//      Directory documentDirectory = await getApplicationDocumentsDirectory();
      Directory documentDirectory = await getApplicationDocumentsDirectory();

      String documentPath = documentDirectory.path;
      final time = DateTime.now().millisecondsSinceEpoch;
      pdffilename = 'inven';

      File file = File("$documentPath/$pdffilename$time.pdf");
//    final time = DateTime.now().millisecondsSinceEpoch;

//    print(documentPath.toUpperCase());
//    File file = File("$documentPath/transaction$time.pdf");
      print(file);
//      print(exdata.length);
//      String formattedTime = DateFormat.Hm().format(now);
//   final output = await getTemporaryDirectory();
//   final file = File("${output.path}/example.pdf");
      file.writeAsBytesSync(pdf.save());
      print(file);
//       final ByteData bytes = await rootBundle.load(file.path);
//       await Share.file('Share your report', '$time.pdf', bytes.buffer.asUint8List(), '*/*');
//      Navigator.push(context,     MaterialPageRoute(builder: (context) => PdfViewer(path: file.path)));
//      SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
//      sharedPrefs.remove('addressp');
//      sharedPrefs.setString('addressp', file.path);

      var addressp = '$pdffilename$time';
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
              _buildtitle(),
              SizedBox(height: 55),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => DataExterior()));
                },
                child: _btnexterior(),
              ),
              SizedBox(
                height: 15,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => DataHallway()));
                },
                child: _btnhallway(),
              ),
              SizedBox(
                height: 15,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => DataSmote()));
                },
                child: _btnsmotedetect(),
              ),
              SizedBox(
                height: 15,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => DataKitchen()));
                },
                child: _btnkitchen(),
              ),
              SizedBox(
                height: 15,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => DataBedroom()));
                },
                child: _btnbedroom(),
              ),
              SizedBox(
                height: 15,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => DataKeys()));
                },
                child: _btnkeys(),
              ),
              SizedBox(
                height: 15,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => DataMeter()));
                },
                child: _btnmeter(),
              ),
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
                      Navigator.pop(context,
                          MaterialPageRoute(builder: (context) => AppHome()));

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
                      await writeOnPdfExterior();
                      await writeOnPdfHallway();
                      await writeOnPdfSmote();
                      await writeOnPdfKitchen();
                      await writeOnPdfBedroom();
                      await writeOnPdfChaabi();
                      await writeOnPdfMeter();

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
                                "END",
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