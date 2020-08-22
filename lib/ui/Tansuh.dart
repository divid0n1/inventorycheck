import 'dart:async';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter_audio_recorder/flutter_audio_recorder.dart';
import 'package:inventorycheck/model/audio.dart';
import 'package:inventorycheck/model/textdata.dart';
import 'package:inventorycheck/notify/audionotifier.dart';
import 'package:inventorycheck/notify/imagesnotifier.dart';
import 'package:inventorycheck/notify/textnotifier.dart';
import 'package:flutter/material.dart';
import 'package:inventorycheck/ui/ImgGallery.dart';
import 'package:inventorycheck/ui/newinventory.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:file/local.dart';

class Tansuh extends StatefulWidget {

  final LocalFileSystem localFileSystem;
  final hasny;

  Tansuh({localFileSystem, this.hasny})
      : this.localFileSystem = localFileSystem ?? LocalFileSystem();
  @override
  _TansuhState createState() => _TansuhState();
}

class _TansuhState extends State<Tansuh> {

  var tantitle;
  var tanbartitle;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Recinit();
//switch
    switch(widget.hasny) {
      case 'a':
        {
          tantitle = 'Exterior';
          tanbartitle = 'Windows';
        }
        break;
      case 'b':
        {
          tantitle = 'Hallway';
          tanbartitle = 'Furniture';
        }
        break;
      case 'c':
        {
          tantitle = 'Ceiling';
          tanbartitle = 'Switches & Sockets';
        }
        break;
      case 'd':
        {
          tantitle = 'Kitchen';
          tanbartitle = 'Skirting';
        }
        break;
      case 'e':
        {
          tantitle = 'Bedroom';
          tanbartitle = 'Other';
        }
        break;
      case 'f':
        {
          tantitle = 'Keys';
          tanbartitle = 'Locks';
        }
        break;
      case 'g':
        {
          tantitle = 'MeterReading';
          tanbartitle = 'Electric Meter';
        }
        break;
      default:
        {
          print('unable to determine');
        }
        break;
    }

  //switch




  }

  String _descriptiontx;
  String _quantitytxex;
  String _colourtxex;
  String _conditiontxex;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildtitle() {
    return Container(
        padding: EdgeInsets.only(top: 30),
        child: Center(
          child: Text(
            "${tantitle}",
            style: TextStyle(
              fontFamily: 'herrvon',
              fontSize: 60,
            ),
          ),
        ));
  }

  Widget _buildtitlebar() {
    return Container(
      color: Colors.white.withOpacity(0.7),
      height: 50,
      width: MediaQuery.of(context).copyWith().size.height / 1,
      child: Container(
        padding: EdgeInsets.only(top: 9),
        child: Text(
          "${tanbartitle}",
          style: TextStyle(
            color: Colors.teal,
            fontFamily: 'arimo',
            fontSize: 22,
          ),
        ),
      ),
    );
  }

  Widget _builddescriptiontext() {
    return Row(
      children: <Widget>[
        SizedBox(
          width: 10,
        ),
        Text(
          "  DESCRIPTION",
          style: TextStyle(
            color: Colors.deepPurpleAccent,
            fontFamily: 'arimo',
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildformdescritpion() {
    ChaabiNotifier chaabiNotifier = Provider.of<ChaabiNotifier>(context);
    return Container(
      width: MediaQuery.of(context).copyWith().size.height / 1.9,
      child: Form(
        key: _formKey,
        child: new Theme(
          data: ThemeData(
            primaryColor: Colors.deepPurpleAccent,
            accentColor: Colors.white,
            hintColor: Colors.deepPurpleAccent,
          ),
          child: Column(
            children: <Widget>[
              TextFormField(
                keyboardType: TextInputType.multiline,
                maxLines: 4,
                decoration: InputDecoration(
                    fillColor: Colors.white.withOpacity(0.7),
                    filled: true,
                    hintText:  _deschint(),
                    border: UnderlineInputBorder(
                        borderSide:
                        new BorderSide(color: Colors.deepPurpleAccent))),
                validator: (String value) {
                  if (value.isEmpty) {
                    return 'Description is required';
                  }
                  return null;
                },
                initialValue: null,
                onSaved: (String value) {
                  _descriptiontx = value;
                  print('Name: $value');
                },
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: 150,
                    height: 80,
                    child: Column(
                      children: <Widget>[
                        Text(
                          "QUANTITY",
                          style: TextStyle(
                            color: Colors.deepPurpleAccent,
                            fontFamily: 'arimo',
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                              hintText:  _quanhint(),
                              fillColor: Colors.white.withOpacity(0.7),
                              filled: true,
                              border: UnderlineInputBorder(
                                  borderSide: new BorderSide(
                                      color: Colors.deepPurpleAccent))),
                          validator: (String value) {
                            if (value.isEmpty) {
                              return 'Quanity is required';
                            }
                            return null;
                          },
                          initialValue: null,
                          onSaved: (String value) {
                            _quantitytxex = value;
                            print('Name: $value');
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                    width: 180,
                    height: 80,
                    child: Column(
                      children: <Widget>[
                        Text(
                          "COLOUR",
                          style: TextStyle(
                            color: Colors.deepPurpleAccent,
                            fontFamily: 'arimo',
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                              hintText:  _colohint(),
                              fillColor: Colors.white.withOpacity(0.7),
                              filled: true,
                              border: UnderlineInputBorder(
                                  borderSide: new BorderSide(
                                      color: Colors.deepPurpleAccent))),
                          validator: (String value) {
                            if (value.isEmpty) {
                              return 'Colour is required';
                            }
                            return null;
                          },
                          initialValue: null,
                          onSaved: (String value) {
                            _colourtxex = value;
                            print('Name: $value');
                          },
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Row(
                children: <Widget>[
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    " CONDITION",
                    style: TextStyle(
                      color: Colors.deepPurpleAccent,
                      fontFamily: 'arimo',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              TextFormField(
                keyboardType: TextInputType.multiline,
                maxLines: 4,
                decoration: InputDecoration(
                    hintText: _condhint(),
                    fillColor: Colors.white.withOpacity(0.7),
                    filled: true,
                    border: UnderlineInputBorder(
                        borderSide:
                        new BorderSide(color: Colors.deepPurpleAccent))),
                validator: (String value) {
                  if (value.isEmpty) {
                    return 'Condition is required';
                  }
                  return null;
                },
                initialValue: null,
                onSaved: (String value) {
                  _conditiontxex = value;
                  print('Name: $value');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  _deschint(){
    ExteriorTanNotifier exteriorTanNotifier = Provider.of<ExteriorTanNotifier>(context);
    HallwayTanNotifier hallwayTanNotifier = Provider.of<HallwayTanNotifier>(context);
    SmoteTanNotifier smoteTanNotifier = Provider.of<SmoteTanNotifier>(context);
    KitchenTanNotifier kitchenTanNotifier = Provider.of<KitchenTanNotifier>(context);
    BedroomTanNotifier bedroomTanNotifier = Provider.of<BedroomTanNotifier>(context);
    ChaabiTanNotifier chaabiTanNotifier = Provider.of<ChaabiTanNotifier>(context);
    MeterreadingTanNotifier meterreadingTanNotifier = Provider.of<MeterreadingTanNotifier>(context);




    switch(widget.hasny) {
      case 'a':
        {
         return exteriorTanNotifier.exteriortanList.isEmpty ? ' ' : '${exteriorTanNotifier.exteriortanList.last.description}';
        }
        break;
      case 'b':
        {
          return hallwayTanNotifier.hallwayTanList.isEmpty ? ' ' : '${hallwayTanNotifier.hallwayTanList.last.description}';
        }
        break;
      case 'c':
        {
          return smoteTanNotifier.smoteTanList.isEmpty ? ' ' : '${smoteTanNotifier.smoteTanList.last.description}';
        }
        break;
      case 'd':
        {
          return kitchenTanNotifier.kitchenTanList.isEmpty ? ' ' : '${kitchenTanNotifier.kitchenTanList.last.description}';
        }
        break;
      case 'e':
        {
          return bedroomTanNotifier.bedroomTanList.isEmpty ? ' ' : '${bedroomTanNotifier.bedroomTanList.last.description}';
        }
        break;
      case 'f':
        {
          return chaabiTanNotifier.chaabiTanList.isEmpty ? ' ' : '${chaabiTanNotifier.chaabiTanList.last.description}';
        }
        break;
      case 'g':
        {
          return meterreadingTanNotifier.meterreadingTanList.isEmpty ? ' ' : '${meterreadingTanNotifier.meterreadingTanList.last.description}';
        }
        break;
      default:
        {
          print('unable to determine');
        }
        break;
    }
  }
  _quanhint(){
    ExteriorTanNotifier exteriorTanNotifier = Provider.of<ExteriorTanNotifier>(context);
    HallwayTanNotifier hallwayTanNotifier = Provider.of<HallwayTanNotifier>(context);
    SmoteTanNotifier smoteTanNotifier = Provider.of<SmoteTanNotifier>(context);
    KitchenTanNotifier kitchenTanNotifier = Provider.of<KitchenTanNotifier>(context);
    BedroomTanNotifier bedroomTanNotifier = Provider.of<BedroomTanNotifier>(context);
    ChaabiTanNotifier chaabiTanNotifier = Provider.of<ChaabiTanNotifier>(context);
    MeterreadingTanNotifier meterreadingTanNotifier = Provider.of<MeterreadingTanNotifier>(context);

    switch(widget.hasny) {
      case 'a':
        {
          return exteriorTanNotifier.exteriortanList.isEmpty ? ' ' : '${exteriorTanNotifier.exteriortanList.last.quantity}';
        }
        break;

      case 'b':
        {
          return hallwayTanNotifier.hallwayTanList.isEmpty ? ' ' : '${hallwayTanNotifier.hallwayTanList.last.quantity}';
        }
        break;
      case 'c':
        {
          return smoteTanNotifier.smoteTanList.isEmpty ? ' ' : '${smoteTanNotifier.smoteTanList.last.quantity}';
        }
        break;
      case 'd':
        {
          return kitchenTanNotifier.kitchenTanList.isEmpty ? ' ' : '${kitchenTanNotifier.kitchenTanList.last.quantity}';
        }
        break;
      case 'e':
        {
          return bedroomTanNotifier.bedroomTanList.isEmpty ? ' ' : '${bedroomTanNotifier.bedroomTanList.last.quantity}';
        }
        break;
      case 'f':
        {
          return chaabiTanNotifier.chaabiTanList.isEmpty ? ' ' : '${chaabiTanNotifier.chaabiTanList.last.quantity}';
        }
        break;
      case 'g':
        {
          return meterreadingTanNotifier.meterreadingTanList.isEmpty ? ' ' : '${meterreadingTanNotifier.meterreadingTanList.last.description}';
        }
        break;
      default:
        {
          print('unable to determine');
        }
        break;
    }
  }
  _colohint(){
    ExteriorTanNotifier exteriorTanNotifier = Provider.of<ExteriorTanNotifier>(context);
    HallwayTanNotifier hallwayTanNotifier = Provider.of<HallwayTanNotifier>(context);
    SmoteTanNotifier smoteTanNotifier = Provider.of<SmoteTanNotifier>(context);
    KitchenTanNotifier kitchenTanNotifier = Provider.of<KitchenTanNotifier>(context);
    BedroomTanNotifier bedroomTanNotifier = Provider.of<BedroomTanNotifier>(context);
    ChaabiTanNotifier chaabiTanNotifier = Provider.of<ChaabiTanNotifier>(context);
    MeterreadingTanNotifier meterreadingTanNotifier = Provider.of<MeterreadingTanNotifier>(context);

    switch(widget.hasny) {
      case 'a':
        {
          return exteriorTanNotifier.exteriortanList.isEmpty ? ' ' : '${exteriorTanNotifier.exteriortanList.last.colour}';
        }
        break;
      case 'b':
        {
          return hallwayTanNotifier.hallwayTanList.isEmpty ? ' ' : '${hallwayTanNotifier.hallwayTanList.last.colour}';
        }
        break;
      case 'c':
        {
          return smoteTanNotifier.smoteTanList.isEmpty ? ' ' : '${smoteTanNotifier.smoteTanList.last.colour}';
        }
        break;
      case 'd':
        {
          return kitchenTanNotifier.kitchenTanList.isEmpty ? ' ' : '${kitchenTanNotifier.kitchenTanList.last.colour}';
        }
        break;
      case 'e':
        {
          return bedroomTanNotifier.bedroomTanList.isEmpty ? ' ' : '${bedroomTanNotifier.bedroomTanList.last.colour}';
        }
        break;
      case 'f':
        {
          return chaabiTanNotifier.chaabiTanList.isEmpty ? ' ' : '${chaabiTanNotifier.chaabiTanList.last.colour}';
        }
        break;
      case 'g':
        {
          return meterreadingTanNotifier.meterreadingTanList.isEmpty ? ' ' : '${meterreadingTanNotifier.meterreadingTanList.last.description}';
        }
        break;
      default:
        {
          print('unable to determine');
        }
        break;
    }
  }
  _condhint(){
    ExteriorTanNotifier exteriorTanNotifier = Provider.of<ExteriorTanNotifier>(context);
    HallwayTanNotifier hallwayTanNotifier = Provider.of<HallwayTanNotifier>(context);
    SmoteTanNotifier smoteTanNotifier = Provider.of<SmoteTanNotifier>(context);
    KitchenTanNotifier kitchenTanNotifier = Provider.of<KitchenTanNotifier>(context);
    BedroomTanNotifier bedroomTanNotifier = Provider.of<BedroomTanNotifier>(context);
    ChaabiTanNotifier chaabiTanNotifier = Provider.of<ChaabiTanNotifier>(context);
    MeterreadingTanNotifier meterreadingTanNotifier = Provider.of<MeterreadingTanNotifier>(context);

    switch(widget.hasny) {
      case 'a':
        {
          return exteriorTanNotifier.exteriortanList.isEmpty ? ' ' : '${exteriorTanNotifier.exteriortanList.last.condition}';
        }
        break;

      case 'b':
        {
          return hallwayTanNotifier.hallwayTanList.isEmpty ? ' ' : '${hallwayTanNotifier.hallwayTanList.last.condition}';
        }
        break;
      case 'c':
        {
          return smoteTanNotifier.smoteTanList.isEmpty ? ' ' : '${smoteTanNotifier.smoteTanList.last.condition}';
        }
        break;
      case 'd':
        {
          return kitchenTanNotifier.kitchenTanList.isEmpty ? ' ' : '${kitchenTanNotifier.kitchenTanList.last.condition}';
        }
        break;
      case 'e':
        {
          return bedroomTanNotifier.bedroomTanList.isEmpty ? ' ' : '${bedroomTanNotifier.bedroomTanList.last.condition}';
        }
        break;
      case 'f':
        {
          return chaabiTanNotifier.chaabiTanList.isEmpty ? ' ' : '${chaabiTanNotifier.chaabiTanList.last.condition}';
        }
        break;
      case 'g':
        {
          return meterreadingTanNotifier.meterreadingTanList.isEmpty ? ' ' : '${meterreadingTanNotifier.meterreadingTanList.last.condition}';
        }
        break;
      default:
        {
          print('unable to determine');
        }
        break;
    }
  }
  _savdata(){
    ExteriorTanNotifier exteriorTanNotifier = Provider.of<ExteriorTanNotifier>(context);
    HallwayTanNotifier hallwayTanNotifier = Provider.of<HallwayTanNotifier>(context);
    SmoteTanNotifier smoteTanNotifier = Provider.of<SmoteTanNotifier>(context);
    KitchenTanNotifier kitchenTanNotifier = Provider.of<KitchenTanNotifier>(context);
    BedroomTanNotifier bedroomTanNotifier = Provider.of<BedroomTanNotifier>(context);
    ChaabiTanNotifier chaabiTanNotifier = Provider.of<ChaabiTanNotifier>(context);
    MeterreadingTanNotifier meterreadingTanNotifier = Provider.of<MeterreadingTanNotifier>(context);

    switch(widget.hasny) {
      case 'a':
        {
          setState(() {
            exteriorTanNotifier.addExteriorTan(ExteriorTan(_descriptiontx,
                _quantitytxex, _colourtxex, _conditiontxex));
          });
        }
        break;

      case 'b':
        {
          setState(() {
            hallwayTanNotifier.addHallwayTan(HallwayTan(_descriptiontx,
                _quantitytxex, _colourtxex, _conditiontxex));
          });
        }
        break;

      case 'c':
        {
          setState(() {
            smoteTanNotifier.addSmoteTan(SmoteTan(_descriptiontx,
                _quantitytxex, _colourtxex, _conditiontxex));
          });
        }
        break;

      case 'd':
        {
          setState(() {
            kitchenTanNotifier.addKitchen(KitchenTan(_descriptiontx,
                _quantitytxex, _colourtxex, _conditiontxex));
          });
        }
        break;

      case 'e':
        {
          setState(() {
            bedroomTanNotifier.addTanBedroom(BedroomTan(_descriptiontx,
                _quantitytxex, _colourtxex, _conditiontxex));
          });
        }
        break;

      case 'f':
        {
          setState(() {
            chaabiTanNotifier.addTanChaabi(ChaabiTan(_descriptiontx,
                _quantitytxex, _colourtxex, _conditiontxex));
          });
        }
        break;

      case 'g':
        {
          setState(() {
            meterreadingTanNotifier.addMeterreadingTan(MeterreadingTan(_descriptiontx,
                _quantitytxex, _colourtxex, _conditiontxex));
          });
        }
        break;

      default:
        {
          print('unable to determine');
        }
        break;
    }

  }


  _imagebtntap(){
    switch(widget.hasny) {
      case 'a':
        {
          return Navigator.push(context, MaterialPageRoute(builder: (context) => ImgGallery(jar: 'ba',)));
        }
        break;
      case 'b':
        {
          return Navigator.push(context, MaterialPageRoute(builder: (context) => ImgGallery(jar: 'bb',)));
        }
        break;
      case 'c':
        {
          return Navigator.push(context, MaterialPageRoute(builder: (context) => ImgGallery(jar: 'bc',)));
        }
        break;
      case 'd':
        {
          return Navigator.push(context, MaterialPageRoute(builder: (context) => ImgGallery(jar: 'bd',)));
        }
        break;
      case 'e':
        {
          return Navigator.push(context, MaterialPageRoute(builder: (context) => ImgGallery(jar: 'be',)));
        }
        break;
      case 'f':
        {
          return Navigator.push(context, MaterialPageRoute(builder: (context) => ImgGallery(jar: 'bf',)));
        }
        break;
      case 'g':
        {
          return Navigator.push(context, MaterialPageRoute(builder: (context) => ImgGallery(jar: 'bg',)));
        }
        break;
      default:
        {
          print('unable to determine');
        }
        break;
    }
  }
  _imagebtncount(){
    ExteriorImgTanNotifier exteriorImgTanNotifier = Provider.of<ExteriorImgTanNotifier>(context);
    HallwayImgTanNotify hallwayImgTanNotify = Provider.of<HallwayImgTanNotify>(context);
    SmoteImgTanNotify smoteImgTanNotify = Provider.of<SmoteImgTanNotify>(context);
    KitchenImgTanNotify kitchenImgTanNotify = Provider.of<KitchenImgTanNotify>(context);
    BedroomImgTanNotify bedroomImgTanNotify = Provider.of<BedroomImgTanNotify>(context);
    ChaabiImgTanNotify chaabiImgTanNotify = Provider.of<ChaabiImgTanNotify>(context);
    MeterImgTanNotify meterImgTanNotify = Provider.of<MeterImgTanNotify>(context);




    switch(widget.hasny) {
      case 'a':
        {
          return exteriorImgTanNotifier.exteriorImgTanList.isEmpty ? '0' : '${exteriorImgTanNotifier.exteriorImgTanList.length}';
        }
        break;
      case 'b':
        {
          return hallwayImgTanNotify.hallwayImgTanList.isEmpty ? '0' : '${hallwayImgTanNotify.hallwayImgTanList.length}';
        }
        break;
      case 'c':
        {
          return smoteImgTanNotify.smoteImgTanList.isEmpty ? '0' : '${smoteImgTanNotify.smoteImgTanList.length}';
        }
        break;
      case 'd':
        {
          return kitchenImgTanNotify.kitchenImgTanList.isEmpty ? '0' : '${kitchenImgTanNotify.kitchenImgTanList.length}';
        }
        break;
      case 'e':
        {
          return bedroomImgTanNotify.bedroomImgTanList.isEmpty ? '0' : '${bedroomImgTanNotify.bedroomImgTanList.length}';
        }
        break;
      case 'f':
        {
          return chaabiImgTanNotify.chaabiImgTanList.isEmpty ? '0' : '${chaabiImgTanNotify.chaabiImgTanList.length}';
        }
        break;
      case 'g':
        {
          return meterImgTanNotify.meterImgTanList.isEmpty ? '0' : '${meterImgTanNotify.meterImgTanList.length}';
        }
        break;
      default:
        {
          print('unable to determine');
        }
        break;
    }
  }


  @override
  Widget build(BuildContext context) {
    ChaabiNotifier chaabiNotifier = Provider.of<ChaabiNotifier>(context);

    ChaabiImgNotify chaabiImgNotify = Provider.of<ChaabiImgNotify>(context);

    AudioKeysNotifier audioKeysNotifier = Provider.of<AudioKeysNotifier>(context);

    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/bg.png"), fit: BoxFit.cover)),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                _buildtitle(),
                _buildtitlebar(),
                Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                          width: 80,
                          child: InkWell(
                            onTap: () {
                              _imagebtntap();
                            },
                            child: Stack(
                              children: <Widget>[
                                CircleAvatar(
                                  backgroundColor: Colors.transparent,
                                  radius: 38,
                                  child: Image.asset('assets/cam.png'),
                                ),
                                Container(
                                  child: Column(
                                    children: <Widget>[
                                      SizedBox(
                                        height: 42,
                                      ),
                                      Center(
                                          child: Text(
                                            _imagebtncount(),
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 17,
                                            ),
                                          )),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )),
                    ),
                    GestureDetector(
                      onPanDown: (_) {
                        Recinit();
                        print('1');
                      },
                      onLongPress: () {
                        Recstart();
                        print('2');
                      },
                      onLongPressEnd: (_) {
                        Recstop();
                        print('3');
                      },
                      onLongPressUp: () {
                        print('4');
                      },
                      child: Stack(children: <Widget>[
                        CircleAvatar(
                          backgroundColor: Colors.transparent,
                          radius: 38,
                          child: Image.asset('assets/mic.png'),
                        ),
                        Container(
                          child: Positioned(
                            left: 32,
                            top: 10,
                            child: Text(
                              '${audioKeysNotifier.audioKeysList.length ?? ''}',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                              ),
                            ),
                          ),
                        )
                      ]),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      '00:${Rcurrent?.duration.toString()}',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.deepPurpleAccent.withOpacity(0.3),
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 0.7),
                _builddescriptiontext(),
                SizedBox(
                  height: 7,
                ),
                _buildformdescritpion(),
                SizedBox(
                  height: 200,
                  width: 200,
                  child: ListView.builder(
                    itemBuilder: (BuildContext context, int index) => Column(
                      children: <Widget>[
                        Text(chaabiNotifier.chaabiList[index].colour),
                        Divider(
                          thickness: 2,
                          color: Colors.purple,
                        ),
                        Padding(
                          padding: EdgeInsets.all(8),
                        ),
                      ],
                    ),
                    itemCount: chaabiNotifier.chaabiList.length,
                  ),
                )
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
                    heroTag: "exleft",
                    mini: true,
                    backgroundColor: Colors.deepPurpleAccent,
                    onPressed: () {

                      Navigator.pop(
                          context,
                          MaterialPageRoute(
                              builder: (context) => NewInventory()));
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
                    onTap: () {
                      if (!_formKey.currentState.validate()) return;

                      _formKey.currentState.save();

                      _savdata();
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
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => NewInventory()));
                  },
                  foregroundColor: Colors.white,
                  child: Icon(Icons.arrow_forward_ios),
                ),
              ),
            ],
          ),
        ));
  }

  FlutterAudioRecorder Rrecorder;
  Recording Rcurrent;
  RecordingStatus RcurrentStatus = RecordingStatus.Unset;

  Recinit() async {
    try {
      if (await FlutterAudioRecorder.hasPermissions) {
        String customPath = '/flutter_audio_recorder_';
        Directory appDocDirectory;
//        io.Directory appDocDirectory = await getApplicationDocumentsDirectory();
        if (Platform.isIOS) {
          appDocDirectory = await getTemporaryDirectory();
        } else {
          appDocDirectory = await getExternalStorageDirectory();
//          getExternalStorageDirectory
        }

        // can add extension like ".mp4" ".wav" ".m4a" ".aac"
        customPath = appDocDirectory.path +
            customPath +
            DateTime.now().millisecondsSinceEpoch.toString();

        // .wav <---> AudioFormat.WAV
        // .mp4 .m4a .aac <---> AudioFormat.AAC
        // AudioFormat is optional, if given value, will overwrite path extension when there is conflicts.
        Rrecorder =
            FlutterAudioRecorder(customPath, audioFormat: AudioFormat.WAV);

        await Rrecorder.initialized;
        // after initialization
        var current = await Rrecorder.current(channel: 0);
        print(current);
        // should be "Initialized", if all working fine
        setState(() {
          Rcurrent = current;
          RcurrentStatus = current.status;
          print(RcurrentStatus);
        });
      } else {
        print('You must accept permission');
//        Scaffold.of(context).showSnackBar(
//            new SnackBar(content: new Text("You must accept permissions")));
      }
    } catch (e) {
      print(e);
    }
  }

  Recstart() async {
    try {
      await Rrecorder.start();
      var recording = await Rrecorder.current(channel: 0);
      setState(() {
        Rcurrent = recording;
      });

      const tick = const Duration(milliseconds: 50);
      new Timer.periodic(tick, (Timer t) async {
        if (RcurrentStatus == RecordingStatus.Stopped) {
          t.cancel();
        }

        var current = await Rrecorder.current(channel: 0);
        // print(current.status);
        setState(() {
          Rcurrent = current;
          RcurrentStatus = Rcurrent.status;
        });
      });
    } catch (e) {
      print(e);
    }
  }

  Recstop() async {
    var result = await Rrecorder.stop();
    print("Stop recording: ${result.path}");
    print("Stop recording: ${result.duration}");
    File file = widget.localFileSystem.file(result.path);
    print("File length: ${await file.length()}");
    setState(() {
      Rcurrent = result;
      AudioKeysNotifier audioKeysNotifier =  Provider.of<AudioKeysNotifier>(context);

      audioKeysNotifier.addAudioKeys(AudioKeys(file));

      RcurrentStatus = Rcurrent.status;
    });
  }
}
