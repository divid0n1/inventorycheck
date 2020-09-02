import 'dart:collection';
import 'dart:io';
import 'package:flutter/cupertino.dart';

//1
class ExtFramePh {
  final File photo;
  ExtFramePh(this.photo, );}
class ExtFramePhNotifier with ChangeNotifier{
  List<ExtFramePh> _extFramePhList = List<ExtFramePh>();
  UnmodifiableListView<ExtFramePh> get extFramePhList => UnmodifiableListView(_extFramePhList);
  addExtFramePh(ExtFramePh extFramePh){
    _extFramePhList.add(extFramePh);
    notifyListeners();
  }}

//2
class ExtExdoorPh {
  final File photo;
  ExtExdoorPh (this.photo, );}
class ExtExdoorPhNotifier with ChangeNotifier{
  List<ExtExdoorPh> _extExdoorPhList = List<ExtExdoorPh>();
  UnmodifiableListView<ExtExdoorPh> get extExdoorPhList => UnmodifiableListView(_extExdoorPhList);
  addExtExdoorPh(ExtExdoorPh extExdoorPh){
    _extExdoorPhList.add(extExdoorPh);
    notifyListeners();
  }}

//3
class ExtIndoorPh {
  final File photo;
  ExtIndoorPh(this.photo, );}
class ExtIndoorPhNotifier with ChangeNotifier{
  List<ExtIndoorPh> _extIndoorPhList = List<ExtIndoorPh>();
  UnmodifiableListView<ExtIndoorPh> get extIndoorPhList => UnmodifiableListView(_extIndoorPhList);
  addExtIndoorPh(ExtIndoorPh extIndoorPh){
    _extIndoorPhList.add(extIndoorPh);
    notifyListeners();
  }}

//4
class ExtCeilingPh {
  final File photo;
  ExtCeilingPh(this.photo, );}
class ExtCeilingPhNotifier with ChangeNotifier{
  List<ExtCeilingPh> _extCeilingPhList = List<ExtCeilingPh>();
  UnmodifiableListView<ExtCeilingPh> get extCeilingPhList => UnmodifiableListView(_extCeilingPhList);
  addExtCeilingPh(ExtCeilingPh extCeilingPh){
    _extCeilingPhList.add(extCeilingPh);
    notifyListeners();
  }}

//5
class ExtLightPh {
  final File photo;
  ExtLightPh(this.photo, );}
class ExtLightPhNotifier with ChangeNotifier{
  List<ExtLightPh> _extLightPhList = List<ExtLightPh>();
  UnmodifiableListView<ExtLightPh> get extLightPhList => UnmodifiableListView(_extLightPhList);
  addExtLightPh(ExtLightPh extLightPh){
    _extLightPhList.add(extLightPh);
    notifyListeners();
  }}

//6
class ExtWallsPh {
  final File photo;
  ExtWallsPh(this.photo, );}
class ExtWallsPhNotifier with ChangeNotifier{
  List<ExtWallsPh> _extWallsPhList = List<ExtWallsPh>();
  UnmodifiableListView<ExtWallsPh> get extWallsPhList => UnmodifiableListView(_extWallsPhList);
  addExtWallsPh(ExtWallsPh extWallsPh){
    _extWallsPhList.add(extWallsPh);
    notifyListeners();
  }}

//7
class ExtWindowsPh {
  final File photo;
  ExtWindowsPh(this.photo, );}
class ExtWindowsPhNotifier with ChangeNotifier{
  List<ExtWindowsPh> _extWindowsPhList = List<ExtWindowsPh>();
  UnmodifiableListView<ExtWindowsPh> get extWindowsPhList => UnmodifiableListView(_extWindowsPhList);
  addExtWindowsPh(ExtWindowsPh extWindowsPh){
    _extWindowsPhList.add(extWindowsPh);
    notifyListeners();
  }}

