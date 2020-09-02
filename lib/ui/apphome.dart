import 'dart:io';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_mailer/flutter_mailer.dart';
import 'package:inventorycheck/ui/myproperty.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'introInvent.dart';

class AppHome extends StatelessWidget {
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
            "Contact",
            style: TextStyle(
              color: Color(0xff684c4c),
              fontFamily: 'alice',
              fontSize: 25,
            ),
          )),
    );
  }


/*  Future<void> send() async {
    if (Platform.isIOS) {
      final bool canSend = await FlutterMailer.canSendMail();
      if (!canSend) {
        const SnackBar snackbar =
        const SnackBar(content: Text('no Email App Available'));
        print('scaffoldkey current state show snack bar');
//        _scafoldKey.currentState.showSnackBar(snackbar);
        return;
      }
    }

    // Platform messages may fail, so we use a try/catch PlatformException.
    final MailOptions mailOptions = MailOptions(
      body: 'bodytext',
      subject: 'subtext',
      recipients: <String>['recep@example.com'],
      isHTML: true,
      // bccRecipients: ['other@example.com'],
      ccRecipients: <String>['ccc@example.com'],
//      attachments: attachment,
    );

    String platformResponse;

    try {
      await FlutterMailer.send(mailOptions);
      platformResponse = 'success';
    } on PlatformException catch (error) {
      platformResponse = error.toString();
      print(error);
      if (!mounted) {
        return;
      } await print('show another dialog'
      );
//      await showDialog<void>(
//          context: _scafoldKey.currentContext,
//          builder: (BuildContext context) => AlertDialog(
//            shape: RoundedRectangleBorder(
//                borderRadius: BorderRadius.circular(4)),
//            content: Column(
//              mainAxisAlignment: MainAxisAlignment.start,
//              crossAxisAlignment: CrossAxisAlignment.start,
//              mainAxisSize: MainAxisSize.min,
//              children: <Widget>[
//                Text(
//                  'Message',
//                  style: Theme.of(context).textTheme.subtitle1,
//                ),
//                Text(error.message),
//              ],
//            ),
//            contentPadding: const EdgeInsets.all(26),
//            title: Text(error.code),
//          ));
    } catch (error) {
      platformResponse = error.toString();
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) {
      return;
    } print ('trhid dialog');
//    _scafoldKey.currentState.showSnackBar(SnackBar(
//      content: Text(platformResponse),
//    ));
  }*/




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
              )
            ],
          ),
        ));
  }
}
