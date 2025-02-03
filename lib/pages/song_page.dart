import 'package:flutter/material.dart';
import 'package:musicplayer/components/neu_box.dart';
import 'package:musicplayer/models/playlist_provider.dart';
import 'package:musicplayer/models/song.dart';
import 'package:provider/provider.dart';

class SongPage extends StatelessWidget {
  //final PlaylistProvider playlistProvider;
  const SongPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<PlaylistProvider>(
      builder: (context, playlistProvider, child) {
        Song song =
            playlistProvider.getPlaylist[playlistProvider.currentSongIndex!];
        return Scaffold(
          body: Center(
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(left: 25, right: 25, bottom: 25),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //app bar
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //back button
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(Icons.arrow_back),
                        ),

                        //title
                        Text(
                          'N O W   P L A Y I N G',
                          style: TextStyle(fontSize: 20),
                        ),

                        //menu button
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.menu),
                        ),
                      ],
                    ),

                    SizedBox(height: 25),

                    //album artwork
                    NeuBox(
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(song.albumArtImgPath),
                          ),

                          //song and artist name and icon
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                //song and artist name
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      song.title,
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      song.artist,
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ],
                                ),

                                //heart icon
                                Icon(
                                  Icons.favorite,
                                  color: Colors.red,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(
                      height: 25,
                    ),

                    //song duration progress
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              //start time
                              Text(
                                  '${playlistProvider.currentDuration.inMinutes}:${playlistProvider.currentDuration.inSeconds.remainder(60).toString().padLeft(2, '0')}'),

                              //shuffle  icon
                              Icon(Icons.shuffle),

                              //repeat icon

                              IconButton(
                                  onPressed: playlistProvider.isRepeatToggle,
                                  icon: Icon(playlistProvider.isRepeatChecked!
                                      ? Icons.repeat_one
                                      : Icons.repeat)),

                              //end time
                              Text(
                                  '${playlistProvider.totalDuration.inMinutes}:${playlistProvider.totalDuration.inSeconds.remainder(60).toString().padLeft(2, '0')}'),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        thumbShape: const RoundSliderThumbShape(
                          enabledThumbRadius: 0,
                          disabledThumbRadius: 0,
                        ),
                      ),
                      child: Slider(
                          min: 0,
                          max: playlistProvider.totalDuration.inSeconds
                              .toDouble(),
                          value: playlistProvider.currentDuration.inSeconds
                              .toDouble(),
                          activeColor: Colors.red,
                          onChanged: (double value) {
                            //the slider while the user is sliding around
                          },
                          onChangeEnd: (double value) =>
                              //sliding has finished
                              playlistProvider
                                  .seek(Duration(seconds: value.toInt()))),
                    ),

                    //payback controls
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        //go to previous
                        Expanded(
                            child: GestureDetector(
                                onTap: playlistProvider.previousSong,
                                child:
                                    NeuBox(child: Icon(Icons.skip_previous)))),

                        SizedBox(width: 20),

                        //play or pause
                        Expanded(
                            flex: 2,
                            child: GestureDetector(
                                onTap: playlistProvider.playOrPause,
                                child: NeuBox(
                                    child: Icon(playlistProvider.isPlaying
                                        ? Icons.pause
                                        : Icons.play_arrow)))),

                        SizedBox(width: 20),

                        //skip forward or next
                        Expanded(
                            child: GestureDetector(
                                onTap: playlistProvider.nextSong,
                                child: NeuBox(child: Icon(Icons.skip_next)))),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          backgroundColor: Theme.of(context).colorScheme.secondary,
        );
      },
    );
  }
}
