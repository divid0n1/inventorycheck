import 'dart:collection';
import 'package:flutter/cupertino.dart';
//1
class HalFrame {
  final String description;
  final String quantity;
  final String colour;
  final String condition;
  HalFrame(this.description, this.quantity, this.colour, this.condition);
}
class HalFrameNotifier with ChangeNotifier{
  List<HalFrame> _halFrameList = [];
  UnmodifiableListView<HalFrame> get halFrameList => UnmodifiableListView(_halFrameList);
  addHalFrame(HalFrame halFrame){
    _halFrameList.add(halFrame);
    notifyListeners();
  }}
//2
class HalExdoor {
  final String description;
  final String quantity;
  final String colour;
  final String condition;
  HalExdoor(this.description, this.quantity, this.colour, this.condition);
}
class HalExdoorNotifier with ChangeNotifier{
  List<HalExdoor> _halExdoorList = [];
  UnmodifiableListView<HalExdoor> get halExdoorList => UnmodifiableListView(_halExdoorList);
  addHalExdoor(HalExdoor halExdoor){
    _halExdoorList.add(halExdoor);
    notifyListeners();
  }}
//3
class HalIndoor {
  final String description;
  final String quantity;
  final String colour;
  final String condition;
  HalIndoor(this.description, this.quantity, this.colour, this.condition);
}
class HalIndoorNotifier with ChangeNotifier{
  List<HalIndoor> _halIndoorList = [];
  UnmodifiableListView<HalIndoor> get halIndoorList => UnmodifiableListView(_halIndoorList);
  addHalIndoor(HalIndoor halIndoor){
    _halIndoorList.add(halIndoor);
    notifyListeners();
  }}
//4
class HalCeiling {
  final String description;
  final String quantity;
  final String colour;
  final String condition;
  HalCeiling(this.description, this.quantity, this.colour, this.condition);
}
class HalCeilingNotifier with ChangeNotifier{
  List<HalCeiling> _halCeilingList = [];
  UnmodifiableListView<HalCeiling> get halCeilingList => UnmodifiableListView(_halCeilingList);
  addHalCeiling(HalCeiling halCeiling){
    _halCeilingList.add(halCeiling);
    notifyListeners();
  }}
//5
class HalLight {
  final String description;
  final String quantity;
  final String colour;
  final String condition;
  HalLight(this.description, this.quantity, this.colour, this.condition);
}
class HalLightNotifier with ChangeNotifier{
  List<HalLight> _halLightList = [];
  UnmodifiableListView<HalLight> get halLightList => UnmodifiableListView(_halLightList);
  addHalLight(HalLight halLight){
    _halLightList.add(halLight);
    notifyListeners();
  }}
//6
class HalWalls {
  final String description;
  final String quantity;
  final String colour;
  final String condition;
  HalWalls(this.description, this.quantity, this.colour, this.condition);
}
class HalWallsNotifier with ChangeNotifier{
  List<HalWalls> _halWallsList = [];
  UnmodifiableListView<HalWalls> get halWallsList => UnmodifiableListView(_halWallsList);
  addHalWalls(HalWalls halWalls){
    _halWallsList.add(halWalls);
    notifyListeners();
  }}
//7
class HalWindows {
  final String description;
  final String quantity;
  final String colour;
  final String condition;
  HalWindows(this.description, this.quantity, this.colour, this.condition);
}
class HalWindowsNotifier with ChangeNotifier{
  List<HalWindows> _halWindowsList = [];
  UnmodifiableListView<HalWindows> get halWindowsList => UnmodifiableListView(_halWindowsList);
  addHalWindows(HalWindows halWindows){
    _halWindowsList.add(halWindows);
    notifyListeners();
  }}



