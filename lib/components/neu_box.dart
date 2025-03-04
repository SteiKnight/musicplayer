import 'package:flutter/material.dart';
import 'package:musicplayer/themes/theme_provider.dart';
import 'package:provider/provider.dart';

class NeuBox extends StatelessWidget {
  final Widget? child;
  const NeuBox({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    //is darkMode
    bool isDarkMode = Provider.of<ThemeProvider>(context).isDarkMode;

    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            //darker shadow on bottom right side
            BoxShadow(
              color: isDarkMode ? Colors.black : Colors.grey.shade500,
              blurRadius: 15,
              offset: Offset(4, 4),
            ),

            //lighter shadow on top left side
            BoxShadow(
              color: isDarkMode ? Colors.grey.shade800 : Colors.white,
              blurRadius: 15,
              offset: Offset(-4, -4),
            ),
          ]),
      child: child,
    );
  }
}
