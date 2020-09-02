import 'dart:collection';
import 'dart:io';
import 'package:flutter/cupertino.dart';
//1
class InventKey {
//  final String description;
  final String quantity;
  final String colour;
//  final String condition;
  InventKey(this.quantity, this.colour, );
}
class InventKeyNotifier with ChangeNotifier{
  List<InventKey> _inventKeyList = [];
  UnmodifiableListView<InventKey> get inventKeyList => UnmodifiableListView(_inventKeyList);
  addExtFrame(InventKey inventKey){
    _inventKeyList.add(inventKey);
    notifyListeners();
  }}

class InventKeyPh {
  final File photo;
  InventKeyPh(this.photo, );}
class InventKeyPhNotifier with ChangeNotifier{
  List<InventKeyPh> _inventKeyPhList = List<InventKeyPh>();
  UnmodifiableListView<InventKeyPh> get inventKeyPhList => UnmodifiableListView(_inventKeyPhList);
  addInventKeyPh(InventKeyPh inventKeyPh){
    _inventKeyPhList.add(inventKeyPh);
    notifyListeners();
  }}