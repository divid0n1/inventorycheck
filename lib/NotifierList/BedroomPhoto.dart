import 'dart:collection';
import 'dart:io';
import 'package:flutter/cupertino.dart';

//1
class BedFramePh {
  final File photo;
  BedFramePh(this.photo, );}
class BedFramePhNotifier with ChangeNotifier{
  List<BedFramePh> _bedFramePhList = List<BedFramePh>();
  UnmodifiableListView<BedFramePh> get bedFramePhList => UnmodifiableListView(_bedFramePhList);
  addBedFramePh(BedFramePh bedFramePh){
    _bedFramePhList.add(bedFramePh);
    notifyListeners();
  }}

//2
class BedExdoorPh {
  final File photo;
  BedExdoorPh (this.photo, );}
class BedExdoorPhNotifier with ChangeNotifier{
  List<BedExdoorPh> _bedExdoorPhList = List<BedExdoorPh>();
  UnmodifiableListView<BedExdoorPh> get bedExdoorPhList => UnmodifiableListView(_bedExdoorPhList);
  addBedExdoorPh(BedExdoorPh bedExdoorPh){
    _bedExdoorPhList.add(bedExdoorPh);
    notifyListeners();
  }}

//3
class BedIndoorPh {
  final File photo;
  BedIndoorPh(this.photo, );}
class BedIndoorPhNotifier with ChangeNotifier{
  List<BedIndoorPh> _bedIndoorPhList = List<BedIndoorPh>();
  UnmodifiableListView<BedIndoorPh> get bedIndoorPhList => UnmodifiableListView(_bedIndoorPhList);
  addBedIndoorPh(BedIndoorPh bedIndoorPh){
    _bedIndoorPhList.add(bedIndoorPh);
    notifyListeners();
  }}

//4
class BedCeilingPh {
  final File photo;
  BedCeilingPh(this.photo, );}
class BedCeilingPhNotifier with ChangeNotifier{
  List<BedCeilingPh> _bedCeilingPhList = List<BedCeilingPh>();
  UnmodifiableListView<BedCeilingPh> get bedCeilingPhList => UnmodifiableListView(_bedCeilingPhList);
  addBedCeilingPh(BedCeilingPh bedCeilingPh){
    _bedCeilingPhList.add(bedCeilingPh);
    notifyListeners();
  }}

//5
class BedLightPh {
  final File photo;
  BedLightPh(this.photo, );}
class BedLightPhNotifier with ChangeNotifier{
  List<BedLightPh> _bedLightPhList = List<BedLightPh>();
  UnmodifiableListView<BedLightPh> get bedLightPhList => UnmodifiableListView(_bedLightPhList);
  addBedLightPh(BedLightPh bedLightPh){
    _bedLightPhList.add(bedLightPh);
    notifyListeners();
  }}

//6
class BedWallsPh {
  final File photo;
  BedWallsPh(this.photo, );}
class BedWallsPhNotifier with ChangeNotifier{
  List<BedWallsPh> _bedWallsPhList = List<BedWallsPh>();
  UnmodifiableListView<BedWallsPh> get bedWallsPhList => UnmodifiableListView(_bedWallsPhList);
  addBedWallsPh(BedWallsPh bedWallsPh){
    _bedWallsPhList.add(bedWallsPh);
    notifyListeners();
  }}

//7
class BedWindowsPh {
  final File photo;
  BedWindowsPh(this.photo, );}
class BedWindowsPhNotifier with ChangeNotifier{
  List<BedWindowsPh> _bedWindowsPhList = List<BedWindowsPh>();
  UnmodifiableListView<BedWindowsPh> get bedWindowsPhList => UnmodifiableListView(_bedWindowsPhList);
  addBedWindowsPh(BedWindowsPh bedWindowsPh){
    _bedWindowsPhList.add(bedWindowsPh);
    notifyListeners();
  }}

