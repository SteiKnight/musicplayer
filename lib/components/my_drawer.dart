import 'package:flutter/material.dart';
import 'package:musicplayer/pages/settings_page.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(50),
            child: Icon(Icons.music_note, size: 80),
          ),

          // Home
          Padding(
            padding: const EdgeInsets.only(left: 25.0, top: 25),
            child: ListTile(
              leading: Icon(Icons.home),
              title: const Text('H O M E'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ),

          // Settings
          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: ListTile(
              leading: Icon(Icons.settings),
              title: const Text('S E T T I N G S'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SettingsPage()));
              },
            ),
          ),
        ],
      ),
    );
  }
}
