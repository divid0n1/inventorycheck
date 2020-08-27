import 'dart:collection';
import 'package:flutter/cupertino.dart';
import 'package:inventorycheck/model/textdata.dart';

class ExteriorNotifier with ChangeNotifier{
  List<Exterior> _exteriorList = [];
  UnmodifiableListView<Exterior> get exteriorList => UnmodifiableListView(_exteriorList);
  addExterior(Exterior exterior){
    _exteriorList.add(exterior);
    notifyListeners();
  }}

class HallwayNotifier with ChangeNotifier{
  List<Hallway> _hallwayList = [];
  UnmodifiableListView<Hallway> get hallwayList => UnmodifiableListView(_hallwayList);
  addHallway(Hallway hallway){
    _hallwayList.add(hallway);
    notifyListeners();
  }}

class SmoteNotifier with ChangeNotifier{
  List<Smote> _smoteList = [];
  UnmodifiableListView<Smote> get smoteList => UnmodifiableListView(_smoteList);
  addSmote(Smote smote){
    _smoteList.add(smote);
    notifyListeners();
  }}

class KitchenNotifier with ChangeNotifier{
  List<Kitchen> _kitchenList = [];
  UnmodifiableListView<Kitchen> get kitchenList => UnmodifiableListView(_kitchenList);
  addKitchen(Kitchen kitchen){
    _kitchenList.add(kitchen);
    notifyListeners();
  }}

class BedroomNotifier with ChangeNotifier{
  List<Bedroom> _bedroomList = [];
  UnmodifiableListView<Bedroom> get bedroomList => UnmodifiableListView(_bedroomList);
  addBedroom(Bedroom bedroom){
    _bedroomList.add(bedroom);
    notifyListeners();
  }}

class ChaabiNotifier with ChangeNotifier{
  List<Chaabi> _chaabiList = [];
  UnmodifiableListView<Chaabi> get chaabiList => UnmodifiableListView(_chaabiList);
  addChaabi(Chaabi chaabi){
    _chaabiList.add(chaabi);
    notifyListeners();
  }}

class MeterreadingNotifier with ChangeNotifier{
  List<Meterreading> _meterreadingList = [];
  UnmodifiableListView<Meterreading> get meterreadingList => UnmodifiableListView(_meterreadingList);
  addMeterreading(Meterreading meterreading){
    _meterreadingList.add(meterreading);
    notifyListeners();
  }}

/////////////////////////////////////////////////////////////////////////
/* *************hasny widget data***************** */
////////////////////////////////////////////////////////////////////////

class ExteriorTanNotifier with ChangeNotifier{
  List<ExteriorTan> _exteriortanList = [];
  UnmodifiableListView<ExteriorTan> get exteriortanList => UnmodifiableListView(_exteriortanList);
  addExteriorTan(ExteriorTan exteriortan){
    _exteriortanList.add(exteriortan);
    notifyListeners();
  }}

class HallwayTanNotifier with ChangeNotifier{
  List<HallwayTan> _hallwayTanList = [];
  UnmodifiableListView<HallwayTan> get hallwayTanList => UnmodifiableListView(_hallwayTanList);
  addHallwayTan(HallwayTan hallwayTan){
    _hallwayTanList.add(hallwayTan);
    notifyListeners();
  }}


class SmoteTanNotifier with ChangeNotifier{
  List<SmoteTan> _smoteTanList = [];
  UnmodifiableListView<SmoteTan> get smoteTanList => UnmodifiableListView(_smoteTanList);
  addSmoteTan(SmoteTan smoteTan){
    _smoteTanList.add(smoteTan);
    notifyListeners();
  }}

class KitchenTanNotifier with ChangeNotifier{
  List<KitchenTan> _kitchenTanList = [];
  UnmodifiableListView<KitchenTan> get kitchenTanList => UnmodifiableListView(_kitchenTanList);
  addKitchen(KitchenTan kitchenTan){
    _kitchenTanList.add(kitchenTan);
    notifyListeners();
  }}

class BedroomTanNotifier with ChangeNotifier{
  List<BedroomTan> _bedroomTanList = [];
  UnmodifiableListView<BedroomTan> get bedroomTanList => UnmodifiableListView(_bedroomTanList);
  addTanBedroom(BedroomTan bedroomTan){
    _bedroomTanList.add(bedroomTan);
    notifyListeners();
  }}

class ChaabiTanNotifier with ChangeNotifier{
  List<ChaabiTan> _chaabiTanList = [];
  UnmodifiableListView<ChaabiTan> get chaabiTanList => UnmodifiableListView(_chaabiTanList);
  addTanChaabi(ChaabiTan chaabiTan){
    _chaabiTanList.add(chaabiTan);
    notifyListeners();
  }}

class MeterreadingTanNotifier with ChangeNotifier{
  List<MeterreadingTan> _meterreadingTanList = [];
  UnmodifiableListView<MeterreadingTan> get meterreadingTanList => UnmodifiableListView(_meterreadingTanList);
  addMeterreadingTan(MeterreadingTan meterreadingTan){
    _meterreadingTanList.add(meterreadingTan);
    notifyListeners();
  }}

class IntroNotifier with ChangeNotifier{
  List<Intro> _introList = [];
  UnmodifiableListView<Intro> get introList => UnmodifiableListView(_introList);
  addIntro(Intro intro){
    _introList.add(intro);
    notifyListeners();
  }}




