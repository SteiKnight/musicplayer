import 'package:flutter/material.dart';
import 'package:musicplayer/models/song.dart';

class PlaylistProvider extends ChangeNotifier{
  //playlist of songs
  final List<Song> playlist = [
    //song 1
    Song(
      title: 'Bully',
      artist: 'Ye',
      albumArtImgPath: 'assets/images/bully.jpg',
      audioPath: 'assets/audios/Bully.mp3',
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
    G E T T E R S
   */
  List<Song> get getPlaylist => playlist;
  int? get getCurrentSongIndex => currentSongIndex;

  /*
   S E T T E R S
   */
  void setCurrentSongIndex(int index) {
    currentSongIndex = index;
  }


}
