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
import 'package:flutter/material.dart';
import 'package:inventorycheck/ui/newinventory.dart';
import 'package:inventorycheck/ui/pages/Celing.dart';
import 'package:inventorycheck/ui/pages/ExtDoor.dart';
import 'package:inventorycheck/ui/pages/Frames.dart';
import 'package:inventorycheck/ui/pages/IntDoor.dart';
import 'package:inventorycheck/ui/pages/Light.dart';
import 'package:inventorycheck/ui/pages/Walls.dart';
import 'package:inventorycheck/ui/pages/Windows.dart';
import 'package:provider/provider.dart';


class Category extends StatefulWidget {
  final String Route;
  const Category ({ Key key, this.Route }): super(key: key);
  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {

  var _titlep = " ";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
//switch
    switch(widget.Route) {
      case '1': { _titlep = 'Exterior'; } break;
      case '2': { _titlep = 'Hallway';  } break;
      case '3': { _titlep = 'Smote Detector';  } break;
      case '4': { _titlep = 'Kitchen';  } break;
      case '5': { _titlep = 'Bedroom';  } break;

      default:
        {
          print('unable to determine');
        }
        break;
    }
  }

  _framesNav(){
    switch(widget.Route){
      case '1': { Navigator.push(context, MaterialPageRoute(builder: (context) => Frames(Route: '11',))); }
      break;
      case '2': { Navigator.push(context, MaterialPageRoute(builder: (context) => Frames(Route: '21',))); }
      break;
      case '3': { Navigator.push(context, MaterialPageRoute(builder: (context) => Frames(Route: '31',))); }
      break;
      case '4': { Navigator.push(context, MaterialPageRoute(builder: (context) => Frames(Route: '41',))); }
      break;
      case '5': { Navigator.push(context, MaterialPageRoute(builder: (context) => Frames(Route: '51',))); }
      break;
      case '6': { Navigator.push(context, MaterialPageRoute(builder: (context) => Frames(Route: '61',))); }
      break;
      case '7': { Navigator.push(context, MaterialPageRoute(builder: (context) => Frames(Route: '71',))); }
      break;
      default:
        {
          print('unable to determine');
        }
        break;

    }
  }
  _extDoorNav(){
    switch(widget.Route){
      case '1': { Navigator.push(context, MaterialPageRoute(builder: (context) => ExtDoor(Route: '12',))); }
      break;
      case '2': { Navigator.push(context, MaterialPageRoute(builder: (context) => ExtDoor(Route: '22',))); }
      break;
      case '3': { Navigator.push(context, MaterialPageRoute(builder: (context) => ExtDoor(Route: '32',))); }
      break;
      case '4': { Navigator.push(context, MaterialPageRoute(builder: (context) => ExtDoor(Route: '42',))); }
      break;
      case '5': { Navigator.push(context, MaterialPageRoute(builder: (context) => ExtDoor(Route: '52',))); }
      break;
      case '6': { Navigator.push(context, MaterialPageRoute(builder: (context) => ExtDoor(Route: '62',))); }
      break;
      case '7': { Navigator.push(context, MaterialPageRoute(builder: (context) => ExtDoor(Route: '72',))); }
      break;
      default:
        {
          print('unable to determine');
        }
        break;

    }
  }
  _intDoorNav(){
    switch(widget.Route){
      case '1': { Navigator.push(context, MaterialPageRoute(builder: (context) => IntDoor(Route: '13',))); }
      break;
      case '2': { Navigator.push(context, MaterialPageRoute(builder: (context) => IntDoor(Route: '23',))); }
      break;
      case '3': { Navigator.push(context, MaterialPageRoute(builder: (context) => IntDoor(Route: '33',))); }
      break;
      case '4': { Navigator.push(context, MaterialPageRoute(builder: (context) => IntDoor(Route: '43',))); }
      break;
      case '5': { Navigator.push(context, MaterialPageRoute(builder: (context) => IntDoor(Route: '53',))); }
      break;
      case '6': { Navigator.push(context, MaterialPageRoute(builder: (context) => IntDoor(Route: '63',))); }
      break;
      case '7': { Navigator.push(context, MaterialPageRoute(builder: (context) => IntDoor(Route: '73',))); }
      break;
      default:
        {
          print('unable to determine');
        }
        break;

    }
  }
  _ceilingNav(){
    switch(widget.Route){
      case '1': { Navigator.push(context, MaterialPageRoute(builder: (context) => Ceiling(Route: '14',))); }
      break;
      case '2': { Navigator.push(context, MaterialPageRoute(builder: (context) => Ceiling(Route: '24',))); }
      break;
      case '3': { Navigator.push(context, MaterialPageRoute(builder: (context) => Ceiling(Route: '34',))); }
      break;
      case '4': { Navigator.push(context, MaterialPageRoute(builder: (context) => Ceiling(Route: '44',))); }
      break;
      case '5': { Navigator.push(context, MaterialPageRoute(builder: (context) => Ceiling(Route: '54',))); }
      break;
      case '6': { Navigator.push(context, MaterialPageRoute(builder: (context) => Ceiling(Route: '64',))); }
      break;
      case '7': { Navigator.push(context, MaterialPageRoute(builder: (context) => Ceiling(Route: '74',))); }
      break;
      default:
        {
          print('unable to determine');
        }
        break;

    }
  }
  _lightNav(){
    switch(widget.Route){
      case '1': { Navigator.push(context, MaterialPageRoute(builder: (context) => Light(Route: '15',))); }
      break;
      case '2': { Navigator.push(context, MaterialPageRoute(builder: (context) => Light(Route: '25',))); }
      break;
      case '3': { Navigator.push(context, MaterialPageRoute(builder: (context) => Light(Route: '35',))); }
      break;
      case '4': { Navigator.push(context, MaterialPageRoute(builder: (context) => Light(Route: '45',))); }
      break;
      case '5': { Navigator.push(context, MaterialPageRoute(builder: (context) => Light(Route: '55',))); }
      break;
      case '6': { Navigator.push(context, MaterialPageRoute(builder: (context) => Light(Route: '65',))); }
      break;
      case '7': { Navigator.push(context, MaterialPageRoute(builder: (context) => Light(Route: '75',))); }
      break;
      default:
        {
          print('unable to determine');
        }
        break;

    }
  }
  _wallsNav(){
    switch(widget.Route){
      case '1': { Navigator.push(context, MaterialPageRoute(builder: (context) => Walls(Route: '16',))); }
      break;
      case '2': { Navigator.push(context, MaterialPageRoute(builder: (context) => Walls(Route: '26',))); }
      break;
      case '3': { Navigator.push(context, MaterialPageRoute(builder: (context) => Walls(Route: '36',))); }
      break;
      case '4': { Navigator.push(context, MaterialPageRoute(builder: (context) => Walls(Route: '46',))); }
      break;
      case '5': { Navigator.push(context, MaterialPageRoute(builder: (context) => Walls(Route: '56',))); }
      break;
      case '6': { Navigator.push(context, MaterialPageRoute(builder: (context) => Walls(Route: '66',))); }
      break;
      case '7': { Navigator.push(context, MaterialPageRoute(builder: (context) => Walls(Route: '76',))); }
      break;
      default:
        {
          print('unable to determine');
        }
        break;

    }
  }
  _windowsNav(){
    switch(widget.Route){
      case '1': { Navigator.push(context, MaterialPageRoute(builder: (context) => Windows(Route: '17',))); }
      break;
      case '2': { Navigator.push(context, MaterialPageRoute(builder: (context) => Windows(Route: '27',))); }
      break;
      case '3': { Navigator.push(context, MaterialPageRoute(builder: (context) => Windows(Route: '37',))); }
      break;
      case '4': { Navigator.push(context, MaterialPageRoute(builder: (context) => Windows(Route: '47',))); }
      break;
      case '5': { Navigator.push(context, MaterialPageRoute(builder: (context) => Windows(Route: '57',))); }
      break;
      case '6': { Navigator.push(context, MaterialPageRoute(builder: (context) => Windows(Route: '67',))); }
      break;
      case '7': { Navigator.push(context, MaterialPageRoute(builder: (context) => Windows(Route: '77',))); }
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
    ExtCeilingNotifier extCeilingNotifier = Provider.of<ExtCeilingNotifier>(context);
    HalCeilingNotifier halCeilingNotifier = Provider.of<HalCeilingNotifier>(context);
    SmoCeilingNotifier smoCeilingNotifier = Provider.of<SmoCeilingNotifier>(context);
    KitCeilingNotifier kitCeilingNotifier = Provider.of<KitCeilingNotifier>(context);
    BedCeilingNotifier bedCeilingNotifier = Provider.of<BedCeilingNotifier>(context);
    ExtCeilingPhNotifier extCeilingPhNotifier = Provider.of<ExtCeilingPhNotifier>(context);
    HalCeilingPhNotifier halCeilingPhNotifier = Provider.of<HalCeilingPhNotifier>(context);
    SmoCeilingPhNotifier smoCeilingPhNotifier = Provider.of<SmoCeilingPhNotifier>(context);
    KitCeilingPhNotifier kitCeilingPhNotifier = Provider.of<KitCeilingPhNotifier>(context);
    BedCeilingPhNotifier bedCeilingPhNotifier = Provider.of<BedCeilingPhNotifier>(context);
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
    ExtWallsNotifier extWallsNotifier = Provider.of<ExtWallsNotifier>(context);
    HalWallsNotifier halWallsNotifier = Provider.of<HalWallsNotifier>(context);
    SmoWallsNotifier smoWallsNotifier = Provider.of<SmoWallsNotifier>(context);
    KitWallsNotifier kitWallsNotifier = Provider.of<KitWallsNotifier>(context);
    BedWallsNotifier bedWallsNotifier = Provider.of<BedWallsNotifier>(context);
    ExtWallsPhNotifier extWallsPhNotifier = Provider.of<ExtWallsPhNotifier>(context);
    HalWallsPhNotifier halWallsPhNotifier = Provider.of<HalWallsPhNotifier>(context);
    SmoWallsPhNotifier smoWallsPhNotifier = Provider.of<SmoWallsPhNotifier>(context);
    KitWallsPhNotifier kitWallsPhNotifier = Provider.of<KitWallsPhNotifier>(context);
    BedWallsPhNotifier bedWallsPhNotifier = Provider.of<BedWallsPhNotifier>(context);
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



    _checklistFrame(){
      switch(widget.Route) {
        case '1':{
          if (extFrameNotifier.extFrameList.isNotEmpty || extFramePhNotifier.extFramePhList.isNotEmpty){return  Container( padding: EdgeInsets.only(left: 260, top:8,),child: Icon( Icons.done,
            color: Color(0xff684c4c), size: 35.0, semanticLabel: 'Added', ));} else {return Container();}
        } break;
        case '2':{
          if (halFrameNotifier.halFrameList.isNotEmpty || halFramePhNotifier.halFramePhList.isNotEmpty){return  Container( padding: EdgeInsets.only(left: 260, top:8,),child: Icon( Icons.done,
            color: Color(0xff684c4c), size: 35.0, semanticLabel: 'Added', ));} else {return Container();}
        } break;
        case '3':{
          if (smoFrameNotifier.smoFrameList.isNotEmpty || smoFramePhNotifier.smoFramePhList.isNotEmpty){return  Container( padding: EdgeInsets.only(left: 260, top:8,),child: Icon( Icons.done,
            color: Color(0xff684c4c), size: 35.0, semanticLabel: 'Added', ));} else {return Container();}
        } break;
        case '4':{
          if (kitFrameNotifier.kitFrameList.isNotEmpty || kitFramePhNotifier.kitFramePhList.isNotEmpty){return  Container( padding: EdgeInsets.only(left: 260, top:8,),child: Icon( Icons.done,
            color: Color(0xff684c4c), size: 35.0, semanticLabel: 'Added', ));} else {return Container();}
        } break;
        case '5':{
          if (bedFrameNotifier.bedFrameList.isNotEmpty || bedFramePhNotifier.bedFramePhList.isNotEmpty){return  Container( padding: EdgeInsets.only(left: 260, top:8,),child: Icon( Icons.done,
            color: Color(0xff684c4c), size: 35.0, semanticLabel: 'Added', ));} else {return Container();}
        } break;


        default: {print('unable to determine'); } break;
      }

    }
    _checklistExdoor(){
      switch(widget.Route) {
        case '1':{
          if (extExdoorNotifier.extExdoorList.isNotEmpty || extExdoorPhNotifier.extExdoorPhList.isNotEmpty){return  Container( padding: EdgeInsets.only(left: 260, top:8,),child: Icon( Icons.done,
            color: Color(0xff684c4c), size: 35.0, semanticLabel: 'Added', ));} else {return Container();}
        } break;
        case '2':{
          if (halExdoorNotifier.halExdoorList.isNotEmpty || halExdoorPhNotifier.halExdoorPhList.isNotEmpty){return  Container( padding: EdgeInsets.only(left: 260, top:8,),child: Icon( Icons.done,
            color: Color(0xff684c4c), size: 35.0, semanticLabel: 'Added', ));} else {return Container();}
        } break;
        case '3':{
          if (smoExdoorNotifier.smoExdoorList.isNotEmpty || smoExdoorPhNotifier.smoExdoorPhList.isNotEmpty){return  Container( padding: EdgeInsets.only(left: 260, top:8,),child: Icon( Icons.done,
            color: Color(0xff684c4c), size: 35.0, semanticLabel: 'Added', ));} else {return Container();}
        } break;
        case '4':{
          if (kitExdoorNotifier.kitExdoorList.isNotEmpty || kitExdoorPhNotifier.kitExdoorPhList.isNotEmpty){return  Container( padding: EdgeInsets.only(left: 260, top:8,),child: Icon( Icons.done,
            color: Color(0xff684c4c), size: 35.0, semanticLabel: 'Added', ));} else {return Container();}
        } break;
        case '5':{
          if (bedExdoorNotifier.bedExdoorList.isNotEmpty || bedExdoorPhNotifier.bedExdoorPhList.isNotEmpty){return  Container( padding: EdgeInsets.only(left: 260, top:8,),child: Icon( Icons.done,
            color: Color(0xff684c4c), size: 35.0, semanticLabel: 'Added', ));} else {return Container();}
        } break;


        default: {print('unable to determine'); } break;
      }

    }
    _checklistIndoor(){
      switch(widget.Route) {
        case '1':{
          if (extIndoorNotifier.extIndoorList.isNotEmpty || extIndoorPhNotifier.extIndoorPhList.isNotEmpty){return  Container( padding: EdgeInsets.only(left: 260, top:8,),child: Icon( Icons.done,
            color: Color(0xff684c4c), size: 35.0, semanticLabel: 'Added', ));} else {return Container();}
        } break;
        case '2':{
          if (halIndoorNotifier.halIndoorList.isNotEmpty || halIndoorPhNotifier.halIndoorPhList.isNotEmpty){return  Container( padding: EdgeInsets.only(left: 260, top:8,),child: Icon( Icons.done,
            color: Color(0xff684c4c), size: 35.0, semanticLabel: 'Added', ));} else {return Container();}
        } break;
        case '3':{
          if (smoIndoorNotifier.smoIndoorList.isNotEmpty || smoIndoorPhNotifier.smoIndoorPhList.isNotEmpty){return  Container( padding: EdgeInsets.only(left: 260, top:8,),child: Icon( Icons.done,
            color: Color(0xff684c4c), size: 35.0, semanticLabel: 'Added', ));} else {return Container();}
        } break;
        case '4':{
          if (kitIndoorNotifier.kitIndoorList.isNotEmpty || kitIndoorPhNotifier.kitIndoorPhList.isNotEmpty){return  Container( padding: EdgeInsets.only(left: 260, top:8,),child: Icon( Icons.done,
            color: Color(0xff684c4c), size: 35.0, semanticLabel: 'Added', ));} else {return Container();}
        } break;
        case '5':{
          if (bedIndoorNotifier.bedIndoorList.isNotEmpty || bedIndoorPhNotifier.bedIndoorPhList.isNotEmpty
          ){return  Container( padding: EdgeInsets.only(left: 260, top:8,),child: Icon( Icons.done,
            color: Color(0xff684c4c), size: 35.0, semanticLabel: 'Added', ));} else {return Container();}
        } break;


        default: {print('unable to determine'); } break;
      }

    }
    _checklistCeiling(){
      switch(widget.Route) {
        case '1':{
          if (extCeilingNotifier.extCeilingList.isNotEmpty || extCeilingPhNotifier.extCeilingPhList.isNotEmpty){return  Container( padding: EdgeInsets.only(left: 260, top:8,),child: Icon( Icons.done,
            color: Color(0xff684c4c), size: 35.0, semanticLabel: 'Added', ));} else {return Container();}
        } break;
        case '2':{
          if (halCeilingNotifier.halCeilingList.isNotEmpty || halCeilingPhNotifier.halCeilingPhList.isNotEmpty){return  Container( padding: EdgeInsets.only(left: 260, top:8,),child: Icon( Icons.done,
            color: Color(0xff684c4c), size: 35.0, semanticLabel: 'Added', ));} else {return Container();}
        } break;
        case '3':{
          if (smoCeilingNotifier.smoCeilingList.isNotEmpty || smoCeilingPhNotifier.smoCeilingPhList.isNotEmpty){return  Container( padding: EdgeInsets.only(left: 260, top:8,),child: Icon( Icons.done,
            color: Color(0xff684c4c), size: 35.0, semanticLabel: 'Added', ));} else {return Container();}
        } break;
        case '4':{
          if (kitCeilingNotifier.kitCeilingList.isNotEmpty || kitCeilingPhNotifier.kitCeilingPhList.isNotEmpty){return  Container( padding: EdgeInsets.only(left: 260, top:8,),child: Icon( Icons.done,
            color: Color(0xff684c4c), size: 35.0, semanticLabel: 'Added', ));} else {return Container();}
        } break;
        case '5':{
          if (bedCeilingNotifier.bedCeilingList.isNotEmpty || bedCeilingPhNotifier.bedCeilingPhList.isNotEmpty){return  Container( padding: EdgeInsets.only(left: 260, top:8,),child: Icon( Icons.done,
            color: Color(0xff684c4c), size: 35.0, semanticLabel: 'Added', ));} else {return Container();}
        } break;


        default: {print('unable to determine'); } break;
      }

    }
    _checklistLight(){
      switch(widget.Route) {
        case '1':{
          if (extLightNotifier.extLightList.isNotEmpty || extLightPhNotifier.extLightPhList.isNotEmpty){return  Container( padding: EdgeInsets.only(left: 260, top:8,),child: Icon( Icons.done,
            color: Color(0xff684c4c), size: 35.0, semanticLabel: 'Added', ));} else {return Container();}
        } break;
        case '2':{
          if (halLightNotifier.halLightList.isNotEmpty || halLightPhNotifier.halLightPhList.isNotEmpty){return  Container( padding: EdgeInsets.only(left: 260, top:8,),child: Icon( Icons.done,
            color: Color(0xff684c4c), size: 35.0, semanticLabel: 'Added', ));} else {return Container();}
        } break;
        case '3':{
          if (smoLightNotifier.smoLightList.isNotEmpty || smoLightPhNotifier.smoLightPhList.isNotEmpty){return  Container( padding: EdgeInsets.only(left: 260, top:8,),child: Icon( Icons.done,
            color: Color(0xff684c4c), size: 35.0, semanticLabel: 'Added', ));} else {return Container();}
        } break;
        case '4':{
          if (kitLightNotifier.kitLightList.isNotEmpty || kitLightPhNotifier.kitLightPhList.isNotEmpty){return  Container( padding: EdgeInsets.only(left: 260, top:8,),child: Icon( Icons.done,
            color: Color(0xff684c4c), size: 35.0, semanticLabel: 'Added', ));} else {return Container();}
        } break;
        case '5':{
          if (bedLightNotifier.bedLightList.isNotEmpty || bedLightPhNotifier.bedLightPhList.isNotEmpty){return  Container( padding: EdgeInsets.only(left: 260, top:8,),child: Icon( Icons.done,
            color: Color(0xff684c4c), size: 35.0, semanticLabel: 'Added', ));} else {return Container();}
        } break;


        default: {print('unable to determine'); } break;
      }

    }
    _checklistWalls(){
      switch(widget.Route) {
        case '1':{
          if (extWallsNotifier.extWallsList.isNotEmpty || extWallsPhNotifier.extWallsPhList.isNotEmpty){return  Container( padding: EdgeInsets.only(left: 260, top:8,),child: Icon( Icons.done,
            color: Color(0xff684c4c), size: 35.0, semanticLabel: 'Added', ));} else {return Container();}
        } break;
        case '2':{
          if (halWallsNotifier.halWallsList.isNotEmpty || halWallsPhNotifier.halWallsPhList.isNotEmpty){return  Container( padding: EdgeInsets.only(left: 260, top:8,),child: Icon( Icons.done,
            color: Color(0xff684c4c), size: 35.0, semanticLabel: 'Added', ));} else {return Container();}
        } break;
        case '3':{
          if (smoWallsNotifier.smoWallsList.isNotEmpty || smoWallsPhNotifier.smoWallsPhList.isNotEmpty){return  Container( padding: EdgeInsets.only(left: 260, top:8,),child: Icon( Icons.done,
            color: Color(0xff684c4c), size: 35.0, semanticLabel: 'Added', ));} else {return Container();}
        } break;
        case '4':{
          if (kitWallsNotifier.kitWallsList.isNotEmpty || kitWallsPhNotifier.kitWallsPhList.isNotEmpty){return  Container( padding: EdgeInsets.only(left: 260, top:8,),child: Icon( Icons.done,
            color: Color(0xff684c4c), size: 35.0, semanticLabel: 'Added', ));} else {return Container();}
        } break;
        case '5':{
          if (bedWallsNotifier.bedWallsList.isNotEmpty || bedWallsPhNotifier.bedWallsPhList.isNotEmpty){return  Container( padding: EdgeInsets.only(left: 260, top:8,),child: Icon( Icons.done,
            color: Color(0xff684c4c), size: 35.0, semanticLabel: 'Added', ));} else {return Container();}
        } break;


        default: {print('unable to determine'); } break;
      }

    }
    _checklistWindows(){
      switch(widget.Route) {
        case '1':{
          if (extWindowsNotifier.extWindowsList.isNotEmpty || extWindowsPhNotifier.extWindowsPhList.isNotEmpty){return  Container( padding: EdgeInsets.only(left: 260, top:8,),child: Icon( Icons.done,
            color: Color(0xff684c4c), size: 35.0, semanticLabel: 'Added', ));} else {return Container();}
        } break;
        case '2':{
          if (halWindowsNotifier.halWindowsList.isNotEmpty || halWindowsPhNotifier.halWindowsPhList.isNotEmpty){return  Container( padding: EdgeInsets.only(left: 260, top:8,),child: Icon( Icons.done,
            color: Color(0xff684c4c), size: 35.0, semanticLabel: 'Added', ));} else {return Container();}
        } break;
        case '3':{
          if (smoWindowsNotifier.smoWindowsList.isNotEmpty || smoWindowsPhNotifier.smoWindowsPhList.isNotEmpty){return  Container( padding: EdgeInsets.only(left: 260, top:8,),child: Icon( Icons.done,
            color: Color(0xff684c4c), size: 35.0, semanticLabel: 'Added', ));} else {return Container();}
        } break;
        case '4':{
          if (kitWindowsNotifier.kitWindowsList.isNotEmpty || kitWindowsPhNotifier.kitWindowsPhList.isNotEmpty){return  Container( padding: EdgeInsets.only(left: 260, top:8,),child: Icon( Icons.done,
            color: Color(0xff684c4c), size: 35.0, semanticLabel: 'Added', ));} else {return Container();}
        } break;
        case '5':{
          if (bedWindowsNotifier.bedWindowsList.isNotEmpty || bedWindowsPhNotifier.bedWindowsPhList.isNotEmpty){return  Container( padding: EdgeInsets.only(left: 260, top:8,),child: Icon( Icons.done,
            color: Color(0xff684c4c), size: 35.0, semanticLabel: 'Added', ));} else {return Container();}
        } break;


        default: {print('unable to determine'); } break;
      }

    }



    Widget _buildtitle() {
      return Container(
          padding: EdgeInsets.only(top: 50),
          child: Center(
            child: Text(
//            '${introNotifier.introList.last.description}'
              "123 PORTLAND RD, LONDON",
              style: TextStyle(
                fontFamily: 'arimo',
                fontSize: 25,
              ),
            ),
          ));
    }

    Widget _btndoorFrame() {
      return Container(
        padding:EdgeInsets.only(bottom:8,),
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/btn.png'),fit: BoxFit.cover
            ,),
        ),
        height: 55,
        width: 260,
        child: Stack(
          children: <Widget>[
            Center(
                child: Text(
                  "Doors and frames",
                  style: TextStyle(
                    color: Color(0xff684c4c),
                    fontFamily: 'alice',
                    fontSize: 24,
                  ),
                )),
            _checklistFrame(),
          ],
        ),
      );
    }

    Widget _btnExtDoor() {
      return Container(
        padding:EdgeInsets.only(bottom:8,),
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/btn.png'),fit: BoxFit.cover
            ,),
        ),
        height: 55,
        width: 260,
        child: Stack(
          children: <Widget>[
            Center(
                child: Text(
                  "Exterior door fittings",
                  style: TextStyle(
                    color: Color(0xff684c4c),
                    fontFamily: 'alice',
                    fontSize: 24,
                  ),
                )),
            _checklistExdoor(),
          ],
        ),
      );
    }

    Widget _btnIntDoor() {
      return Container(
        padding:EdgeInsets.only(bottom:8,),
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/btn.png'),fit: BoxFit.cover
            ,),
        ),
        height: 55,
        width: 260,
        child: Stack(
          children: <Widget>[
            Center(
                child: Text(
                  "Interior door gittings",
                  style: TextStyle(
                    color: Color(0xff684c4c),
                    fontFamily: 'alice',
                    fontSize: 24,
                  ),
                )),
            _checklistIndoor(),
          ],
        ),
      );
    }

    Widget _btnCeiling() {
      return Container(
        padding:EdgeInsets.only(bottom:8,),
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/btn.png'),fit: BoxFit.cover
            ,),
        ),
        height: 55,
        width: 260,
        child: Stack(
          children: <Widget>[
            Center(
                child: Text(
                  "Ceiling",
                  style: TextStyle(
                    color: Color(0xff684c4c),
                    fontFamily: 'alice',
                    fontSize: 24,
                  ),
                )),
            _checklistCeiling(),
          ],
        ),
      );
    }

    Widget _btnLight() {
      return Container(
        padding:EdgeInsets.only(bottom:8,),
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/btn.png'),fit: BoxFit.cover
            ,),
        ),
        height: 55,
        width: 260,
        child: Stack(
          children: <Widget>[
            Center(
                child: Text(
                  "Light",
                  style: TextStyle(
                    color: Color(0xff684c4c),
                    fontFamily: 'alice',
                    fontSize: 24,
                  ),
                )),
            _checklistLight(),
          ],
        ),
      );
    }

    Widget _btnWalls() {
      return Container(
        padding:EdgeInsets.only(bottom:8,),
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/btn.png'),fit: BoxFit.cover
            ,),
        ),
        height: 55,
        width: 260,
        child: Stack(
          children: <Widget>[
            Center(
                child: Text(
                  "Walls",
                  style: TextStyle(
                    color: Color(0xff684c4c),
                    fontFamily: 'alice',
                    fontSize: 24,
                  ),
                )),
            _checklistWalls(),
          ],
        ),
      );
    }

    Widget _btnWindow() {
      return Container(
        padding:EdgeInsets.only(bottom:8,),
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/btn.png'),fit: BoxFit.cover
            ,),
        ),
        height: 55,
        width: 260,
        child: Stack(
          children: <Widget>[
            Center(
                child: Text(
                  "Windows",
                  style: TextStyle(
                    color: Color(0xff684c4c),
                    fontFamily: 'alice',
                    fontSize: 24,
                  ),
                )),
            _checklistWindows(),
          ],
        ),
      );
    }


    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/bg.png"), fit: BoxFit.cover)),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            children: <Widget>[
              Container(
                  padding: EdgeInsets.only(top: 50),
                  child: Center(
                    child: Text(
//                      '${introNotifier.introList.last.description.toUpperCase()}',
//                "123 PORTLAND RD, LONDON",
                    '${_titlep}',
                      style: TextStyle(
                        fontFamily: 'alice',
                        fontSize: 25,
                          color : Color(0xff684c4c),
                      ),
                    ),
                  )),
              SizedBox(height: 35),
              InkWell(
                onTap: () {
                _framesNav();
                },
                child: _btndoorFrame(),
              ),
              SizedBox(
                height: 15,
              ),
              InkWell(
                onTap: () {
                  _extDoorNav();
                },
                child: _btnExtDoor(),
              ),
              SizedBox(
                height: 15,
              ),
              InkWell(
                onTap: () {
                  _intDoorNav();
                },
                child: _btnIntDoor(),
              ),
              SizedBox(
                height: 15,
              ),
              InkWell(
                onTap: () {
                  _ceilingNav();
                },
                child: _btnCeiling(),
              ),
              SizedBox(
                height: 15,
              ),
              InkWell(
                onTap: () {
                  _lightNav();
                },
                child: _btnLight(),
              ),
              SizedBox(
                height: 15,
              ),
              InkWell(
                onTap: () {
                  _wallsNav();
                },
                child: _btnWalls(),
              ),
              SizedBox(
                height: 15,
              ),
              InkWell(
                onTap: () {
                  _windowsNav();
                },
                child: _btnWindow(),
              ),
            ],
          ),
          floatingActionButton: Stack(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 31),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: FloatingActionButton(
//                      hoverColor: Colors.black,
//                      focusColor: Colors.red,
//                      splashColor: Colors.green,

                    heroTag: "exleft",
//                      mini: true,
                    backgroundColor: Colors.white,

//                      shape: RoundedRectangleBorder(co,borderRadius: BorderRadius.all(Radius.circular(50.0),Radius),),
//                      RoundedRectangleBorder(side: BorderSide(color: Colors.pink, width: 4.0)),

                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => NewInventory()));

//                        Navigator.of(context).pushNamed('/newInventroy');
//                          Navigator.of(context).pushNamed('/newInventroy');
//                        print(images.length);
                    },
                    child: Icon(Icons.arrow_back_ios),

                    foregroundColor: Color(0xff684c4c),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 15),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: InkWell(
                    onTap: () async {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => NewInventory()));

                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: new BorderRadius.only(
                            topLeft: const Radius.circular(15.0),
                            topRight: const Radius.circular(15.0),
                            bottomLeft: const Radius.circular(15.0),
                            bottomRight: const Radius.circular(15.0)),
                        color: Color(0xff684c4c),
                        border: new Border.all(color: Colors.blueGrey),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 1,
                            offset: Offset(5, 5),
                          ),
                        ],
                      ),
                      height: 55,
                      width: 140,
                      child: Center(
                          child: Column(
                            children: <Widget>[
                              Text(
                                "END",
                                style: TextStyle(
                                  color: Color(0xffffffff),
//                                  fontFamily: 'alice',
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "REPORT",
                                style: TextStyle(
                                  color: Color(0xffffffff),
//                                  fontFamily: 'alice',
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            ],
                          )),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}