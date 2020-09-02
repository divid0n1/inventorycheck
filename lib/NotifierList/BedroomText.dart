import 'dart:collection';
import 'package:flutter/cupertino.dart';
//1
class BedFrame {
  final String description;
  final String quantity;
  final String colour;
  final String condition;
  BedFrame(this.description, this.quantity, this.colour, this.condition);
}
class BedFrameNotifier with ChangeNotifier{
  List<BedFrame> _bedFrameList = [];
  UnmodifiableListView<BedFrame> get bedFrameList => UnmodifiableListView(_bedFrameList);
  addBedFrame(BedFrame bedFrame){
    _bedFrameList.add(bedFrame);
    notifyListeners();
  }}
//2
class BedExdoor {
  final String description;
  final String quantity;
  final String colour;
  final String condition;
  BedExdoor(this.description, this.quantity, this.colour, this.condition);
}
class BedExdoorNotifier with ChangeNotifier{
  List<BedExdoor> _bedExdoorList = [];
  UnmodifiableListView<BedExdoor> get bedExdoorList => UnmodifiableListView(_bedExdoorList);
  addBedExdoor(BedExdoor bedExdoor){
    _bedExdoorList.add(bedExdoor);
    notifyListeners();
  }}
//3
class BedIndoor {
  final String description;
  final String quantity;
  final String colour;
  final String condition;
  BedIndoor(this.description, this.quantity, this.colour, this.condition);
}
class BedIndoorNotifier with ChangeNotifier{
  List<BedIndoor> _bedIndoorList = [];
  UnmodifiableListView<BedIndoor> get bedIndoorList => UnmodifiableListView(_bedIndoorList);
  addBedIndoor(BedIndoor bedIndoor){
    _bedIndoorList.add(bedIndoor);
    notifyListeners();
  }}
//4
class BedCeiling {
  final String description;
  final String quantity;
  final String colour;
  final String condition;
  BedCeiling(this.description, this.quantity, this.colour, this.condition);
}
class BedCeilingNotifier with ChangeNotifier{
  List<BedCeiling> _bedCeilingList = [];
  UnmodifiableListView<BedCeiling> get bedCeilingList => UnmodifiableListView(_bedCeilingList);
  addBedCeiling(BedCeiling bedCeiling){
    _bedCeilingList.add(bedCeiling);
    notifyListeners();
  }}
//5
class BedLight {
  final String description;
  final String quantity;
  final String colour;
  final String condition;
  BedLight(this.description, this.quantity, this.colour, this.condition);
}
class BedLightNotifier with ChangeNotifier{
  List<BedLight> _bedLightList = [];
  UnmodifiableListView<BedLight> get bedLightList => UnmodifiableListView(_bedLightList);
  addBedLight(BedLight bedLight){
    _bedLightList.add(bedLight);
    notifyListeners();
  }}
//6
class BedWalls {
  final String description;
  final String quantity;
  final String colour;
  final String condition;
  BedWalls(this.description, this.quantity, this.colour, this.condition);
}
class BedWallsNotifier with ChangeNotifier{
  List<BedWalls> _bedWallsList = [];
  UnmodifiableListView<BedWalls> get bedWallsList => UnmodifiableListView(_bedWallsList);
  addBedWalls(BedWalls bedWalls){
    _bedWallsList.add(bedWalls);
    notifyListeners();
  }}
//7
class BedWindows {
  final String description;
  final String quantity;
  final String colour;
  final String condition;
  BedWindows(this.description, this.quantity, this.colour, this.condition);
}
class BedWindowsNotifier with ChangeNotifier{
  List<BedWindows> _bedWindowsList = [];
  UnmodifiableListView<BedWindows> get bedWindowsList => UnmodifiableListView(_bedWindowsList);
  addBedWindows(BedWindows bedWindows){
    _bedWindowsList.add(bedWindows);
    notifyListeners();
  }}



