import 'dart:collection';
import 'package:flutter/cupertino.dart';
//1
class BdfourFrame {
  final String description;
  final String quantity;
  final String colour;
  final String condition;
  BdfourFrame(this.description, this.quantity, this.colour, this.condition);
}
class BdfourFrameNotifier with ChangeNotifier{
  List<BdfourFrame> _bdfourFrameList = [];
  UnmodifiableListView<BdfourFrame> get bdfourFrameList => UnmodifiableListView(_bdfourFrameList);
  addBdfourFrame(BdfourFrame bdfourFrame){
    _bdfourFrameList.add(bdfourFrame);
    notifyListeners();
  }}
//2
class BdfourExdoor {
  final String description;
  final String quantity;
  final String colour;
  final String condition;
  BdfourExdoor(this.description, this.quantity, this.colour, this.condition);
}
class BdfourExdoorNotifier with ChangeNotifier{
  List<BdfourExdoor> _bdfourExdoorList = [];
  UnmodifiableListView<BdfourExdoor> get bdfourExdoorList => UnmodifiableListView(_bdfourExdoorList);
  addBdfourExdoor(BdfourExdoor bdfourExdoor){
    _bdfourExdoorList.add(bdfourExdoor);
    notifyListeners();
  }}
//3
class BdfourIndoor {
  final String description;
  final String quantity;
  final String colour;
  final String condition;
  BdfourIndoor(this.description, this.quantity, this.colour, this.condition);
}
class BdfourIndoorNotifier with ChangeNotifier{
  List<BdfourIndoor> _bdfourIndoorList = [];
  UnmodifiableListView<BdfourIndoor> get bdfourIndoorList => UnmodifiableListView(_bdfourIndoorList);
  addBdfourIndoor(BdfourIndoor bdfourIndoor){
    _bdfourIndoorList.add(bdfourIndoor);
    notifyListeners();
  }}
//4
class BdfourCeiling {
  final String description;
  final String quantity;
  final String colour;
  final String condition;
  BdfourCeiling(this.description, this.quantity, this.colour, this.condition);
}
class BdfourCeilingNotifier with ChangeNotifier{
  List<BdfourCeiling> _bdfourCeilingList = [];
  UnmodifiableListView<BdfourCeiling> get bdfourCeilingList => UnmodifiableListView(_bdfourCeilingList);
  addBdfourCeiling(BdfourCeiling bdfourCeiling){
    _bdfourCeilingList.add(bdfourCeiling);
    notifyListeners();
  }}
//5
class BdfourLight {
  final String description;
  final String quantity;
  final String colour;
  final String condition;
  BdfourLight(this.description, this.quantity, this.colour, this.condition);
}
class BdfourLightNotifier with ChangeNotifier{
  List<BdfourLight> _bdfourLightList = [];
  UnmodifiableListView<BdfourLight> get bdfourLightList => UnmodifiableListView(_bdfourLightList);
  addBdfourLight(BdfourLight bdfourLight){
    _bdfourLightList.add(bdfourLight);
    notifyListeners();
  }}
//6
class BdfourWalls {
  final String description;
  final String quantity;
  final String colour;
  final String condition;
  BdfourWalls(this.description, this.quantity, this.colour, this.condition);
}
class BdfourWallsNotifier with ChangeNotifier{
  List<BdfourWalls> _bdfourWallsList = [];
  UnmodifiableListView<BdfourWalls> get bdfourWallsList => UnmodifiableListView(_bdfourWallsList);
  addBdfourWalls(BdfourWalls bdfourWalls){
    _bdfourWallsList.add(bdfourWalls);
    notifyListeners();
  }}
//7
class BdfourWindows {
  final String description;
  final String quantity;
  final String colour;
  final String condition;
  BdfourWindows(this.description, this.quantity, this.colour, this.condition);
}
class BdfourWindowsNotifier with ChangeNotifier{
  List<BdfourWindows> _bdfourWindowsList = [];
  UnmodifiableListView<BdfourWindows> get bdfourWindowsList => UnmodifiableListView(_bdfourWindowsList);
  addBdfourWindows(BdfourWindows bdfourWindows){
    _bdfourWindowsList.add(bdfourWindows);
    notifyListeners();
  }}



