import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_audio_recorder/flutter_audio_recorder.dart';
import 'package:inventorycheck/hasny/record.dart';
import 'package:inventorycheck/model/audio.dart';
import 'package:inventorycheck/model/textdata.dart';
import 'package:inventorycheck/notify/audionotifier.dart';
import 'package:inventorycheck/notify/imagesnotifier.dart';
import 'package:inventorycheck/notify/textnotifier.dart';
import 'package:flutter/material.dart';
import 'package:inventorycheck/ui/apphome.dart';
import 'package:inventorycheck/ui/ImgGallery.dart';
import 'package:inventorycheck/ui/newinventory.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:file/local.dart';
import 'package:inventorycheck/hasny/record.dart' as hasn;

import 'Tansuh.dart';

class DataKitchen extends StatefulWidget {
  final LocalFileSystem localFileSystem;

  DataKitchen({localFileSystem})
      : this.localFileSystem = localFileSystem ?? LocalFileSystem();

  @override
  _DataKitchenState createState() => _DataKitchenState();
}

class _DataKitchenState extends State<DataKitchen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Recinit();
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
            "Kitchen",
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
          "Kitchen Interior",
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
            color: Color(0xff684c4c),
            fontFamily: 'arimo',
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _builddescfield() {
    return Container(
      width: MediaQuery.of(context).copyWith().size.height / 2,
      child: TextField(
        onSubmitted: (String value) {
          _descriptiontx = value;
          print('Name: $value');
        },
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white.withOpacity(0.7),
          border: new OutlineInputBorder(
              borderSide: new BorderSide(color: Colors.white)),
//                      hintText: "Message",
          contentPadding: EdgeInsets.only(bottom: 40.0, top: 1.0, left: 10.0),
        ),
        maxLines: 4,
        keyboardType: TextInputType.multiline,
      ),
    );
  }

  Widget _buildformdescritpion() {
    KitchenNotifier kitchenNotifier = Provider.of<KitchenNotifier>(context);
    return Container(
      width: MediaQuery.of(context).copyWith().size.height / 1.9,
      child: Form(
        key: _formKey,
        child: new Theme(
          data: ThemeData(
            primaryColor: Color(0xff684c4c),
            accentColor: Colors.white,
            hintColor: Color(0xff684c4c),
          ),
          child: Column(
            children: <Widget>[
              TextFormField(
                keyboardType: TextInputType.multiline,
                maxLines: 4,
                decoration: InputDecoration(
                    fillColor: Colors.white.withOpacity(0.7),
                    filled: true,
                    hintText:  kitchenNotifier.kitchenList.isEmpty ? ' ' : '${kitchenNotifier.kitchenList.last.description}',
                    border: UnderlineInputBorder(
                        borderSide:
                            new BorderSide(color: Color(0xff684c4c)))),
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
                            color: Color(0xff684c4c),
                            fontFamily: 'arimo',
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                              hintText:  kitchenNotifier.kitchenList.isEmpty ? ' ' : '${kitchenNotifier.kitchenList.last.quantity}',
                              fillColor: Colors.white.withOpacity(0.7),
                              filled: true,
                              border: UnderlineInputBorder(
                                  borderSide: new BorderSide(
                                      color: Color(0xff684c4c)))),
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
                            color: Color(0xff684c4c),
                            fontFamily: 'arimo',
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                              hintText:  kitchenNotifier.kitchenList.isEmpty ? ' ' : '${kitchenNotifier.kitchenList.last.colour}',
                              fillColor: Colors.white.withOpacity(0.7),
                              filled: true,
                              border: UnderlineInputBorder(
                                  borderSide: new BorderSide(
                                      color: Color(0xff684c4c)))),
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
                    " CONDITION AND CLEANING",
                    style: TextStyle(
                      color: Color(0xff684c4c),
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
                    fillColor: Colors.white.withOpacity(0.7),
                    filled: true,
                    hintText:  kitchenNotifier.kitchenList.isEmpty ? ' ' : '${kitchenNotifier.kitchenList.last.condition}',
                    border: UnderlineInputBorder(
                        borderSide:
                            new BorderSide(color: Color(0xff684c4c)))),
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

  @override
  Widget build(BuildContext context) {
    KitchenNotifier kitchenNotifier = Provider.of<KitchenNotifier>(context);

    KitchenImgNotify kitchenImgNotify = Provider.of<KitchenImgNotify>(context);

    AudioKitchenNotifier audioKitchenNotifier = Provider.of<AudioKitchenNotifier>(context);
    _audiodur(){
      if(Rcurrent?.duration?.inMilliseconds == 0 ){
        return Text('0:0',style: TextStyle(color: Colors.deepPurple.withOpacity(0.5),fontSize: 25,),);
      } else {
        return Text('${Rcurrent?.duration?.inMinutes} : ${Rcurrent?.duration?.inSeconds}'
          ,style: TextStyle(color: Colors.deepPurple.withOpacity(0.5),fontSize: 25,),);
      }
    }
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
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ImgGallery(jar: '4',)));
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
                                        '${kitchenImgNotify.kitchenImgList.length ?? ''}',
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
                              '${audioKitchenNotifier.audioKitchenList.length ?? ''}',
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
Container(child:_audiodur(),),
                  ],
                ),
                SizedBox(height: 0.7),
                _builddescriptiontext(),
                SizedBox(
                  height: 7,
                ),
                _buildformdescritpion(),
//                SizedBox(
//                  height: 200,
//                  width: 200,
//                  child: ListView.builder(
//                    itemBuilder: (BuildContext context, int index) => Column(
//                      children: <Widget>[
//                        Text(kitchenNotifier.kitchenList[index].colour),
//                        Divider(
//                          thickness: 2,
//                          color: Colors.purple,
//                        ),
//                        Padding(
//                          padding: EdgeInsets.all(8),
//                        ),
//                      ],
//                    ),
//                    itemCount: kitchenNotifier.kitchenList.length,
//                  ),
//                )
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
                    backgroundColor: Color(0xff684c4c),
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
                      setState(() {
                        kitchenNotifier.addKitchen(Kitchen(_descriptiontx,
                            _quantitytxex, _colourtxex, _conditiontxex));
                      });
                      print(kitchenNotifier.kitchenList.length);
                      print(kitchenNotifier.kitchenList.first);
                      print(kitchenNotifier.kitchenList.last);
                      print(kitchenNotifier.kitchenList);
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
                  backgroundColor: Color(0xff684c4c),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Tansuh(hasny: 'd',)));
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
      AudioKitchenNotifier audioKitchenNotifier =  Provider.of<AudioKitchenNotifier>(context);

      audioKitchenNotifier.addAudioKitchen(AudioKitchen(file));

      RcurrentStatus = Rcurrent.status;
    });
  }
}
