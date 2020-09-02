import 'dart:collection';
import 'package:flutter/cupertino.dart';
//1
class KitFrame {
  final String description;
  final String quantity;
  final String colour;
  final String condition;
  KitFrame(this.description, this.quantity, this.colour, this.condition);
}
class KitFrameNotifier with ChangeNotifier{
  List<KitFrame> _kitFrameList = [];
  UnmodifiableListView<KitFrame> get kitFrameList => UnmodifiableListView(_kitFrameList);
  addKitFrame(KitFrame kitFrame){
    _kitFrameList.add(kitFrame);
    notifyListeners();
  }}
//2
class KitExdoor {
  final String description;
  final String quantity;
  final String colour;
  final String condition;
  KitExdoor(this.description, this.quantity, this.colour, this.condition);
}
class KitExdoorNotifier with ChangeNotifier{
  List<KitExdoor> _kitExdoorList = [];
  UnmodifiableListView<KitExdoor> get kitExdoorList => UnmodifiableListView(_kitExdoorList);
  addKitExdoor(KitExdoor kitExdoor){
    _kitExdoorList.add(kitExdoor);
    notifyListeners();
  }}
//3
class KitIndoor {
  final String description;
  final String quantity;
  final String colour;
  final String condition;
  KitIndoor(this.description, this.quantity, this.colour, this.condition);
}
class KitIndoorNotifier with ChangeNotifier{
  List<KitIndoor> _kitIndoorList = [];
  UnmodifiableListView<KitIndoor> get kitIndoorList => UnmodifiableListView(_kitIndoorList);
  addKitIndoor(KitIndoor kitIndoor){
    _kitIndoorList.add(kitIndoor);
    notifyListeners();
  }}
//4
class KitCeiling {
  final String description;
  final String quantity;
  final String colour;
  final String condition;
  KitCeiling(this.description, this.quantity, this.colour, this.condition);
}
class KitCeilingNotifier with ChangeNotifier{
  List<KitCeiling> _kitCeilingList = [];
  UnmodifiableListView<KitCeiling> get kitCeilingList => UnmodifiableListView(_kitCeilingList);
  addKitCeiling(KitCeiling kitCeiling){
    _kitCeilingList.add(kitCeiling);
    notifyListeners();
  }}
//5
class KitLight {
  final String description;
  final String quantity;
  final String colour;
  final String condition;
  KitLight(this.description, this.quantity, this.colour, this.condition);
}
class KitLightNotifier with ChangeNotifier{
  List<KitLight> _kitLightList = [];
  UnmodifiableListView<KitLight> get kitLightList => UnmodifiableListView(_kitLightList);
  addKitLight(KitLight kitLight){
    _kitLightList.add(kitLight);
    notifyListeners();
  }}
//6
class KitWalls {
  final String description;
  final String quantity;
  final String colour;
  final String condition;
  KitWalls(this.description, this.quantity, this.colour, this.condition);
}
class KitWallsNotifier with ChangeNotifier{
  List<KitWalls> _kitWallsList = [];
  UnmodifiableListView<KitWalls> get kitWallsList => UnmodifiableListView(_kitWallsList);
  addKitWalls(KitWalls kitWalls){
    _kitWallsList.add(kitWalls);
    notifyListeners();
  }}
//7
class KitWindows {
  final String description;
  final String quantity;
  final String colour;
  final String condition;
  KitWindows(this.description, this.quantity, this.colour, this.condition);
}
class KitWindowsNotifier with ChangeNotifier{
  List<KitWindows> _kitWindowsList = [];
  UnmodifiableListView<KitWindows> get kitWindowsList => UnmodifiableListView(_kitWindowsList);
  addKitWindows(KitWindows kitWindows){
    _kitWindowsList.add(kitWindows);
    notifyListeners();
  }}



