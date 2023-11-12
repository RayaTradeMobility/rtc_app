import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rtc_app/constants/card_view.dart';
import 'package:rtc_app/models/news_model.dart';
import '../constants/appbar_default.dart';
import '../constants/drawer_default.dart';
import '../models/LoginModel.dart';
import '../repo/news_repository.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.user});

  final LoginModel user;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

enum FilterList { bbcNews, afr, mode }

class _HomeScreenState extends State<HomeScreen> {
  NewsRepository api = NewsRepository();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width * 1;
    final height = MediaQuery.sizeOf(context).height * 1;
    String namePage = 'News';

    return Scaffold(
      appBar: const MyAppBar(),
      drawer: MyDrawer(user: widget.user),
      body: ListView(
        children: [
          const SizedBox(
            height: 10,
          ),
          Center(
            child: Text(
              'RAYA HR SYSTEM',
              style: GoogleFonts.poppins(
                fontSize: 20,
                color: Colors.blue[800],
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: height / 1.2,
            width: width,
            child: FutureBuilder<List<NewsModel>>(
                future: api.getCards(widget.user.hRID!),
                builder: (BuildContext context, snapshot) {
                  if (snapshot.hasData) {
                    final model = snapshot.data!;
                    return ListView.builder(
                        itemCount: model.length,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) {
                          return CardItem(
                            model: model,
                            index: index,
                            namePage: namePage,
                            liked: true,
                            comment: true,
                            seeMoreBool: true,
                          );
                        });
                  } else if (snapshot.hasError) {
                    const SizedBox(
                      child: Center(child: Text("has Error")),
                    );
                  }
                  return Container();
                }),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
