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
import 'package:inventorycheck/ui/Category.dart';
import 'package:inventorycheck/ui/Tansuh.dart';
import 'package:inventorycheck/ui/ImgGallery.dart';
import 'package:inventorycheck/ui/newinventory.dart';
import 'package:inventorycheck/ui/pages/ExtDoor.dart';
import 'package:inventorycheck/ui/pages/GetImg.dart';
import 'package:provider/provider.dart';

class Frames extends StatefulWidget {
  final String Route;
  const Frames ({ Key key, this.Route }): super(key: key);

  @override
  _FramesState createState() => _FramesState();
}

class _FramesState extends State<Frames> {
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
    switch(widget.Route) {
      case '11':{_title = 'Bedroom 2'; } break;
      case '21':{_title = 'Hallway'; } break;
      case '31':{_title = 'Bedroom 3'; } break;
      case '41':{_title = 'Kitchen'; } break;
      case '51':{_title = 'Bedroom'; } break;
      case '61':{_title = 'Bedroom 4'; } break;
      case '71':{_title = 'Meter Reading 71'; } break;
      default: {print('unable to determine'); } break;
    }
  }

  _route(){
    switch(widget.Route) {
      case '11': { Navigator.push(context, MaterialPageRoute(builder: (context) => ExtDoor(Route: '12',))); } break;
      case '21': { Navigator.push(context, MaterialPageRoute(builder: (context) => ExtDoor(Route: '22',))); } break;
      case '31': { Navigator.push(context, MaterialPageRoute(builder: (context) => ExtDoor(Route: '32',))); } break;
      case '41': { Navigator.push(context, MaterialPageRoute(builder: (context) => ExtDoor(Route: '42',))); } break;
      case '51': { Navigator.push(context, MaterialPageRoute(builder: (context) => ExtDoor(Route: '52',))); } break;
      case '61': { Navigator.push(context, MaterialPageRoute(builder: (context) => ExtDoor(Route: '62',))); } break;
      case '71': { Navigator.push(context, MaterialPageRoute(builder: (context) => ExtDoor(Route: '72',))); } break;
      default:   { print('unable to determine'); } break;
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
        child: Container(
//          padding: EdgeInsets.only(top: 9),
          child: Text(
            "DOORS AND FRAMES",
            style: TextStyle(
              color: Color(0xff684c4c),
              fontFamily: 'alice',
              fontSize: 23,
              fontWeight: FontWeight.bold,
            ),
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
    ExtFrameNotifier extFrameNotifier = Provider.of<ExtFrameNotifier>(context);
    HalFrameNotifier halFrameNotifier = Provider.of<HalFrameNotifier>(context);
    SmoFrameNotifier smoFrameNotifier = Provider.of<SmoFrameNotifier>(context);
    KitFrameNotifier kitFrameNotifier = Provider.of<KitFrameNotifier>(context);
    BedFrameNotifier bedFrameNotifier = Provider.of<BedFrameNotifier>(context);

    ExtFramePhNotifier extFramePhNotifier = Provider.of<ExtFramePhNotifier>(context);
    HalFramePhNotifier halFramePhNotifier = Provider.of<HalFramePhNotifier>(context);
    SmoFramePhNotifier smoFramePhNotifier = Provider.of<SmoFramePhNotifier>(context);
    KitFramePhNotifier kitFramePhNotifier = Provider.of<KitFramePhNotifier>(context);
    BedFramePhNotifier bedFramePhNotifier = Provider.of<BedFramePhNotifier>(context);
    BdfourFrameNotifier bdfourFrameNotifier = Provider.of<BdfourFrameNotifier>(context);
    BdfourFramePhNotifier bdfourFramePhNotifier = Provider.of<BdfourFramePhNotifier>(context);

    final bool showFab = MediaQuery.of(context).viewInsets.bottom==0.0;


    _savetext(){
      if (!_formKey.currentState.validate()) return;
           _formKey.currentState.save();

      switch(widget.Route) {
        case '11': {
          setState(() {
            extFrameNotifier.addExtFrame(ExtFrame(_descriptiontx,_quantitytxex,_colourtxex,_conditiontxex));
          });        } break;
        case '21': {
          setState(() {
            halFrameNotifier.addHalFrame(HalFrame(_descriptiontx,_quantitytxex,_colourtxex,_conditiontxex));
          });        } break;
        case '31': {
          setState(() {
            smoFrameNotifier.addSmoFrame(SmoFrame(_descriptiontx,_quantitytxex,_colourtxex,_conditiontxex));
          });        } break;
        case '41': {
          setState(() {
            kitFrameNotifier.addKitFrame(KitFrame(_descriptiontx,_quantitytxex,_colourtxex,_conditiontxex));
          });        } break;
        case '51': {
          setState(() {
            bedFrameNotifier.addBedFrame(BedFrame(_descriptiontx,_quantitytxex,_colourtxex,_conditiontxex));
          });        } break;
        case '61': {
          setState(() {
            bdfourFrameNotifier.addBdfourFrame(BdfourFrame(_descriptiontx,_quantitytxex,_colourtxex,_conditiontxex));
          });        } break;
        default: { print('unable to determine');} break;
      }

    }

    _getDesc(){
      switch(widget.Route) {
        case '11': {
          return extFrameNotifier.extFrameList.isEmpty ? '' : '${extFrameNotifier.extFrameList.last.description}';
        } break;
        case '21': {
          return halFrameNotifier.halFrameList.isEmpty ? '' : '${halFrameNotifier.halFrameList.last.description}';
        } break;
        case '31': {
          return smoFrameNotifier.smoFrameList.isEmpty ? '' : '${smoFrameNotifier.smoFrameList.last.description}';
        } break;
        case '41': {
          return kitFrameNotifier.kitFrameList.isEmpty ? '' : '${kitFrameNotifier.kitFrameList.last.description}';
        } break;
        case '51': {
          return  bedFrameNotifier.bedFrameList.isEmpty ? '' : '${bedFrameNotifier.bedFrameList.last.description}';
        } break;
        case '61': {
          return  bdfourFrameNotifier.bdfourFrameList.isEmpty ? '' : '${bdfourFrameNotifier.bdfourFrameList.last.description}';
        } break;
         default:   { print('unable to determine'); } break;
      }

    }
    _getQuan(){
      switch(widget.Route) {
        case '11': {
          return  extFrameNotifier.extFrameList.isEmpty ? '' : '${extFrameNotifier.extFrameList.last.quantity}';
        } break;
        case '21': {
          return  halFrameNotifier.halFrameList.isEmpty ? '' : '${halFrameNotifier.halFrameList.last.quantity}';
        } break;
        case '31': {
          return   smoFrameNotifier.smoFrameList.isEmpty ? '' : '${smoFrameNotifier.smoFrameList.last.quantity}';
        } break;
        case '41': {
          return   kitFrameNotifier.kitFrameList.isEmpty ? '' : '${kitFrameNotifier.kitFrameList.last.quantity}';
        } break;
        case '51': {
          return   bedFrameNotifier.bedFrameList.isEmpty ? '' : '${bedFrameNotifier.bedFrameList.last.quantity}';
        } break;
        case '61': {
          return   bdfourFrameNotifier.bdfourFrameList.isEmpty ? '' : '${bdfourFrameNotifier.bdfourFrameList.last.quantity}';
        } break;
        default:   { print('unable to determine'); } break;
      }
    }
    _getColr(){
      switch(widget.Route) {
        case '11': {
          return   extFrameNotifier.extFrameList.isEmpty ? ' ' : '${extFrameNotifier.extFrameList.last.colour}';
        } break;
        case '21': {
          return  halFrameNotifier.halFrameList.isEmpty ? ' ' : '${halFrameNotifier.halFrameList.last.colour}';
        } break;
        case '31': {
          return  smoFrameNotifier.smoFrameList.isEmpty ? ' ' : '${smoFrameNotifier.smoFrameList.last.colour}';
        } break;
        case '41': {
          return  kitFrameNotifier.kitFrameList.isEmpty ? ' ' : '${kitFrameNotifier.kitFrameList.last.colour}';
        } break;
        case '51': {
          return   bedFrameNotifier.bedFrameList.isEmpty ? ' ' : '${bedFrameNotifier.bedFrameList.last.colour}';
        } break;
        case '61': {
          return   bdfourFrameNotifier.bdfourFrameList.isEmpty ? '' : '${bdfourFrameNotifier.bdfourFrameList.last.colour}';
        } break;
        default:   { print('unable to determine'); } break;
      }
    }
    _getCond(){
      switch(widget.Route) {
        case '11': {
          return   extFrameNotifier.extFrameList.isEmpty ? '' : '${extFrameNotifier.extFrameList.last.condition}';
        } break;
        case '21': {
          return   halFrameNotifier.halFrameList.isEmpty ? '' : '${halFrameNotifier.halFrameList.last.condition}';
        } break;
        case '31': {
          return   smoFrameNotifier.smoFrameList.isEmpty ? '' : '${smoFrameNotifier.smoFrameList.last.condition}';
        } break;
        case '41': {
          return   kitFrameNotifier.kitFrameList.isEmpty ? '' : '${kitFrameNotifier.kitFrameList.last.condition}';
        } break;
        case '51': {
          return  bedFrameNotifier.bedFrameList.isEmpty ? '' : '${bedFrameNotifier.bedFrameList.last.condition}';
        } break;
        case '61': {
          return  bdfourFrameNotifier.bdfourFrameList.isEmpty ? '' : '${bdfourFrameNotifier.bdfourFrameList.last.condition}';
        } break;
        default:   { print('unable to determine'); } break;
      }
    }
    _goImg(){
      switch(widget.Route){
        case '11': {return '11p';} break;
        case '21': {return '21p';} break;
        case '31': {return '31p';} break;
        case '41': {return '41p';} break;
        case '51': {return '51p';} break;
        case '61': {return '61p';} break;
        default: {print('I dont know');} break;
      }
}
    _ImgCount(){
      switch(widget.Route){
        case '11': {return extFramePhNotifier.extFramePhList.isNotEmpty ? extFramePhNotifier.extFramePhList.length : '0';} break;
        case '21': {return halFramePhNotifier.halFramePhList.isNotEmpty ? halFramePhNotifier.halFramePhList.length : '0';} break;
        case '31': {return smoFramePhNotifier.smoFramePhList.isNotEmpty ? smoFramePhNotifier.smoFramePhList.length : '0';} break;
        case '41': {return kitFramePhNotifier.kitFramePhList.isNotEmpty ? kitFramePhNotifier.kitFramePhList.length : '0';} break;
        case '51': {return bedFramePhNotifier.bedFramePhList.isNotEmpty ? bedFramePhNotifier.bedFramePhList.length : '0';} break;
        case '61': {return bdfourFramePhNotifier.bdfourFramePhList.isNotEmpty ? bdfourFramePhNotifier.bdfourFramePhList.length : '0';} break;
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
//                       hintText: _getDesc(),
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
//                Text( extFrameNotifier.extFrameList.isEmpty.toString() ?? 'list is empty'),
                Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top:5.0),
                      child: Container(
                          decoration: BoxDecoration(
                            borderRadius: new BorderRadius.only(
                                topLeft: const Radius.circular(50.0),
                                topRight: const Radius.circular(50.0),
                                bottomLeft: const Radius.circular(50.0),
                                bottomRight: const Radius.circular(50.0)),
                            color: Color(0xff684c4c).withOpacity(0.3),
//                            border: new Border.all(color: Colors.blueGrey),
//                            boxShadow: [
//                              BoxShadow(
//                                color: Color(0xff684c4c).withOpacity(0.5),
//                                spreadRadius: 0,
//                                offset: Offset(1, 1),
//                              ),
//                            ],
                          ),
                          width: 80,
                          height: 80,

                          child: InkWell(
                            onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => GetImg(Route: _goImg(),)));
 },
                            child: Stack(
                              children: <Widget>[
                                CircleAvatar(

                                  backgroundColor: Colors.transparent,
                                  radius: 38,
                                  child: Image.asset('assets/cam.png',),
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
                      Navigator.pop(context, MaterialPageRoute(builder: (context) => Category()));

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
          ) : null,
        ));
  }

  }
