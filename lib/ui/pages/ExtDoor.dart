import 'package:flutter/cupertino.dart';
import 'package:inventorycheck/NotifierList/BdfourPhoto.dart';
import 'package:inventorycheck/NotifierList/BdfourText.dart';
import 'package:inventorycheck/NotifierList/BedroomPhoto.dart';
import 'package:inventorycheck/NotifierList/BedroomText.dart';
import 'package:inventorycheck/NotifierList/ExteriorPhoto.dart';
import 'package:inventorycheck/NotifierList/ExteriorText.dart';
import 'package:inventorycheck/NotifierList/HallwayPhoto.dart';
import 'package:inventorycheck/NotifierList/HallwayText.dart';
import 'package:inventorycheck/NotifierList/KitchenPhoto.dart';
import 'package:inventorycheck/NotifierList/KitchenText.dart';
import 'package:inventorycheck/NotifierList/SmotePhoto.dart';
import 'package:inventorycheck/NotifierList/SmoteText.dart';
import 'package:inventorycheck/notify/textnotifier.dart';
import 'package:flutter/material.dart';
import 'package:inventorycheck/ui/Tansuh.dart';
import 'package:inventorycheck/ui/ImgGallery.dart';
import 'package:inventorycheck/ui/newinventory.dart';
import 'package:inventorycheck/ui/pages/Frames.dart';
import 'package:inventorycheck/ui/pages/GetImg.dart';
import 'package:provider/provider.dart';

import 'IntDoor.dart';

class ExtDoor extends StatefulWidget {
  final String Route;
  const ExtDoor ({ Key key, this.Route }): super(key: key);
  @override
  _ExtDoorState createState() => _ExtDoorState();
}

class _ExtDoorState extends State<ExtDoor> {

  String _title;
  String _descriptiontx;
  String _quantitytxex;
  String _colourtxex;
  String _conditiontxex;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
//switch
    switch(widget.Route) {
      case '12': {_title = 'Bedroom 2'; } break;
      case '22': {_title = 'Hallway'; } break;
      case '32': {_title = 'Bedroom 3'; } break;
      case '42': {_title = 'Kitchen'; } break;
      case '52': {_title = 'Bedroom'; } break;
      case '62': {_title = 'Bedroom 4'; } break;
      default: { print('unable to determine');} break;
    }
  }

  _route(){
    switch(widget.Route) {
      case '12': { Navigator.push(context, MaterialPageRoute(builder: (context) => IntDoor(Route: '13',))); } break;
      case '22': { Navigator.push(context, MaterialPageRoute(builder: (context) => IntDoor(Route: '23',))); } break;
      case '32': { Navigator.push(context, MaterialPageRoute(builder: (context) => IntDoor(Route: '33',))); } break;
      case '42': { Navigator.push(context, MaterialPageRoute(builder: (context) => IntDoor(Route: '43',))); } break;
      case '52': { Navigator.push(context, MaterialPageRoute(builder: (context) => IntDoor(Route: '53',))); } break;
      case '62': { Navigator.push(context, MaterialPageRoute(builder: (context) => IntDoor(Route: '63',))); } break;
      default: { print('unable to determine');} break;
    }
  }



  Widget _buildtitle() {
    return Container(
        padding: EdgeInsets.only(top: 30),
        child: Center(
          child: Text(
            "${_title}",
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
          "  EXTERIOR DOOR FITTINGS",
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

  final FocusNode _onefocus = FocusNode();
  final FocusNode _twofocus = FocusNode();
  final FocusNode _thrfocus = FocusNode();
  final FocusNode _foufocus = FocusNode();

  _fieldFocusChange(BuildContext context, FocusNode currentFocus,FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);}

  @override
  Widget build(BuildContext context) {
    ExtExdoorNotifier extExdoorNotifier = Provider.of<ExtExdoorNotifier>(context);
    HalExdoorNotifier halExdoorNotifier = Provider.of<HalExdoorNotifier>(context);
    SmoExdoorNotifier smoExdoorNotifier = Provider.of<SmoExdoorNotifier>(context);
    KitExdoorNotifier kitExdoorNotifier = Provider.of<KitExdoorNotifier>(context);
    BedExdoorNotifier bedExdoorNotifier = Provider.of<BedExdoorNotifier>(context);

    ExtExdoorPhNotifier extExdoorPhNotifier = Provider.of<ExtExdoorPhNotifier>(context);
    HalExdoorPhNotifier halExdoorPhNotifier = Provider.of<HalExdoorPhNotifier>(context);
    SmoExdoorPhNotifier smoExdoorPhNotifier = Provider.of<SmoExdoorPhNotifier>(context);
    KitExdoorPhNotifier kitExdoorPhNotifier = Provider.of<KitExdoorPhNotifier>(context);
    BedExdoorPhNotifier bedExdoorPhNotifier = Provider.of<BedExdoorPhNotifier>(context);

    BdfourExdoorNotifier bdfourExdoorNotifier = Provider.of<BdfourExdoorNotifier>(context);
    BdfourExdoorPhNotifier bdfourExdoorPhNotifier = Provider.of<BdfourExdoorPhNotifier>(context);

    final bool showFab = MediaQuery.of(context).viewInsets.bottom==0.0;

    _savetext(){
      if (!_formKey.currentState.validate()) return;
      _formKey.currentState.save();

      switch(widget.Route) {
        case '12': {
          setState(() {
            extExdoorNotifier.addExtExdoor(ExtExdoor(_descriptiontx,_quantitytxex,_colourtxex,_conditiontxex));
          });        } break;
        case '22': {
          setState(() {
            halExdoorNotifier.addHalExdoor(HalExdoor(_descriptiontx,_quantitytxex,_colourtxex,_conditiontxex));
          });        } break;
        case '32': {
          setState(() {
            smoExdoorNotifier.addSmoExdoor(SmoExdoor(_descriptiontx,_quantitytxex,_colourtxex,_conditiontxex));
          });        } break;
        case '42': {
          setState(() {
            kitExdoorNotifier.addKitExdoor(KitExdoor(_descriptiontx,_quantitytxex,_colourtxex,_conditiontxex));
          });        } break;
        case '52': {
          setState(() {
            bedExdoorNotifier.addBedExdoor(BedExdoor(_descriptiontx,_quantitytxex,_colourtxex,_conditiontxex));
          });        } break;
        case '62': {
          setState(() {
            bdfourExdoorNotifier.addBdfourExdoor(BdfourExdoor(_descriptiontx,_quantitytxex,_colourtxex,_conditiontxex));
          });        } break;
        default: { print('unable to determine');} break;
      }

    }

    _getDesc(){
      switch(widget.Route) {
        case '12': {
          return extExdoorNotifier.extExdoorList.isEmpty ? '' : '${extExdoorNotifier.extExdoorList.last.description}';
        } break;
        case '22': {
          return halExdoorNotifier.halExdoorList.isEmpty ? '' : '${halExdoorNotifier.halExdoorList.last.description}';
        } break;
        case '32': {
          return smoExdoorNotifier.smoExdoorList.isEmpty ? '' : '${smoExdoorNotifier.smoExdoorList.last.description}';
        } break;
        case '42': {
          return kitExdoorNotifier.kitExdoorList.isEmpty ? '' : '${kitExdoorNotifier.kitExdoorList.last.description}';
        } break;
        case '52': {
          return  bedExdoorNotifier.bedExdoorList.isEmpty ? '' : '${bedExdoorNotifier.bedExdoorList.last.description}';
        } break;
        case '62': {
          return  bdfourExdoorNotifier.bdfourExdoorList.isEmpty ? '' : '${bdfourExdoorNotifier.bdfourExdoorList.last.description}';
        } break;
        default:   { print('unable to determine'); } break;
      }

    }
    _getQuan(){
      switch(widget.Route) {
        case '12': {
          return  extExdoorNotifier.extExdoorList.isEmpty ? '' : '${extExdoorNotifier.extExdoorList.last.quantity}';
        } break;
        case '22': {
          return  halExdoorNotifier.halExdoorList.isEmpty ? '' : '${halExdoorNotifier.halExdoorList.last.quantity}';
        } break;
        case '32': {
          return   smoExdoorNotifier.smoExdoorList.isEmpty ? '' : '${smoExdoorNotifier.smoExdoorList.last.quantity}';
        } break;
        case '42': {
          return   kitExdoorNotifier.kitExdoorList.isEmpty ? '' : '${kitExdoorNotifier.kitExdoorList.last.quantity}';
        } break;
        case '52': {
          return   bedExdoorNotifier.bedExdoorList.isEmpty ? '' : '${bedExdoorNotifier.bedExdoorList.last.quantity}';
        } break;
        case '62': {
          return   bdfourExdoorNotifier.bdfourExdoorList.isEmpty ? '' : '${bdfourExdoorNotifier.bdfourExdoorList.last.quantity}';
        } break;
        default:   { print('unable to determine'); } break;
      }
    }
    _getColr(){
      switch(widget.Route) {
        case '12': {
          return   extExdoorNotifier.extExdoorList.isEmpty ? '' : '${extExdoorNotifier.extExdoorList.last.colour}';
        } break;
        case '22': {
          return  halExdoorNotifier.halExdoorList.isEmpty ? '' : '${halExdoorNotifier.halExdoorList.last.colour}';
        } break;
        case '32': {
          return  smoExdoorNotifier.smoExdoorList.isEmpty ? '' : '${smoExdoorNotifier.smoExdoorList.last.colour}';
        } break;
        case '42': {
          return  kitExdoorNotifier.kitExdoorList.isEmpty ? '' : '${kitExdoorNotifier.kitExdoorList.last.colour}';
        } break;
        case '52': {
          return   bedExdoorNotifier.bedExdoorList.isEmpty ? '' : '${bedExdoorNotifier.bedExdoorList.last.colour}';
        } break;
        case '62': {
          return   bdfourExdoorNotifier.bdfourExdoorList.isEmpty ? '' : '${bdfourExdoorNotifier.bdfourExdoorList.last.colour}';
        } break;
        default:   { print('unable to determine'); } break;
      }
    }
    _getCond(){
      switch(widget.Route) {
        case '12': {
          return   extExdoorNotifier.extExdoorList.isEmpty ? '' : '${extExdoorNotifier.extExdoorList.last.condition}';
        } break;
        case '22': {
          return   halExdoorNotifier.halExdoorList.isEmpty ? '' : '${halExdoorNotifier.halExdoorList.last.condition}';
        } break;
        case '32': {
          return   smoExdoorNotifier.smoExdoorList.isEmpty ? '' : '${smoExdoorNotifier.smoExdoorList.last.condition}';
        } break;
        case '42': {
          return   kitExdoorNotifier.kitExdoorList.isEmpty ? '' : '${kitExdoorNotifier.kitExdoorList.last.condition}';
        } break;
        case '52': {
          return  bedExdoorNotifier.bedExdoorList.isEmpty ? '' : '${bedExdoorNotifier.bedExdoorList.last.condition}';
        } break;
        case '62': {
          return  bdfourExdoorNotifier.bdfourExdoorList.isEmpty ? '' : '${bdfourExdoorNotifier.bdfourExdoorList.last.condition}';
        } break;
        default:   { print('unable to determine'); } break;
      }
    }
    _goImg(){
      switch(widget.Route){
        case '12': {return '12p';} break;
        case '22': {return '22p';} break;
        case '32': {return '32p';} break;
        case '42': {return '42p';} break;
        case '52': {return '52p';} break;
        case '62': {return '62p';} break;
        default: {print('I dont know');} break;
      }
    }
    _ImgCount(){
      switch(widget.Route){
        case '12': {return extExdoorPhNotifier.extExdoorPhList.isNotEmpty ? extExdoorPhNotifier.extExdoorPhList.length : '0';} break;
        case '22': {return halExdoorPhNotifier.halExdoorPhList.isNotEmpty ? halExdoorPhNotifier.halExdoorPhList.length : '0';} break;
        case '32': {return smoExdoorPhNotifier.smoExdoorPhList.isNotEmpty ? smoExdoorPhNotifier.smoExdoorPhList.length : '0';} break;
        case '42': {return kitExdoorPhNotifier.kitExdoorPhList.isNotEmpty ? kitExdoorPhNotifier.kitExdoorPhList.length : '0';} break;
        case '52': {return bedExdoorPhNotifier.bedExdoorPhList.isNotEmpty ? bedExdoorPhNotifier.bedExdoorPhList.length : '0';} break;
        case '62': {return bdfourExdoorPhNotifier.bdfourExdoorPhList.isNotEmpty ? bdfourExdoorPhNotifier.bdfourExdoorPhList.length : '0';} break;
        default: {print('I dont know');} break;
      }
    }


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

                  keyboardType: TextInputType.multiline,
                  maxLines: 4,
                  decoration: InputDecoration(
                      fillColor: Colors.white.withOpacity(0.7),
                      filled: true,
//                      hintText: _getDesc(),
                      border: UnderlineInputBorder(
                          borderSide: new BorderSide(
                              color: Color(0xff684c4c)
                          )
                      )),
                  validator: (String value) {
                    if (value.isEmpty) {
                      return 'Description is required';
                    }
                    return null;
                  },
                  initialValue: _getDesc(),
                  onSaved: (String value){
                    _descriptiontx = value;
                    print('Name: $value');
                  },
                ),
                SizedBox( height: 15,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
//                      width: MediaQuery.of(context).copyWith().size.width / 4,
//                      height: MediaQuery.of(context).copyWith().size.height / 10,
                      width: 140,
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
                            textInputAction: TextInputAction.next,
                            focusNode: _twofocus,
                            onFieldSubmitted: (term) {_fieldFocusChange(context, _twofocus, _thrfocus);},
                            decoration: InputDecoration(
//                                hintText: _getQuan(),
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
                            initialValue: _getQuan(),
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
                      width: 170,
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
                            textInputAction: TextInputAction.next,
                            focusNode: _thrfocus,
                            onFieldSubmitted: (term) {_fieldFocusChange(context, _thrfocus, _foufocus);},
                            decoration: InputDecoration(
//                                hintText: _getColr(),

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
                            initialValue: _getColr(),
                            onSaved: (String value){
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
                SizedBox(height: 5,),
                TextFormField(
                  textInputAction: TextInputAction.done,
                  focusNode: _foufocus,
                  onFieldSubmitted: (term){ _foufocus.unfocus(); },

                  keyboardType: TextInputType.multiline,
                  maxLines: 4,
                  decoration: InputDecoration(
                      fillColor: Colors.white.withOpacity(0.7),
                      filled: true,
//                      hintText: _getCond(),
                      border: UnderlineInputBorder(
                          borderSide: new BorderSide(
                              color: Color(0xff684c4c)
                          )
                      )),
                  validator: (String value) {
                    if (value.isEmpty) {
                      return 'Condition is required';
                    }
                    return null;
                  },
                  initialValue: _getCond(),
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
                            onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => GetImg(Route: _goImg(),)));
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
                                          child: Text(
                                            _ImgCount().toString(),

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
          floatingActionButton:showFab ? Stack(
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

                      Navigator.pop(context, MaterialPageRoute(builder: (context) => Frames()));

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
                    _route();
                  },
                  foregroundColor: Colors.white,
                  child: Icon(Icons.arrow_forward_ios),
                ),
              ),
            ],
          ): null,
        ));
  }

  }
