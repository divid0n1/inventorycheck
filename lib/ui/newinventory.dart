import 'dart:io';
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

class NewInventory extends StatelessWidget {

  Widget _buildtitle (){
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

  Widget _btnexterior(){
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
      child: Center(child: Text("Exterior", style: TextStyle(
        color: Colors.black, fontFamily: 'alice', fontSize: 25,),)),
    );
  }

  Widget _btnhallway(){
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
      child: Center(child: Text("Hallway", style: TextStyle(
        color: Colors.black, fontFamily: 'alice', fontSize: 25,),)),
    );
  }

  Widget _btnsmotedetect(){
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
      child: Center(child: Text("Ceiling", style: TextStyle(
        color: Colors.black, fontFamily: 'alice', fontSize: 25,),)),
    );
  }

  Widget _btnkitchen(){
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
      child: Center(child: Text("Kitchen", style: TextStyle(
        color: Colors.black, fontFamily: 'alice', fontSize: 25,),)),
    );
  }

  Widget _btnbedroom(){
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
      child: Center(child: Text("Bedroom 1", style: TextStyle(
        color: Colors.black, fontFamily: 'alice', fontSize: 25,),)),
    );
  }

  Widget _btnkeys(){
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
      child: Center(child: Text("Keys", style: TextStyle(
        color: Colors.black, fontFamily: 'alice', fontSize: 25,),)),
    );
  }

  Widget _btnmeter(){
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
      child: Center(child: Text("Meter readings", style: TextStyle(
        color: Colors.black, fontFamily: 'alice', fontSize: 25,),)),
    );
  }


  final pdf = pw.Document();

  var pdffilename ;



  @override
  Widget build(BuildContext context) {
    ExteriorNotifier exteriorNotifier = Provider.of<ExteriorNotifier>(context);
    HallwayNotifier hallwayNotifier = Provider.of<HallwayNotifier>(context);
    SmoteNotifier smoteNotifier = Provider.of<SmoteNotifier>(context);
    KitchenNotifier kitchenNotifier = Provider.of<KitchenNotifier>(context);
    BedroomNotifier bedroomNotifier = Provider.of<BedroomNotifier>(context);
    ChaabiNotifier chaabiNotifier = Provider.of<ChaabiNotifier>(context);
    MeterreadingNotifier meterreadingNotifier = Provider.of<MeterreadingNotifier>(context);

    ExteriorImgNotifier exteriorImgNotifier = Provider.of<ExteriorImgNotifier>(context);
    HallwayImgNotify hallwayImgNotify = Provider.of<HallwayImgNotify>(context);
    SmoteImgNotify smoteImgNotify = Provider.of<SmoteImgNotify>(context);
    KitchenImgNotify kitchenImgNotify = Provider.of<KitchenImgNotify>(context);
    BedroomImgNotify bedroomImgNotify = Provider.of<BedroomImgNotify>(context);
    ChaabiImgNotify chaabiImgNotify = Provider.of<ChaabiImgNotify>(context);
    MeterImgNotify meterImgNotify = Provider.of<MeterImgNotify>(context);


    ExteriorTanNotifier exteriorTanNotifier = Provider.of<ExteriorTanNotifier>(context);
    HallwayTanNotifier hallwayTanNotifier = Provider.of<HallwayTanNotifier>(context);
    SmoteTanNotifier smoteTanNotifier = Provider.of<SmoteTanNotifier>(context);
    KitchenTanNotifier kitchenTanNotifier = Provider.of<KitchenTanNotifier>(context);
    BedroomTanNotifier bedroomTanNotifier = Provider.of<BedroomTanNotifier>(context);
    ChaabiTanNotifier chaabiTanNotifier = Provider.of<ChaabiTanNotifier>(context);
    MeterreadingTanNotifier meterreadingTanNotifier = Provider.of<MeterreadingTanNotifier>(context);


    ExteriorImgTanNotifier exteriorImgTanNotifier = Provider.of<ExteriorImgTanNotifier>(context);
    HallwayImgTanNotify hallwayImgTanNotify = Provider.of<HallwayImgTanNotify>(context);
    SmoteImgTanNotify smoteImgTanNotify = Provider.of<SmoteImgTanNotify>(context);
    KitchenImgTanNotify kitchenImgTanNotify = Provider.of<KitchenImgTanNotify>(context);
    BedroomImgTanNotify bedroomImgTanNotify = Provider.of<BedroomImgTanNotify>(context);
    ChaabiImgTanNotify chaabiImgTanNotify = Provider.of<ChaabiImgTanNotify>(context);
    MeterImgTanNotify meterImgTanNotify = Provider.of<MeterImgTanNotify>(context);

    writeOnPdfExterior() async{
        if(exteriorNotifier.exteriorList.isNotEmpty){
      var pwtheme = pw.Theme.withFont(
        base: pw.Font.ttf(await rootBundle.load("assets/arimo.ttf")),
      );

      pdf.addPage(pw.MultiPage(
        theme: pwtheme,
        pageFormat: PdfPageFormat.a5,
        margin: pw.EdgeInsets.all(5),
        build: (pw.Context context) {
          return <pw.Widget>[
            pw.Header(level:0, child: pw.Text('Exterior Summary PDF: ${pdffilename}')),
            pw.Text('Description: ${exteriorNotifier.exteriorList.last.description}',style:pw.TextStyle(fontSize: 18,) ,),
            pw.Text('Quantity: ${exteriorNotifier.exteriorList.last.quantity}',style:pw.TextStyle(fontSize: 18,) ,),
            pw.Text('Colour: ${exteriorNotifier.exteriorList.last.colour}',style:pw.TextStyle(fontSize: 18,) ,),
            pw.Text('Condition: ${exteriorNotifier.exteriorList.last.condition}',style:pw.TextStyle(fontSize: 18,) ,),
            pw.Container(height: 50,width: 100,),
          ];
        },
      )
      );}
        if (exteriorImgNotifier.exteriorImgList.isNotEmpty){

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

        }
        if(exteriorTanNotifier.exteriortanList.isNotEmpty){
          var pwtheme = pw.Theme.withFont(
            base: pw.Font.ttf(await rootBundle.load("assets/arimo.ttf")),
          );

          pdf.addPage(pw.MultiPage(
            theme: pwtheme,
            pageFormat: PdfPageFormat.a5,
            margin: pw.EdgeInsets.all(5),
            build: (pw.Context context) {
              return <pw.Widget>[
                pw.Header(level:0, child: pw.Text('Exterior Summary PDF: ${pdffilename}')),
                pw.Text('Description: ${exteriorTanNotifier.exteriortanList.last.description}',style:pw.TextStyle(fontSize: 18,) ,),
                pw.Text('Quantity: ${exteriorTanNotifier.exteriortanList.last.quantity}',style:pw.TextStyle(fontSize: 18,) ,),
                pw.Text('Colour: ${exteriorTanNotifier.exteriortanList.last.colour}',style:pw.TextStyle(fontSize: 18,) ,),
                pw.Text('Condition: ${exteriorTanNotifier.exteriortanList.last.condition}',style:pw.TextStyle(fontSize: 18,) ,),
                pw.Container(height: 50,width: 100,),
              ];
            },
          )
          );}
        if (exteriorImgTanNotifier.exteriorImgTanList.isNotEmpty){

          int i=0;
          while(i < exteriorImgTanNotifier.exteriorImgTanList.length){
            var imag = PdfImage.file(
              pdf.document,
              bytes: File(exteriorImgTanNotifier.exteriorImgTanList[i].imagesfloortan.path).readAsBytesSync(),
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

        }
    }
    writeOnPdfHallway() async{
      if(hallwayNotifier.hallwayList.isNotEmpty){
        var pwtheme = pw.Theme.withFont(
          base: pw.Font.ttf(await rootBundle.load("assets/arimo.ttf")),
        );

        pdf.addPage(pw.MultiPage(
          theme: pwtheme,
          pageFormat: PdfPageFormat.a5,
          margin: pw.EdgeInsets.all(5),
          build: (pw.Context context) {
            return <pw.Widget>[
              pw.Header(level:0, child: pw.Text('Hallway Summary PDF: ${pdffilename}')),
              pw.Text('Description: ${hallwayNotifier.hallwayList.last.description}',style:pw.TextStyle(fontSize: 18,) ,),
              pw.Text('Quantity: ${hallwayNotifier.hallwayList.last.quantity}',style:pw.TextStyle(fontSize: 18,) ,),
              pw.Text('Colour: ${hallwayNotifier.hallwayList.last.colour}',style:pw.TextStyle(fontSize: 18,) ,),
              pw.Text('Condition: ${hallwayNotifier.hallwayList.last.condition}',style:pw.TextStyle(fontSize: 18,) ,),
              pw.Container(height: 50,width: 100,),
            ];
          },
        )
        );}
      if (hallwayImgNotify.hallwayImgList.isNotEmpty){

        int i=0;
        while(i < hallwayImgNotify.hallwayImgList.length){
          var imag = PdfImage.file(
            pdf.document,
            bytes: File(hallwayImgNotify.hallwayImgList[i].imagehallway.path).readAsBytesSync(),
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
                pw.Header(level: 0, child: pw.Text("Hallway Images")),
                pw.Container(height: 700,width: 600,
                  child: pw.Image(imag),),
              ];
            },
          ));
        }

      }
      if(hallwayTanNotifier.hallwayTanList.isNotEmpty){
        var pwtheme = pw.Theme.withFont(
          base: pw.Font.ttf(await rootBundle.load("assets/arimo.ttf")),
        );

        pdf.addPage(pw.MultiPage(
          theme: pwtheme,
          pageFormat: PdfPageFormat.a5,
          margin: pw.EdgeInsets.all(5),
          build: (pw.Context context) {
            return <pw.Widget>[
              pw.Header(level:0, child: pw.Text('Hallway Summary PDF: ${pdffilename}')),
              pw.Text('Description: ${hallwayTanNotifier.hallwayTanList.last.description}',style:pw.TextStyle(fontSize: 18,) ,),
              pw.Text('Quantity: ${hallwayTanNotifier.hallwayTanList.last.quantity}',style:pw.TextStyle(fontSize: 18,) ,),
              pw.Text('Colour: ${hallwayTanNotifier.hallwayTanList.last.colour}',style:pw.TextStyle(fontSize: 18,) ,),
              pw.Text('Condition: ${hallwayTanNotifier.hallwayTanList.last.condition}',style:pw.TextStyle(fontSize: 18,) ,),
              pw.Container(height: 50,width: 100,),
            ];
          },
        )
        );}
      if (hallwayImgTanNotify.hallwayImgTanList.isNotEmpty){

        int i=0;
        while(i < hallwayImgTanNotify.hallwayImgTanList.length){
          var imag = PdfImage.file(
            pdf.document,
            bytes: File(hallwayImgTanNotify.hallwayImgTanList[i].imagehallwaytan.path).readAsBytesSync(),
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
                pw.Header(level: 0, child: pw.Text("Hallway Images")),
                pw.Container(height: 700,width: 600,
                  child: pw.Image(imag),),
              ];
            },
          ));
        }

      }
    }
    writeOnPdfSmote() async{
      if(smoteNotifier.smoteList.isNotEmpty){
        var pwtheme = pw.Theme.withFont(
          base: pw.Font.ttf(await rootBundle.load("assets/arimo.ttf")),
        );

        pdf.addPage(pw.MultiPage(
          theme: pwtheme,
          pageFormat: PdfPageFormat.a5,
          margin: pw.EdgeInsets.all(5),
          build: (pw.Context context) {
            return <pw.Widget>[
              pw.Header(level:0, child: pw.Text('Ceiling Summary PDF: ${pdffilename}')),
              pw.Text('Description: ${smoteNotifier.smoteList.last.description}',style:pw.TextStyle(fontSize: 18,) ,),
              pw.Text('Quantity: ${smoteNotifier.smoteList.last.quantity}',style:pw.TextStyle(fontSize: 18,) ,),
              pw.Text('Colour: ${smoteNotifier.smoteList.last.colour}',style:pw.TextStyle(fontSize: 18,) ,),
              pw.Text('Condition: ${smoteNotifier.smoteList.last.condition}',style:pw.TextStyle(fontSize: 18,) ,),
              pw.Container(height: 50,width: 100,),
            ];
          },
        )
        );}
      if (smoteImgNotify.smoteImgList.isNotEmpty){

        int i=0;
        while(i < smoteImgNotify.smoteImgList.length){
          var imag = PdfImage.file(
            pdf.document,
            bytes: File(smoteImgNotify.smoteImgList[i].imagessmote.path).readAsBytesSync(),
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
                pw.Header(level: 0, child: pw.Text("Ceiling Images")),
                pw.Container(height: 700,width: 600,
                  child: pw.Image(imag),),
              ];
            },
          ));
        }

      }
      if(smoteTanNotifier.smoteTanList.isNotEmpty){
        var pwtheme = pw.Theme.withFont(
          base: pw.Font.ttf(await rootBundle.load("assets/arimo.ttf")),
        );

        pdf.addPage(pw.MultiPage(
          theme: pwtheme,
          pageFormat: PdfPageFormat.a5,
          margin: pw.EdgeInsets.all(5),
          build: (pw.Context context) {
            return <pw.Widget>[
              pw.Header(level:0, child: pw.Text('Ceiling Summary PDF: ${pdffilename}')),
              pw.Text('Description: ${smoteTanNotifier.smoteTanList.last.description}',style:pw.TextStyle(fontSize: 18,) ,),
              pw.Text('Quantity: ${smoteTanNotifier.smoteTanList.last.quantity}',style:pw.TextStyle(fontSize: 18,) ,),
              pw.Text('Colour: ${smoteTanNotifier.smoteTanList.last.colour}',style:pw.TextStyle(fontSize: 18,) ,),
              pw.Text('Condition: ${smoteTanNotifier.smoteTanList.last.condition}',style:pw.TextStyle(fontSize: 18,) ,),
              pw.Container(height: 50,width: 100,),
            ];
          },
        )
        );}
      if (smoteImgTanNotify.smoteImgTanList.isNotEmpty){

        int i=0;
        while(i < smoteImgTanNotify.smoteImgTanList.length){
          var imag = PdfImage.file(
            pdf.document,
            bytes: File(smoteImgTanNotify.smoteImgTanList[i].imagessmotetan.path).readAsBytesSync(),
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
                pw.Header(level: 0, child: pw.Text("Ceiling Images")),
                pw.Container(height: 700,width: 600,
                  child: pw.Image(imag),),
              ];
            },
          ));
        }

      }
    }
    writeOnPdfKitchen() async{
      if(kitchenNotifier.kitchenList.isNotEmpty){
        var pwtheme = pw.Theme.withFont(
          base: pw.Font.ttf(await rootBundle.load("assets/arimo.ttf")),
        );

        pdf.addPage(pw.MultiPage(
          theme: pwtheme,
          pageFormat: PdfPageFormat.a5,
          margin: pw.EdgeInsets.all(5),
          build: (pw.Context context) {
            return <pw.Widget>[
              pw.Header(level:0, child: pw.Text('Kitchen Summary PDF: ${pdffilename}')),
              pw.Text('Description: ${kitchenNotifier.kitchenList.last.description}',style:pw.TextStyle(fontSize: 18,) ,),
              pw.Text('Quantity: ${kitchenNotifier.kitchenList.last.quantity}',style:pw.TextStyle(fontSize: 18,) ,),
              pw.Text('Colour: ${kitchenNotifier.kitchenList.last.colour}',style:pw.TextStyle(fontSize: 18,) ,),
              pw.Text('Condition: ${kitchenNotifier.kitchenList.last.condition}',style:pw.TextStyle(fontSize: 18,) ,),
              pw.Container(height: 50,width: 100,),
            ];
          },
        )
        );}
      if (kitchenImgNotify.kitchenImgList.isNotEmpty){

        int i=0;
        while(i < kitchenImgNotify.kitchenImgList.length){
          var imag = PdfImage.file(
            pdf.document,
            bytes: File(kitchenImgNotify.kitchenImgList[i].imagekitchen.path).readAsBytesSync(),
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
                pw.Header(level: 0, child: pw.Text("Kitchen Images")),
                pw.Container(height: 700,width: 600,
                  child: pw.Image(imag),),
              ];
            },
          ));
        }

      }
      if(kitchenTanNotifier.kitchenTanList.isNotEmpty){
        var pwtheme = pw.Theme.withFont(
          base: pw.Font.ttf(await rootBundle.load("assets/arimo.ttf")),
        );

        pdf.addPage(pw.MultiPage(
          theme: pwtheme,
          pageFormat: PdfPageFormat.a5,
          margin: pw.EdgeInsets.all(5),
          build: (pw.Context context) {
            return <pw.Widget>[
              pw.Header(level:0, child: pw.Text('Kitchen Summary PDF: ${pdffilename}')),
              pw.Text('Description: ${kitchenTanNotifier.kitchenTanList.last.description}',style:pw.TextStyle(fontSize: 18,) ,),
              pw.Text('Quantity: ${kitchenTanNotifier.kitchenTanList.last.quantity}',style:pw.TextStyle(fontSize: 18,) ,),
              pw.Text('Colour: ${kitchenTanNotifier.kitchenTanList.last.colour}',style:pw.TextStyle(fontSize: 18,) ,),
              pw.Text('Condition: ${kitchenTanNotifier.kitchenTanList.last.condition}',style:pw.TextStyle(fontSize: 18,) ,),
              pw.Container(height: 50,width: 100,),
            ];
          },
        )
        );}
      if (kitchenImgTanNotify.kitchenImgTanList.isNotEmpty){

        int i=0;
        while(i < kitchenImgTanNotify.kitchenImgTanList.length){
          var imag = PdfImage.file(
            pdf.document,
            bytes: File(kitchenImgTanNotify.kitchenImgTanList[i].imagekitchentan.path).readAsBytesSync(),
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
                pw.Header(level: 0, child: pw.Text("Kitchen Images")),
                pw.Container(height: 700,width: 600,
                  child: pw.Image(imag),),
              ];
            },
          ));
        }

      }
    }
    writeOnPdfBedroom() async{
      if(bedroomNotifier.bedroomList.isNotEmpty){
        var pwtheme = pw.Theme.withFont(
          base: pw.Font.ttf(await rootBundle.load("assets/arimo.ttf")),
        );

        pdf.addPage(pw.MultiPage(
          theme: pwtheme,
          pageFormat: PdfPageFormat.a5,
          margin: pw.EdgeInsets.all(5),
          build: (pw.Context context) {
            return <pw.Widget>[
              pw.Header(level:0, child: pw.Text('Bedroom Summary PDF: ${pdffilename}')),
              pw.Text('Description: ${bedroomNotifier.bedroomList.last.description}',style:pw.TextStyle(fontSize: 18,) ,),
              pw.Text('Quantity: ${bedroomNotifier.bedroomList.last.quantity}',style:pw.TextStyle(fontSize: 18,) ,),
              pw.Text('Colour: ${bedroomNotifier.bedroomList.last.colour}',style:pw.TextStyle(fontSize: 18,) ,),
              pw.Text('Condition: ${bedroomNotifier.bedroomList.last.condition}',style:pw.TextStyle(fontSize: 18,) ,),
              pw.Container(height: 50,width: 100,),
            ];
          },
        )
        );}
      if (bedroomImgNotify.bedroomImgList.isNotEmpty){

        int i=0;
        while(i < bedroomImgNotify.bedroomImgList.length){
          var imag = PdfImage.file(
            pdf.document,
            bytes: File(bedroomImgNotify.bedroomImgList[i].imagebedroom.path).readAsBytesSync(),
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
                pw.Header(level: 0, child: pw.Text("Bedroom Images")),
                pw.Container(height: 700,width: 600,
                  child: pw.Image(imag),),
              ];
            },
          ));
        }

      }
      if(bedroomTanNotifier.bedroomTanList.isNotEmpty){
        var pwtheme = pw.Theme.withFont(
          base: pw.Font.ttf(await rootBundle.load("assets/arimo.ttf")),
        );

        pdf.addPage(pw.MultiPage(
          theme: pwtheme,
          pageFormat: PdfPageFormat.a5,
          margin: pw.EdgeInsets.all(5),
          build: (pw.Context context) {
            return <pw.Widget>[
              pw.Header(level:0, child: pw.Text('Bedroom Summary PDF: ${pdffilename}')),
              pw.Text('Description: ${bedroomTanNotifier.bedroomTanList.last.description}',style:pw.TextStyle(fontSize: 18,) ,),
              pw.Text('Quantity: ${bedroomTanNotifier.bedroomTanList.last.quantity}',style:pw.TextStyle(fontSize: 18,) ,),
              pw.Text('Colour: ${bedroomTanNotifier.bedroomTanList.last.colour}',style:pw.TextStyle(fontSize: 18,) ,),
              pw.Text('Condition: ${bedroomTanNotifier.bedroomTanList.last.condition}',style:pw.TextStyle(fontSize: 18,) ,),
              pw.Container(height: 50,width: 100,),
            ];
          },
        )
        );}
      if (bedroomImgTanNotify.bedroomImgTanList.isNotEmpty){

        int i=0;
        while(i < bedroomImgTanNotify.bedroomImgTanList.length){
          var imag = PdfImage.file(
            pdf.document,
            bytes: File(bedroomImgTanNotify.bedroomImgTanList[i].imagebedroomtan.path).readAsBytesSync(),
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
                pw.Header(level: 0, child: pw.Text("Bedroom Images")),
                pw.Container(height: 700,width: 600,
                  child: pw.Image(imag),),
              ];
            },
          ));
        }

      }
    }
    writeOnPdfChaabi() async{
      if(chaabiNotifier.chaabiList.isNotEmpty){
        var pwtheme = pw.Theme.withFont(
          base: pw.Font.ttf(await rootBundle.load("assets/arimo.ttf")),
        );

        pdf.addPage(pw.MultiPage(
          theme: pwtheme,
          pageFormat: PdfPageFormat.a5,
          margin: pw.EdgeInsets.all(5),
          build: (pw.Context context) {
            return <pw.Widget>[
              pw.Header(level:0, child: pw.Text('Keys Summary PDF: ${pdffilename}')),
              pw.Text('Description: ${chaabiNotifier.chaabiList.last.description}',style:pw.TextStyle(fontSize: 18,) ,),
              pw.Text('Quantity: ${chaabiNotifier.chaabiList.last.quantity}',style:pw.TextStyle(fontSize: 18,) ,),
              pw.Text('Colour: ${chaabiNotifier.chaabiList.last.colour}',style:pw.TextStyle(fontSize: 18,) ,),
              pw.Text('Condition: ${chaabiNotifier.chaabiList.last.condition}',style:pw.TextStyle(fontSize: 18,) ,),
              pw.Container(height: 50,width: 100,),
            ];
          },
        )
        );}
      if (chaabiImgNotify.chaabiImgList.isNotEmpty){

        int i=0;
        while(i < chaabiImgNotify.chaabiImgList.length){
          var imag = PdfImage.file(
            pdf.document,
            bytes: File(chaabiImgNotify.chaabiImgList[i].imagechaabi.path).readAsBytesSync(),
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
                pw.Header(level: 0, child: pw.Text("Keys Images")),
                pw.Container(height: 700,width: 600,
                  child: pw.Image(imag),),
              ];
            },
          ));
        }

      }
      if(chaabiTanNotifier.chaabiTanList.isNotEmpty){
        var pwtheme = pw.Theme.withFont(
          base: pw.Font.ttf(await rootBundle.load("assets/arimo.ttf")),
        );

        pdf.addPage(pw.MultiPage(
          theme: pwtheme,
          pageFormat: PdfPageFormat.a5,
          margin: pw.EdgeInsets.all(5),
          build: (pw.Context context) {
            return <pw.Widget>[
              pw.Header(level:0, child: pw.Text('Keys Summary PDF: ${pdffilename}')),
              pw.Text('Description: ${chaabiTanNotifier.chaabiTanList.last.description}',style:pw.TextStyle(fontSize: 18,) ,),
              pw.Text('Quantity: ${chaabiTanNotifier.chaabiTanList.last.quantity}',style:pw.TextStyle(fontSize: 18,) ,),
              pw.Text('Colour: ${chaabiTanNotifier.chaabiTanList.last.colour}',style:pw.TextStyle(fontSize: 18,) ,),
              pw.Text('Condition: ${chaabiTanNotifier.chaabiTanList.last.condition}',style:pw.TextStyle(fontSize: 18,) ,),
              pw.Container(height: 50,width: 100,),
            ];
          },
        )
        );}
      if (chaabiImgTanNotify.chaabiImgTanList.isNotEmpty){

        int i=0;
        while(i < chaabiImgTanNotify.chaabiImgTanList.length){
          var imag = PdfImage.file(
            pdf.document,
            bytes: File(chaabiImgTanNotify.chaabiImgTanList[i].imagechaabitan.path).readAsBytesSync(),
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

      }
    }
    writeOnPdfMeter() async{
      if(meterreadingNotifier.meterreadingList.isNotEmpty){
        var pwtheme = pw.Theme.withFont(
          base: pw.Font.ttf(await rootBundle.load("assets/arimo.ttf")),
        );

        pdf.addPage(pw.MultiPage(
          theme: pwtheme,
          pageFormat: PdfPageFormat.a5,
          margin: pw.EdgeInsets.all(5),
          build: (pw.Context context) {
            return <pw.Widget>[
              pw.Header(level:0, child: pw.Text('Meter Summary PDF: ${pdffilename}')),
              pw.Text('Description: ${meterreadingNotifier.meterreadingList.last.description}',style:pw.TextStyle(fontSize: 18,) ,),
              pw.Text('Quantity: ${meterreadingNotifier.meterreadingList.last.quantity}',style:pw.TextStyle(fontSize: 18,) ,),
              pw.Text('Colour: ${meterreadingNotifier.meterreadingList.last.colour}',style:pw.TextStyle(fontSize: 18,) ,),
              pw.Text('Condition: ${meterreadingNotifier.meterreadingList.last.condition}',style:pw.TextStyle(fontSize: 18,) ,),
              pw.Container(height: 50,width: 100,),
            ];
          },
        )
        );}
      if (meterImgNotify.meterImgList.isNotEmpty){

        int i=0;
        while(i < meterImgNotify.meterImgList.length){
          var imag = PdfImage.file(
            pdf.document,
            bytes: File(meterImgNotify.meterImgList[i].imagemeter.path).readAsBytesSync(),
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
                pw.Header(level: 0, child: pw.Text("Meter Images")),
                pw.Container(height: 700,width: 600,
                  child: pw.Image(imag),),
              ];
            },
          ));
        }

      }
      if(meterreadingTanNotifier.meterreadingTanList.isNotEmpty){
        var pwtheme = pw.Theme.withFont(
          base: pw.Font.ttf(await rootBundle.load("assets/arimo.ttf")),
        );

        pdf.addPage(pw.MultiPage(
          theme: pwtheme,
          pageFormat: PdfPageFormat.a5,
          margin: pw.EdgeInsets.all(5),
          build: (pw.Context context) {
            return <pw.Widget>[
              pw.Header(level:0, child: pw.Text('Meter Summary PDF: ${pdffilename}')),
              pw.Text('Description: ${meterreadingTanNotifier.meterreadingTanList.last.description}',style:pw.TextStyle(fontSize: 18,) ,),
              pw.Text('Quantity: ${meterreadingTanNotifier.meterreadingTanList.last.quantity}',style:pw.TextStyle(fontSize: 18,) ,),
              pw.Text('Colour: ${meterreadingTanNotifier.meterreadingTanList.last.colour}',style:pw.TextStyle(fontSize: 18,) ,),
              pw.Text('Condition: ${meterreadingTanNotifier.meterreadingTanList.last.condition}',style:pw.TextStyle(fontSize: 18,) ,),
              pw.Container(height: 50,width: 100,),
            ];
          },
        )
        );}
      if (meterImgTanNotify.meterImgTanList.isNotEmpty){

        int i=0;
        while(i < meterImgTanNotify.meterImgTanList.length){
          var imag = PdfImage.file(
            pdf.document,
            bytes: File(meterImgTanNotify.meterImgTanList[i].imagemetertan.path).readAsBytesSync(),
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
                pw.Header(level: 0, child: pw.Text("Meter Images")),
                pw.Container(height: 700,width: 600,
                  child: pw.Image(imag),),
              ];
            },
          ));
        }

      }
    }



    //for var in ..........
/*
    writeOnPdfExterior() async{

      if (exteriorImgNotifier.exteriorImgList.isNotEmpty){




          var myTheme = pw.Theme.withFont(
            base: pw.Font.ttf(await rootBundle.load("assets/arimo.ttf")),
          );
          for( var imagesfloor in  exteriorImgNotifier.exteriorImgList){
            pdf.addPage(

              pw.MultiPage(

            theme: myTheme,
            pageFormat: PdfPageFormat.a5,
            margin: pw.EdgeInsets.all(32),

            build: (pw.Context context) {

              return
                <pw.Widget>[
                pw.Header(level: 0, child: pw.Text("Exterio Images")),

                  pw.Container(height: 200,width: 200,
                  child:

                  pw.Image(PdfImage.file( pdf.document, bytes: File(imagesfloor.imagesfloor.path).readAsBytesSync(),)),),
              ];
            },
          ));


      }}
    }
*/


// Originial work invid

    writeOnPdfAddPage() async{

      var pwtheme = pw.Theme.withFont(
        base: pw.Font.ttf(await rootBundle.load("assets/arimo.ttf")),
      );

      pdf.addPage(pw.MultiPage(
        theme: pwtheme,
        pageFormat: PdfPageFormat.a5,
        margin: pw.EdgeInsets.all(5),
        build: (pw.Context context) {
          return <pw.Widget>[
            pw.Header(level:0, child: pw.Text('CheckInventory PDF: ${pdffilename}')),
            pw.Text('Description: ${exteriorNotifier.exteriorList.last.description}',style:pw.TextStyle(fontSize: 18,) ,),
            pw.Text('Quantity: ${exteriorNotifier.exteriorList.last.quantity}',style:pw.TextStyle(fontSize: 18,) ,),
            pw.Text('Colour: ${exteriorNotifier.exteriorList.last.colour}',style:pw.TextStyle(fontSize: 18,) ,),
            pw.Text('Condition: ${exteriorNotifier.exteriorList.last.condition}',style:pw.TextStyle(fontSize: 18,) ,),
            pw.Container(height: 50,width: 100,),
            pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              crossAxisAlignment: pw.CrossAxisAlignment.center,
              children: <pw.Widget>[
                pw.SizedBox(height: 100,),
//                pw.Container(height: 200, width: 200,
//                  child:
//                  pw.Image(
//          PdfImage.file(pdf.document, bytes: (exteriorImgNotifier.exteriorImgList.elementAt(0).imagesfloor).readAsBytesSync(),),height: 230,width: 230,fit: pw.BoxFit.contain,),
//                    ),


//                  pw.Image(
//                      PdfImage.file(pdf.document, bytes: (exteriorImgNotifier.exteriorImgList.elementAt(1).imagesfloor).readAsBytesSync(),),height: 230,width: 230,fit: pw.BoxFit.contain,),

              ]
            ),
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
/*

    writeOnPdfAddImage() async{

        for (var i = 0; i < exteriorImgNotifier.exteriorImgList.length; i++) {
          var imag = PdfImage.file(
            pdf.document,
            bytes: File(exteriorImgNotifier.exteriorImgList[i].imagesfloor.path).readAsBytesSync(),
          );

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
                pw.Container(child:
                pw.Image(imag),),
              ];
            },
          ));
        }


    }
*/
    writeOnPdfAddImage() async{

//      for (var i = 0; i < exteriorImgNotifier.exteriorImgList.length; i++)
//      {
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
              pw.Header(level: 0, child: pw.Text("new pdf Title")),
              pw.Container(height: 200,width: 200,
                child: pw.Image(imag),),
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
//      Navigator.push(context, MaterialPageRoute(builder: (context) => PdfViewer(path: "$documentPath/$pdffilename.pdf")));
                      final ByteData bytes = await rootBundle.load(file.path);
                            await Share.file('Share your report', '$time.pdf', bytes.buffer.asUint8List(), '*/*');


    }

    pdfview()async{
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


    return  Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/bg.png"), fit: BoxFit.cover)),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            children: <Widget>[
              _buildtitle(),
              SizedBox(height: 75),
              InkWell(onTap: (){

                Navigator.push(context, MaterialPageRoute(builder: (context) => DataExterior()));
              },
                child: _btnexterior(),),
              SizedBox(height: 15,),
              InkWell(onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => DataHallway()));
              },child: _btnhallway(),),
              SizedBox(height: 15,),
              InkWell(onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => DataSmote()));
              },child:_btnsmotedetect(),),
              SizedBox(height: 15,),
              InkWell(onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => DataKitchen()));
              },child:  _btnkitchen(),),
              SizedBox(height: 15,),
              InkWell(onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => DataBedroom()));
              },child: _btnbedroom(),),
              SizedBox(height: 15,),
              InkWell(onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => DataKeys()));
              },child: _btnkeys(),),
              SizedBox(height: 15,),
              InkWell(onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => DataMeter()));
              },child:  _btnmeter(),),
            ],
          ),

            floatingActionButton: Stack(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 31),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: FloatingActionButton(
                      heroTag: "exleft",
                      mini: true,
                      backgroundColor: Colors.deepPurpleAccent,
                      onPressed: () {
                        Navigator.pop(context, MaterialPageRoute(builder: (context) => AppHome()));

//                        Navigator.of(context).pushNamed('/newInventroy');
//                          Navigator.of(context).pushNamed('/newInventroy');
//                        print(images.length);
                      },
                      child: Icon(Icons.arrow_back_ios),
                      foregroundColor: Colors.white,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 15),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: InkWell(
                      onTap: () async {

                        await writeOnPdfExterior();
                        await writeOnPdfHallway();
                        await  writeOnPdfSmote();
                        await  writeOnPdfKitchen();
                        await   writeOnPdfBedroom();
                        await   writeOnPdfChaabi();
                        await    writeOnPdfMeter();
//                        _Block(title: 'Tour bus driver');
                        await savePdf();
                        await pdfview();
                      },
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/savebtn.png"),
                            )),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: FloatingActionButton(

                    heroTag: "exnext",
                    mini: true,
                    backgroundColor: Colors.deepPurpleAccent,
                    onPressed: ()  {
//                      Navigator.pop(context, MaterialPageRoute(builder: (context) => TodosScreen()));
                    },
                    foregroundColor: Colors.white,
                    child: Icon(Icons.plus_one),
                  ),
                ),
              ],
            ),
        ));
  }
}
/*
class _Block extends pw.StatelessWidget {
  _Block({this.title});

  final String title;

  @override
  pw.Widget build(pw.Context context) {
    return pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: <pw.Widget>[
          pw.Row(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: <pw.Widget>[
                pw.Container(
                  width: 6,
                  height: 6,
                  margin: const pw.EdgeInsets.only(top: 2.5, left: 2, right: 5),
                  decoration: const pw.BoxDecoration(
                      shape: pw.BoxShape.circle),
                ),
                pw.Text(title,
                    style: pw.Theme.of(context)
                        .defaultTextStyle
                        .copyWith(fontWeight: pw.FontWeight.bold)),
              ]),
          pw.Container(
            decoration: const pw.BoxDecoration(
                border: pw.BoxBorder(left: true, width: 2)),
            padding: const pw.EdgeInsets.only(left: 10, top: 5, bottom: 5),
            margin: const pw.EdgeInsets.only(left: 5),
            child: pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: <pw.Widget>[
                  pw.Lorem(length: 20),
                ]),
          ),
        ]);
  }
}

 */