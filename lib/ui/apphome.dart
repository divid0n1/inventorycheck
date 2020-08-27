import 'package:inventorycheck/ui/myproperty.dart';
import 'package:inventorycheck/ui/newinventory.dart';
import 'package:flutter/material.dart';

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
        border: new Border.all(color: Colors.grey,width: 2.0,),
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
        border: new Border.all(color: Color(0xffb7bdc3),width: 2.0,),
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
              SizedBox(height: 100,),
              InkWell(
//                onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => IntroInvent()));},
                child: _btninventory(),
              ),
              SizedBox(height: 25,),
              InkWell(
                child: _btnmyproperty(),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => MyProperty()));
                },
              ),

            ],
          ),
        ));
  }
}