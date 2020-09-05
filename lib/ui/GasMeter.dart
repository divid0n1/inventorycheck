import 'package:flutter/cupertino.dart';
import 'package:inventorycheck/NotifierList/ExteriorText.dart';
import 'package:flutter/material.dart';
import 'package:inventorycheck/NotifierList/MeterText.dart';
import 'package:inventorycheck/ui/ElecMeter.dart';
import 'package:inventorycheck/ui/meterImg.dart';
import 'package:inventorycheck/ui/newinventory.dart';
import 'package:inventorycheck/ui/pages/Frames.dart';
import 'package:inventorycheck/ui/pages/GetImg.dart';
import 'package:provider/provider.dart';

class meterGas extends StatefulWidget {

  @override
  _meterGasState createState() => _meterGasState();
}

class _meterGasState extends State<meterGas> {

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
            "Meter Reading",
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
          "GAS METER",
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
          "     SERIAL NUMBER",
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
  final FocusNode _thrfocus = FocusNode();

  _fieldFocusChange(BuildContext context, FocusNode currentFocus,FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);}

  @override
  Widget build(BuildContext context) {
    GasMeterNotifier gasMeterNotifier = Provider.of<GasMeterNotifier>(context);
    GasMeterPhNotifier gasMeterPhNotifier = Provider.of<GasMeterPhNotifier>(context);
    final bool showFab = MediaQuery.of(context).viewInsets.bottom==0.0;


    _savetext(){
      if (!_formKey.currentState.validate()) return;
      _formKey.currentState.save();
      setState(() {
        gasMeterNotifier.addGasMeter(GasMeter(_descriptiontx,_quantitytxex,_conditiontxex));
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
                TextFormField(
                  textInputAction: TextInputAction.next,
                  focusNode: _onefocus,
                  onFieldSubmitted: (term) {_fieldFocusChange(context, _onefocus, _twofocus);},
//                  keyboardType: TextInputType.multiline,
//                  maxLines: 4,
                  decoration: InputDecoration(
                      fillColor: Colors.white.withOpacity(0.7),
                      filled: true,
//                      hintText: gasMeterNotifier.gasMeterList.isEmpty ? '':'${gasMeterNotifier.gasMeterList.last.description}',
                      border: UnderlineInputBorder(
                          borderSide: new BorderSide(
                              color: Color(0xff684c4c)
                          )
                      )),
                  validator: (String value) {
                    if (value.isEmpty) {
                      return 'Serial is required';
                    }
                    return null;
                  },
                  initialValue: gasMeterNotifier.gasMeterList.isEmpty ? '':'${gasMeterNotifier.gasMeterList.last.description}',
                  onSaved: (String value){
                    _descriptiontx = value;
                    print('Name: $value');
                  },
                ),
                SizedBox( height: 15,),

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
                                hintText:gasMeterNotifier.gasMeterList.isEmpty ? ' ':'${gasMeterNotifier.gasMeterList.last.quantity}',
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
                                hintText: gasMeterNotifier.gasMeterList.isEmpty ? ' ':'${gasMeterNotifier.gasMeterList.last.colour}',

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

                Row(
                  children: <Widget>[
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      " METER READING",
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
                  textInputAction: TextInputAction.next,
                  focusNode: _twofocus,
                  onFieldSubmitted: (term) {_fieldFocusChange(context, _twofocus, _thrfocus);},
                  decoration: InputDecoration(
                      fillColor: Colors.white.withOpacity(0.7),
                      filled: true,
//                      hintText: gasMeterNotifier.gasMeterList.isEmpty ? ' ':'${gasMeterNotifier.gasMeterList.last.quantity}',
                      border: UnderlineInputBorder(
                          borderSide: new BorderSide(
                              color: Color(0xff684c4c)
                          )
                      )),
                  validator: (String value) {
                    if (value.isEmpty) {
                      return 'Meter Reading is required';
                    }
                    return null;
                  },
                  initialValue: gasMeterNotifier.gasMeterList.isEmpty ? '':'${gasMeterNotifier.gasMeterList.last.quantity}',
                  onSaved: (String value){
                    _quantitytxex = value;
                    print('Name: $value');
                  },
                ),
                SizedBox(height: 20,),
                Row(
                  children: <Widget>[
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      " METER LOCATION",
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
                  focusNode: _thrfocus,
                  onFieldSubmitted: (term){ _thrfocus.unfocus(); },
                  maxLines: 2,
                  decoration: InputDecoration(
                      fillColor: Colors.white.withOpacity(0.7),
                      filled: true,
//                      hintText: gasMeterNotifier.gasMeterList.isEmpty ? ' ':'${gasMeterNotifier.gasMeterList.last.condition}',
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
                  initialValue: gasMeterNotifier.gasMeterList.isEmpty ? '':'${gasMeterNotifier.gasMeterList.last.condition}',
                  onSaved: (String value){
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
                            onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => meterImg(Route: '1',)));
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
                                        height: 49,
                                      ),
                                      Center(
                                          child: Text(gasMeterPhNotifier.gasMeterPhList.isEmpty ? '0': '${gasMeterPhNotifier.gasMeterPhList.length}',
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
              ],
            ),
          ),
          floatingActionButton: showFab ? Stack(
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
                      Navigator.pop(context, MaterialPageRoute(builder: (context) => meterElec()));

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
          ) : null,
        ));
  }

}
