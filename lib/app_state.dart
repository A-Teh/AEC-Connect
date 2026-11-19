import 'package:flutter/material.dart'
    show ChangeNotifier, Color, Colors, VoidCallback;

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  DateTime? _tsAuthFirstScreen;
  DateTime? get tsAuthFirstScreen => _tsAuthFirstScreen;
  set tsAuthFirstScreen(DateTime? value) {
    _tsAuthFirstScreen = value;
  }

  bool _bAuthScreenViewLogged = false;
  bool get bAuthScreenViewLogged => _bAuthScreenViewLogged;
  set bAuthScreenViewLogged(bool value) {
    _bAuthScreenViewLogged = value;
  }

  String _sAuthVariantTemp = 'unassigned\n';
  String get sAuthVariantTemp => _sAuthVariantTemp;
  set sAuthVariantTemp(String value) {
    _sAuthVariantTemp = value;
  }
}
