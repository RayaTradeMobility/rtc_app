import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:rtc_app/constants/constant.dart';
import 'package:rtc_app/models/LoginModel.dart';
import 'package:rtc_app/view/EventsScreen.dart';
import 'package:rtc_app/view/JobsScreen.dart';
import 'package:rtc_app/view/KnowYourCompanyScreen.dart';
import 'package:rtc_app/view/PoliciesScreen.dart';
import 'package:rtc_app/view/login_screen.dart';
import 'package:rtc_app/view/profile_screen.dart';

import '../view/complaints_screen.dart';
import '../view/home_screen.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key, required this.user});

  final LoginModel user;

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: MyColorsSample.primary,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/rayawhite.png',
                  fit: BoxFit.contain,
                  height: 50,
                ),
              ],
            ),
          ),
          ListTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(children: [
                  const Icon(Icons.notifications_active),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(tr('Notification')),
                ]),
                Row(
                  children: [
                    Container(
                        width: 20,
                        height: 20,
                        decoration: const BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        ),
                        child: Center(
                            child: Text(
                          tr('1'),
                          style: const TextStyle(color: Colors.white),
                        )))
                  ],
                )
              ],
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Row(
              children: [
                const Icon(Icons.feed_rounded),
                const SizedBox(
                  width: 8,
                ),
                Text(tr('News')),
              ],
            ),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return HomeScreen(
                  user: widget.user,
                );
              }));
            },
          ),
          ListTile(
            title: Row(
              children: [
                const Icon(Icons.feedback),
                const SizedBox(
                  width: 8,
                ),
                Text(tr('Complaints')),
              ],
            ),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return ComplaintsScreen(user: widget.user);
              }));
            },
          ),
          ListTile(
            title: Row(
              children: [
                const Icon(Icons.wb_iridescent),
                const SizedBox(
                  width: 8,
                ),
                Text(tr('Suggestions and Inquiries')),
              ],
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Row(
              children: [
                const Icon(Icons.insights_sharp),
                const SizedBox(
                  width: 8,
                ),
                Text(tr('Know Your Company')),
              ],
            ),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return KnowYourCompanyScreen(user: widget.user);
              }));
            },
          ),
          ListTile(
            title: Row(
              children: [
                const Icon(Icons.local_police),
                const SizedBox(
                  width: 8,
                ),
                Text(tr('Policies')),
              ],
            ),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return PoliciesScreen(user: widget.user);
              }));
            },
          ),
          ListTile(
            title: Row(
              children: [
                const Icon(Icons.work),
                const SizedBox(
                  width: 8,
                ),
                Text(tr('Jobs')),
              ],
            ),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return JobsScreen(user: widget.user);
              }));
            },
          ),
          ListTile(
            title: Row(
              children: [
                const Icon(Icons.local_offer),
                const SizedBox(
                  width: 8,
                ),
                Text(tr('Employees Offers')),
              ],
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Row(
              children: [
                const Icon(Icons.event),
                const SizedBox(
                  width: 8,
                ),
                Text(tr('Events')),
              ],
            ),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return EventScreen(user: widget.user);
              }));
            },
          ),
          ListTile(
            title: Row(
              children: [
                const Icon(Icons.account_circle),
                const SizedBox(
                  width: 8,
                ),
                Text(tr('My Profile')),
              ],
            ),
            onTap: () {
              // Handle BBC News menu item click
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return ProfileScreen(user: widget.user);
              }));
            },
          ),
          ListTile(
            title: Row(
              children: [
                const Icon(Icons.logout),
                const SizedBox(
                  width: 8,
                ),
                Text(tr('Logout')),
              ],
            ),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const LoginPage();
              }));
            },
          ),
        ],
      ),
    );
  }
}
