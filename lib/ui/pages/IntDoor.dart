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
import 'package:inventorycheck/ui/pages/Celing.dart';
import 'package:inventorycheck/ui/pages/ExtDoor.dart';
import 'package:inventorycheck/ui/pages/GetImg.dart';
import 'package:provider/provider.dart';

class IntDoor extends StatefulWidget {
  final String Route;
  const IntDoor ({ Key key, this.Route }): super(key: key);
  @override
  _IntDoorState createState() => _IntDoorState();
}

class _IntDoorState extends State<IntDoor> {
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
      case '13':{_title = 'Bedroom 2';} break;
      case '23':{_title = 'Hallway';} break;
      case '33':{_title = 'Bedroom 3';} break;
      case '43':{_title = 'Kitchen';} break;
      case '53':{_title = 'Bedroom';} break;
      case '63':{_title = 'Bedroom 4';} break;
      default:
        {
          print('unable to determine');
        }
        break;
    }
  }

  _route(){

    switch(widget.Route) {
      case '13': { Navigator.push(context, MaterialPageRoute(builder: (context) => Ceiling(Route: '14',))); } break;
      case '23': { Navigator.push(context, MaterialPageRoute(builder: (context) => Ceiling(Route: '24',))); } break;
      case '33': { Navigator.push(context, MaterialPageRoute(builder: (context) => Ceiling(Route: '34',))); } break;
      case '43': { Navigator.push(context, MaterialPageRoute(builder: (context) => Ceiling(Route: '44',))); } break;
      case '53': { Navigator.push(context, MaterialPageRoute(builder: (context) => Ceiling(Route: '54',))); } break;
      case '63': { Navigator.push(context, MaterialPageRoute(builder: (context) => Ceiling(Route: '64',))); } break;

      default:
        {
          print('unable to determine');
        }
        break;
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
          "  INTERIOR DOOR FITTINGS",
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
    ExtIndoorNotifier extIndoorNotifier = Provider.of<ExtIndoorNotifier>(context);
    HalIndoorNotifier halIndoorNotifier = Provider.of<HalIndoorNotifier>(context);
    SmoIndoorNotifier smoIndoorNotifier = Provider.of<SmoIndoorNotifier>(context);
    KitIndoorNotifier kitIndoorNotifier = Provider.of<KitIndoorNotifier>(context);
    BedIndoorNotifier bedIndoorNotifier = Provider.of<BedIndoorNotifier>(context);
    ExtIndoorPhNotifier extIndoorPhNotifier = Provider.of<ExtIndoorPhNotifier>(context);
    HalIndoorPhNotifier halIndoorPhNotifier = Provider.of<HalIndoorPhNotifier>(context);
    SmoIndoorPhNotifier smoIndoorPhNotifier = Provider.of<SmoIndoorPhNotifier>(context);
    KitIndoorPhNotifier kitIndoorPhNotifier = Provider.of<KitIndoorPhNotifier>(context);
    BedIndoorPhNotifier bedIndoorPhNotifier = Provider.of<BedIndoorPhNotifier>(context);
    BdfourIndoorNotifier bdfourIndoorNotifier = Provider.of<BdfourIndoorNotifier>(context);
    BdfourIndoorPhNotifier bdfourIndoorPhNotifier = Provider.of<BdfourIndoorPhNotifier>(context);

    final bool showFab = MediaQuery.of(context).viewInsets.bottom==0.0;

    _ImgCount(){
      switch(widget.Route){
        case '13': {return extIndoorPhNotifier.extIndoorPhList.isNotEmpty ? extIndoorPhNotifier.extIndoorPhList.length : '0';} break;
        case '23': {return halIndoorPhNotifier.halIndoorPhList.isNotEmpty ? halIndoorPhNotifier.halIndoorPhList.length : '0';} break;
        case '33': {return smoIndoorPhNotifier.smoIndoorPhList.isNotEmpty ? smoIndoorPhNotifier.smoIndoorPhList.length : '0';} break;
        case '43': {return kitIndoorPhNotifier.kitIndoorPhList.isNotEmpty ? kitIndoorPhNotifier.kitIndoorPhList.length : '0';} break;
        case '53': {return bedIndoorPhNotifier.bedIndoorPhList.isNotEmpty ? bedIndoorPhNotifier.bedIndoorPhList.length : '0';} break;
        case '63': {return bdfourIndoorPhNotifier.bdfourIndoorPhList.isNotEmpty ? bdfourIndoorPhNotifier.bdfourIndoorPhList.length : '0';} break;
        default: {print('I dont know');} break;
      }
    }


    _savetext(){
      if (!_formKey.currentState.validate()) return;
      _formKey.currentState.save();

      switch(widget.Route) {
        case '13': {
          setState(() {
            extIndoorNotifier.addExtIndoor(ExtIndoor(_descriptiontx,_quantitytxex,_colourtxex,_conditiontxex));
          });        } break;
        case '23': {
          setState(() {
            halIndoorNotifier.addHalIndoor(HalIndoor(_descriptiontx,_quantitytxex,_colourtxex,_conditiontxex));
          });        } break;
        case '33': {
          setState(() {
            smoIndoorNotifier.addSmoIndoor(SmoIndoor(_descriptiontx,_quantitytxex,_colourtxex,_conditiontxex));
          });        } break;
        case '43': {
          setState(() {
            kitIndoorNotifier.addKitIndoor(KitIndoor(_descriptiontx,_quantitytxex,_colourtxex,_conditiontxex));
          });        } break;
        case '53': {
          setState(() {
            bedIndoorNotifier.addBedIndoor(BedIndoor(_descriptiontx,_quantitytxex,_colourtxex,_conditiontxex));
          });        } break;
        case '63': {
          setState(() {
            bdfourIndoorNotifier.addBdfourIndoor(BdfourIndoor(_descriptiontx,_quantitytxex,_colourtxex,_conditiontxex));
          });        } break;
        default: { print('unable to determine');} break;
      }

    }

    _getDesc(){
      switch(widget.Route) {
        case '13': {
          return extIndoorNotifier.extIndoorList.isEmpty ? '' : '${extIndoorNotifier.extIndoorList.last.description}';
        } break;
        case '23': {
          return halIndoorNotifier.halIndoorList.isEmpty ? '' : '${halIndoorNotifier.halIndoorList.last.description}';
        } break;
        case '33': {
          return smoIndoorNotifier.smoIndoorList.isEmpty ? '' : '${smoIndoorNotifier.smoIndoorList.last.description}';
        } break;
        case '43': {
          return kitIndoorNotifier.kitIndoorList.isEmpty ? '' : '${kitIndoorNotifier.kitIndoorList.last.description}';
        } break;
        case '53': {
          return  bedIndoorNotifier.bedIndoorList.isEmpty ? '' : '${bedIndoorNotifier.bedIndoorList.last.description}';
        } break;
        case '63': {
          return  bdfourIndoorNotifier.bdfourIndoorList.isEmpty ? '' : '${bdfourIndoorNotifier.bdfourIndoorList.last.description}';
        } break;
        default:   { print('unable to determine'); } break;
      }

    }
    _getQuan(){
      switch(widget.Route) {
        case '13': {
          return  extIndoorNotifier.extIndoorList.isEmpty ? '' : '${extIndoorNotifier.extIndoorList.last.quantity}';
        } break;
        case '23': {
          return  halIndoorNotifier.halIndoorList.isEmpty ? '' : '${halIndoorNotifier.halIndoorList.last.quantity}';
        } break;
        case '33': {
          return   smoIndoorNotifier.smoIndoorList.isEmpty ? '' : '${smoIndoorNotifier.smoIndoorList.last.quantity}';
        } break;
        case '43': {
          return   kitIndoorNotifier.kitIndoorList.isEmpty ? '' : '${kitIndoorNotifier.kitIndoorList.last.quantity}';
        } break;
        case '53': {
          return   bedIndoorNotifier.bedIndoorList.isEmpty ? '' : '${bedIndoorNotifier.bedIndoorList.last.quantity}';
        } break;
        case '63': {
          return   bdfourIndoorNotifier.bdfourIndoorList.isEmpty ? '' : '${bdfourIndoorNotifier.bdfourIndoorList.last.quantity}';
        } break;
        default:   { print('unable to determine'); } break;
      }
    }
    _getColr(){
      switch(widget.Route) {
        case '13': {
          return   extIndoorNotifier.extIndoorList.isEmpty ? '' : '${extIndoorNotifier.extIndoorList.last.colour}';
        } break;
        case '23': {
          return  halIndoorNotifier.halIndoorList.isEmpty ? '' : '${halIndoorNotifier.halIndoorList.last.colour}';
        } break;
        case '33': {
          return  smoIndoorNotifier.smoIndoorList.isEmpty ? '' : '${smoIndoorNotifier.smoIndoorList.last.colour}';
        } break;
        case '43': {
          return  kitIndoorNotifier.kitIndoorList.isEmpty ? '' : '${kitIndoorNotifier.kitIndoorList.last.colour}';
        } break;
        case '53': {
          return   bedIndoorNotifier.bedIndoorList.isEmpty ? '' : '${bedIndoorNotifier.bedIndoorList.last.colour}';
        } break;
        case '63': {
          return   bdfourIndoorNotifier.bdfourIndoorList.isEmpty ? '' : '${bdfourIndoorNotifier.bdfourIndoorList.last.colour}';
        } break;
        default:   { print('unable to determine'); } break;
      }
    }
    _getCond(){
      switch(widget.Route) {
        case '13': {
          return   extIndoorNotifier.extIndoorList.isEmpty ? '' : '${extIndoorNotifier.extIndoorList.last.condition}';
        } break;
        case '23': {
          return   halIndoorNotifier.halIndoorList.isEmpty ? '' : '${halIndoorNotifier.halIndoorList.last.condition}';
        } break;
        case '33': {
          return   smoIndoorNotifier.smoIndoorList.isEmpty ? '' : '${smoIndoorNotifier.smoIndoorList.last.condition}';
        } break;
        case '43': {
          return   kitIndoorNotifier.kitIndoorList.isEmpty ? '' : '${kitIndoorNotifier.kitIndoorList.last.condition}';
        } break;
        case '53': {
          return  bedIndoorNotifier.bedIndoorList.isEmpty ? '' : '${bedIndoorNotifier.bedIndoorList.last.condition}';
        } break;
        case '63': {
          return  bdfourIndoorNotifier.bdfourIndoorList.isEmpty ? '' : '${bdfourIndoorNotifier.bdfourIndoorList.last.condition}';
        } break;
        default:   { print('unable to determine'); } break;
      }
    }
    _goImg(){
      switch(widget.Route){
        case '13': {return '13p';} break;
        case '23': {return '23p';} break;
        case '33': {return '33p';} break;
        case '43': {return '43p';} break;
        case '53': {return '53p';} break;
        case '63': {return '63p';} break;
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
                            initialValue:_getQuan(),
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
//                  keyboardType: TextInputType.multiline,
                  maxLines: 4,
                  decoration: InputDecoration(
                      fillColor: Colors.white.withOpacity(0.7),
                      filled: true,
                      hintText: _getCond(),
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
                      child: Container(
                          decoration: BoxDecoration(
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

                      Navigator.pop(context, MaterialPageRoute(builder: (context) => ExtDoor()));

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
          ):null,
        ));
  }

  }
