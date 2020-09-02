import 'dart:collection';
import 'package:flutter/cupertino.dart';
//1
class ExtFrame {
  final String description;
  final String quantity;
  final String colour;
  final String condition;
  ExtFrame(this.description, this.quantity, this.colour, this.condition);
}
class ExtFrameNotifier with ChangeNotifier{
  List<ExtFrame> _extFrameList = [];
  UnmodifiableListView<ExtFrame> get extFrameList => UnmodifiableListView(_extFrameList);
  addExtFrame(ExtFrame extFrame){
    _extFrameList.add(extFrame);
    notifyListeners();
  }}
//2
class ExtExdoor {
  final String description;
  final String quantity;
  final String colour;
  final String condition;
  ExtExdoor(this.description, this.quantity, this.colour, this.condition);
}
class ExtExdoorNotifier with ChangeNotifier{
  List<ExtExdoor> _extExdoorList = [];
  UnmodifiableListView<ExtExdoor> get extExdoorList => UnmodifiableListView(_extExdoorList);
  addExtExdoor(ExtExdoor extExdoor){
    _extExdoorList.add(extExdoor);
    notifyListeners();
  }}
//3
class ExtIndoor {
  final String description;
  final String quantity;
  final String colour;
  final String condition;
  ExtIndoor(this.description, this.quantity, this.colour, this.condition);
}
class ExtIndoorNotifier with ChangeNotifier{
  List<ExtIndoor> _extIndoorList = [];
  UnmodifiableListView<ExtIndoor> get extIndoorList => UnmodifiableListView(_extIndoorList);
  addExtIndoor(ExtIndoor extIndoor){
    _extIndoorList.add(extIndoor);
    notifyListeners();
  }}
//4
class ExtCeiling {
  final String description;
  final String quantity;
  final String colour;
  final String condition;
  ExtCeiling(this.description, this.quantity, this.colour, this.condition);
}
class ExtCeilingNotifier with ChangeNotifier{
  List<ExtCeiling> _extCeilingList = [];
  UnmodifiableListView<ExtCeiling> get extCeilingList => UnmodifiableListView(_extCeilingList);
  addExtCeiling(ExtCeiling extCeiling){
    _extCeilingList.add(extCeiling);
    notifyListeners();
  }}
//5
class ExtLight {
  final String description;
  final String quantity;
  final String colour;
  final String condition;
  ExtLight(this.description, this.quantity, this.colour, this.condition);
}
class ExtLightNotifier with ChangeNotifier{
  List<ExtLight> _extLightList = [];
  UnmodifiableListView<ExtLight> get extLightList => UnmodifiableListView(_extLightList);
  addExtLight(ExtLight extLight){
    _extLightList.add(extLight);
    notifyListeners();
  }}
//6
class ExtWalls {
  final String description;
  final String quantity;
  final String colour;
  final String condition;
  ExtWalls(this.description, this.quantity, this.colour, this.condition);
}
class ExtWallsNotifier with ChangeNotifier{
  List<ExtWalls> _extWallsList = [];
  UnmodifiableListView<ExtWalls> get extWallsList => UnmodifiableListView(_extWallsList);
  addExtWalls(ExtWalls extWalls){
    _extWallsList.add(extWalls);
    notifyListeners();
  }}
//7
class ExtWindows {
  final String description;
  final String quantity;
  final String colour;
  final String condition;
  ExtWindows(this.description, this.quantity, this.colour, this.condition);
}
class ExtWindowsNotifier with ChangeNotifier{
  List<ExtWindows> _extWindowsList = [];
  UnmodifiableListView<ExtWindows> get extWindowsList => UnmodifiableListView(_extWindowsList);
  addExtWindows(ExtWindows extWindows){
    _extWindowsList.add(extWindows);
    notifyListeners();
  }}



