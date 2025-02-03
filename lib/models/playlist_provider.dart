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
      audioPath: 'audios/Highs and Lows.mp3',
    ),

    //song 2
    Song(
      title: 'evil jordan',
      artist: 'Playboi Carti',
      albumArtImgPath: 'assets/images/evil jordan.jpg',
      audioPath: 'audios/evil jordan.mp3',
    ),

    //song 3
    Song(
      title: 'spaceship',
      artist: 'Playboi Carti',
      albumArtImgPath: 'assets/images/spaceship.jpg',
      audioPath: 'audios/spaceship.mp3',
    ),
  ];

  //current song index
  int? _currentSongIndex;

  /*
   *A U D I O   P L A Y E R   M E T H O D S
   */
  //audio player
  final AudioPlayer audioPlayer = AudioPlayer();

  //durations
  Duration _currentDuration = Duration.zero;
  Duration _totalDuration = Duration.zero;

  //constructor
  PlaylistProvider() {
    listenToDuration();
  }

  //initially not playing
  bool _isPlaying = false;

  //play the song
  void play() async {
    final String path = playlist[currentSongIndex!].audioPath;

    // stop current song
    await audioPlayer.stop();

    //play new song
    await audioPlayer.play(AssetSource(path));

    isPlaying = true;
    notifyListeners();
  }

  //pause current song
  void pause() async {
    await audioPlayer.pause();
    isPlaying = false;
    notifyListeners();
  }

  //resume playing
  void resume() async {
    await audioPlayer.resume();
    isPlaying = true;
    notifyListeners();
  }

  //resume or play
  void playOrPause() {
    if (isPlaying) {
      pause();
    } else {
      resume();
    }
  }

  //seek time in song
  void seek(Duration time) async {
    await audioPlayer.seek(time);
  }

  //next song
  void nextSong() {
    if (currentSongIndex != null) {
      if (currentSongIndex == playlist.length - 1) {
        currentSongIndex = 0;
      } else {
        currentSongIndex = currentSongIndex! + 1;
      }
    }
  }

  //previous song
  void previousSong() async {
    // if duration is greater than 5 seconds, go to the beginning of the song
    if (_currentDuration.inSeconds > 5) {
      await audioPlayer.seek(Duration.zero);
      return;
    } else if (currentSongIndex == 0) {
      currentSongIndex = playlist.length - 1;
    } else {
      currentSongIndex = currentSongIndex! - 1;
    }
  }

  //listen to duration
  void listenToDuration() {
    //listen to the total duration
    audioPlayer.onDurationChanged.listen((duration) {
      _totalDuration = duration;
      notifyListeners();
    });

    //listen for current duration
    audioPlayer.onPositionChanged.listen((duration) {
      _currentDuration = duration;
      notifyListeners();
    });

    //listen for song completeion
    audioPlayer.onPlayerComplete.listen((event) {
      //play next song
      nextSong();
    });
  }

  //dispose of audio player

  /*
    G E T T E R S
   */
  List<Song> get getPlaylist => playlist;
  int? get currentSongIndex => _currentSongIndex;
  bool get isPlaying => _isPlaying;
  Duration get currentDuration => _currentDuration;
  Duration get totalDuration => _totalDuration;

  /*
   S E T T E R S
   */

  //set is playing
  set isPlaying(bool isPlaying) {
    _isPlaying = isPlaying;
    notifyListeners();
  }

  set currentSongIndex(int? index) {
    _currentSongIndex = index;

    if (index != null) {
      play();
    }

    notifyListeners();
  }
}
