import 'package:flutter/material.dart';
import 'package:musicplayer/components/my_drawer.dart';
import 'package:musicplayer/models/playlist_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: const Text('P L A Y L I S T'),
        centerTitle: true,
      ),
      body: Consumer<PlaylistProvider>(
        builder: (context, playlistProvider, child) {
          return ListView.builder(
            itemCount: playlistProvider.getPlaylist.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: Image.asset(
                  playlistProvider.getPlaylist[index].albumArtImgPath,
                  width: 50,
                  height: 50,
                ),
                title: Text(playlistProvider.getPlaylist[index].title),
                subtitle: Text(playlistProvider.getPlaylist[index].artist),
                onTap: () {
                  playlistProvider.setCurrentSongIndex(index);
                },
              );
            },
          );
        },
      ),
      drawer: MyDrawer(),
    );
  }
}
