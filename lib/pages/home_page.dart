import 'package:flutter/material.dart';
import 'package:musicplayer/components/my_drawer.dart';
import 'package:musicplayer/models/playlist_provider.dart';
import 'package:musicplayer/models/song.dart';
import 'package:musicplayer/pages/song_page.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //get the playlist provider
  late final dynamic playlistProvider;

  //initialize the playlist
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    playlistProvider = Provider.of<PlaylistProvider>(context, listen: false);
  }

  void goToSong(int index) {
    //set the current song index
    playlistProvider.setCurrentSongIndex = index;

    //navigate to the song page
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SongPage(
            //playlistProvider: playlistProvider,
            ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      appBar: AppBar(
        title: const Text('P L A Y L I S T'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Consumer<PlaylistProvider>(
          builder: (context, playlistProvider, child) {
            // get the playlist
            final playlist = playlistProvider.getPlaylist;

            //return list of songs
            return ListView.builder(
              itemCount: playlist.length,
              itemBuilder: (context, index) {
                //get the song
                Song song = playlist[index];

                //return list tile
                return ListTile(
                  leading: Image.asset(
                    song.albumArtImgPath,
                    width: 50,
                    height: 50,
                  ),
                  title: Text(song.title),
                  subtitle: Text(song.artist),
                  onTap: () => goToSong(index),
                );
              },
            );
          },
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
