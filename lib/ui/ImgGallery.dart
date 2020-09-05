import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:inventorycheck/model/imagedata.dart';
import 'package:inventorycheck/notify/imagesnotifier.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

import 'dataexterior.dart';

class ImgGallery extends StatefulWidget {
  final String jar;
  const ImgGallery ({ Key key, this.jar }): super(key: key);

  @override
  _ImgGalleryState createState() => _ImgGalleryState();
}

class _ImgGalleryState extends State<ImgGallery> {
var imgtitle;

@override
void initState() {
  // TODO: implement initState
  super.initState();
//switch
  switch(widget.jar) {
    case '1':
      {
        imgtitle = 'Gas Meter';
      }
      break;
    case '2':
      {
        imgtitle = 'Electrick Meter';
      }
      break;
    case '2':
      {
        imgtitle = 'Hallway Floor';
      }
      break;
    case 'bb':
      {
        imgtitle = 'Hallway Furniture';
      }
      break;
    case '3':
      {
        imgtitle = 'Ceiling Lighting';
      }
      break;
    case 'bc':
      {
        imgtitle = 'Switches & Smoke';
      }
      break;
    case '4':
      {
        imgtitle = 'Kitchen Floor';
      }
      break;
    case 'bd':
      {
        imgtitle = 'Kitchen Squirting';
      }
      break;
    case '5':
      {
        imgtitle = 'BedRoom Floor';
      }
      break;
    case 'be':
      {
        imgtitle = 'BedRoom Interior';
      }
      break;
    case '6':
      {
        imgtitle = 'Keys';
      }
      break;
    case 'bf':
      {
        imgtitle = 'Locks';
      }
      break;
    case '7':
      {
        imgtitle = 'Meter Gas';
      }
      break;
    case 'bg':
      {
        imgtitle = 'Meter Electic';
      }
      break;

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
  btncamimg(){

    return InkWell(
      onTap: (){
//        imageSelectorCamera();
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: new BorderRadius.only(
              topLeft: const Radius.circular(25.0),
              topRight: const Radius.circular(25.0),
              bottomLeft: const Radius.circular(25.0),
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
        width: 240,
        child: Center(
            child: Text(
              "Take photo",
              style: TextStyle(
                  color: Color(0xff684c4c),
                  fontFamily: 'arimo',
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            )),
      ),
    );


  }




  @override
  Widget build(BuildContext context) {
    ExteriorImgNotifier exteriorImgNotifier = Provider.of<ExteriorImgNotifier>(context);
    HallwayImgNotify hallwayImgNotify = Provider.of<HallwayImgNotify>(context);
    SmoteImgNotify smoteImgNotify = Provider.of<SmoteImgNotify>(context);
    KitchenImgNotify kitchenImgNotify = Provider.of<KitchenImgNotify>(context);
    BedroomImgNotify bedroomImgNotify = Provider.of<BedroomImgNotify>(context);
    ChaabiImgNotify chaabiImgNotify = Provider.of<ChaabiImgNotify>(context);
    MeterImgNotify meterImgNotify = Provider.of<MeterImgNotify>(context);

    ExteriorImgTanNotifier exteriorImgTanNotifier = Provider.of<ExteriorImgTanNotifier>(context);
    HallwayImgTanNotify hallwayImgTanNotify = Provider.of<HallwayImgTanNotify>(context);
    SmoteImgTanNotify smoteImgTanNotify = Provider.of<SmoteImgTanNotify>(context);
    KitchenImgTanNotify kitchenImgTanNotify = Provider.of<KitchenImgTanNotify>(context);
    BedroomImgTanNotify bedroomImgTanNotify = Provider.of<BedroomImgTanNotify>(context);
    ChaabiImgTanNotify chaabiImgTanNotify = Provider.of<ChaabiImgTanNotify>(context);
    MeterImgTanNotify meterImgTanNotify = Provider.of<MeterImgTanNotify>(context);


    imageSelectorCamera() async {
      cameraFile = await ImagePicker.pickImage(
        source: ImageSource.camera,
      );
      setState(() {
        switch(widget.jar) {
          case '1': {
            exteriorImgNotifier.addExteriorImg(ExteriorImages(cameraFile));
          }
          break;

          case '2': {
            hallwayImgNotify.addHallwayImg(HallwayImg(cameraFile));
          }
          break;

          case '3': {
            smoteImgNotify.addSmoteImg(SmoteImg(cameraFile));
          }
          break;

          case '4': {
            kitchenImgNotify.addKitchenImg(KitchenImg(cameraFile));
          }
          break;

          case '5': {
            bedroomImgNotify.addBedroomImg(BedroomImg(cameraFile));
          }
          break;

          case '6': {
            chaabiImgNotify.addChaabiImg(ChaabiImg(cameraFile));
          }
          break;

          case '7': {
            meterImgNotify.addMeterImg(MeterImg(cameraFile));
          }
          break;

          case 'ba': {
            exteriorImgTanNotifier.addExteriorImgTan(ExteriorImagesTan(cameraFile));
          }
          break;

          case 'bb': {
            hallwayImgTanNotify.addHallwayImgTan(HallwayImgTan(cameraFile));
          }
          break;

          case 'bc': {
            smoteImgTanNotify.addSmoteImgTan(SmoteImgTan(cameraFile));
          }
          break;

          case 'bd': {
            kitchenImgTanNotify.addKitchenImgTan(KitchenImgTan(cameraFile));
          }
          break;

          case 'be': {
            bedroomImgTanNotify.addBedroomImgTan(BedroomImgTan(cameraFile));
          }
          break;

          case 'bf': {
            chaabiImgTanNotify.addChaabiImgTan(ChaabiImgTan(cameraFile));
          }
          break;

          case 'bg': {
            meterImgTanNotify.addMeterImgTan(MeterImgTan(cameraFile));
          }
          break;

          default: {
            print('unable to determine');
          }
          break;
        }
      });
      print("You selected camera image : " + cameraFile.path);
//     Directory documentDirectory = await getDownloadsDirectory();
//     File file = File("$documentDirectory/$pdffilename.pdf");

//      Directory documentDirectory = await getDownloadsDirectory();
//      String documentPath = documentDirectory.path;
//      File file = File(cameraFile.path);
//      File savedImage = await imagen.copy('$path/saved_image.jpg');
//    final direc = await getDownloadsDirectory;
//    final myImgPath = '${direc.path}/MyImages';
      Directory documentDirectory = await getApplicationDocumentsDirectory();
      String documentPath = documentDirectory.path;
      var vella = DateTime.now().millisecondsSinceEpoch;
      final File newImage = await cameraFile.copy('$documentPath/Invent$vella.png');
      print("New Path Saved:${newImage}");

//      Directory documentDirector = await getDownloadsDirectory();
//      String documentPat = documentDirector.path;
//      final File newImag = await cameraFile.copy('$documentPat/image2.png');
//      print("New Path Saved:${newImag}");

    }

    imageSelectorGallery() async {
      galleryFile = await ImagePicker.pickImage(
        source: ImageSource.gallery,
      );
      setState(() {
        switch(widget.jar) {
          case '1': {
            exteriorImgNotifier.addExteriorImg(ExteriorImages(galleryFile));
          }
          break;

          case '2': {
            hallwayImgNotify.addHallwayImg(HallwayImg(galleryFile));
          }
          break;

          case '3': {
            smoteImgNotify.addSmoteImg(SmoteImg(galleryFile));
          }
          break;

          case '4': {
            kitchenImgNotify.addKitchenImg(KitchenImg(galleryFile));
          }
          break;

          case '5': {
            bedroomImgNotify.addBedroomImg(BedroomImg(galleryFile));
          }
          break;

          case '6': {
            chaabiImgNotify.addChaabiImg(ChaabiImg(galleryFile));
          }
          break;

          case '7': {
            meterImgNotify.addMeterImg(MeterImg(galleryFile));
          }
          break;

          case 'ba': {
            exteriorImgTanNotifier.addExteriorImgTan(ExteriorImagesTan(galleryFile));
          }
          break;

          case 'bb': {
            hallwayImgTanNotify.addHallwayImgTan(HallwayImgTan(galleryFile));
          }
          break;

          case 'bc': {
            smoteImgTanNotify.addSmoteImgTan(SmoteImgTan(galleryFile));
          }
          break;

          case 'bd': {
            kitchenImgTanNotify.addKitchenImgTan(KitchenImgTan(galleryFile));
          }
          break;

          case 'be': {
            bedroomImgTanNotify.addBedroomImgTan(BedroomImgTan(galleryFile));
          }
          break;

          case 'bf': {
            chaabiImgTanNotify.addChaabiImgTan(ChaabiImgTan(galleryFile));
          }
          break;

          case 'bg': {
            meterImgTanNotify.addMeterImgTan(MeterImgTan(galleryFile));
          }
          break;

          default: {
            print('unable to determine');
          }
          break;
        }



      });
      print("You selected camera image : " + galleryFile.path);
    }

    Widget gridview (){

      switch(widget.jar) {
        case '1': {
          return Container(
            height: 500,
            child: GridView.count(crossAxisCount: 2,
                childAspectRatio: 1.5,
                children: List.generate(exteriorImgNotifier.exteriorImgList.length, (index){
                  return Column (children: <Widget>[
                    SizedBox(height: 10,),
                    Container(
                      height: 100,
                      width: 170,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(1)
                      ),
                      child: ClipRRect(
                        child: Image.file(exteriorImgNotifier.exteriorImgList[index].imagesfloor,fit: BoxFit.cover,),
                        borderRadius: BorderRadius.circular(1),
                      ),)
                  ],);
                }
                )
            ),
          );
        }
        break;

        case '2': {
          return Container(
            height: 500,
            child: GridView.count(crossAxisCount: 2,
                childAspectRatio: 1.5,
                children: List.generate(hallwayImgNotify.hallwayImgList.length, (index){
                  return Column (children: <Widget>[
                    SizedBox(height: 10,),
                    Container(
                      height: 100,
                      width: 170,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(1)
                      ),
                      child: ClipRRect(
                        child: Image.file(hallwayImgNotify.hallwayImgList[index].imagehallway,fit: BoxFit.cover,),
                        borderRadius: BorderRadius.circular(1),
                      ),)
                  ],);
                }
                )
            ),
          );
        }
        break;

        case '3': {
          return Container(
            height: 500,
            child: GridView.count(crossAxisCount: 2,
                childAspectRatio: 1.5,
                children: List.generate(smoteImgNotify.smoteImgList.length, (index){
                  return Column (children: <Widget>[
                    SizedBox(height: 10,),
                    Container(
                      height: 100,
                      width: 170,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(1)
                      ),
                      child: ClipRRect(
                        child: Image.file(smoteImgNotify.smoteImgList[index].imagessmote,fit: BoxFit.cover,),
                        borderRadius: BorderRadius.circular(1),
                      ),)
                  ],);
                }
                )
            ),
          );
        }
        break;

        case '4': {
          return Container(
            height: 500,
            child: GridView.count(crossAxisCount: 2,
                childAspectRatio: 1.5,
                children: List.generate(kitchenImgNotify.kitchenImgList.length, (index){
                  return Column (children: <Widget>[
                    SizedBox(height: 10,),
                    Container(
                      height: 100,
                      width: 170,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(1)
                      ),
                      child: ClipRRect(
                        child: Image.file(kitchenImgNotify.kitchenImgList[index].imagekitchen,fit: BoxFit.cover,),
                        borderRadius: BorderRadius.circular(1),
                      ),)
                  ],);
                }
                )
            ),
          );
        }
        break;

        case '5': {
          return Container(
            height: 500,
            child: GridView.count(crossAxisCount: 2,
                childAspectRatio: 1.5,
                children: List.generate(bedroomImgNotify.bedroomImgList.length, (index){
                  return Column (children: <Widget>[
                    SizedBox(height: 10,),
                    Container(
                      height: 100,
                      width: 170,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(1)
                      ),
                      child: ClipRRect(
                        child: Image.file(bedroomImgNotify.bedroomImgList[index].imagebedroom,fit: BoxFit.cover,),
                        borderRadius: BorderRadius.circular(1),
                      ),)
                  ],);
                }
                )
            ),
          );
        }
        break;

        case '6': {
          return Container(
            height: 500,
            child: GridView.count(crossAxisCount: 2,
                childAspectRatio: 1.5,
                children: List.generate(chaabiImgNotify.chaabiImgList.length, (index){
                  return Column (children: <Widget>[
                    SizedBox(height: 10,),
                    Container(
                      height: 100,
                      width: 170,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(1)
                      ),
                      child: ClipRRect(
                        child: Image.file(chaabiImgNotify.chaabiImgList[index].imagechaabi,fit: BoxFit.cover,),
                        borderRadius: BorderRadius.circular(1),
                      ),)
                  ],);
                }
                )
            ),
          );
        }
        break;

        case '7': {
          return Container(
            height: 500,
            child: GridView.count(crossAxisCount: 2,
                childAspectRatio: 1.5,
                children: List.generate(meterImgNotify.meterImgList.length, (index){
                  return Column (children: <Widget>[
                    SizedBox(height: 10,),
                    Container(
                      height: 100,
                      width: 170,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(1)
                      ),
                      child: ClipRRect(
                        child: Image.file(meterImgNotify.meterImgList[index].imagemeter,fit: BoxFit.cover,),
                        borderRadius: BorderRadius.circular(1),
                      ),)
                  ],);
                }
                )
            ),
          );
        }
        break;

        case 'ba': {
          return Container(
            height: 500,
            child: GridView.count(crossAxisCount: 2,
                childAspectRatio: 1.5,
                children: List.generate(exteriorImgTanNotifier.exteriorImgTanList.length, (index){
                  return Column (children: <Widget>[
                    SizedBox(height: 10,),
                    Container(
                      height: 100,
                      width: 170,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(1)
                      ),
                      child: ClipRRect(
                        child: Image.file(exteriorImgTanNotifier.exteriorImgTanList[index].imagesfloortan,fit: BoxFit.cover,),
                        borderRadius: BorderRadius.circular(1),
                      ),)
                  ],);
                }
                )
            ),
          );
        }
        break;

        case 'bb': {
          return Container(
            height: 500,
            child: GridView.count(crossAxisCount: 2,
                childAspectRatio: 1.5,
                children: List.generate(hallwayImgTanNotify.hallwayImgTanList.length, (index){
                  return Column (children: <Widget>[
                    SizedBox(height: 10,),
                    Container(
                      height: 100,
                      width: 170,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(1)
                      ),
                      child: ClipRRect(
                        child: Image.file(hallwayImgTanNotify.hallwayImgTanList[index].imagehallwaytan,fit: BoxFit.cover,),
                        borderRadius: BorderRadius.circular(1),
                      ),)
                  ],);
                }
                )
            ),
          );
        }
        break;

        case 'bc': {
          return Container(
            height: 500,
            child: GridView.count(crossAxisCount: 2,
                childAspectRatio: 1.5,
                children: List.generate(smoteImgTanNotify.smoteImgTanList.length, (index){
                  return Column (children: <Widget>[
                    SizedBox(height: 10,),
                    Container(
                      height: 100,
                      width: 170,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(1)
                      ),
                      child: ClipRRect(
                        child: Image.file(smoteImgTanNotify.smoteImgTanList[index].imagessmotetan,fit: BoxFit.cover,),
                        borderRadius: BorderRadius.circular(1),
                      ),)
                  ],);
                }
                )
            ),
          );
        }
        break;

        case 'bd': {
          return Container(
            height: 500,
            child: GridView.count(crossAxisCount: 2,
                childAspectRatio: 1.5,
                children: List.generate(kitchenImgTanNotify.kitchenImgTanList.length, (index){
                  return Column (children: <Widget>[
                    SizedBox(height: 10,),
                    Container(
                      height: 100,
                      width: 170,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(1)
                      ),
                      child: ClipRRect(
                        child: Image.file(kitchenImgTanNotify.kitchenImgTanList[index].imagekitchentan,fit: BoxFit.cover,),
                        borderRadius: BorderRadius.circular(1),
                      ),)
                  ],);
                }
                )
            ),
          );
        }
        break;

        case 'be': {
          return Container(
            height: 500,
            child: GridView.count(crossAxisCount: 2,
                childAspectRatio: 1.5,
                children: List.generate(bedroomImgTanNotify.bedroomImgTanList.length, (index){
                  return Column (children: <Widget>[
                    SizedBox(height: 10,),
                    Container(
                      height: 100,
                      width: 170,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(1)
                      ),
                      child: ClipRRect(
                        child: Image.file(bedroomImgTanNotify.bedroomImgTanList[index].imagebedroomtan,fit: BoxFit.cover,),
                        borderRadius: BorderRadius.circular(1),
                      ),)
                  ],);
                }
                )
            ),
          );
        }
        break;

        case 'bf': {
          return Container(
            height: 500,
            child: GridView.count(crossAxisCount: 2,
                childAspectRatio: 1.5,
                children: List.generate(chaabiImgTanNotify.chaabiImgTanList.length, (index){
                  return Column (children: <Widget>[
                    SizedBox(height: 10,),
                    Container(
                      height: 100,
                      width: 170,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(1)
                      ),
                      child: ClipRRect(
                        child: Image.file(chaabiImgTanNotify.chaabiImgTanList[index].imagechaabitan,fit: BoxFit.cover,),
                        borderRadius: BorderRadius.circular(1),
                      ),)
                  ],);
                }
                )
            ),
          );
        }
        break;

        case 'bg': {
          return Container(
            height: 500,
            child: GridView.count(crossAxisCount: 2,
                childAspectRatio: 1.5,
                children: List.generate(meterImgTanNotify.meterImgTanList.length, (index){
                  return Column (children: <Widget>[
                    SizedBox(height: 10,),
                    Container(
                      height: 100,
                      width: 170,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(1)
                      ),
                      child: ClipRRect(
                        child: Image.file(meterImgTanNotify.meterImgTanList[index].imagemetertan,fit: BoxFit.cover,),
                        borderRadius: BorderRadius.circular(1),
                      ),)
                  ],);
                }
                )
            ),
          );
        }
        break;


        default: {
          print('unable to determine');
        }
        break;
      };


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
//          Text(
//              'Img Floor: ${exteriorImgNotifier.exteriorImgList.length ?? ""}',
//            style: TextStyle(fontSize: 20,),
//),
//              Text(
//                'Img Door: ${hallwayImgNotify.hallwayImgList.length ?? ""}',
//                style: TextStyle(fontSize: 20,),
//              ),
              gridview(),

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
                  onPressed: (){Navigator.pop(context, MaterialPageRoute(builder: (context) => DataExterior()));

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
                                "Pick",
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
