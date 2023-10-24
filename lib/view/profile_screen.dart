import 'package:flutter/material.dart';

import '../constants/appbar_default.dart';
import '../constants/drawer_default.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(),
      drawer: const MyDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(28.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              const Center(
                child: CircleAvatar(
                  radius: 90.0,
                  backgroundImage: AssetImage(
                    "assets/images/user.png",
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Divider(
                height: 53,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Name:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
                  ),
                  Container(
                      constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width * 0.6),
                      child: const Text(
                        ' Mohamed Osama Mahmoud Ibrahim',
                        style: TextStyle(fontSize: 18),
                        maxLines: 2,
                      ))
                ],
              ),
              const Divider(
                height: 53,
              ),
              const Row(
                children: [
                  Text(
                    'Title:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
                  ),
                  Text(
                    ' Software Developer',
                    style: TextStyle(fontSize: 18),
                  )
                ],
              ),
              const Divider(
                height: 53,
              ),
              const Row(
                children: [
                  Text(
                    'Company:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
                  ),
                  Text(
                    ' Raya Trade',
                    style: TextStyle(fontSize: 18),
                  )
                ],
              ),
              const Divider(
                height: 53,
              ),
              const Row(
                children: [
                  Text(
                    'Department:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
                  ),
                  Text(
                    ' Information Technology',
                    style: TextStyle(fontSize: 18),
                  )
                ],
              ),
              const Divider(
                height: 53,
              ),
              const Row(
                children: [
                  Text(
                    'Grade:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
                  ),
                  Text(
                    ' 8',
                    style: TextStyle(fontSize: 18),
                  )
                ],
              ),
              const Divider(
                height: 53,
              ),
              const Row(
                children: [
                  Text(
                    'Email:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
                  ),
                  Text(
                    ' Mohamedosama@rayacorp.com',
                    style: TextStyle(fontSize: 18),
                  )
                ],
              ),
              const Divider(
                height: 53,
              ),
              const Row(
                children: [
                  Text(
                    'Password:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
                  ),
                  Text(
                    ' password',
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
              ElevatedButton(onPressed: () {}, child: const Text('Change Password')),
            ],
          ),
        ),
      ),
    );
  }
}
