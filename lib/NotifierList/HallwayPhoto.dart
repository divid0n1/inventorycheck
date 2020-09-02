import 'dart:collection';
import 'dart:io';
import 'package:flutter/cupertino.dart';

//1
class HalFramePh {
  final File photo;
  HalFramePh(this.photo, );}
class HalFramePhNotifier with ChangeNotifier{
  List<HalFramePh> _halFramePhList = List<HalFramePh>();
  UnmodifiableListView<HalFramePh> get halFramePhList => UnmodifiableListView(_halFramePhList);
  addHalFramePh(HalFramePh halFramePh){
    _halFramePhList.add(halFramePh);
    notifyListeners();
  }}

//2
class HalExdoorPh {
  final File photo;
  HalExdoorPh (this.photo, );}
class HalExdoorPhNotifier with ChangeNotifier{
  List<HalExdoorPh> _halExdoorPhList = List<HalExdoorPh>();
  UnmodifiableListView<HalExdoorPh> get halExdoorPhList => UnmodifiableListView(_halExdoorPhList);
  addHalExdoorPh(HalExdoorPh halExdoorPh){
    _halExdoorPhList.add(halExdoorPh);
    notifyListeners();
  }}

//3
class HalIndoorPh {
  final File photo;
  HalIndoorPh(this.photo, );}
class HalIndoorPhNotifier with ChangeNotifier{
  List<HalIndoorPh> _halIndoorPhList = List<HalIndoorPh>();
  UnmodifiableListView<HalIndoorPh> get halIndoorPhList => UnmodifiableListView(_halIndoorPhList);
  addHalIndoorPh(HalIndoorPh halIndoorPh){
    _halIndoorPhList.add(halIndoorPh);
    notifyListeners();
  }}

//4
class HalCeilingPh {
  final File photo;
  HalCeilingPh(this.photo, );}
class HalCeilingPhNotifier with ChangeNotifier{
  List<HalCeilingPh> _halCeilingPhList = List<HalCeilingPh>();
  UnmodifiableListView<HalCeilingPh> get halCeilingPhList => UnmodifiableListView(_halCeilingPhList);
  addHalCeilingPh(HalCeilingPh halCeilingPh){
    _halCeilingPhList.add(halCeilingPh);
    notifyListeners();
  }}

//5
class HalLightPh {
  final File photo;
  HalLightPh(this.photo, );}
class HalLightPhNotifier with ChangeNotifier{
  List<HalLightPh> _halLightPhList = List<HalLightPh>();
  UnmodifiableListView<HalLightPh> get halLightPhList => UnmodifiableListView(_halLightPhList);
  addHalLightPh(HalLightPh halLightPh){
    _halLightPhList.add(halLightPh);
    notifyListeners();
  }}

//6
class HalWallsPh {
  final File photo;
  HalWallsPh(this.photo, );}
class HalWallsPhNotifier with ChangeNotifier{
  List<HalWallsPh> _halWallsPhList = List<HalWallsPh>();
  UnmodifiableListView<HalWallsPh> get halWallsPhList => UnmodifiableListView(_halWallsPhList);
  addHalWallsPh(HalWallsPh halWallsPh){
    _halWallsPhList.add(halWallsPh);
    notifyListeners();
  }}

//7
class HalWindowsPh {
  final File photo;
  HalWindowsPh(this.photo, );}
class HalWindowsPhNotifier with ChangeNotifier{
  List<HalWindowsPh> _halWindowsPhList = List<HalWindowsPh>();
  UnmodifiableListView<HalWindowsPh> get halWindowsPhList => UnmodifiableListView(_halWindowsPhList);
  addHalWindowsPh(HalWindowsPh halWindowsPh){
    _halWindowsPhList.add(halWindowsPh);
    notifyListeners();
  }}

