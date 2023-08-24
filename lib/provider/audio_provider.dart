import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SoundSelectionProvider with ChangeNotifier {
  late SharedPreferences _prefs;
  final AudioPlayer _audioPlayer = AudioPlayer();

  List<String> _audioFiles = [];
  String _selectedAudioFile = '';

  String get selectedAudioFile => _selectedAudioFile;
  List<String> get audioFiles => _audioFiles;

  static final SoundSelectionProvider _instance =
      SoundSelectionProvider._internal();

  factory SoundSelectionProvider() {
    return _instance;
  }

  SoundSelectionProvider._internal() {
    _initPreferences();
    fetchAudioFiles();
  }
  Future<void> _initPreferences() async {
    _prefs = await SharedPreferences.getInstance();
  }

  Future<void> fetchAudioFiles() async {
    final manifestContent = await rootBundle.loadString('AssetManifest.json');
    final manifestMap = json.decode(manifestContent) as Map<String, dynamic>;

    _audioFiles = manifestMap.keys
        .where((String key) =>
            key.startsWith('assets/sound/') && key.endsWith('.wav'))
        .map((audioFile) {
      final fileName = audioFile.split('/').last; // Extract the file name
      return fileName.substring(0, fileName.lastIndexOf('.'));
    }).toList();

    if (_audioFiles.isNotEmpty) {
      _selectedAudioFile =
          _prefs.getString('selectedAudioFile') ?? _audioFiles[0];
    }

    notifyListeners();
  }

  void setSelectedAudioFile(String newValue) {
    _selectedAudioFile = newValue;
    _prefs.setString('selectedAudioFile', _selectedAudioFile);
    notifyListeners();
  }

  void playSelectedAudio() {
    _audioPlayer.play(AssetSource('sound/$_selectedAudioFile.wav'));
  }
}
