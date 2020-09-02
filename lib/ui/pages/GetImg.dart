import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:inventorycheck/NotifierList/BedroomPhoto.dart';
import 'package:inventorycheck/NotifierList/ExteriorPhoto.dart';
import 'package:inventorycheck/NotifierList/HallwayPhoto.dart';
import 'package:inventorycheck/NotifierList/KitchenPhoto.dart';
import 'package:inventorycheck/NotifierList/SmotePhoto.dart';
import 'package:image/image.dart' as imgg;
import 'package:inventorycheck/model/imagedata.dart';
import 'package:inventorycheck/model/textdata.dart';
import 'package:inventorycheck/notify/imagesnotifier.dart';
import 'package:inventorycheck/notify/textnotifier.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

class GetImg extends StatefulWidget {
  final String Route;
  const GetImg ({ Key key, this.Route }): super(key: key);

  @override
  _GetImgState createState() => _GetImgState();
}

class _GetImgState extends State<GetImg> {
var imgtitle;

@override
void initState() {
  // TODO: implement initState
  super.initState();
//switch
  switch(widget.Route) {
    case '11p': { imgtitle = 'Exterior Doorss'; } break;
    case '12p': { imgtitle = 'Exterior Doors'; } break;
    case '13p': { imgtitle = 'Exterior Interior'; } break;
    case '14p': { imgtitle = 'Exterior Ceiling'; } break;
    case '15p': { imgtitle = 'Exterior Light'; } break;
    case '16p': { imgtitle = 'Exterior Walls'; } break;
    case '17p': { imgtitle = 'Exterior Windows'; } break;
    case '21p': { imgtitle = 'Doors & Frames'; } break;
    case '22p': { imgtitle = 'Hallway Exterior'; } break;
    case '23p': { imgtitle = 'Hallway Interior'; } break;
    case '24p': { imgtitle = 'Hallway Ceiling'; } break;
    case '25p': { imgtitle = 'Hallway Light'; } break;
    case '26p': { imgtitle = 'Hallway Walls'; } break;
    case '27p': { imgtitle = 'Hallway Windows'; } break;
    case '31p': { imgtitle = 'Smote Detector Doors'; } break;
    case '32p': { imgtitle = 'Smote Detector Exterior'; } break;
    case '33p': { imgtitle = 'Smote Detector Interior'; } break;
    case '34p': { imgtitle = 'Smote Detector Ceiling'; } break;
    case '35p': { imgtitle = 'Smote Detector Light'; } break;
    case '36p': { imgtitle = 'Smote Detector Walls'; } break;
    case '37p': { imgtitle = 'Smote Detector Windows'; } break;
    case '41p': { imgtitle = 'Kitchen Doors & Frame'; } break;
    case '42p': { imgtitle = 'Kitchen Exterior'; } break;
    case '43p': { imgtitle = 'Kitchen Interior'; } break;
    case '44p': { imgtitle = 'Kitchen Ceiling'; } break;
    case '45p': { imgtitle = 'Kitchen Light'; } break;
    case '46p': { imgtitle = 'Kitchen Walls'; } break;
    case '47p': { imgtitle = 'Kitchen Windows'; } break;
    case '51p': { imgtitle = 'Bedroom Doors & Frame'; } break;
    case '52p': { imgtitle = 'Bedroom Exterior'; } break;
    case '53p': { imgtitle = 'Bedroom Interior'; } break;
    case '54p': { imgtitle = 'Bedroom Ceiling'; } break;
    case '55p': { imgtitle = 'Bedroom Light'; } break;
    case '56p': { imgtitle = 'Bedroom Walls'; } break;
    case '57p': { imgtitle = 'Bedroom Windows'; } break;


    default:
      {
        print('unable to determine');
      }
      break;
  }
}

  File cameraFile;
  var images_captured = List<Widget>();
  File galleryFile;

_buildtitlefloor (){
  return Container(
    color: Colors.white.withOpacity(0.7),
    height: 100,
    width: MediaQuery.of(context).copyWith().size.height / 1,
    child: Container(
      padding: EdgeInsets.only(top: 9),
      child: Center(
        child: Text(
          " ${imgtitle??''}",
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'herrvon',
            fontSize: 60,
          ),
        ),
      ),
    ),
  );
}

  @override
  Widget build(BuildContext context) {
    ExtFramePhNotifier extFramePhNotifier = Provider.of<ExtFramePhNotifier>(context);
    ExtExdoorPhNotifier extExdoorPhNotifier = Provider.of<ExtExdoorPhNotifier>(context);
    ExtIndoorPhNotifier extIndoorPhNotifier = Provider.of<ExtIndoorPhNotifier>(context);
    ExtCeilingPhNotifier extCeilingPhNotifier = Provider.of<ExtCeilingPhNotifier>(context);
    ExtLightPhNotifier extLightPhNotifier = Provider.of<ExtLightPhNotifier>(context);
    ExtWallsPhNotifier extWallsPhNotifier = Provider.of<ExtWallsPhNotifier>(context);
    ExtWindowsPhNotifier extWindowsPhNotifier = Provider.of<ExtWindowsPhNotifier>(context);
    HalFramePhNotifier halFramePhNotifier = Provider.of<HalFramePhNotifier>(context);
    HalExdoorPhNotifier halExdoorPhNotifier = Provider.of<HalExdoorPhNotifier>(context);
    HalIndoorPhNotifier halIndoorPhNotifier = Provider.of<HalIndoorPhNotifier>(context);
    HalCeilingPhNotifier halCeilingPhNotifier = Provider.of<HalCeilingPhNotifier>(context);
    HalLightPhNotifier halLightPhNotifier = Provider.of<HalLightPhNotifier>(context);
    HalWallsPhNotifier halWallsPhNotifier = Provider.of<HalWallsPhNotifier>(context);
    HalWindowsPhNotifier halWindowsPhNotifier = Provider.of<HalWindowsPhNotifier>(context);
    SmoFramePhNotifier smoFramePhNotifier = Provider.of<SmoFramePhNotifier>(context);
    SmoExdoorPhNotifier smoExdoorPhNotifier = Provider.of<SmoExdoorPhNotifier>(context);
    SmoIndoorPhNotifier smoIndoorPhNotifier = Provider.of<SmoIndoorPhNotifier>(context);
    SmoCeilingPhNotifier smoCeilingPhNotifier = Provider.of<SmoCeilingPhNotifier>(context);
    SmoLightPhNotifier smoLightPhNotifier = Provider.of<SmoLightPhNotifier>(context);
    SmoWallsPhNotifier smoWallsPhNotifier = Provider.of<SmoWallsPhNotifier>(context);
    SmoWindowsPhNotifier smoWindowsPhNotifier = Provider.of<SmoWindowsPhNotifier>(context);
    KitFramePhNotifier kitFramePhNotifier = Provider.of<KitFramePhNotifier>(context);
    KitExdoorPhNotifier kitExdoorPhNotifier = Provider.of<KitExdoorPhNotifier>(context);
    KitIndoorPhNotifier kitIndoorPhNotifier = Provider.of<KitIndoorPhNotifier>(context);
    KitCeilingPhNotifier kitCeilingPhNotifier = Provider.of<KitCeilingPhNotifier>(context);
    KitLightPhNotifier kitLightPhNotifier = Provider.of<KitLightPhNotifier>(context);
    KitWallsPhNotifier kitWallsPhNotifier = Provider.of<KitWallsPhNotifier>(context);
    KitWindowsPhNotifier kitWindowsPhNotifier = Provider.of<KitWindowsPhNotifier>(context);
    BedFramePhNotifier bedFramePhNotifier = Provider.of<BedFramePhNotifier>(context);
    BedExdoorPhNotifier bedExdoorPhNotifier = Provider.of<BedExdoorPhNotifier>(context);
    BedIndoorPhNotifier bedIndoorPhNotifier = Provider.of<BedIndoorPhNotifier>(context);
    BedCeilingPhNotifier bedCeilingPhNotifier = Provider.of<BedCeilingPhNotifier>(context);
    BedLightPhNotifier bedLightPhNotifier = Provider.of<BedLightPhNotifier>(context);
    BedWallsPhNotifier bedWallsPhNotifier = Provider.of<BedWallsPhNotifier>(context);
    BedWindowsPhNotifier bedWindowsPhNotifier = Provider.of<BedWindowsPhNotifier>(context);

    imageSelectorCamera() async {

      cameraFile = await ImagePicker.pickImage(
        source: ImageSource.camera,
      );
      var datetim = '${DateTime.now().year}/${DateTime.now().month}/${DateTime.now().day}--${DateTime.now().hour}:${DateTime.now().minute}:${DateTime.now().second}';
      var decodeImg = imgg.decodeImage(cameraFile.readAsBytesSync());
      imgg.drawString(decodeImg, imgg.arial_48, 50, 50, datetim);
      var encodeImage = imgg.encodeJpg(decodeImg, quality: 100);
      var finalImage = File(cameraFile.path)..writeAsBytesSync(encodeImage);

      setState(() {
        if (finalImage != null ){
          switch(widget.Route) {
            case '11p': { extFramePhNotifier.addExtFramePh(ExtFramePh(finalImage)); }break;
            case '12p': { extExdoorPhNotifier.addExtExdoorPh(ExtExdoorPh(finalImage)); }break;
            case '13p': { extIndoorPhNotifier.addExtIndoorPh(ExtIndoorPh(finalImage)); }break;
            case '14p': { extCeilingPhNotifier.addExtCeilingPh(ExtCeilingPh(finalImage)); }break;
            case '15p': { extLightPhNotifier.addExtLightPh(ExtLightPh(finalImage)); }break;
            case '16p': { extWallsPhNotifier.addExtWallsPh(ExtWallsPh(finalImage)); }break;
            case '17p': { extWindowsPhNotifier.addExtWindowsPh(ExtWindowsPh(finalImage)); }break;
            case '21p': { halFramePhNotifier.addHalFramePh(HalFramePh(finalImage)); }break;
            case '22p': { halExdoorPhNotifier.addHalExdoorPh(HalExdoorPh(finalImage)); }break;
            case '23p': { halIndoorPhNotifier.addHalIndoorPh(HalIndoorPh(finalImage)); }break;
            case '24p': { halCeilingPhNotifier.addHalCeilingPh(HalCeilingPh(finalImage)); }break;
            case '25p': { halLightPhNotifier.addHalLightPh(HalLightPh(finalImage)); }break;
            case '26p': { halWallsPhNotifier.addHalWallsPh(HalWallsPh(finalImage)); }break;
            case '27p': { halWindowsPhNotifier.addHalWindowsPh(HalWindowsPh(finalImage)); }break;
            case '31p': { smoFramePhNotifier.addSmoFramePh(SmoFramePh(finalImage)); }break;
            case '32p': { smoExdoorPhNotifier.addSmoExdoorPh(SmoExdoorPh(finalImage)); }break;
            case '33p': { smoIndoorPhNotifier.addSmoIndoorPh(SmoIndoorPh(finalImage)); }break;
            case '34p': { smoCeilingPhNotifier.addSmoCeilingPh(SmoCeilingPh(finalImage)); }break;
            case '35p': { smoLightPhNotifier.addSmoLightPh(SmoLightPh(finalImage)); }break;
            case '36p': { smoWallsPhNotifier.addSmoWallsPh(SmoWallsPh(finalImage)); }break;
            case '37p': { smoWindowsPhNotifier.addSmoWindowsPh(SmoWindowsPh(finalImage)); }break;
            case '41p': { kitFramePhNotifier.addKitFramePh(KitFramePh(finalImage)); }break;
            case '42p': { kitExdoorPhNotifier.addKitExdoorPh(KitExdoorPh(finalImage)); }break;
            case '43p': { kitIndoorPhNotifier.addKitIndoorPh(KitIndoorPh(finalImage)); }break;
            case '44p': { kitCeilingPhNotifier.addKitCeilingPh(KitCeilingPh(finalImage)); }break;
            case '45p': { kitLightPhNotifier.addKitLightPh(KitLightPh(finalImage)); }break;
            case '46p': { kitWallsPhNotifier.addKitWallsPh(KitWallsPh(finalImage)); }break;
            case '47p': { kitWindowsPhNotifier.addKitWindowsPh(KitWindowsPh(finalImage)); }break;
            case '51p': { bedFramePhNotifier.addBedFramePh(BedFramePh(finalImage)); }break;
            case '52p': { bedExdoorPhNotifier.addBedExdoorPh(BedExdoorPh(finalImage)); }break;
            case '53p': { bedIndoorPhNotifier.addBedIndoorPh(BedIndoorPh(finalImage)); }break;
            case '54p': { bedCeilingPhNotifier.addBedCeilingPh(BedCeilingPh(finalImage)); }break;
            case '55p': { bedLightPhNotifier.addBedLightPh(BedLightPh(finalImage)); }break;
            case '56p': { bedWallsPhNotifier.addBedWallsPh(BedWallsPh(finalImage)); }break;
            case '57p': { bedWindowsPhNotifier.addBedWindowsPh(BedWindowsPh(finalImage)); }break;

            default: { print('unable to determine'); } break;}
        }
         });
      print("You selected camera image : " + cameraFile.path);
      Directory documentDirectory = await getApplicationDocumentsDirectory();
      String documentPath = documentDirectory.path;
      var vella = DateTime.now().millisecondsSinceEpoch;
      final File newImage = await cameraFile.copy('$documentPath/Invent$vella.png');
      print("New Path Saved:${newImage}");

    }

    imageSelectorGallery() async {
      galleryFile = await ImagePicker.pickImage(
        source: ImageSource.gallery,
      );


      setState(() {
        if(galleryFile != null){
        switch(widget.Route) {
          case '11p': { extFramePhNotifier.addExtFramePh(ExtFramePh(galleryFile)); }break;
          case '12p': { extExdoorPhNotifier.addExtExdoorPh(ExtExdoorPh(galleryFile)); }break;
          case '13p': { extIndoorPhNotifier.addExtIndoorPh(ExtIndoorPh(galleryFile)); }break;
          case '14p': { extCeilingPhNotifier.addExtCeilingPh(ExtCeilingPh(galleryFile)); }break;
          case '15p': { extLightPhNotifier.addExtLightPh(ExtLightPh(galleryFile)); }break;
          case '16p': { extWallsPhNotifier.addExtWallsPh(ExtWallsPh(galleryFile)); }break;
          case '17p': { extWindowsPhNotifier.addExtWindowsPh(ExtWindowsPh(galleryFile)); }break;
          case '21p': { halFramePhNotifier.addHalFramePh(HalFramePh(galleryFile)); }break;
          case '22p': { halExdoorPhNotifier.addHalExdoorPh(HalExdoorPh(galleryFile)); }break;
          case '23p': { halIndoorPhNotifier.addHalIndoorPh(HalIndoorPh(galleryFile)); }break;
          case '24p': { halCeilingPhNotifier.addHalCeilingPh(HalCeilingPh(galleryFile)); }break;
          case '25p': { halLightPhNotifier.addHalLightPh(HalLightPh(galleryFile)); }break;
          case '26p': { halWallsPhNotifier.addHalWallsPh(HalWallsPh(galleryFile)); }break;
          case '27p': { halWindowsPhNotifier.addHalWindowsPh(HalWindowsPh(galleryFile)); }break;
          case '31p': { smoFramePhNotifier.addSmoFramePh(SmoFramePh(galleryFile)); }break;
          case '32p': { smoExdoorPhNotifier.addSmoExdoorPh(SmoExdoorPh(galleryFile)); }break;
          case '33p': { smoIndoorPhNotifier.addSmoIndoorPh(SmoIndoorPh(galleryFile)); }break;
          case '34p': { smoCeilingPhNotifier.addSmoCeilingPh(SmoCeilingPh(galleryFile)); }break;
          case '35p': { smoLightPhNotifier.addSmoLightPh(SmoLightPh(galleryFile)); }break;
          case '36p': { smoWallsPhNotifier.addSmoWallsPh(SmoWallsPh(galleryFile)); }break;
          case '37p': { smoWindowsPhNotifier.addSmoWindowsPh(SmoWindowsPh(galleryFile)); }break;
          case '41p': { kitFramePhNotifier.addKitFramePh(KitFramePh(galleryFile)); }break;
          case '42p': { kitExdoorPhNotifier.addKitExdoorPh(KitExdoorPh(galleryFile)); }break;
          case '43p': { kitIndoorPhNotifier.addKitIndoorPh(KitIndoorPh(galleryFile)); }break;
          case '44p': { kitCeilingPhNotifier.addKitCeilingPh(KitCeilingPh(galleryFile)); }break;
          case '45p': { kitLightPhNotifier.addKitLightPh(KitLightPh(galleryFile)); }break;
          case '46p': { kitWallsPhNotifier.addKitWallsPh(KitWallsPh(galleryFile)); }break;
          case '47p': { kitWindowsPhNotifier.addKitWindowsPh(KitWindowsPh(galleryFile)); }break;
          case '51p': { bedFramePhNotifier.addBedFramePh(BedFramePh(galleryFile)); }break;
          case '52p': { bedExdoorPhNotifier.addBedExdoorPh(BedExdoorPh(galleryFile)); }break;
          case '53p': { bedIndoorPhNotifier.addBedIndoorPh(BedIndoorPh(galleryFile)); }break;
          case '54p': { bedCeilingPhNotifier.addBedCeilingPh(BedCeilingPh(galleryFile)); }break;
          case '55p': { bedLightPhNotifier.addBedLightPh(BedLightPh(galleryFile)); }break;
          case '56p': { bedWallsPhNotifier.addBedWallsPh(BedWallsPh(galleryFile)); }break;
          case '57p': { bedWindowsPhNotifier.addBedWindowsPh(BedWindowsPh(galleryFile)); }break;

          default: { print('unable to determine'); } break;}
        }
      });
      print("You selected camera image : " + galleryFile.path);
    }

    _getlist(){
      switch(widget.Route){
        case '11p': {
          return List.generate(extFramePhNotifier.extFramePhList.length, (index){
            return Column (children: <Widget>[  SizedBox(height: 10,),
              Container( height: 100, width: 170,
                decoration: BoxDecoration( borderRadius: BorderRadius.circular(1) ),
                child: ClipRRect(
                  child: Image.file(extFramePhNotifier.extFramePhList[index].photo,fit: BoxFit.cover,),
                  borderRadius: BorderRadius.circular(1),
                ),)],);});}break;
        case '12p': {
          return List.generate(extExdoorPhNotifier.extExdoorPhList.length, (index){
            return Column (children: <Widget>[  SizedBox(height: 10,),
              Container( height: 100, width: 170,
                decoration: BoxDecoration( borderRadius: BorderRadius.circular(1) ),
                child: ClipRRect(
                  child: Image.file(extExdoorPhNotifier.extExdoorPhList[index].photo,fit: BoxFit.cover,),
                  borderRadius: BorderRadius.circular(1),
                ),)],);});}break;
        case '13p': {
          return List.generate(extIndoorPhNotifier.extIndoorPhList.length, (index){
            return Column (children: <Widget>[  SizedBox(height: 10,),
              Container( height: 100, width: 170,
                decoration: BoxDecoration( borderRadius: BorderRadius.circular(1) ),
                child: ClipRRect(
                  child: Image.file(extIndoorPhNotifier.extIndoorPhList[index].photo,fit: BoxFit.cover,),
                  borderRadius: BorderRadius.circular(1),
                ),)],);});}break;
        case '14p': {
          return List.generate(extCeilingPhNotifier.extCeilingPhList.length, (index){
            return Column (children: <Widget>[  SizedBox(height: 10,),
              Container( height: 100, width: 170,
                decoration: BoxDecoration( borderRadius: BorderRadius.circular(1) ),
                child: ClipRRect(
                  child: Image.file(extCeilingPhNotifier.extCeilingPhList[index].photo,fit: BoxFit.cover,),
                  borderRadius: BorderRadius.circular(1),
                ),)],);});}break;
        case '15p': {
          return List.generate(extLightPhNotifier.extLightPhList.length, (index){
            return Column (children: <Widget>[  SizedBox(height: 10,),
              Container( height: 100, width: 170,
                decoration: BoxDecoration( borderRadius: BorderRadius.circular(1) ),
                child: ClipRRect(
                  child: Image.file(extLightPhNotifier.extLightPhList[index].photo,fit: BoxFit.cover,),
                  borderRadius: BorderRadius.circular(1),
                ),)],);});}break;
        case '16p': {
          return List.generate(extWallsPhNotifier.extWallsPhList.length, (index){
            return Column (children: <Widget>[  SizedBox(height: 10,),
              Container( height: 100, width: 170,
                decoration: BoxDecoration( borderRadius: BorderRadius.circular(1) ),
                child: ClipRRect(
                  child: Image.file(extWallsPhNotifier.extWallsPhList[index].photo,fit: BoxFit.cover,),
                  borderRadius: BorderRadius.circular(1),
                ),)],);});}break;
        case '17p': {
          return List.generate(extWindowsPhNotifier.extWindowsPhList.length, (index){
            return Column (children: <Widget>[  SizedBox(height: 10,),
              Container( height: 100, width: 170,
                decoration: BoxDecoration( borderRadius: BorderRadius.circular(1) ),
                child: ClipRRect(
                  child: Image.file(extWindowsPhNotifier.extWindowsPhList[index].photo,fit: BoxFit.cover,),
                  borderRadius: BorderRadius.circular(1),
                ),)],);});}break;
        case '21p': {
          return List.generate(halFramePhNotifier.halFramePhList.length, (index){
            return Column (children: <Widget>[  SizedBox(height: 10,),
              Container( height: 100, width: 170,
                decoration: BoxDecoration( borderRadius: BorderRadius.circular(1) ),
                child: ClipRRect(
                  child: Image.file(halFramePhNotifier.halFramePhList[index].photo,fit: BoxFit.cover,),
                  borderRadius: BorderRadius.circular(1),
                ),)],);});}break;
        case '22p': {
          return List.generate(halExdoorPhNotifier.halExdoorPhList.length, (index){
            return Column (children: <Widget>[  SizedBox(height: 10,),
              Container( height: 100, width: 170,
                decoration: BoxDecoration( borderRadius: BorderRadius.circular(1) ),
                child: ClipRRect(
                  child: Image.file(halExdoorPhNotifier.halExdoorPhList[index].photo,fit: BoxFit.cover,),
                  borderRadius: BorderRadius.circular(1),
                ),)],);});}break;
        case '23p': {
          return List.generate(halIndoorPhNotifier.halIndoorPhList.length, (index){
            return Column (children: <Widget>[  SizedBox(height: 10,),
              Container( height: 100, width: 170,
                decoration: BoxDecoration( borderRadius: BorderRadius.circular(1) ),
                child: ClipRRect(
                  child: Image.file(halIndoorPhNotifier.halIndoorPhList[index].photo,fit: BoxFit.cover,),
                  borderRadius: BorderRadius.circular(1),
                ),)],);});}break;
        case '24p': {
          return List.generate(halCeilingPhNotifier.halCeilingPhList.length, (index){
            return Column (children: <Widget>[  SizedBox(height: 10,),
              Container( height: 100, width: 170,
                decoration: BoxDecoration( borderRadius: BorderRadius.circular(1) ),
                child: ClipRRect(
                  child: Image.file(halCeilingPhNotifier.halCeilingPhList[index].photo,fit: BoxFit.cover,),
                  borderRadius: BorderRadius.circular(1),
                ),)],);});}break;
        case '25p': {
          return List.generate(halLightPhNotifier.halLightPhList.length, (index){
            return Column (children: <Widget>[  SizedBox(height: 10,),
              Container( height: 100, width: 170,
                decoration: BoxDecoration( borderRadius: BorderRadius.circular(1) ),
                child: ClipRRect(
                  child: Image.file(halLightPhNotifier.halLightPhList[index].photo,fit: BoxFit.cover,),
                  borderRadius: BorderRadius.circular(1),
                ),)],);});}break;
        case '26p': {
          return List.generate(halWallsPhNotifier.halWallsPhList.length, (index){
            return Column (children: <Widget>[  SizedBox(height: 10,),
              Container( height: 100, width: 170,
                decoration: BoxDecoration( borderRadius: BorderRadius.circular(1) ),
                child: ClipRRect(
                  child: Image.file(halWallsPhNotifier.halWallsPhList[index].photo,fit: BoxFit.cover,),
                  borderRadius: BorderRadius.circular(1),
                ),)],);});}break;
        case '27p': {
          return List.generate(halWindowsPhNotifier.halWindowsPhList.length, (index){
            return Column (children: <Widget>[  SizedBox(height: 10,),
              Container( height: 100, width: 170,
                decoration: BoxDecoration( borderRadius: BorderRadius.circular(1) ),
                child: ClipRRect(
                  child: Image.file(halWindowsPhNotifier.halWindowsPhList[index].photo,fit: BoxFit.cover,),
                  borderRadius: BorderRadius.circular(1),
                ),)],);});}break;
        case '31p': {
          return List.generate(smoFramePhNotifier.smoFramePhList.length, (index){
            return Column (children: <Widget>[  SizedBox(height: 10,),
              Container( height: 100, width: 170,
                decoration: BoxDecoration( borderRadius: BorderRadius.circular(1) ),
                child: ClipRRect(
                  child: Image.file(smoFramePhNotifier.smoFramePhList[index].photo,fit: BoxFit.cover,),
                  borderRadius: BorderRadius.circular(1),
                ),)],);});}break;
        case '32p': {
          return List.generate(smoExdoorPhNotifier.smoExdoorPhList.length, (index){
            return Column (children: <Widget>[  SizedBox(height: 10,),
              Container( height: 100, width: 170,
                decoration: BoxDecoration( borderRadius: BorderRadius.circular(1) ),
                child: ClipRRect(
                  child: Image.file(smoExdoorPhNotifier.smoExdoorPhList[index].photo,fit: BoxFit.cover,),
                  borderRadius: BorderRadius.circular(1),
                ),)],);});}break;
        case '33p': {
          return List.generate(smoIndoorPhNotifier.smoIndoorPhList.length, (index){
            return Column (children: <Widget>[  SizedBox(height: 10,),
              Container( height: 100, width: 170,
                decoration: BoxDecoration( borderRadius: BorderRadius.circular(1) ),
                child: ClipRRect(
                  child: Image.file(smoIndoorPhNotifier.smoIndoorPhList[index].photo,fit: BoxFit.cover,),
                  borderRadius: BorderRadius.circular(1),
                ),)],);});}break;
        case '34p': {
          return List.generate(smoCeilingPhNotifier.smoCeilingPhList.length, (index){
            return Column (children: <Widget>[  SizedBox(height: 10,),
              Container( height: 100, width: 170,
                decoration: BoxDecoration( borderRadius: BorderRadius.circular(1) ),
                child: ClipRRect(
                  child: Image.file(smoCeilingPhNotifier.smoCeilingPhList[index].photo,fit: BoxFit.cover,),
                  borderRadius: BorderRadius.circular(1),
                ),)],);});}break;
        case '35p': {
          return List.generate(smoLightPhNotifier.smoLightPhList.length, (index){
            return Column (children: <Widget>[  SizedBox(height: 10,),
              Container( height: 100, width: 170,
                decoration: BoxDecoration( borderRadius: BorderRadius.circular(1) ),
                child: ClipRRect(
                  child: Image.file(smoLightPhNotifier.smoLightPhList[index].photo,fit: BoxFit.cover,),
                  borderRadius: BorderRadius.circular(1),
                ),)],);});}break;
        case '36p': {
          return List.generate(smoWallsPhNotifier.smoWallsPhList.length, (index){
            return Column (children: <Widget>[  SizedBox(height: 10,),
              Container( height: 100, width: 170,
                decoration: BoxDecoration( borderRadius: BorderRadius.circular(1) ),
                child: ClipRRect(
                  child: Image.file(smoWallsPhNotifier.smoWallsPhList[index].photo,fit: BoxFit.cover,),
                  borderRadius: BorderRadius.circular(1),
                ),)],);});}break;
        case '37p': {
          return List.generate(smoWindowsPhNotifier.smoWindowsPhList.length, (index){
            return Column (children: <Widget>[  SizedBox(height: 10,),
              Container( height: 100, width: 170,
                decoration: BoxDecoration( borderRadius: BorderRadius.circular(1) ),
                child: ClipRRect(
                  child: Image.file(smoWindowsPhNotifier.smoWindowsPhList[index].photo,fit: BoxFit.cover,),
                  borderRadius: BorderRadius.circular(1),
                ),)],);});}break;
        case '41p': {
          return List.generate(kitFramePhNotifier.kitFramePhList.length, (index){
            return Column (children: <Widget>[  SizedBox(height: 10,),
              Container( height: 100, width: 170,
                decoration: BoxDecoration( borderRadius: BorderRadius.circular(1) ),
                child: ClipRRect(
                  child: Image.file(kitFramePhNotifier.kitFramePhList[index].photo,fit: BoxFit.cover,),
                  borderRadius: BorderRadius.circular(1),
                ),)],);});}break;
        case '42p': {
          return List.generate(kitExdoorPhNotifier.kitExdoorPhList.length, (index){
            return Column (children: <Widget>[  SizedBox(height: 10,),
              Container( height: 100, width: 170,
                decoration: BoxDecoration( borderRadius: BorderRadius.circular(1) ),
                child: ClipRRect(
                  child: Image.file(kitExdoorPhNotifier.kitExdoorPhList[index].photo,fit: BoxFit.cover,),
                  borderRadius: BorderRadius.circular(1),
                ),)],);});}break;
        case '43p': {
          return List.generate(kitIndoorPhNotifier.kitIndoorPhList.length, (index){
            return Column (children: <Widget>[  SizedBox(height: 10,),
              Container( height: 100, width: 170,
                decoration: BoxDecoration( borderRadius: BorderRadius.circular(1) ),
                child: ClipRRect(
                  child: Image.file(kitIndoorPhNotifier.kitIndoorPhList[index].photo,fit: BoxFit.cover,),
                  borderRadius: BorderRadius.circular(1),
                ),)],);});}break;
        case '44p': {
          return List.generate(kitCeilingPhNotifier.kitCeilingPhList.length, (index){
            return Column (children: <Widget>[  SizedBox(height: 10,),
              Container( height: 100, width: 170,
                decoration: BoxDecoration( borderRadius: BorderRadius.circular(1) ),
                child: ClipRRect(
                  child: Image.file(kitCeilingPhNotifier.kitCeilingPhList[index].photo,fit: BoxFit.cover,),
                  borderRadius: BorderRadius.circular(1),
                ),)],);});}break;
        case '45p': {
          return List.generate(kitLightPhNotifier.kitLightPhList.length, (index){
            return Column (children: <Widget>[  SizedBox(height: 10,),
              Container( height: 100, width: 170,
                decoration: BoxDecoration( borderRadius: BorderRadius.circular(1) ),
                child: ClipRRect(
                  child: Image.file(kitLightPhNotifier.kitLightPhList[index].photo,fit: BoxFit.cover,),
                  borderRadius: BorderRadius.circular(1),
                ),)],);});}break;
        case '46p': {
          return List.generate(kitWallsPhNotifier.kitWallsPhList.length, (index){
            return Column (children: <Widget>[  SizedBox(height: 10,),
              Container( height: 100, width: 170,
                decoration: BoxDecoration( borderRadius: BorderRadius.circular(1) ),
                child: ClipRRect(
                  child: Image.file(kitWallsPhNotifier.kitWallsPhList[index].photo,fit: BoxFit.cover,),
                  borderRadius: BorderRadius.circular(1),
                ),)],);});}break;
        case '47p': {
          return List.generate(kitWindowsPhNotifier.kitWindowsPhList.length, (index){
            return Column (children: <Widget>[  SizedBox(height: 10,),
              Container( height: 100, width: 170,
                decoration: BoxDecoration( borderRadius: BorderRadius.circular(1) ),
                child: ClipRRect(
                  child: Image.file(kitWindowsPhNotifier.kitWindowsPhList[index].photo,fit: BoxFit.cover,),
                  borderRadius: BorderRadius.circular(1),
                ),)],);});}break;
        case '51p': {
          return List.generate(bedFramePhNotifier.bedFramePhList.length, (index){
            return Column (children: <Widget>[  SizedBox(height: 10,),
              Container( height: 100, width: 170,
                decoration: BoxDecoration( borderRadius: BorderRadius.circular(1) ),
                child: ClipRRect(
                  child: Image.file(bedFramePhNotifier.bedFramePhList[index].photo,fit: BoxFit.cover,),
                  borderRadius: BorderRadius.circular(1),
                ),)],);});}break;
        case '52p': {
          return List.generate(bedExdoorPhNotifier.bedExdoorPhList.length, (index){
            return Column (children: <Widget>[  SizedBox(height: 10,),
              Container( height: 100, width: 170,
                decoration: BoxDecoration( borderRadius: BorderRadius.circular(1) ),
                child: ClipRRect(
                  child: Image.file(bedExdoorPhNotifier.bedExdoorPhList[index].photo,fit: BoxFit.cover,),
                  borderRadius: BorderRadius.circular(1),
                ),)],);});}break;
        case '53p': {
          return List.generate(bedIndoorPhNotifier.bedIndoorPhList.length, (index){
            return Column (children: <Widget>[  SizedBox(height: 10,),
              Container( height: 100, width: 170,
                decoration: BoxDecoration( borderRadius: BorderRadius.circular(1) ),
                child: ClipRRect(
                  child: Image.file(bedIndoorPhNotifier.bedIndoorPhList[index].photo,fit: BoxFit.cover,),
                  borderRadius: BorderRadius.circular(1),
                ),)],);});}break;
        case '54p': {
          return List.generate(bedCeilingPhNotifier.bedCeilingPhList.length, (index){
            return Column (children: <Widget>[  SizedBox(height: 10,),
              Container( height: 100, width: 170,
                decoration: BoxDecoration( borderRadius: BorderRadius.circular(1) ),
                child: ClipRRect(
                  child: Image.file(bedCeilingPhNotifier.bedCeilingPhList[index].photo,fit: BoxFit.cover,),
                  borderRadius: BorderRadius.circular(1),
                ),)],);});}break;
        case '55p': {
          return List.generate(bedLightPhNotifier.bedLightPhList.length, (index){
            return Column (children: <Widget>[  SizedBox(height: 10,),
              Container( height: 100, width: 170,
                decoration: BoxDecoration( borderRadius: BorderRadius.circular(1) ),
                child: ClipRRect(
                  child: Image.file(bedLightPhNotifier.bedLightPhList[index].photo,fit: BoxFit.cover,),
                  borderRadius: BorderRadius.circular(1),
                ),)],);});}break;
        case '56p': {
          return List.generate(bedWallsPhNotifier.bedWallsPhList.length, (index){
            return Column (children: <Widget>[  SizedBox(height: 10,),
              Container( height: 100, width: 170,
                decoration: BoxDecoration( borderRadius: BorderRadius.circular(1) ),
                child: ClipRRect(
                  child: Image.file(bedWallsPhNotifier.bedWallsPhList[index].photo,fit: BoxFit.cover,),
                  borderRadius: BorderRadius.circular(1),
                ),)],);});}break;
        case '57p': {
          return List.generate(bedWindowsPhNotifier.bedWindowsPhList.length, (index){
            return Column (children: <Widget>[  SizedBox(height: 10,),
              Container( height: 100, width: 170,
                decoration: BoxDecoration( borderRadius: BorderRadius.circular(1) ),
                child: ClipRRect(
                  child: Image.file(bedWindowsPhNotifier.bedWindowsPhList[index].photo,fit: BoxFit.cover,),
                  borderRadius: BorderRadius.circular(1),
                ),)],);});}break;


        default : {print('Error PhotoLoading');}break;
      }
    }

    return Scaffold(
      appBar: PreferredSize(
        child: Container(),
        preferredSize: Size.fromHeight(0.0),
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/bg.png"), fit: BoxFit.cover)),
        child: SingleChildScrollView(
          child: Column(mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
            _buildtitlefloor(),
            Container(
              height: 500,
              child: GridView.count(crossAxisCount: 2,
                  childAspectRatio: 1.5,
                  children: _getlist()),
            ),
              SizedBox(height: 50,),
            ])
        ),
      ),
        floatingActionButton: Stack(
          children: <Widget>[
            Padding(padding: EdgeInsets.only(left:31),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: FloatingActionButton(
                  mini: true,
                  heroTag: "wfleft",
                  backgroundColor: Colors.white,
                  onPressed: (){
                    Navigator.pop(context);

//                    Navigator.push(context, MaterialPageRoute(builder: (context) => Exterior(images: images,imagesleng: imagesleng,)));
//                    widget.floordata = "";
                  },
                  child: Icon(Icons.arrow_back_ios),foregroundColor: Color(0xff684c4c),),
              ),),
            Align(
              alignment: Alignment.bottomCenter,
              child:           Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  InkWell(
                    onTap: (){
                      imageSelectorCamera();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: new BorderRadius.only(
                            topLeft: const Radius.circular(25.0),
//                            topRight: const Radius.circular(25.0),
                            bottomLeft: const Radius.circular(25.0),
//                            bottomRight: const Radius.circular(25.0)
                        ),
                        color: Colors.white.withOpacity(1),
                        border: new Border.all(
                          color: Color(0xff684c4c),

                          width: 2,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 4,
                            offset: Offset(5, 5), // changes position of shadow
                          ),
                        ],
                      ),
                      height: 100,
                      width: 100,
                      child: Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                " Take",
                                style: TextStyle(
                                    color: Color(0xff684c4c),
                                    fontFamily: 'arimo',
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                " photo",
                                style: TextStyle(
                                    color: Color(0xff684c4c),
                                    fontFamily: 'arimo',
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          )),
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      imageSelectorGallery();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: new BorderRadius.only(
//                            topLeft: const Radius.circular(25.0),
                            topRight: const Radius.circular(25.0),
//                            bottomLeft: const Radius.circular(25.0),
                            bottomRight: const Radius.circular(25.0)),
                        color: Colors.white.withOpacity(1),
                        border: new Border.all(
                          color: Color(0xff684c4c),
                          width: 2,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 4,
                            offset: Offset(5, 5), // changes position of shadow
                          ),
                        ],
                      ),
                      height: 100,
                      width: 100,
                      child: Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                "Photo",
                                style: TextStyle(
                                    color: Color(0xff684c4c),
                                    fontFamily: 'arimo',
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "Gallery",
                                style: TextStyle(
                                    color: Color(0xff684c4c),
                                    fontFamily: 'arimo',
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          )),
                    ),
                  )
                ],
              ),
            )

          ],
        )
    );

}
}
