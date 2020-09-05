import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image/image.dart' as imgg;
import 'package:inventorycheck/NotifierList/MeterText.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class meterImg extends StatefulWidget {
  final String Route;
  const meterImg ({ Key key, this.Route }): super(key: key);

  @override
  _meterImgState createState() => _meterImgState();
}

class _meterImgState extends State<meterImg> {
var imgtitle;

@override
void initState() {
  // TODO: implement initState
  super.initState();
//switch
  switch(widget.Route) {
    case '1': { imgtitle = 'Gas Meter'; } break;
    case '2': { imgtitle = 'Electric Meter'; } break;
    case '3': { imgtitle = 'Smoke Detector'; } break;
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
    GasMeterPhNotifier gasMeterPhNotifier = Provider.of<GasMeterPhNotifier>(context);
    ElecMeterPhNotifier elecMeterPhNotifier = Provider.of<ElecMeterPhNotifier>(context);
    SmokeDePhNotifier smokeDePhNotifier = Provider.of<SmokeDePhNotifier>(context);
    var isLandscape = MediaQuery.of(context).orientation == Orientation.portrait;
    _camalert(){
      return showDialog(
          context: context,
          builder: (BuildContext context) {
            return Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius:
                  BorderRadius.circular(20.0)), //this right here
              child: Container(
                height: 150,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [SizedBox(height: 10,),
                      Text('Please Rotate Your Phone',style: TextStyle( fontFamily: 'alice',fontSize: 20,),),
                      SizedBox(height: 30,),
                      Row(mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[

                          SizedBox(height: 30,width: 80,
                            child: InkWell(

                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Center(
                                child: Text(
                                  "Ok",
                                  style: TextStyle(color: Color(0xff684c4c), fontFamily: 'alice',fontSize: 25,),
                                ), ), ), ), ], ) ], ), ), ), ); });}

    imageSelectorCamera() async {

      cameraFile = await ImagePicker.pickImage(
        source: ImageSource.camera,
      );
      var datetim = '${DateFormat("dd-MM-yyyy").format(DateTime.now())} ${DateFormat("Hm").format(DateTime.now())} ';      var decodeImg = imgg.decodeImage(cameraFile.readAsBytesSync());
      imgg.drawString(decodeImg, imgg.arial_48, 50, 50, datetim);
      var encodeImage = imgg.encodeJpg(decodeImg, quality: 100);
      var finalImage = File(cameraFile.path)..writeAsBytesSync(encodeImage);
      setState(() {
        if (finalImage != null ){
          switch(widget.Route) {
            case '1': { gasMeterPhNotifier.addGasMeterPh(GasMeterPh(finalImage)); }break;
            case '2': { elecMeterPhNotifier.addElecMeterPh(ElecMeterPh(finalImage)); }break;
            case '3': { smokeDePhNotifier.addSmokeDePh(SmokeDePh(finalImage)); }break;

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

          case '1': { gasMeterPhNotifier.addGasMeterPh(GasMeterPh(galleryFile)); }break;
          case '2': { elecMeterPhNotifier.addElecMeterPh(ElecMeterPh(galleryFile)); }break;
          case '3': { smokeDePhNotifier.addSmokeDePh(SmokeDePh(galleryFile)); }break;

          default: { print('unable to determine'); } break;}
        }
      });
      print("You selected camera image : " + galleryFile.path);
    }

    Future<File> drawTextOnImage() async {
      var image = await ImagePicker.pickImage(source: ImageSource.camera);
      var decodeImg = imgg.decodeImage(image.readAsBytesSync());
      var datetim = '${DateFormat("dd-MM-yyyy").format(DateTime.now())} ${DateFormat("Hm").format(DateTime.now())} ';
      imgg.drawString(decodeImg, imgg.arial_48, 0, 0, datetim);
      var encodeImage = imgg.encodeJpg(decodeImg, quality: 100);
      var finalImage = File(image.path)..writeAsBytesSync(encodeImage);
      return finalImage;
    }

    _getlist(){
      switch(widget.Route){
        case '1': {
          return List.generate(gasMeterPhNotifier.gasMeterPhList.length, (index){
            return Column (children: <Widget>[  SizedBox(height: 10,),
              Container( height: 100, width: 170,
                decoration: BoxDecoration( borderRadius: BorderRadius.circular(1) ),
                child: ClipRRect(
                  child: Image.file(gasMeterPhNotifier.gasMeterPhList[index].photo,fit: BoxFit.cover,),
                  borderRadius: BorderRadius.circular(1),
                ),)],);});}break;
        case '2': {
          return List.generate(elecMeterPhNotifier.elecMeterPhList.length, (index){
            return Column (children: <Widget>[  SizedBox(height: 10,),
              Container( height: 100, width: 170,
                decoration: BoxDecoration( borderRadius: BorderRadius.circular(1) ),
                child: ClipRRect(
                  child: Image.file(elecMeterPhNotifier.elecMeterPhList[index].photo,fit: BoxFit.cover,),
                  borderRadius: BorderRadius.circular(1),
                ),)],);});}break;
        case '3': {
          return List.generate(smokeDePhNotifier.smokeDePhList.length, (index){
            return Column (children: <Widget>[  SizedBox(height: 10,),
              Container( height: 100, width: 170,
                decoration: BoxDecoration( borderRadius: BorderRadius.circular(1) ),
                child: ClipRRect(
                  child: Image.file(smokeDePhNotifier.smokeDePhList[index].photo,fit: BoxFit.cover,),
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
                    onTap: (){if(isLandscape == true){
                      imageSelectorCamera();
                    }else {_camalert();}
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
