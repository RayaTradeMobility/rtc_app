import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rtc_app/constants/provider.dart';

import '../view/home_screen.dart';



class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  void _toggleDarkMode(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context, listen: false);
    final newMode =
    themeProvider.mode == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
    themeProvider.setMode(newMode);
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.blue,
      leading: IconButton(
        onPressed: () {
          Scaffold.of(context).openDrawer();
        },
        icon: const Icon(Icons.menu),
      ),
      title: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              'assets/rayawhite.png',
              fit: BoxFit.contain,
              height: 50,
              width: 150,
            ),
          ),
        ],
      ),
      actions: [
        PopupMenuButton<FilterList>(
          itemBuilder: (BuildContext context) => <PopupMenuEntry<FilterList>>[
            const PopupMenuItem<FilterList>(
              value: FilterList.bbcNews,
              child: Text('Language'),
            ),
            PopupMenuItem<FilterList>(
              value: FilterList.mode,
              child: Row(
                children: [
                  Icon(Theme.of(context).brightness == Brightness.dark
                      ? Icons.light_mode
                      : Icons.dark_mode),
                  const SizedBox(width: 8.0),
                  Text(Theme.of(context).brightness == Brightness.dark
                      ? 'Light Mode'
                      : 'Dark Mode'),
                ],
              ),
            ),
          ],
          onSelected: (FilterList result) {
            if (result == FilterList.mode) {
              _toggleDarkMode(context);
            }
          },
        ),
      ],
    );
  }
}
