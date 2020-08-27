/*
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:image_picker/image_picker.dart';
import 'package:inventorycheck/model/imagedata.dart';
import 'package:inventorycheck/model/textdata.dart';
import 'package:inventorycheck/notify/imagesnotifier.dart';
import 'package:inventorycheck/notify/textnotifier.dart';
import 'package:inventorycheck/ui/apphome.dart';
import 'package:inventorycheck/ui/newinventory.dart';
import 'package:provider/provider.dart';
import 'package:exif/exif.dart';
import 'package:image/image.dart' as img;

class IntroInvent extends StatefulWidget {
  @override
  _IntroInventState createState() => _IntroInventState();
}

class _IntroInventState extends State<IntroInvent> {

  final GlobalKey<FormState> _introformKey = GlobalKey<FormState>();
  String _descriptiontx;
  String _quantitytxex;
  String _colourtxex;
  String _conditiontxex;
  File photo;

  Widget _newproptitle (){
    return Container(
        padding: EdgeInsets.only(top: 20),
        child: Center(
          child: Text(
            "New Property",
            style: TextStyle(
              fontFamily: 'herrvon',
              fontSize: 55,


            ),
          ),
        ));
  }
  Widget _newpropsubtitle (){
    IntroImgNotify introImgNotify = Provider.of<IntroImgNotify>(context);

     return Container(
      padding: EdgeInsets.only(top: 3,),
      child: Column(
        children: <Widget>[
           Text(
                  "FRONT OF THE",
                  style: TextStyle(
                    fontFamily: 'alice',
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
          Text(
            "HOUSE PHOTO",
            style: TextStyle(
              fontFamily: 'alice',
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
//          Text('${introImgNotify.introImgList.length ?? '3'}'
//          ),

        ],
      ),
    );
  }

  Widget _buildformdescritpion() {

    IntroNotifier introNotifier = Provider.of<IntroNotifier>(context);

    return Container(
//      width: MediaQuery.of(context).copyWith().size.height / 1.9,
//    padding: EdgeInsets.all(40,),
    padding: EdgeInsets.only(left: 40,right: 40,top: 25,),
      child: Form(
        key: _introformKey,
        child: new Theme(
          data: ThemeData(
            primaryColor: Colors.deepPurpleAccent,
            accentColor: Colors.white,
            hintColor: Colors.deepPurpleAccent,
          ),
          child: Column(
            children: <Widget>[
              Row(
              mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "PROPERTY ADDRESS",
                    style: TextStyle(
                      color: Color(0xff684c4c),
                      fontFamily: 'alice',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 7,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(

                    height: 142,
                    width: 308,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.7),
                      border: new Border.all(color: Colors.grey,width: 2.0,),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 1,
                          offset: Offset(5, 5),
                        ),
                      ],
                    ),
                    child: TextFormField(

                      keyboardType: TextInputType.multiline,
                      maxLines: 6,
                      decoration: InputDecoration(
                          fillColor: Colors.white.withOpacity(0.7),
                          filled: true,
                          hintText:  introNotifier.introList.isEmpty ? ' ' : '${introNotifier.introList.last.description}',
                          border: UnderlineInputBorder(
                              borderSide:
                              new BorderSide(color: Colors.black,width: 1.0,))),
//                      validator: (String value) {
//                        if (value.isEmpty) {
//                          return 'Address is required';
//                        }
//                        return null;
//                      },
                      initialValue: null,
                      onSaved: (String value) {
                        _descriptiontx = value;
                        print('Name: $value');
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "REFERENCE NUMBER", textAlign: TextAlign.start,
                    style: TextStyle(
                      color: Color(0xff684c4c),
                      fontFamily: 'alice',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 4,),
              Row(crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: 200,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.8),
                      border: new Border.all(color: Colors.grey,width: 2,),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.9),
                          spreadRadius: 1,
                          offset: Offset(5, 5),
                        ),
                      ],
                    ),
                    child: TextFormField(
                      decoration: InputDecoration(
                          hintText:  introNotifier.introList.isEmpty ? ' ' : '${introNotifier.introList.last.quantity}',
                          fillColor: Colors.white.withOpacity(0.7),
                          filled: true,
                          border: UnderlineInputBorder(
                              borderSide: new BorderSide(
                                  color: Colors.deepPurpleAccent))),
//                      validator: (String value) {
//                        if (value.isEmpty) {
//                          return 'Reference is required';
//                        }
//                        return null;
//                      },
                      initialValue: null,
                      onSaved: (String value) {
                        _quantitytxex = value;
                        print('Name: $value');
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 8,
              ),
              Row(crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "DATE OF INSPECTION",
                    style: TextStyle(
                      color: Color(0xff684c4c),
                      fontFamily: 'alice',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Row(crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: 200,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.8),
                      border: new Border.all(color: Colors.grey,width: 2,),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.9),
                          spreadRadius: 1,
                          offset: Offset(5, 5),
                        ),
                      ],
                    ),
                    child: TextFormField(
                      decoration: InputDecoration(
                          hintText:  introNotifier.introList.isEmpty ? ' ' : '${introNotifier.introList.last.colour}',
                          fillColor: Colors.white.withOpacity(0.7),
                          filled: true,
                          border: UnderlineInputBorder(
                              borderSide: new BorderSide(
                                  color: Colors.deepPurpleAccent))),
//                      validator: (String value) {
//                        if (value.isEmpty) {
//                          return 'Date of inspection is required';
//                        }
//                        return null;
//                      },
                      initialValue: null,
                      onSaved: (String value) {
                        _colourtxex = value;
                        print('Name: $value');
                      },
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  SizedBox(
                    width: 10,
                  ),

                ],
              ),
              SizedBox(
                height: 5,
              ),

            ],
          ),
        ),
      ),
    );
  }
  Widget _buildbtncam(){
    IntroImgNotify introImgNotify = Provider.of<IntroImgNotify>(context);

    return Container(
padding: EdgeInsets.only(top: 13,),
      child: CircleAvatar(
                              radius: 39,
                              backgroundColor: Colors.black,
                              child: photo == null
                                  ? GestureDetector(
                                      onTap: () async {
                                        File getPic = await ImagePicker.pickImage(
                                            source: ImageSource.camera);
                                        if (getPic != null) {
                                          setState(() {
                                            photo = getPic;
                                            introImgNotify.addIntroImg(IntroImg(photo));

                                          });
                                        }
                                      },
                                      child: Image.asset('assets/camnew.png'),
                                    )
                                  : GestureDetector(
                                      onTap: () async {
                                        File getPic = await ImagePicker.pickImage(
                                            source: ImageSource.camera);

                                        if (getPic != null)  {
                                          setState(() async{
                                            photo = getPic;
//
//                                            final originalFile = File(photo.path);
//                                            List<int> imageBytes = await originalFile.readAsBytes();
//                                            final originalImage = img.decodeImage(imageBytes);
//                                            img.Image fixedImage;
//                                            fixedImage = img.copyRotate(originalImage, 90);
//                                            final fixedFile =
//                                            await originalFile.writeAsBytes(img.encodeJpg(fixedImage));


                                            introImgNotify.addIntroImg(IntroImg(photo));

                                          });
                                        }
                                      },
                                      child: CircleAvatar(
                                        radius: 39,
                                        backgroundImage: FileImage(introImgNotify.introImgList.last.imageintro),
                                      ),
                                    ),
                            ),
    );


}
_saveform(){
  IntroNotifier introNotifier = Provider.of<IntroNotifier>(context);

  if (!_introformKey.currentState.validate()) return;
  _introformKey.currentState.save();
  setState(() {
    introNotifier.addIntro(Intro(_descriptiontx,
        _quantitytxex, _colourtxex, ));
  });
  print(introNotifier.introList.length);
  print(introNotifier.introList.first);
  print(introNotifier.introList.last);
}

  Future<File> fixExifRotation(String imagePath) async {
    final originalFile = File(imagePath);
    List<int> imageBytes = await originalFile.readAsBytes();

    final originalImage = img.decodeImage(imageBytes);

    final height = originalImage.height;
    final width = originalImage.width;

    // Let's check for the image size
    // This will be true also for upside-down photos but it's ok for me
    if (height >= width) {
      // I'm interested in portrait photos so
      // I'll just return here
      return originalFile;
    }

    // We'll use the exif package to read exif data
    // This is map of several exif properties
    // Let's check 'Image Orientation'
    final exifData = await readExifFromBytes(imageBytes);

    img.Image fixedImage;

    if (height < width) {
//      logger.logInfo('Rotating image necessary');
      // rotate
      if (exifData['Image Orientation'].printable.contains('Horizontal')) {
        fixedImage = img.copyRotate(originalImage, 90);
      } else if (exifData['Image Orientation'].printable.contains('180')) {
        fixedImage = img.copyRotate(originalImage, -90);
      } else if (exifData['Image Orientation'].printable.contains('CCW')) {
        fixedImage = img.copyRotate(originalImage, 180);
      } else {
        fixedImage = img.copyRotate(originalImage, 0);
      }
    }

    // Here you can select whether you'd like to save it as png
    // or jpg with some compression
    // I choose jpg with 100% quality
    final fixedFile =
    await originalFile.writeAsBytes(img.encodeJpg(fixedImage));

    return fixedFile;
  }


  @override
  Widget build(BuildContext context) {
    return Container(decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/bg.png"), fit: BoxFit.cover)),
    child: Scaffold(
      appBar: PreferredSize(
        child: Container(),
        preferredSize: Size.fromHeight(0.0),
      ),
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: Column(children: <Widget>[

          _newproptitle(),
          _newpropsubtitle(),
          _buildbtncam(),
          _buildformdescritpion(),
        ],),
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
                    Navigator.pop(context, MaterialPageRoute(builder: (context) => AppHome()));
                  },
                  child: Icon(Icons.arrow_back_ios),
                  foregroundColor: Colors.white,
                ),
              ),
            ),

            Align(
              alignment: Alignment.bottomRight,
              child: FloatingActionButton(
                heroTag: "intronext",
                mini: true,
                backgroundColor: Color(0xff684c4c),
                onPressed: () async{
                  Navigator.push(context, MaterialPageRoute(builder: (context) => NewInventory()));
                  await _saveform();
                },
                foregroundColor: Colors.white,
                child: Icon(Icons.arrow_forward_ios),
              ),
            ),
          ],
        ),
    ),

    );
  }
}
*/
