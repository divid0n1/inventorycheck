import 'dart:collection';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:inventorycheck/ui/meterImg.dart';
//1
class GasMeter {
  final String description;
  final String quantity;
//  final String colour;
  final String condition;
  GasMeter(this.description, this.quantity, this.condition);
}
class GasMeterNotifier with ChangeNotifier{
  List<GasMeter> _gasMeterList = [];
  UnmodifiableListView<GasMeter> get gasMeterList => UnmodifiableListView(_gasMeterList);
  addGasMeter(GasMeter gasMeter){
    _gasMeterList.add(gasMeter);
    notifyListeners();
  }}
//2
class ElecMeter {
  final String description;
  final String quantity;
//  final String colour;
  final String condition;
  ElecMeter(this.description, this.quantity, this.condition);
}
class ElecMeterNotifier with ChangeNotifier{
  List<ElecMeter> _elecMeterList = [];
  UnmodifiableListView<ElecMeter> get elecMeterList => UnmodifiableListView(_elecMeterList);
  addElecMeter(ElecMeter elecMeter){
    _elecMeterList.add(elecMeter);
    notifyListeners();
  }}



  ////////////meterImg

class GasMeterPh {
  final File photo;
  GasMeterPh(this.photo);}
class GasMeterPhNotifier with ChangeNotifier{
  List<GasMeterPh> _gasMeterPhList = List<GasMeterPh>();
  UnmodifiableListView<GasMeterPh> get gasMeterPhList => UnmodifiableListView(_gasMeterPhList);
  addGasMeterPh(GasMeterPh gasMeterPh){
    _gasMeterPhList.add(gasMeterPh);
    notifyListeners();
  }}
class ElecMeterPh {
  final File photo;
  ElecMeterPh(this.photo, );}
class ElecMeterPhNotifier with ChangeNotifier{
  List<ElecMeterPh> _elecMeterPhList = List<ElecMeterPh>();
  UnmodifiableListView<ElecMeterPh> get elecMeterPhList => UnmodifiableListView(_elecMeterPhList);
  addElecMeterPh(ElecMeterPh elecMeterPh){
    _elecMeterPhList.add(elecMeterPh);
    notifyListeners();
  }}




//3 FOR SMOKE DETECTOR TEXT DATA
class SmokeDe {
  final String description;
  final String quantity;
//  final String colour;
//  final String condition;
  SmokeDe(this.description, this.quantity);
}
class SmokeDeNotifier with ChangeNotifier{
  List<SmokeDe> _smokeDeList = [];
  UnmodifiableListView<SmokeDe> get smokeDeList => UnmodifiableListView(_smokeDeList);
  addSmokeDe(SmokeDe smokeDe){
    _smokeDeList.add(smokeDe);
    notifyListeners();
  }}
//3 FOR SMOKE DETECTOR TEXT photo
class SmokeDePh {
  final File photo;
  SmokeDePh(this.photo);}
class SmokeDePhNotifier with ChangeNotifier{
  List<SmokeDePh> _smokeDePhList = List<SmokeDePh>();
  UnmodifiableListView<SmokeDePh> get smokeDePhList => UnmodifiableListView(_smokeDePhList);
  addSmokeDePh(SmokeDePh smokeDePh){
    _smokeDePhList.add(smokeDePh);
    notifyListeners();
  }}