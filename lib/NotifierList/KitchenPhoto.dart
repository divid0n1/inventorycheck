import 'dart:collection';
import 'dart:io';
import 'package:flutter/cupertino.dart';

//1
class KitFramePh {
  final File photo;
  KitFramePh(this.photo, );}
class KitFramePhNotifier with ChangeNotifier{
  List<KitFramePh> _kitFramePhList = List<KitFramePh>();
  UnmodifiableListView<KitFramePh> get kitFramePhList => UnmodifiableListView(_kitFramePhList);
  addKitFramePh(KitFramePh kitFramePh){
    _kitFramePhList.add(kitFramePh);
    notifyListeners();
  }}

//2
class KitExdoorPh {
  final File photo;
  KitExdoorPh (this.photo, );}
class KitExdoorPhNotifier with ChangeNotifier{
  List<KitExdoorPh> _kitExdoorPhList = List<KitExdoorPh>();
  UnmodifiableListView<KitExdoorPh> get kitExdoorPhList => UnmodifiableListView(_kitExdoorPhList);
  addKitExdoorPh(KitExdoorPh kitExdoorPh){
    _kitExdoorPhList.add(kitExdoorPh);
    notifyListeners();
  }}

//3
class KitIndoorPh {
  final File photo;
  KitIndoorPh(this.photo, );}
class KitIndoorPhNotifier with ChangeNotifier{
  List<KitIndoorPh> _kitIndoorPhList = List<KitIndoorPh>();
  UnmodifiableListView<KitIndoorPh> get kitIndoorPhList => UnmodifiableListView(_kitIndoorPhList);
  addKitIndoorPh(KitIndoorPh kitIndoorPh){
    _kitIndoorPhList.add(kitIndoorPh);
    notifyListeners();
  }}

//4
class KitCeilingPh {
  final File photo;
  KitCeilingPh(this.photo, );}
class KitCeilingPhNotifier with ChangeNotifier{
  List<KitCeilingPh> _kitCeilingPhList = List<KitCeilingPh>();
  UnmodifiableListView<KitCeilingPh> get kitCeilingPhList => UnmodifiableListView(_kitCeilingPhList);
  addKitCeilingPh(KitCeilingPh kitCeilingPh){
    _kitCeilingPhList.add(kitCeilingPh);
    notifyListeners();
  }}

//5
class KitLightPh {
  final File photo;
  KitLightPh(this.photo, );}
class KitLightPhNotifier with ChangeNotifier{
  List<KitLightPh> _kitLightPhList = List<KitLightPh>();
  UnmodifiableListView<KitLightPh> get kitLightPhList => UnmodifiableListView(_kitLightPhList);
  addKitLightPh(KitLightPh kitLightPh){
    _kitLightPhList.add(kitLightPh);
    notifyListeners();
  }}

//6
class KitWallsPh {
  final File photo;
  KitWallsPh(this.photo, );}
class KitWallsPhNotifier with ChangeNotifier{
  List<KitWallsPh> _kitWallsPhList = List<KitWallsPh>();
  UnmodifiableListView<KitWallsPh> get kitWallsPhList => UnmodifiableListView(_kitWallsPhList);
  addKitWallsPh(KitWallsPh kitWallsPh){
    _kitWallsPhList.add(kitWallsPh);
    notifyListeners();
  }}

//7
class KitWindowsPh {
  final File photo;
  KitWindowsPh(this.photo, );}
class KitWindowsPhNotifier with ChangeNotifier{
  List<KitWindowsPh> _kitWindowsPhList = List<KitWindowsPh>();
  UnmodifiableListView<KitWindowsPh> get kitWindowsPhList => UnmodifiableListView(_kitWindowsPhList);
  addKitWindowsPh(KitWindowsPh kitWindowsPh){
    _kitWindowsPhList.add(kitWindowsPh);
    notifyListeners();
  }}

