import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:islami/core/remote/apis/api_manager.dart';
import 'package:islami/core/resources/Color_Manager.dart';
import 'package:just_audio/just_audio.dart';

import '../model/radio_model.dart';
import '../model/reciters_model.dart';

enum RadioTabTypes { radio, reciters }

enum RadioStates { initial, loading, success, failure }

enum RecitersStates { initial, loading, success, failure }

class RadioTabProvider extends ChangeNotifier {
  RadioTabTypes _selectedTab = RadioTabTypes.radio;

  RadioTabTypes get getSelectedTab => _selectedTab;
  final AudioPlayer _player = AudioPlayer();

  RadioTabProvider() {
    getRadios();
  }

  void switchTab(RadioTabTypes type) {
    _selectedTab = type;
    notifyListeners();
  }

  TextStyle getTabTextStyle(RadioTabTypes type) {
    return TextStyle(
        fontSize: 16,
        fontWeight: _selectedTab == type ? FontWeight.bold : FontWeight.w400,
        color: _selectedTab == type ? ColorsManager.black : Colors.white);
  }

  List<Radios?>? radios = [];
  RadioStates radioState = RadioStates.initial;

  Future<void> getRadios() async {
    radioState = RadioStates.loading;
    notifyListeners();

    try {
      final result = await ApiManager.getRadios();
      radios = result.radios;
      radioState = RadioStates.success;
      notifyListeners();
    } catch (exception) {
      log(exception.toString());
      radioState = RadioStates.failure;
      notifyListeners();
    }
  }

  List<Reciters?>? reciters = [];
  RecitersStates recitersState = RecitersStates.initial;

  Future<void> getReciters() async {
    recitersState = RecitersStates.loading;
    notifyListeners();

    try {
      final result = await ApiManager.getReciters();
      reciters = result.reciters;
      recitersState = RecitersStates.success;
      notifyListeners();
    } catch (exception) {
      log(exception.toString());
      recitersState = RecitersStates.failure;
      notifyListeners();
    }
  }

  Radios? selectedRadio;

  Future<void> playRadio(Radios radio) async {
    if (selectedRadio == radio) {
      await _player.pause();
      selectedRadio = null;
    } else {
      await _player.setUrl(radio.url ?? '');
      _player.play();
      selectedRadio = radio;
    }
    notifyListeners();
  }
  Radios ? selectedRadioForVolume;
  Future<void> changeVolume(Radios radio)async{
    if (selectedRadioForVolume==radio){
      await _player.setVolume(1);
      selectedRadioForVolume=null;
    }else{
      await _player.setVolume(0);
      selectedRadioForVolume=radio;
    }
    notifyListeners();
  }

@override
  void dispose() {
    _player.stop();
    _player.dispose();
    super.dispose();
  }
}
