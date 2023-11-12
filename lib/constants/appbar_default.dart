// ignore_for_file: deprecated_member_use

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rtc_app/constants/constant.dart';
import 'package:rtc_app/constants/provider.dart';

import '../view/news_screen.dart';

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
      backgroundColor: MyColorsSample.primary,
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
              'assets/images/rayawhite.png',
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
            PopupMenuItem<FilterList>(
              value: FilterList.bbcNews,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(tr('Language')),
                ],
              ),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text(tr('Select Language')),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          InkWell(
                            onTap: () {
                              context.locale = const Locale('ar', 'SA');
                              Navigator.pop(context);
                            },
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: Text(tr('Arabic')),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              context.locale = const Locale('en', 'US');
                              Navigator.pop(context);
                            },
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: Text(tr('English')),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
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
                      ? tr('Light Mode')
                      : tr('Dark Mode')),
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
