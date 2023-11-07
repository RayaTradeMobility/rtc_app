import 'package:flutter/material.dart';
import 'package:rtc_app/models/LoginModel.dart';

import '../constants/appbar_default.dart';
import '../constants/drawer_default.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key, required this.user}) : super(key: key);

  final LoginModel user;

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(),
      drawer: MyDrawer(
        user: widget.user,
      ),
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
                    child: Text(
                      ' ${widget.user.name}',
                      style: const TextStyle(fontSize: 18),
                      maxLines: 2,
                    ),
                  )
                ],
              ),
              const Divider(
                height: 53,
              ),
              Row(
                children: [
                  const Text(
                    'Title:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
                  ),
                  Text(
                    ' ${widget.user.title}',
                    style: const TextStyle(fontSize: 18),
                  )
                ],
              ),
              const Divider(
                height: 53,
              ),
              Row(
                children: [
                  const Text(
                    'Company:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
                  ),
                  Text(
                    ' ${widget.user.company}',
                    style: const TextStyle(fontSize: 18),
                  )
                ],
              ),
              const Divider(
                height: 53,
              ),
              Row(
                children: [
                  const Text(
                    'Department:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
                  ),
                  Text(
                    ' ${widget.user.department}',
                    style: const TextStyle(fontSize: 18),
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
              Row(
                children: [
                  const Text(
                    'Email:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
                  ),
                  Text(
                    ' ${widget.user.email}',
                    style: const TextStyle(fontSize: 18),
                  )
                ],
              ),
              const Divider(
                height: 53,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Text(
                        'Password:',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w800),
                      ),
                      Visibility(
                        visible: showPassword,
                        child: Text(
                          ' ${widget.user.portalPassword}',
                          style: const TextStyle(fontSize: 18),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            showPassword = !showPassword;
                          });
                        },
                        child: showPassword
                            ? const Icon(Icons.visibility)
                            : const Icon(Icons.visibility_off),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
