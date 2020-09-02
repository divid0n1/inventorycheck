import 'package:flutter/cupertino.dart';
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
import 'package:inventorycheck/ui/pages/GetImg.dart';
import 'package:inventorycheck/ui/pages/Walls.dart';
import 'package:provider/provider.dart';

class Windows extends StatefulWidget {
  final String Route;
  const Windows ({ Key key, this.Route }): super(key: key);
  @override
  _WindowsState createState() => _WindowsState();
}

class _WindowsState extends State<Windows> {
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
      case '17': { _title = 'Exterior'; } break;
      case '27': { _title = 'Hallway'; } break;
      case '37': { _title = 'Smote Detector'; } break;
      case '47': { _title = 'Kitchen'; } break;
      case '57': { _title = 'Bedroom'; } break;

      default:
        {
          print('unable to determine');
        }
        break;
    }
  }

  _route(){

    switch(widget.Route) {
      case '17': { Navigator.push(context, MaterialPageRoute(builder: (context) => Category(Route: '1',))); } break;
      case '27': { Navigator.push(context, MaterialPageRoute(builder: (context) => Category(Route: '2',))); } break;
      case '37': { Navigator.push(context, MaterialPageRoute(builder: (context) => Category(Route: '3',))); } break;
      case '47': { Navigator.push(context, MaterialPageRoute(builder: (context) => Category(Route: '4',))); } break;
      case '57': { Navigator.push(context, MaterialPageRoute(builder: (context) => Category(Route: '5',))); } break;

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
          "  WINDOWS",
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

    ExtWindowsNotifier extWindowsNotifier = Provider.of<ExtWindowsNotifier>(context);
    HalWindowsNotifier halWindowsNotifier = Provider.of<HalWindowsNotifier>(context);
    SmoWindowsNotifier smoWindowsNotifier = Provider.of<SmoWindowsNotifier>(context);
    KitWindowsNotifier kitWindowsNotifier = Provider.of<KitWindowsNotifier>(context);
    BedWindowsNotifier bedWindowsNotifier = Provider.of<BedWindowsNotifier>(context);
    ExtWindowsPhNotifier extWindowsPhNotifier = Provider.of<ExtWindowsPhNotifier>(context);
    HalWindowsPhNotifier halWindowsPhNotifier = Provider.of<HalWindowsPhNotifier>(context);
    SmoWindowsPhNotifier smoWindowsPhNotifier = Provider.of<SmoWindowsPhNotifier>(context);
    KitWindowsPhNotifier kitWindowsPhNotifier = Provider.of<KitWindowsPhNotifier>(context);
    BedWindowsPhNotifier bedWindowsPhNotifier = Provider.of<BedWindowsPhNotifier>(context);
    _ImgCount(){
      switch(widget.Route){
        case '17': {return extWindowsPhNotifier.extWindowsPhList.isNotEmpty ? extWindowsPhNotifier.extWindowsPhList.length : '0';} break;
        case '27': {return halWindowsPhNotifier.halWindowsPhList.isNotEmpty ? halWindowsPhNotifier.halWindowsPhList.length : '0';} break;
        case '37': {return smoWindowsPhNotifier.smoWindowsPhList.isNotEmpty ? smoWindowsPhNotifier.smoWindowsPhList.length : '0';} break;
        case '47': {return kitWindowsPhNotifier.kitWindowsPhList.isNotEmpty ? kitWindowsPhNotifier.kitWindowsPhList.length : '0';} break;
        case '57': {return bedWindowsPhNotifier.bedWindowsPhList.isNotEmpty ? bedWindowsPhNotifier.bedWindowsPhList.length : '0';} break;
        default: {print('I dont know');} break;
      }
    }

    final bool showFab = MediaQuery.of(context).viewInsets.bottom==0.0;

    _savetext(){
      if (!_formKey.currentState.validate()) return;
      _formKey.currentState.save();

      switch(widget.Route) {
        case '17': {
          setState(() {
            extWindowsNotifier.addExtWindows(ExtWindows(_descriptiontx,_quantitytxex,_colourtxex,_conditiontxex));
          });        } break;
        case '27': {
          setState(() {
            halWindowsNotifier.addHalWindows(HalWindows(_descriptiontx,_quantitytxex,_colourtxex,_conditiontxex));
          });        } break;
        case '37': {
          setState(() {
            smoWindowsNotifier.addSmoWindows(SmoWindows(_descriptiontx,_quantitytxex,_colourtxex,_conditiontxex));
          });        } break;
        case '47': {
          setState(() {
            kitWindowsNotifier.addKitWindows(KitWindows(_descriptiontx,_quantitytxex,_colourtxex,_conditiontxex));
          });        } break;
        case '57': {
          setState(() {
            bedWindowsNotifier.addBedWindows(BedWindows(_descriptiontx,_quantitytxex,_colourtxex,_conditiontxex));
          });        } break;
        default: { print('unable to determine');} break;
      }

    }

    _getDesc(){
      switch(widget.Route) {
        case '17': {
          return extWindowsNotifier.extWindowsList.isEmpty ? '' : '${extWindowsNotifier.extWindowsList.last.description}';
        } break;
        case '27': {
          return halWindowsNotifier.halWindowsList.isEmpty ? '' : '${halWindowsNotifier.halWindowsList.last.description}';
        } break;
        case '37': {
          return smoWindowsNotifier.smoWindowsList.isEmpty ? '' : '${smoWindowsNotifier.smoWindowsList.last.description}';
        } break;
        case '47': {
          return kitWindowsNotifier.kitWindowsList.isEmpty ? '' : '${kitWindowsNotifier.kitWindowsList.last.description}';
        } break;
        case '57': {
          return  bedWindowsNotifier.bedWindowsList.isEmpty ? '' : '${bedWindowsNotifier.bedWindowsList.last.description}';
        } break;
        default:   { print('unable to determine'); } break;
      }

    }
    _getQuan(){
      switch(widget.Route) {
        case '17': {
          return extWindowsNotifier.extWindowsList.isEmpty ? '' : '${extWindowsNotifier.extWindowsList.last.quantity}';
        } break;
        case '27': {
          return halWindowsNotifier.halWindowsList.isEmpty ? '' : '${halWindowsNotifier.halWindowsList.last.quantity}';
        } break;
        case '37': {
          return smoWindowsNotifier.smoWindowsList.isEmpty ? '' : '${smoWindowsNotifier.smoWindowsList.last.quantity}';
        } break;
        case '47': {
          return kitWindowsNotifier.kitWindowsList.isEmpty ? '' : '${kitWindowsNotifier.kitWindowsList.last.quantity}';
        } break;
        case '57': {
          return  bedWindowsNotifier.bedWindowsList.isEmpty ? '' : '${bedWindowsNotifier.bedWindowsList.last.quantity}';
        } break;
        default:   { print('unable to determine'); } break;
      }
    }
    _getColr(){
      switch(widget.Route) {
        case '17': {
          return extWindowsNotifier.extWindowsList.isEmpty ? '' : '${extWindowsNotifier.extWindowsList.last.colour}';
        } break;
        case '27': {
          return halWindowsNotifier.halWindowsList.isEmpty ? '' : '${halWindowsNotifier.halWindowsList.last.colour}';
        } break;
        case '37': {
          return smoWindowsNotifier.smoWindowsList.isEmpty ? '' : '${smoWindowsNotifier.smoWindowsList.last.colour}';
        } break;
        case '47': {
          return kitWindowsNotifier.kitWindowsList.isEmpty ? '' : '${kitWindowsNotifier.kitWindowsList.last.colour}';
        } break;
        case '57': {
          return  bedWindowsNotifier.bedWindowsList.isEmpty ? '' : '${bedWindowsNotifier.bedWindowsList.last.colour}';
        } break;
        default:   { print('unable to determine'); } break;
      }
    }
    _getCond(){
      switch(widget.Route) {
        case '17': {
          return extWindowsNotifier.extWindowsList.isEmpty ? '' : '${extWindowsNotifier.extWindowsList.last.condition}';
        } break;
        case '27': {
          return halWindowsNotifier.halWindowsList.isEmpty ? '' : '${halWindowsNotifier.halWindowsList.last.condition}';
        } break;
        case '37': {
          return smoWindowsNotifier.smoWindowsList.isEmpty ? '' : '${smoWindowsNotifier.smoWindowsList.last.condition}';
        } break;
        case '47': {
          return kitWindowsNotifier.kitWindowsList.isEmpty ? '' : '${kitWindowsNotifier.kitWindowsList.last.condition}';
        } break;
        case '57': {
          return  bedWindowsNotifier.bedWindowsList.isEmpty ? '' : '${bedWindowsNotifier.bedWindowsList.last.condition}';
        } break;
        default:   { print('unable to determine'); } break;
      }
    }
    _goImg(){
      switch(widget.Route){
        case '17': {return '17p';} break;
        case '27': {return '27p';} break;
        case '37': {return '37p';} break;
        case '47': {return '47p';} break;
        case '57': {return '57p';} break;
        default: {print('I dont know');} break;
      }
    }

    Widget _buildformdescritpion (){
      ExteriorNotifier exteriorNotifier = Provider.of<ExteriorNotifier>(context);
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
                  onFieldSubmitted: (term) {_fieldFocusChange(context, _onefocus, _twofocus);},                  maxLines: 4,
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
                            initialValue:  _getColr(),
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
                                        height: 42,
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

                      Navigator.pop(context, MaterialPageRoute(builder: (context) => Walls()));

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
