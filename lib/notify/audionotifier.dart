import 'dart:collection';
import 'package:flutter/cupertino.dart';
import 'package:inventorycheck/model/audio.dart';

class AudioRecNotifier with ChangeNotifier{
  List<AudioRec> _audioRecList = List<AudioRec>();
  UnmodifiableListView<AudioRec> get audioRecList => UnmodifiableListView(_audioRecList);
  addAudioRec(AudioRec audioRec){
    _audioRecList.add(audioRec);
    notifyListeners();
  }}

class AudioHallwayNotifier with ChangeNotifier{
  List<AudioHallway> _audioHallwayList = List<AudioHallway>();
  UnmodifiableListView<AudioHallway> get audioHallwayList => UnmodifiableListView(_audioHallwayList);
  addAudioHallway(AudioHallway audioHallway){
    _audioHallwayList.add(audioHallway);
    notifyListeners();
  }}

class AudioSmoteNotifier with ChangeNotifier{
  List<AudioSmote> _audioSmoteList = List<AudioSmote>();
  UnmodifiableListView<AudioSmote> get audioSmoteList => UnmodifiableListView(_audioSmoteList);
  addAudioSmote(AudioSmote audioSmote){
    _audioSmoteList.add(audioSmote);
    notifyListeners();
  }}

class AudioKitchenNotifier with ChangeNotifier{
  List<AudioKitchen> _audioKitchenList = List<AudioKitchen>();
  UnmodifiableListView<AudioKitchen> get audioKitchenList => UnmodifiableListView(_audioKitchenList);
  addAudioKitchen(AudioKitchen audioKitchen){
    _audioKitchenList.add(audioKitchen);
    notifyListeners();
  }}

class AudioBedroomNotifier with ChangeNotifier{
  List<AudioBedroom> _audioBedroomList = List<AudioBedroom>();
  UnmodifiableListView<AudioBedroom> get audioBedroomList => UnmodifiableListView(_audioBedroomList);
  addAudioBedroom(AudioBedroom audioBedroom){
    _audioBedroomList.add(audioBedroom);
    notifyListeners();
  }}

class AudioKeysNotifier with ChangeNotifier{
  List<AudioKeys> _audioKeysList = List<AudioKeys>();
  UnmodifiableListView<AudioKeys> get audioKeysList => UnmodifiableListView(_audioKeysList);
  addAudioKeys(AudioKeys audioKeys){
    _audioKeysList.add(audioKeys);
    notifyListeners();
  }}

class AudioMeterNotifier with ChangeNotifier{
  List<AudioMeter> _audioMeterList = List<AudioMeter>();
  UnmodifiableListView<AudioMeter> get audioMeterList => UnmodifiableListView(_audioMeterList);
  addAudioMeter(AudioMeter audioMeter){
    _audioMeterList.add(audioMeter);
    notifyListeners();
  }}
