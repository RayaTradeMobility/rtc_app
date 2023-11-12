import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:rtc_app/models/LoginModel.dart';
import '../constants/appbar_default.dart';
import '../constants/constant.dart';
import '../constants/drawer_default.dart';
import '../models/response_message_model.dart';
import '../repo/news_repository.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key, required this.user}) : super(key: key);

  final LoginModel user;

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool showPassword = false;
  NewsRepository api = NewsRepository();
  final _formKey1 = GlobalKey<FormState>();
  TextEditingController passwordController = TextEditingController();
  int menuId=1;

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
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: MyColorsSample.primary,
                      ),
                      onPressed: () async {
                        AwesomeDialog(
                            context: context,
                            dialogType: DialogType.info,
                            // ignore: deprecated_member_use
                            animType: AnimType.SCALE,
                            body: Column(
                              children: [
                                const Text(
                                  'Enter New Password',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 10),
                                Form(
                                  key: _formKey1,
                                  child: TextFormField(
                                    controller: passwordController,
                                    keyboardType: TextInputType.number,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Please enter New Password';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                              ],
                            ),
                            btnOkOnPress: () async {
                              if (_formKey1.currentState!.validate()) {
                                ResponseMessage res =
                                    await api.updatePassword(widget.user.hRID!,
                                        passwordController.text);
                                if (res.message == "Updated Success") {
                                  Fluttertoast.showToast(
                                      msg: res.message!,
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.CENTER,
                                      timeInSecForIosWeb: 1,
                                      backgroundColor: Colors.grey,
                                      textColor: Colors.white,
                                      fontSize: 16.0);
                                } else if (res.message != "Updated Success") {
                                  Fluttertoast.showToast(
                                      msg: "Something went wrong",
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.CENTER,
                                      timeInSecForIosWeb: 1,
                                      backgroundColor: Colors.grey,
                                      textColor: Colors.white,
                                      fontSize: 16.0);
                                }
                              }
                            }).show();
                      },
                      child: const Text("Change Password"))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
