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
import 'package:inventorycheck/ui/Tansuh.dart';
import 'package:inventorycheck/ui/ImgGallery.dart';
import 'package:inventorycheck/ui/newinventory.dart';
import 'package:inventorycheck/ui/pages/Celing.dart';
import 'package:inventorycheck/ui/pages/GetImg.dart';
import 'package:inventorycheck/ui/pages/Walls.dart';
import 'package:provider/provider.dart';

class Light extends StatefulWidget {
  final String Route;
  const Light ({ Key key, this.Route }): super(key: key);
  @override
  _LightState createState() => _LightState();
}

class _LightState extends State<Light> {

  String _descriptiontx;
  String _quantitytxex;
  String _colourtxex;
  String _conditiontxex;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _title;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
//switch
    switch(widget.Route) {
      case '15': { _title = 'Exterior'; } break;
      case '25': { _title = 'Hallway'; } break;
      case '35': { _title = 'Smote Detector'; } break;
      case '45': { _title = 'Kitchen'; } break;
      case '55': { _title = 'Bedroom'; } break;
      default:
        {
          print('unable to determine');
        }
        break;
    }
  }
  _route(){

    switch(widget.Route) {
      case '15': { Navigator.push(context, MaterialPageRoute(builder: (context) => Walls(Route: '16',))); } break;
      case '25': { Navigator.push(context, MaterialPageRoute(builder: (context) => Walls(Route: '26',))); } break;
      case '35': { Navigator.push(context, MaterialPageRoute(builder: (context) => Walls(Route: '36',))); } break;
      case '45': { Navigator.push(context, MaterialPageRoute(builder: (context) => Walls(Route: '46',))); } break;
      case '55': { Navigator.push(context, MaterialPageRoute(builder: (context) => Walls(Route: '56',))); } break;

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
          "LIGHT",
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

    ExtLightNotifier extLightNotifier = Provider.of<ExtLightNotifier>(context);
    HalLightNotifier halLightNotifier = Provider.of<HalLightNotifier>(context);
    SmoLightNotifier smoLightNotifier = Provider.of<SmoLightNotifier>(context);
    KitLightNotifier kitLightNotifier = Provider.of<KitLightNotifier>(context);
    BedLightNotifier bedLightNotifier = Provider.of<BedLightNotifier>(context);
    ExtLightPhNotifier extLightPhNotifier = Provider.of<ExtLightPhNotifier>(context);
    HalLightPhNotifier halLightPhNotifier = Provider.of<HalLightPhNotifier>(context);
    SmoLightPhNotifier smoLightPhNotifier = Provider.of<SmoLightPhNotifier>(context);
    KitLightPhNotifier kitLightPhNotifier = Provider.of<KitLightPhNotifier>(context);
    BedLightPhNotifier bedLightPhNotifier = Provider.of<BedLightPhNotifier>(context);
    final bool showFab = MediaQuery.of(context).viewInsets.bottom==0.0;
    _ImgCount(){
      switch(widget.Route){
        case '15': {return extLightPhNotifier.extLightPhList.isNotEmpty ? extLightPhNotifier.extLightPhList.length : '0';} break;
        case '25': {return halLightPhNotifier.halLightPhList.isNotEmpty ? halLightPhNotifier.halLightPhList.length : '0';} break;
        case '35': {return smoLightPhNotifier.smoLightPhList.isNotEmpty ? smoLightPhNotifier.smoLightPhList.length : '0';} break;
        case '45': {return kitLightPhNotifier.kitLightPhList.isNotEmpty ? kitLightPhNotifier.kitLightPhList.length : '0';} break;
        case '55': {return bedLightPhNotifier.bedLightPhList.isNotEmpty ? bedLightPhNotifier.bedLightPhList.length : '0';} break;
        default: {print('I dont know');} break;
      }
    }

    _savetext(){
      if (!_formKey.currentState.validate()) return;
      _formKey.currentState.save();

      switch(widget.Route) {
        case '15': {
          setState(() {
            extLightNotifier.addExtLight(ExtLight(_descriptiontx,_quantitytxex,_colourtxex,_conditiontxex));
          });        } break;
        case '25': {
          setState(() {
            halLightNotifier.addHalLight(HalLight(_descriptiontx,_quantitytxex,_colourtxex,_conditiontxex));
          });        } break;
        case '35': {
          setState(() {
            smoLightNotifier.addSmoLight(SmoLight(_descriptiontx,_quantitytxex,_colourtxex,_conditiontxex));
          });        } break;
        case '45': {
          setState(() {
            kitLightNotifier.addKitLight(KitLight(_descriptiontx,_quantitytxex,_colourtxex,_conditiontxex));
          });        } break;
        case '55': {
          setState(() {
            bedLightNotifier.addBedLight(BedLight(_descriptiontx,_quantitytxex,_colourtxex,_conditiontxex));
          });        } break;
        default: { print('unable to determine');} break;
      }

    }

    _getDesc(){
      switch(widget.Route) {
        case '15': {
          return extLightNotifier.extLightList.isEmpty ? '' : '${extLightNotifier.extLightList.last.description}';
        } break;
        case '25': {
          return halLightNotifier.halLightList.isEmpty ? '' : '${halLightNotifier.halLightList.last.description}';
        } break;
        case '35': {
          return smoLightNotifier.smoLightList.isEmpty ? '' : '${smoLightNotifier.smoLightList.last.description}';
        } break;
        case '45': {
          return kitLightNotifier.kitLightList.isEmpty ? '' : '${kitLightNotifier.kitLightList.last.description}';
        } break;
        case '55': {
          return  bedLightNotifier.bedLightList.isEmpty ? '' : '${bedLightNotifier.bedLightList.last.description}';
        } break;
        default:   { print('unable to determine'); } break;
      }

    }
    _getQuan(){
      switch(widget.Route) {
        case '15': {
          return extLightNotifier.extLightList.isEmpty ? '' : '${extLightNotifier.extLightList.last.quantity}';
        } break;
        case '25': {
          return halLightNotifier.halLightList.isEmpty ? '' : '${halLightNotifier.halLightList.last.quantity}';
        } break;
        case '35': {
          return smoLightNotifier.smoLightList.isEmpty ? '' : '${smoLightNotifier.smoLightList.last.quantity}';
        } break;
        case '45': {
          return kitLightNotifier.kitLightList.isEmpty ? '' : '${kitLightNotifier.kitLightList.last.quantity}';
        } break;
        case '55': {
          return  bedLightNotifier.bedLightList.isEmpty ? '' : '${bedLightNotifier.bedLightList.last.quantity}';
        } break;
        default:   { print('unable to determine'); } break;
      }
    }
    _getColr(){
      switch(widget.Route) {
        case '15': {
          return extLightNotifier.extLightList.isEmpty ? '' : '${extLightNotifier.extLightList.last.colour}';
        } break;
        case '25': {
          return halLightNotifier.halLightList.isEmpty ? '' : '${halLightNotifier.halLightList.last.colour}';
        } break;
        case '35': {
          return smoLightNotifier.smoLightList.isEmpty ? '' : '${smoLightNotifier.smoLightList.last.colour}';
        } break;
        case '45': {
          return kitLightNotifier.kitLightList.isEmpty ? '' : '${kitLightNotifier.kitLightList.last.colour}';
        } break;
        case '55': {
          return  bedLightNotifier.bedLightList.isEmpty ? '' : '${bedLightNotifier.bedLightList.last.colour}';
        } break;
        default:   { print('unable to determine'); } break;
      }
    }
    _getCond(){
      switch(widget.Route) {
        case '15': {
          return extLightNotifier.extLightList.isEmpty ? '' : '${extLightNotifier.extLightList.last.condition}';
        } break;
        case '25': {
          return halLightNotifier.halLightList.isEmpty ? '' : '${halLightNotifier.halLightList.last.condition}';
        } break;
        case '35': {
          return smoLightNotifier.smoLightList.isEmpty ? '' : '${smoLightNotifier.smoLightList.last.condition}';
        } break;
        case '45': {
          return kitLightNotifier.kitLightList.isEmpty ? '' : '${kitLightNotifier.kitLightList.last.condition}';
        } break;
        case '55': {
          return  bedLightNotifier.bedLightList.isEmpty ? '' : '${bedLightNotifier.bedLightList.last.condition}';
        } break;
        default:   { print('unable to determine'); } break;
      }
    }
    _goImg(){
      switch(widget.Route){
        case '15': {return '15p';} break;
        case '25': {return '25p';} break;
        case '35': {return '35p';} break;
        case '45': {return '45p';} break;
        case '55': {return '55p';} break;
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
                  onFieldSubmitted: (term) {_fieldFocusChange(context, _onefocus, _twofocus);},
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

                      Navigator.pop(context, MaterialPageRoute(builder: (context) => Ceiling()));

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
