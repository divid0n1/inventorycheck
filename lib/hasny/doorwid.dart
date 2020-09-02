import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:inventorycheck/notify/textnotifier.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:provider/provider.dart';
import 'package:inventorycheck/notify/imagesnotifier.dart';




class maani extends StatelessWidget {
  final pdf = pw.Document();





  @override
  Widget build(BuildContext context) {
    writeOnPdfCover() async {
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


                        ]),
                  ),
                )
              ]),


            ];
          },
        ));
      }


    }

    return Container();


  }
}
