// ignore_for_file: deprecated_member_use, use_build_context_synchronously

import 'package:animate_do/animate_do.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:rtc_app/constants/constant.dart';
import 'package:rtc_app/models/LoginModel.dart';
import 'package:rtc_app/view/news_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../API Online/api_service.dart';
import '../constants/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  bool isLoading = false;
  final _formKey = GlobalKey<FormState>();
  final _formKey1 = GlobalKey<FormState>();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool passwordVisibility = true;
  API api = API();

  @override
  void initState() {
    _loadUserEmailPassword();
    super.initState();
  }

  void _toggleDarkMode(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context, listen: false);
    final newMode =
        themeProvider.mode == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
    themeProvider.setMode(newMode);
  }

  void _loadUserEmailPassword() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var email = prefs.getString("username") ?? "";
      var passWord = prefs.getString("password") ?? "";
      if (kDebugMode) {
        print(email);
        print(passwordController);
      }
      usernameController.text = email;
      passwordController.text = passWord;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 400,
              child: Stack(
                children: <Widget>[
                  Positioned(
                    top: -40,
                    height: 400,
                    width: width,
                    child: FadeInUp(
                        duration: const Duration(seconds: 1),
                        child: Container(
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                      'assets/images/background-.png'),
                                  fit: BoxFit.fill)),
                        )),
                  ),
                  Positioned(
                    left: 0,
                    height: 400,
                    width: width + 20,
                    child: FadeInUp(
                        duration: const Duration(milliseconds: 1000),
                        child: Container(
                          width: width,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                            image: AssetImage('assets/images/background-1.png'),
                            fit: BoxFit.fill,
                          )),
                        )),
                  ),
                  Positioned(
                    left: width / 3,
                    top: MediaQuery.of(context).size.height / 5,
                    height: 44,
                    width: width / 3,
                    child: FadeInUp(
                        duration: const Duration(seconds: 1),
                        child: Container(
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  opacity: 0.8,
                                  image:
                                      AssetImage('assets/images/rayawhite.png'),
                                  fit: BoxFit.fill)),
                        )),
                  ),
                  Positioned(
                      right: width - 40,
                      top: 30,
                      height: 90,
                      child: FadeInUp(
                        duration: const Duration(milliseconds: 1000),
                        child: InkWell(
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
                                            context.locale =
                                                const Locale('ar', 'SA');
                                            Navigator.pop(context);
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 8.0),
                                            child: Text(tr('Arabic')),
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            context.locale =
                                                const Locale('en', 'US');
                                            Navigator.pop(context);
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 8.0),
                                            child: Text(tr('English')),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              );
                            },
                            child: const Icon(
                              Icons.language,
                              size: 30,
                            )),
                      )),
                  Positioned(
                    left: width - 50,
                    top: 30,
                    height: 90,
                    child: FadeInUp(
                      duration: const Duration(milliseconds: 1000),
                      child: PopupMenuButton<FilterList>(
                        itemBuilder: (BuildContext context) =>
                            <PopupMenuEntry<FilterList>>[
                          PopupMenuItem<FilterList>(
                            value: FilterList.mode,
                            child: Row(
                              children: [
                                Icon(Theme.of(context).brightness ==
                                        Brightness.dark
                                    ? Icons.light_mode
                                    : Icons.dark_mode),
                                const SizedBox(width: 8.0),
                                Text(Theme.of(context).brightness ==
                                        Brightness.dark
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
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  FadeInUp(
                      duration: const Duration(milliseconds: 1500),
                      child: Text(
                        tr("Login"),
                        style: const TextStyle(
                            color: Color.fromRGBO(49, 39, 79, 1),
                            fontWeight: FontWeight.bold,
                            fontSize: 30),
                      )),
                  const SizedBox(
                    height: 30,
                  ),
                  FadeInUp(
                      duration: const Duration(milliseconds: 1700),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                            border: Border.all(
                                color: const Color.fromRGBO(196, 135, 198, .3)),
                            boxShadow: const [
                              BoxShadow(
                                color: Color.fromRGBO(196, 135, 198, .3),
                                blurRadius: 20,
                                offset: Offset(0, 10),
                              )
                            ]),
                        child: Column(
                          children: <Widget>[
                            Container(
                              padding: const EdgeInsets.all(10),
                              decoration: const BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          color: Color.fromRGBO(
                                              196, 135, 198, .3)))),
                              child: Form(
                                key: _formKey1,
                                child: TextFormField(
                                  validator: (username) {
                                    if (isUsernameValid(username!)) {
                                      return null;
                                    } else {
                                      return 'Please Enter Valid Username';
                                    }
                                  },
                                  controller: usernameController,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: tr("Username"),
                                      hintStyle: TextStyle(
                                          color: Colors.grey.shade700)),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              padding: const EdgeInsets.all(10),
                              child: Form(
                                key: _formKey,
                                child: TextFormField(
                                  validator: (password) {
                                    if (isPasswordValid(password!)) {
                                      return null;
                                    } else {
                                      return 'Please Enter Valid Password';
                                    }
                                  },
                                  controller: passwordController,
                                  obscureText: passwordVisibility,
                                  decoration: InputDecoration(
                                      suffixIcon: IconButton(
                                        icon: Icon(
                                          // Based on passwordVisible state choose the icon
                                          passwordVisibility
                                              ? Icons.visibility
                                              : Icons.visibility_off,
                                          color: Theme.of(context)
                                              .primaryColorDark,
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            passwordVisibility =
                                                !passwordVisibility;
                                          });
                                        },
                                      ),
                                      border: InputBorder.none,
                                      hintText: tr("Password"),
                                      hintStyle: TextStyle(
                                          color: Colors.grey.shade700)),
                                ),
                              ),
                            )
                          ],
                        ),
                      )),
                  const SizedBox(
                    height: 20,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  FadeInUp(
                      duration: const Duration(milliseconds: 1900),
                      child: MaterialButton(
                        onPressed: () async {
                          setState(() {
                            isLoading = true;
                          });
                          if (_formKey.currentState!.validate() &&
                              _formKey1.currentState!.validate()) {
                            LoginModel user = await api.login(
                                usernameController.text,
                                passwordController.text);

                            if (user.name != null) {
                              setState(() {
                                isLoading = false;
                              });
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => HomeScreen(user: user),
                                ),
                              );
                            } else {
                              setState(() {
                                isLoading = false;
                              });
                              Fluttertoast.showToast(
                                msg: "Invalid Username or Password",
                                toastLength: Toast.LENGTH_LONG,
                                gravity: ToastGravity.CENTER,
                                timeInSecForIosWeb: 1,
                                backgroundColor: MyColorsSample.primary,
                                textColor: Colors.white,
                                fontSize: 16.0,
                              );
                            }
                          } else {
                            setState(() {
                              isLoading = false;
                            });
                          }
                        },
                        color: const Color.fromRGBO(49, 39, 79, 1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        height: 50,
                        child: Center(
                            child: isLoading
                                ? const SpinKitChasingDots(
                                    size: 18,
                                    color: Colors.blue,
                                  )
                                : Text(
                                    tr("Login"),
                                    style: const TextStyle(color: Colors.white),
                                  )),
                      )),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

bool isPasswordValid(String password) => password.length >= 6;

bool isUsernameValid(String username) => username.length >= 5;
