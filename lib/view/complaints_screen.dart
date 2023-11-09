import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rtc_app/constants/card_submit.dart';
import 'package:rtc_app/models/LoginModel.dart';
import 'package:rtc_app/models/news_model.dart';

import '../constants/card_information.dart';
import '../constants/card_view.dart';
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
                if (snapshot.hasError) {
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
                            model: model,
                            index: index,
                            namePage: namePage,
                            liked: false,
                            comment: true,
                            seeMoreBool: false,
                          );
                        });
                  } else if (categoryName == "Information") {
                    return const MyCard();
                  }
                  {
                    return const SubmitCard();
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
