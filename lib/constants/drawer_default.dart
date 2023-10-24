import 'package:flutter/material.dart';
import 'package:rtc_app/view/profile_screen.dart';

import '../view/categories_screen.dart';
import '../view/home_screen.dart';


class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.blue,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/rayawhite.png',
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
                const Row(children: [
                  Icon(Icons.notifications_active),
                  SizedBox(
                    width: 8,
                  ),
                  Text('Notification'),
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
                        child: const Center(
                            child: Text(
                              '1',
                              style: TextStyle(color: Colors.white),
                            )))
                  ],
                )
              ],
            ),
            onTap: () {
              // Handle AFR menu item click
              Navigator.pop(context); // Close the drawer
              // Add your logic here
            },
          ),
          ListTile(
            title: const Row(
              children: [
                Icon(Icons.feed_rounded),
                SizedBox(
                  width: 8,
                ),
                Text('News'),
              ],
            ),
            onTap: () {
              // Handle AFR menu item click
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const HomeScreen();
              })); // Close the drawer
              // Add your logic here
            },
          ),
          ListTile(
            title: const Row(
              children: [
                Icon(Icons.feedback),
                SizedBox(
                  width: 8,
                ),
                Text('Complaints'),
              ],
            ),
            onTap: () {
              // Handle AFR menu item click
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const CategoriesScreen();
              })); // Close the drawer
              // Add your logic here
            },
          ),
          ListTile(
            title: const Row(
              children: [
                Icon(Icons.wb_iridescent),
                SizedBox(
                  width: 8,
                ),
                Text('Suggestions and Inquiries'),
              ],
            ),
            onTap: () {
              // Handle AFR menu item click
              Navigator.pop(context); // Close the drawer
              // Add your logic here
            },
          ),
          ListTile(
            title: const Row(
              children: [
                Icon(Icons.insights_sharp),
                SizedBox(
                  width: 8,
                ),
                Text('Know Your Company'),
              ],
            ),
            onTap: () {
              // Handle AFR menu item click
              Navigator.pop(context); // Close the drawer
              // Add your logic here
            },
          ),
          ListTile(
            title: const Row(
              children: [
                Icon(Icons.local_police),
                SizedBox(
                  width: 8,
                ),
                Text('Policies'),
              ],
            ),
            onTap: () {
              // Handle AFR menu item click
              Navigator.pop(context); // Close the drawer
              // Add your logic here
            },
          ),
          ListTile(
            title: const Row(
              children: [
                Icon(Icons.work),
                SizedBox(
                  width: 8,
                ),
                Text('Jobs'),
              ],
            ),
            onTap: () {
              // Handle AFR menu item click
              Navigator.pop(context); // Close the drawer
              // Add your logic here
            },
          ),
          ListTile(
            title: const Row(
              children: [
                Icon(Icons.local_offer),
                SizedBox(
                  width: 8,
                ),
                Text('Employees Offers'),
              ],
            ),
            onTap: () {
              // Handle AFR menu item click
              Navigator.pop(context); // Close the drawer
              // Add your logic here
            },
          ),
          ListTile(
            title: const Row(
              children: [
                Icon(Icons.event),
                SizedBox(
                  width: 8,
                ),
                Text('Events'),
              ],
            ),
            onTap: () {
              // Handle AFR menu item click
              Navigator.pop(context); // Close the drawer
              // Add your logic here
            },
          ),
          ListTile(
            title: const Row(
              children: [
                Icon(Icons.account_circle),
                SizedBox(
                  width: 8,
                ),
                Text('My Profile'),
              ],
            ),
            onTap: () {
              // Handle BBC News menu item click
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const ProfileScreen();
              }));
              // Add your logic here
            },
          ),
          ListTile(
            title: const Row(
              children: [
                Icon(Icons.logout),
                SizedBox(
                  width: 8,
                ),
                Text('Logout'),
              ],
            ),
            onTap: () {
              // Handle AFR menu item click
              Navigator.pop(context); // Close the drawer
              // Add your logic here
            },
          ),
        ],
      ),
    );
  }
}
