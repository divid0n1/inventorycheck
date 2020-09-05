import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mailer/flutter_mailer.dart';
import 'package:inventorycheck/ui/myproperty.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';
import 'introInvent.dart';

class AppHome extends StatefulWidget {

  @override
  _AppHomeState createState() => _AppHomeState();
}
class _AppHomeState extends State<AppHome> {
  Widget _buildtitle() {
    return Container(
        padding: EdgeInsets.only(top: 40),
        child: Center(
          child: Text(
            "Check Inventory",
            style: TextStyle(
              fontFamily: 'herrvon',
              fontSize: 60,
            ),
          ),
        ));
  }

  Widget _builddescription() {
    return Container(
      child: Text(
        "FOR A STRAIGHT FORWARD MOVE",
        style: TextStyle(fontFamily: 'arimoBold', fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _btninventory() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.8),
        border: new Border.all(
          color: Colors.grey,
          width: 2.0,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 1,
            offset: Offset(5, 5),
          ),
        ],
      ),
      height: 55,
      width: 240,
      child: Center(
          child: Text(
        "New Inventory",
        style: TextStyle(
          color: Color(0xff684c4c),
          fontFamily: 'alice',
          fontSize: 25,
        ),
      )),
    );
  }

  Widget _btnmyproperty() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.8),
        border: new Border.all(
          color: Color(0xffb7bdc3),
          width: 2.0,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 1,
            offset: Offset(5, 5),
          ),
        ],
      ),
      height: 55,
      width: 240,
      child: Center(
          child: Text(
        "My Property",
        style: TextStyle(
          color: Color(0xff684c4c),
          fontFamily: 'alice',
          fontSize: 25,
        ),
      )),
    );
  }

  Widget _btncontact() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.8),
        border: new Border.all(
          color: Color(0xffb7bdc3),
          width: 2.0,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 1,
            offset: Offset(5, 5),
          ),
        ],
      ),
      height: 55,
      width: 240,
      child: Center(
          child: Text(
            "App support",
            style: TextStyle(
              color: Color(0xff684c4c),
              fontFamily: 'alice',
              fontSize: 25,
            ),
          )),
    );
  }



  String pdfpath;

  Future<String> getValues() async {
    SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
    pdfpath = await sharedPrefs.getString('addressp');
  }

  @override
  Widget build(BuildContext context) {



    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/bg.png"), fit: BoxFit.cover)),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            children: <Widget>[
              _buildtitle(),
              _builddescription(),
              Column(mainAxisAlignment: MainAxisAlignment.center,
                children: [
              SizedBox(
                height: 100,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => IntroInvent()));
                },
                child: _btninventory(),
              ),
              SizedBox(
                height: 25,
              ),
              GestureDetector(
                child: _btnmyproperty(),
                onTapDown: (_) {
                  getValues();
                  print('1');
                },
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MyProperty(
                                pdfpath: pdfpath,
                              )));
                  print('2');
                  // Navigator.push(context, MaterialPageRoute(builder: (context) => MyProperty()));
                },
              ),
              SizedBox(height: 25,),
              InkWell(
                onTap: () async{
                  final MailOptions mailOptions = MailOptions(
                    body: '',
                    subject: 'CheckInventory: ',
                    recipients: ['contact@eutopianlettings.co.uk'],
//                    isHTML: true,
//                    bccRecipients: ['other@example.com'],
//                    ccRecipients: ['third@example.com'],
//                    attachments: [ 'path/to/image.png', ],
                  );

                  await FlutterMailer.send(mailOptions);
//                  Navigator.push(context, MaterialPageRoute(builder: (context) => Contactus()));


                },
                child: _btncontact(),
              ),
//                  fud(),
                IconButton(icon: Icon(Icons.arrow_right_alt_outlined),
                onPressed: (){
                   print('${DateFormat("dd-MM-yyyy").format(DateTime.now())} ${DateFormat("Hm").format(DateTime.now())} ');

                },)
                ],),

            ],
          ),
        ));
  }
}
