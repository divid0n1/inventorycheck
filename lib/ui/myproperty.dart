import 'dart:io';

import 'package:flutter/material.dart';
import 'package:inventorycheck/ui/apphome.dart';
import 'package:pdf_viewer_plugin/pdf_viewer_plugin.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyProperty extends StatefulWidget {
  @override
  _MyPropertyState createState() => _MyPropertyState();
}

class _MyPropertyState extends State<MyProperty> {

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
//var addressp;
//  @override
//  void initState()async {
//    super.initState();
//    SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
//    addressp = sharedPrefs.getString('addressp');
//  }

var  addressp ;
//  ImageProvider imageProvider;
@override
  void initState() {
    // TODO: implement initState
//  SharedPreferences sharedPrefs =  await SharedPreferences.getInstance();
//  addressp =  await sharedPrefs.getString('addressp');
//  print('${addressp}');
  getValues();
    super.initState();
  }

  getValues() async {

    SharedPreferences sharedPrefs =  await SharedPreferences.getInstance();
    setState(() {
      addressp = sharedPrefs.getString('addressp');
//      imageProvider = FileImage(File(addressp));
    });

    print('adress is: ${addressp}');

  }

  @override
  Widget build(BuildContext context) {
    return Container(        decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/bg.png"), fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
          appBar: PreferredSize(
            child: Container(),
            preferredSize: Size.fromHeight(0.0),
          ),
        body: Column(children: <Widget>[
          _buildtitle(),
          RaisedButton(child: Text('adfasd'),onPressed: () {
            setState(() async{

            });

          }
          ,),
//          Container(
//            decoration: BoxDecoration(
//                image: DecorationImage(
//                  image: imageProvider,
//                  fit: BoxFit.cover,
//                )),
//          ),

          Text('${addressp}'),
          Container(
            height: 300.0,
            child: PdfViewer (
//              filePath: '/data/user/0/com.inventorycheck.inventorycheck/app_flutter/inven1598531253815.pdf',
              filePath: addressp,
            ),),
        ],),
          floatingActionButton: Stack(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 31),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: FloatingActionButton(
                    heroTag: "introleft",
                    mini: true,
                    backgroundColor: Colors.deepPurpleAccent,
                    onPressed: () {
                      Navigator.pop(context, MaterialPageRoute(builder: (context) => AppHome()));
                    },
                    child: Icon(Icons.arrow_back_ios),
                    foregroundColor: Colors.white,
                  ),
                ),
              ),


            ],
          )
      ),






    );
  }
}
