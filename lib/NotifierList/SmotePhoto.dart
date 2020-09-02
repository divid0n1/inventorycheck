import 'dart:collection';
import 'dart:io';
import 'package:flutter/cupertino.dart';

//1
class SmoFramePh {
  final File photo;
  SmoFramePh(this.photo, );}
class SmoFramePhNotifier with ChangeNotifier{
  List<SmoFramePh> _smoFramePhList = List<SmoFramePh>();
  UnmodifiableListView<SmoFramePh> get smoFramePhList => UnmodifiableListView(_smoFramePhList);
  addSmoFramePh(SmoFramePh smoFramePh){
    _smoFramePhList.add(smoFramePh);
    notifyListeners();
  }}

//2
class SmoExdoorPh {
  final File photo;
  SmoExdoorPh (this.photo, );}
class SmoExdoorPhNotifier with ChangeNotifier{
  List<SmoExdoorPh> _smoExdoorPhList = List<SmoExdoorPh>();
  UnmodifiableListView<SmoExdoorPh> get smoExdoorPhList => UnmodifiableListView(_smoExdoorPhList);
  addSmoExdoorPh(SmoExdoorPh smoExdoorPh){
    _smoExdoorPhList.add(smoExdoorPh);
    notifyListeners();
  }}

//3
class SmoIndoorPh {
  final File photo;
  SmoIndoorPh(this.photo, );}
class SmoIndoorPhNotifier with ChangeNotifier{
  List<SmoIndoorPh> _smoIndoorPhList = List<SmoIndoorPh>();
  UnmodifiableListView<SmoIndoorPh> get smoIndoorPhList => UnmodifiableListView(_smoIndoorPhList);
  addSmoIndoorPh(SmoIndoorPh smoIndoorPh){
    _smoIndoorPhList.add(smoIndoorPh);
    notifyListeners();
  }}

//4
class SmoCeilingPh {
  final File photo;
  SmoCeilingPh(this.photo, );}
class SmoCeilingPhNotifier with ChangeNotifier{
  List<SmoCeilingPh> _smoCeilingPhList = List<SmoCeilingPh>();
  UnmodifiableListView<SmoCeilingPh> get smoCeilingPhList => UnmodifiableListView(_smoCeilingPhList);
  addSmoCeilingPh(SmoCeilingPh smoCeilingPh){
    _smoCeilingPhList.add(smoCeilingPh);
    notifyListeners();
  }}

//5
class SmoLightPh {
  final File photo;
  SmoLightPh(this.photo, );}
class SmoLightPhNotifier with ChangeNotifier{
  List<SmoLightPh> _smoLightPhList = List<SmoLightPh>();
  UnmodifiableListView<SmoLightPh> get smoLightPhList => UnmodifiableListView(_smoLightPhList);
  addSmoLightPh(SmoLightPh smoLightPh){
    _smoLightPhList.add(smoLightPh);
    notifyListeners();
  }}

//6
class SmoWallsPh {
  final File photo;
  SmoWallsPh(this.photo, );}
class SmoWallsPhNotifier with ChangeNotifier{
  List<SmoWallsPh> _smoWallsPhList = List<SmoWallsPh>();
  UnmodifiableListView<SmoWallsPh> get smoWallsPhList => UnmodifiableListView(_smoWallsPhList);
  addSmoWallsPh(SmoWallsPh smoWallsPh){
    _smoWallsPhList.add(smoWallsPh);
    notifyListeners();
  }}

//7
class SmoWindowsPh {
  final File photo;
  SmoWindowsPh(this.photo, );}
class SmoWindowsPhNotifier with ChangeNotifier{
  List<SmoWindowsPh> _smoWindowsPhList = List<SmoWindowsPh>();
  UnmodifiableListView<SmoWindowsPh> get smoWindowsPhList => UnmodifiableListView(_smoWindowsPhList);
  addSmoWindowsPh(SmoWindowsPh smoWindowsPh){
    _smoWindowsPhList.add(smoWindowsPh);
    notifyListeners();
  }}

