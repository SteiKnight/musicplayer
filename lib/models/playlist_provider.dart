import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:musicplayer/models/song.dart';

class PlaylistProvider extends ChangeNotifier {
  //playlist of songs
  final List<Song> playlist = [
    //song 1
    Song(
      title: 'Highs and Lows',
      artist: 'Ye',
      albumArtImgPath: 'assets/images/highs and lows.jpg',
      audioPath: 'assets/audios/Highs and Lows.mp3',
    ),

    //song 2
    Song(
      title: 'evil jordan',
      artist: 'Playboi Carti',
      albumArtImgPath: 'assets/images/evil jordan.jpg',
      audioPath: 'assets/audios/evil jordan.mp3',
    ),

    //song 3
    Song(
      title: 'spaceship',
      artist: 'Playboi Carti',
      albumArtImgPath: 'assets/images/spaceship.jpg',
      audioPath: 'assets/audios/spaceship.mp3',
    ),
  ];

  //current song index
  int? currentSongIndex;

  /*
   *A U D I O   P L A Y E R   M E T H O D S
   */
  //audio player
  final AudioPlayer audioPlayer = AudioPlayer();

  //durations
  Duration currentDuration = Duration();
  Duration totalDuration = Duration();

  //constructor
  PlaylistProvider() {
    listenToDuration;
  }

  //initially not playing

  //play the song

  //pause current song

  //resume playing

  //resume or play

  //seek time in song

  //next song

  //previous song

  //listen to duration
  void listenToDuration() {
    
  }

  //dispose of audio player

  /*
    G E T T E R S
   */
  List<Song> get getPlaylist => playlist;
  int? get getCurrentSongIndex => currentSongIndex;

  /*
   S E T T E R S
   */
  set setCurrentSongIndex(int index) {
    currentSongIndex = index;
    notifyListeners();
  }
}
