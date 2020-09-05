import 'dart:collection';
import 'dart:io';
import 'package:flutter/cupertino.dart';

//1
class BdfourFramePh {
  final File photo;
  BdfourFramePh(this.photo, );}
class BdfourFramePhNotifier with ChangeNotifier{
  List<BdfourFramePh> _bdfourFramePhList = List<BdfourFramePh>();
  UnmodifiableListView<BdfourFramePh> get bdfourFramePhList => UnmodifiableListView(_bdfourFramePhList);
  addBdfourFramePh(BdfourFramePh bdfourFramePh){
    _bdfourFramePhList.add(bdfourFramePh);
    notifyListeners();
  }}

//2
class BdfourExdoorPh {
  final File photo;
  BdfourExdoorPh (this.photo, );}
class BdfourExdoorPhNotifier with ChangeNotifier{
  List<BdfourExdoorPh> _bdfourExdoorPhList = List<BdfourExdoorPh>();
  UnmodifiableListView<BdfourExdoorPh> get bdfourExdoorPhList => UnmodifiableListView(_bdfourExdoorPhList);
  addBdfourExdoorPh(BdfourExdoorPh bdfourExdoorPh){
    _bdfourExdoorPhList.add(bdfourExdoorPh);
    notifyListeners();
  }}

//3
class BdfourIndoorPh {
  final File photo;
  BdfourIndoorPh(this.photo, );}
class BdfourIndoorPhNotifier with ChangeNotifier{
  List<BdfourIndoorPh> _bdfourIndoorPhList = List<BdfourIndoorPh>();
  UnmodifiableListView<BdfourIndoorPh> get bdfourIndoorPhList => UnmodifiableListView(_bdfourIndoorPhList);
  addBdfourIndoorPh(BdfourIndoorPh bdfourIndoorPh){
    _bdfourIndoorPhList.add(bdfourIndoorPh);
    notifyListeners();
  }}

//4
class BdfourCeilingPh {
  final File photo;
  BdfourCeilingPh(this.photo, );}
class BdfourCeilingPhNotifier with ChangeNotifier{
  List<BdfourCeilingPh> _bdfourCeilingPhList = List<BdfourCeilingPh>();
  UnmodifiableListView<BdfourCeilingPh> get bdfourCeilingPhList => UnmodifiableListView(_bdfourCeilingPhList);
  addBdfourCeilingPh(BdfourCeilingPh bdfourCeilingPh){
    _bdfourCeilingPhList.add(bdfourCeilingPh);
    notifyListeners();
  }}

//5
class BdfourLightPh {
  final File photo;
  BdfourLightPh(this.photo, );}
class BdfourLightPhNotifier with ChangeNotifier{
  List<BdfourLightPh> _bdfourLightPhList = List<BdfourLightPh>();
  UnmodifiableListView<BdfourLightPh> get bdfourLightPhList => UnmodifiableListView(_bdfourLightPhList);
  addBdfourLightPh(BdfourLightPh bdfourLightPh){
    _bdfourLightPhList.add(bdfourLightPh);
    notifyListeners();
  }}

//6
class BdfourWallsPh {
  final File photo;
  BdfourWallsPh(this.photo, );}
class BdfourWallsPhNotifier with ChangeNotifier{
  List<BdfourWallsPh> _bdfourWallsPhList = List<BdfourWallsPh>();
  UnmodifiableListView<BdfourWallsPh> get bdfourWallsPhList => UnmodifiableListView(_bdfourWallsPhList);
  addBdfourWallsPh(BdfourWallsPh bdfourWallsPh){
    _bdfourWallsPhList.add(bdfourWallsPh);
    notifyListeners();
  }}

//7
class BdfourWindowsPh {
  final File photo;
  BdfourWindowsPh(this.photo, );}
class BdfourWindowsPhNotifier with ChangeNotifier{
  List<BdfourWindowsPh> _bdfourWindowsPhList = List<BdfourWindowsPh>();
  UnmodifiableListView<BdfourWindowsPh> get bdfourWindowsPhList => UnmodifiableListView(_bdfourWindowsPhList);
  addBdfourWindowsPh(BdfourWindowsPh bdfourWindowsPh){
    _bdfourWindowsPhList.add(bdfourWindowsPh);
    notifyListeners();
  }}

