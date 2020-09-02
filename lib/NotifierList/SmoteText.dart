import 'dart:collection';
import 'package:flutter/cupertino.dart';
//1
class SmoFrame {
  final String description;
  final String quantity;
  final String colour;
  final String condition;
  SmoFrame(this.description, this.quantity, this.colour, this.condition);
}
class SmoFrameNotifier with ChangeNotifier{
  List<SmoFrame> _smoFrameList = [];
  UnmodifiableListView<SmoFrame> get smoFrameList => UnmodifiableListView(_smoFrameList);
  addSmoFrame(SmoFrame smoFrame){
    _smoFrameList.add(smoFrame);
    notifyListeners();
  }}
//2
class SmoExdoor {
  final String description;
  final String quantity;
  final String colour;
  final String condition;
  SmoExdoor(this.description, this.quantity, this.colour, this.condition);
}
class SmoExdoorNotifier with ChangeNotifier{
  List<SmoExdoor> _smoExdoorList = [];
  UnmodifiableListView<SmoExdoor> get smoExdoorList => UnmodifiableListView(_smoExdoorList);
  addSmoExdoor(SmoExdoor smoExdoor){
    _smoExdoorList.add(smoExdoor);
    notifyListeners();
  }}
//3
class SmoIndoor {
  final String description;
  final String quantity;
  final String colour;
  final String condition;
  SmoIndoor(this.description, this.quantity, this.colour, this.condition);
}
class SmoIndoorNotifier with ChangeNotifier{
  List<SmoIndoor> _smoIndoorList = [];
  UnmodifiableListView<SmoIndoor> get smoIndoorList => UnmodifiableListView(_smoIndoorList);
  addSmoIndoor(SmoIndoor smoIndoor){
    _smoIndoorList.add(smoIndoor);
    notifyListeners();
  }}
//4
class SmoCeiling {
  final String description;
  final String quantity;
  final String colour;
  final String condition;
  SmoCeiling(this.description, this.quantity, this.colour, this.condition);
}
class SmoCeilingNotifier with ChangeNotifier{
  List<SmoCeiling> _smoCeilingList = [];
  UnmodifiableListView<SmoCeiling> get smoCeilingList => UnmodifiableListView(_smoCeilingList);
  addSmoCeiling(SmoCeiling smoCeiling){
    _smoCeilingList.add(smoCeiling);
    notifyListeners();
  }}
//5
class SmoLight {
  final String description;
  final String quantity;
  final String colour;
  final String condition;
  SmoLight(this.description, this.quantity, this.colour, this.condition);
}
class SmoLightNotifier with ChangeNotifier{
  List<SmoLight> _smoLightList = [];
  UnmodifiableListView<SmoLight> get smoLightList => UnmodifiableListView(_smoLightList);
  addSmoLight(SmoLight smoLight){
    _smoLightList.add(smoLight);
    notifyListeners();
  }}
//6
class SmoWalls {
  final String description;
  final String quantity;
  final String colour;
  final String condition;
  SmoWalls(this.description, this.quantity, this.colour, this.condition);
}
class SmoWallsNotifier with ChangeNotifier{
  List<SmoWalls> _smoWallsList = [];
  UnmodifiableListView<SmoWalls> get smoWallsList => UnmodifiableListView(_smoWallsList);
  addSmoWalls(SmoWalls smoWalls){
    _smoWallsList.add(smoWalls);
    notifyListeners();
  }}
//7
class SmoWindows {
  final String description;
  final String quantity;
  final String colour;
  final String condition;
  SmoWindows(this.description, this.quantity, this.colour, this.condition);
}
class SmoWindowsNotifier with ChangeNotifier{
  List<SmoWindows> _smoWindowsList = [];
  UnmodifiableListView<SmoWindows> get smoWindowsList => UnmodifiableListView(_smoWindowsList);
  addSmoWindows(SmoWindows smoWindows){
    _smoWindowsList.add(smoWindows);
    notifyListeners();
  }}



