import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rtc_app/models/LoginModel.dart';
import 'package:rtc_app/models/news_model.dart';

import '../constants/CardItem.dart';
import '../constants/appbar_default.dart';
import '../constants/constant.dart';
import '../constants/drawer_default.dart';
import '../repo/news_repository.dart';
import '../view-model/news_view_model.dart';
import 'home_screen.dart';

class ComplaintsScreen extends StatefulWidget {
  const ComplaintsScreen({Key? key, required this.user}) : super(key: key);
  final LoginModel user;

  @override
  ComplaintsScreenState createState() => ComplaintsScreenState();
}

class ComplaintsScreenState extends State<ComplaintsScreen> {
  NewsViewModel newsViewModel = NewsViewModel();
  NewsRepository api = NewsRepository();
  FilterList? selectedMenu;
  String namePage = "Complaints";

  String categoryName = 'View';

  List<String> categoriesList = [
    'Information',
    'View',
    'Submit ',
  ];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width * 1;
    final height = MediaQuery.of(context).size.height * 1;

    return Scaffold(
      appBar: const MyAppBar(),
      drawer: MyDrawer(user: widget.user),
      body: Column(
        children: [
          Center(
              child: Text(
            namePage,
            style: const TextStyle(
                fontSize: 30,
                letterSpacing: 4,
                color: MyColorsSample.primaryDark,
                fontWeight: FontWeight.w900),
          )),
          const Divider(
            color: Colors.black,
          ),
          SizedBox(
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categoriesList.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    setState(() {
                      categoryName = categoriesList[index];
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: Container(
                      decoration: BoxDecoration(
                        color: categoryName == categoriesList[index]
                            ? Colors.blue
                            : Colors.grey,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 32),
                        child: Center(
                          child: Text(
                            categoriesList[index].toString(),
                            style: GoogleFonts.poppins(
                              fontSize: 13,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: FutureBuilder<List<NewsModel>>(
              future: api.getComplaintsCards(widget.user.hRID!),
              builder: (BuildContext context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: SpinKitCircle(
                      size: 50,
                      color: Colors.blue,
                    ),
                  );
                } else if (snapshot.hasError) {
                  return const Center(
                    child: Text('Error occurred while fetching data.'),
                  );
                } else {
                  final model = snapshot.data!;
                  if (categoryName == "View") {
                    return ListView.builder(
                        itemCount: model.length,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) {
                          return CardItem(
                              model: model, index: index, namePage: namePage);
                        });
                  } else if (categoryName == "Information") {
                    return Container(
                      width: width / 1.1,
                      height: height / 1.2,
                      color: Colors.grey.withOpacity(0.2),
                      child: Stack(
                        children: [
                          Positioned(
                              left: 20,
                              top: 20,
                              child: Container(
                                width: width / 1.7,
                                height: height / 3,
                                color: Colors.red,
                              ))
                        ],
                      ),
                    );
                  }
                  {
                    return Card(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Container(
                              color: Colors.grey,
                              height: 120,
                              child: TextFormField(
                                decoration:
                                    const InputDecoration(hintText: "Title*"),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Container(
                              color: Colors.grey,
                              height: 300,
                              child: Column(
                                children: [
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Expanded(
                                    child: TextField(
                                      decoration: InputDecoration(
                                          labelText: 'Enter Message'),
                                      keyboardType: TextInputType.multiline,
                                      maxLines: null,
                                      expands: true, // <-- SEE HERE
                                    ),
                                  ),
                                  ElevatedButton(
                                    onPressed: () {},
                                    child: const Text(
                                      'Send',
                                      style: TextStyle(fontSize: 24),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
