import 'dart:io';

import 'package:flutter/material.dart';
import 'package:inventorycheck/ui/apphome.dart';
import 'package:inventorycheck/ui/pdfviewer.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf_viewer_plugin/pdf_viewer_plugin.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyProperty extends StatelessWidget {

  final pdfpath;
  MyProperty({this.pdfpath});

  Widget _buildtitle() {
    return Container(
        padding: EdgeInsets.only(top: 40),
        child: Center(
          child: Text(
            "Check Inventory",
            style: TextStyle(
              fontFamily: 'herrvon',
              fontSize: 60,
            ),
          ),
        ));
  }





  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/bg.png"), fit: BoxFit.cover)),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: PreferredSize(
            child: Container(),
            preferredSize: Size.fromHeight(0.0),
          ),
          body: Column(
            children: <Widget>[
              _buildtitle(),
              Container(
                height: 300,
                child:PdfViewer(
//                filePath: '${completePath}',
                  filePath: pdfpath,
                ),
              ),],
          ),
          floatingActionButton: Stack(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 31),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: FloatingActionButton(
                    heroTag: "introleft",
                    mini: true,
                    backgroundColor: Color(0xff684c4c),
                    onPressed: () {
                      Navigator.pop(context,
                          MaterialPageRoute(builder: (context) => AppHome()));
                    },
                    child: Icon(Icons.arrow_back_ios),
                    foregroundColor: Colors.white,
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
