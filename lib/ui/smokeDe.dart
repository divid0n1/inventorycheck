import 'package:flutter/cupertino.dart';
import 'package:image/image.dart' as imgg;
import 'package:flutter/material.dart';
import 'package:inventorycheck/NotifierList/MeterText.dart';
import 'package:inventorycheck/ui/GasMeter.dart';
import 'package:inventorycheck/ui/meterImg.dart';
import 'package:inventorycheck/ui/newinventory.dart';
import 'package:inventorycheck/ui/pages/Frames.dart';
import 'package:inventorycheck/ui/pages/GetImg.dart';
import 'package:provider/provider.dart';

class SmokeDetect extends StatefulWidget {

  @override
  _SmokeDetectState createState() => _SmokeDetectState();
}

class _SmokeDetectState extends State<SmokeDetect> {

  String _title;
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
            "Smoke Detector",
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
      child: Center(
        child: Text(
          "  SMOKE DETECTOR",
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

  Widget _builddescriptiontext() {
    return Row(
      children: <Widget>[
        SizedBox(
          width: 10,
        ),
        Text(
          "  ",
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

  final FocusNode _onefocus = FocusNode();
  final FocusNode _twofocus = FocusNode();

  _fieldFocusChange(BuildContext context, FocusNode currentFocus,FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);}
  @override
  Widget build(BuildContext context) {
    SmokeDeNotifier smokeDeNotifier = Provider.of<SmokeDeNotifier>(context);
    SmokeDePhNotifier smokeDePhNotifier = Provider.of<SmokeDePhNotifier>(context);



    _savetext(){
      if (!_formKey.currentState.validate()) return;
      _formKey.currentState.save();
      setState(() {
        smokeDeNotifier.addSmokeDe(SmokeDe(_descriptiontx,_quantitytxex));
      });
    }


//    _goImg(){
//      switch(widget.Route){
//        case '12': {return '12p';} break;
//        case '22': {return '22p';} break;
//        default: {print('I dont know');} break;
//      }
//    }
//    _ImgCount(){
//      switch(widget.Route){
//        case '12': {return extExdoorPhNotifier.extExdoorPhList.isNotEmpty ? extExdoorPhNotifier.extExdoorPhList.length : '0';} break;
//        case '22': {return halExdoorPhNotifier.halExdoorPhList.isNotEmpty ? halExdoorPhNotifier.halExdoorPhList.length : '0';} break;
//        default: {print('I dont know');} break;
//      }
//    }


    Widget _buildformdescritpion (){
      return Container(
        width: MediaQuery.of(context).copyWith().size.height / 1.9,
        child: Form (
          key: _formKey,
          child: new Theme(
            data:  ThemeData(
              primaryColor: Color(0xff684c4c),
              accentColor: Colors.white,
              hintColor: Color(0xff684c4c),
            ),
            child: Column(
              children: <Widget>[
                /*TextFormField(
//                  keyboardType: TextInputType.multiline,
//                  maxLines: 1,
                  decoration: InputDecoration(
                      fillColor: Colors.white.withOpacity(0.7),
                      filled: true,
                      hintText: elecMeterNotifier.elecMeterList.isEmpty ? ' ':'${elecMeterNotifier.elecMeterList.last.description}',
                      border: UnderlineInputBorder(
                          borderSide: new BorderSide(
                              color: Color(0xff684c4c)
                          )
                      )),
                  validator: (String value) {
                    if (value.isEmpty) {
                      return 'Serial  is required';
                    }
                    return null;
                  },
                  initialValue: null,
                  onSaved: (String value){
                    _descriptiontx = value;
                    print('Name: $value');
                  },
                ),*/
                SizedBox( height: 25,),
                /*Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
//                      width: MediaQuery.of(context).copyWith().size.width / 4,
//                      height: MediaQuery.of(context).copyWith().size.height / 10,
                      width: 150,
                      height: 94,
                      child: Column(
                        children: <Widget>[
                          Text("QUANTITY", style: TextStyle(
                            color: Color(0xff684c4c),
                            fontFamily: 'arimo',
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),),
                          TextFormField(
                            decoration: InputDecoration(
                                hintText: elecMeterNotifier.elecMeterList.isEmpty ? ' ':'${elecMeterNotifier.elecMeterList.last.quantity}',
                                fillColor: Colors.white.withOpacity(0.7),
                                filled: true,
                                border: UnderlineInputBorder(
                                    borderSide: new BorderSide(
                                        color: Color(0xff684c4c)
                                    )
                                )),
                            validator: (String value) {
                              if (value.isEmpty) {
                                return 'Quanity is required';
                              }
                              return null;
                            },
                            initialValue: null,
                            onSaved: (String value){
                              _quantitytxex = value;
                              print('Name: $value');
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 20,),
                    Container(
//                      width: MediaQuery.of(context).copyWith().size.width / 4,
//                      height: MediaQuery.of(context).copyWith().size.height / 10,
                      width: 180,
                      height: 94,
                      child: Column(
                        children: <Widget>[
                          Text("COLOUR", style: TextStyle(
                            color: Color(0xff684c4c),
                            fontFamily: 'arimo',
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),),
                          TextFormField(
                            decoration: InputDecoration(
                                hintText:elecMeterNotifier.elecMeterList.isEmpty ? ' ':'${elecMeterNotifier.elecMeterList.last.colour}',

                                fillColor: Colors.white.withOpacity(0.7),
                                filled: true,
                                border: UnderlineInputBorder(
                                    borderSide: new BorderSide(
                                        color: Color(0xff684c4c)
                                    )
                                )),
                            validator: (String value) {
                              if (value.isEmpty) {
                                return 'Colour is required';
                              }
                              return null;
                            },
                            initialValue: null,
                            onSaved: (String value){
                              _colourtxex = value;
                              print('Name: $value');
                            },
                          ),
                        ],
                      ),
                    )
                  ],
                ),*/
                Row(mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      " QUANTITY",
                      style: TextStyle(
                        color: Color(0xff684c4c),
                        fontFamily: 'arimo',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox( height: 10,),
                TextFormField(
                  textInputAction: TextInputAction.next,
                  focusNode: _onefocus,
                  onFieldSubmitted: (term) {_fieldFocusChange(context, _onefocus, _twofocus);},
//                  keyboardType: TextInputType.multiline,
//                  maxLines: 1,
                  decoration: InputDecoration(
                      fillColor: Colors.white.withOpacity(0.7),
                      filled: true,
//                      hintText: smokeDeNotifier.smokeDeList.isEmpty ? '':'${smokeDeNotifier.smokeDeList.last.quantity}',
                      border: UnderlineInputBorder(
                          borderSide: new BorderSide(
                              color: Color(0xff684c4c)
                          )
                      )),
                  validator: (String value) {
                    if (value.isEmpty) {
                      return 'Quantity is required';
                    }
                    return null;
                  },
                  initialValue: smokeDeNotifier.smokeDeList.isEmpty ? '':'${smokeDeNotifier.smokeDeList.last.quantity}',
                  onSaved: (String value){
                    _quantitytxex = value;
                    print('Name: $value');
                  },
                ),
                SizedBox(
                  height: 25,
                ),
                Row(
                  children: <Widget>[

                    Text(
                      " SMOKE DETECTOR LOCATION",
                      style: TextStyle(
                        color: Color(0xff684c4c),
                        fontFamily: 'arimo',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                  ],
                ),
                SizedBox(height: 5,),
                TextFormField(
                  textInputAction: TextInputAction.done,
                  focusNode: _twofocus,
                  onFieldSubmitted: (term){ _twofocus.unfocus(); },
//                  keyboardType: TextInputType.multiline,
                  maxLines: 2,
                  decoration: InputDecoration(
                      fillColor: Colors.white.withOpacity(0.7),
                      filled: true,
//                      hintText: smokeDeNotifier.smokeDeList.isEmpty ? ' ':'${smokeDeNotifier.smokeDeList.last.description}',
                      border: UnderlineInputBorder(
                          borderSide: new BorderSide(
                              color: Color(0xff684c4c)
                          )
                      )),
                  validator: (String value) {
                    if (value.isEmpty) {
                      return 'Location is required';
                    }
                    return null;
                  },
                  initialValue: smokeDeNotifier.smokeDeList.isEmpty ? '':'${smokeDeNotifier.smokeDeList.last.description}',
                  onSaved: (String value){
                    _descriptiontx = value;
                    print('Name: $value');
                  },
                ),


              ],
            ),

          ),


        ),
      );
    }
    final bool showFab = MediaQuery.of(context).viewInsets.bottom==0.0;
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/bg.png"), fit: BoxFit.cover)),
        child: Scaffold(

          resizeToAvoidBottomPadding: true,
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Column(
              children: <Widget>[

                _buildtitle(),
                _buildtitlebar(),
                Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top:5.0),
                      child: Container(decoration: BoxDecoration(
                        borderRadius: new BorderRadius.only(
                            topLeft: const Radius.circular(50.0),
                            topRight: const Radius.circular(50.0),
                            bottomLeft: const Radius.circular(50.0),
                            bottomRight: const Radius.circular(50.0)),
                        color: Color(0xff684c4c).withOpacity(0.3),),height: 80,
                          width: 80,
                          child: InkWell(
                            onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => meterImg(Route: '3',)));
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
                                          child: Text(smokeDePhNotifier.smokeDePhList.isEmpty ? '0': '${smokeDePhNotifier.smokeDePhList.length}',
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

                  ],
                ),
                SizedBox(height: 0.7),
                _builddescriptiontext(),
                SizedBox(height: 7,),
                _buildformdescritpion(),
//              SizedBox(height: 60,),

              ],
            ),
          ),
          floatingActionButton: showFab? Stack(
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
                      _savetext();
                      Navigator.pop(context);

                    },
                    child: Icon(Icons.arrow_back_ios),
                    foregroundColor: Colors.white,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: FloatingActionButton(
                  heroTag: "exnext",
                  mini: true,

                  backgroundColor: Color(0xff684c4c),
                  onPressed: ()  {
                    _savetext();
                    Navigator.push(context, MaterialPageRoute(builder: (context) => NewInventory()));

                  },
                  foregroundColor: Colors.white,
                  child: Icon(Icons.arrow_forward_ios),
                ),
              ),
            ],
          ):null,
        ));
  }

}
