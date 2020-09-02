import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:image_picker/image_picker.dart';
import 'package:inventorycheck/NotifierList/KeysText.dart';
import 'package:image/image.dart' as imgg;
import 'package:inventorycheck/model/textdata.dart';
import 'package:inventorycheck/notify/imagesnotifier.dart';
import 'package:inventorycheck/notify/textnotifier.dart';
import 'package:inventorycheck/ui/apphome.dart';
import 'package:inventorycheck/ui/newinventory.dart';
import 'package:provider/provider.dart';
import 'package:exif/exif.dart';
import 'package:image/image.dart' as img;

class homeKeys extends StatefulWidget {
  @override
  _homeKeysState createState() => _homeKeysState();
}

class _homeKeysState extends State<homeKeys> {

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
      color: Colors.white.withOpacity(0.7),
      height: 50,
      width: MediaQuery.of(context).copyWith().size.height / 1,
      child: Center(
        child: Text(
          "K E Y S",
          style: TextStyle(
            color: Color(0xff684c4c),
            fontFamily: 'alice',
            fontSize: 23,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }



  final FocusNode _onefocus = FocusNode();
  final FocusNode _twofocus = FocusNode();
//    final FocusNode _thrfocus = FocusNode();
  _fieldFocusChange(BuildContext context, FocusNode currentFocus,FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);}


  @override
  Widget build(BuildContext context) {
    InventKeyNotifier inventKeyNotifier = Provider.of<InventKeyNotifier>(context);
    InventKeyPhNotifier inventKeyPhNotifier = Provider.of<InventKeyPhNotifier>(context);

    final bool showFab = MediaQuery.of(context).viewInsets.bottom==0.0;
    Widget _buildformdescritpion() {

      IntroNotifier introNotifier = Provider.of<IntroNotifier>(context);

      return Container(
//      width: MediaQuery.of(context).copyWith().size.height / 1.9,
//    padding: EdgeInsets.all(40,),
        padding: EdgeInsets.only(left: 50,right: 40,top: 25,),
        child: Form(
          key: _introformKey,
          child: new Theme(
            data: ThemeData(
              primaryColor: Color(0xff684c4c),
              accentColor: Colors.white,
              hintColor: Color(0xff684c4c),
            ),
            child: Column(
              children: <Widget>[

                SizedBox(height: 7,),

                SizedBox(
                  height: 15,
                ),
                Row(crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "HOW MANY SETS OF KEYS", textAlign: TextAlign.start,
                      style: TextStyle(
                        color: Color(0xff684c4c),
                        fontFamily: 'alice',
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 14,),
                Row(crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      width: 270,
                      height: 45,
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
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.next,
                        focusNode: _onefocus,
                        onFieldSubmitted: (term) {_fieldFocusChange(context, _onefocus, _twofocus);},
                        decoration: InputDecoration(
//                            hintText:  inventKeyNotifier.inventKeyList.isEmpty ? '' : '${inventKeyNotifier.inventKeyList.last.quantity}',
                            fillColor: Colors.white.withOpacity(0.7),
                            filled: true,
                            border: UnderlineInputBorder(
                                borderSide: new BorderSide(
                                    color: Color(0xff684c4c)))),
//                      validator: (String value) {
//                        if (value.isEmpty) {
//                          return 'Reference is required';
//                        }
//                        return null;
//                      },
                        initialValue:  inventKeyNotifier.inventKeyList.isEmpty ? '' : '${inventKeyNotifier.inventKeyList.last.quantity}',
                        onSaved: (String value) {
                          _quantitytxex = value;
                          print('Name: $value');
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 60,
                ),
                Row(crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "NUMBER OF KEYS ON EACH SET",
                      style: TextStyle(
                        color: Color(0xff684c4c),
                        fontFamily: 'alice',
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12,),
                Row(crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      width: 270,
                      height: 45,
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
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.done,
                        focusNode: _twofocus,
                        onFieldSubmitted: (term){ _twofocus.unfocus();
                        },

                        decoration: InputDecoration(
//                            hintText:  inventKeyNotifier.inventKeyList.isEmpty ? '' : '${inventKeyNotifier.inventKeyList.last.colour}',
                            fillColor: Colors.white.withOpacity(0.7),
                            filled: true,
                            border: UnderlineInputBorder(
                                borderSide: new BorderSide(
                                    color: Color(0xff684c4c)))),
//                      validator: (String value) {
//                        if (value.isEmpty) {
//                          return 'Date of inspection is required';
//                        }
//                        return null;
//                      },
                        initialValue:  inventKeyNotifier.inventKeyList.isEmpty ? '' : '${inventKeyNotifier.inventKeyList.last.colour}',
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
      InventKeyPhNotifier inventKeyPhNotifier = Provider.of<InventKeyPhNotifier>(context);
      return Padding(
        padding: const EdgeInsets.only(top:10.0),
        child: Container(decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.9),
            spreadRadius: 1,
            offset: Offset(3, 3),
          ),
        ],
          borderRadius: new BorderRadius.only(
              topLeft: const Radius.circular(50.0),
              topRight: const Radius.circular(50.0),
              bottomLeft: const Radius.circular(50.0),
              bottomRight: const Radius.circular(50.0)),
          color: Color(0xff684c4c).withOpacity(0.3),),height: 80,width: 80,
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
                    var datetim = '${DateTime.now().year}/${DateTime.now().month}/${DateTime.now().day}--${DateTime.now().hour}:${DateTime.now().minute}:${DateTime.now().second}';
                    var decodeImg = imgg.decodeImage(photo.readAsBytesSync());
                    imgg.drawString(decodeImg, imgg.arial_48, 50, 50, datetim);
                    var encodeImage = imgg.encodeJpg(decodeImg, quality: 100);
                    var finalImage = File(photo.path)..writeAsBytesSync(encodeImage);

                    inventKeyPhNotifier.addInventKeyPh(InventKeyPh(finalImage));

                  });
                }
              },
              child:inventKeyPhNotifier.inventKeyPhList.isEmpty ? Image.asset('assets/camnew.png')  : CircleAvatar(radius: 39,backgroundImage: FileImage(inventKeyPhNotifier.inventKeyPhList.last.photo),),
            )
                : GestureDetector(
              onTap: () async {
                File getPic = await ImagePicker.pickImage(
                    source: ImageSource.camera);

                if (getPic != null)  {
                  setState(() async{
                    photo = getPic;
                    var datetim = '${DateTime.now().year}/${DateTime.now().month}/${DateTime.now().day}--${DateTime.now().hour}:${DateTime.now().minute}:${DateTime.now().second}';
                    var decodeImg = imgg.decodeImage(photo.readAsBytesSync());
                    imgg.drawString(decodeImg, imgg.arial_48, 50, 50, datetim);
                    var encodeImage = imgg.encodeJpg(decodeImg, quality: 100);
                    var finalImage = File(photo.path)..writeAsBytesSync(encodeImage);
//
//                                            final originalFile = File(photo.path);
//                                            List<int> imageBytes = await originalFile.readAsBytes();
//                                            final originalImage = img.decodeImage(imageBytes);
//                                            img.Image fixedImage;
//                                            fixedImage = img.copyRotate(originalImage, 90);
//                                            final fixedFile =
//                                            await originalFile.writeAsBytes(img.encodeJpg(fixedImage));


                    inventKeyPhNotifier.addInventKeyPh(InventKeyPh(finalImage));

                  });
                }
              },
              child: CircleAvatar(
                radius: 39,
                backgroundImage: FileImage(inventKeyPhNotifier.inventKeyPhList.last.photo),
              ),
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
        inventKeyNotifier.addExtFrame(InventKey( _quantitytxex, _colourtxex, ));
      });
    }
_dialog(){
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
              borderRadius:
              BorderRadius.circular(20.0)), //this right here
          child: Container(
            height: 200,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
//                                mainAxisAlignment: MainAxisAlignment.center,
//                                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('No Image selected for Inventory',style: TextStyle( fontFamily: 'alice',fontSize: 20,),),
                  SizedBox(height: 10,),
                  Text('You want to skip it?',style: TextStyle( fontFamily: 'alice',fontSize: 20,),),
                  SizedBox(height: 60,),
                  Center(
                    child: Row(mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(height: 30,width: 80,
                          child: RaisedButton(elevation: 0.5,
                            onPressed: () {},
                            child: Text(
                              "Yes",
                              style: TextStyle(color: Colors.white, fontFamily: 'alice',fontSize: 18,),
                            ),
                            color: const Color(0xff684c4c).withOpacity(0.5),
                          ),
                        ),SizedBox(width: 15,),
                        SizedBox(height: 30,width: 80,
                          child: RaisedButton(elevation: 0.5,

                            onPressed: () {},
                            child: Text(
                              "No",
                              style: TextStyle(color: Colors.white, fontFamily: 'alice',fontSize: 18,),
                            ),
                            color: const Color(0xff684c4c).withOpacity(0.5),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      });
}



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
        floatingActionButton: showFab ? Stack(
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

                    Navigator.push(context, MaterialPageRoute(builder: (context) => NewInventory()));
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
onPressed: (){_saveform();Navigator.push(context, MaterialPageRoute(builder: (context) => NewInventory()));},
                foregroundColor: Colors.white,
                child: Icon(Icons.arrow_forward_ios),
              ),
            ),
          ],
        ):null,
      ),

    );
  }
}
