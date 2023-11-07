import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rtc_app/models/LoginModel.dart';
import 'package:rtc_app/models/news_model.dart';
import 'package:rtc_app/view/see_more_screen.dart';
import 'package:url_launcher/url_launcher.dart';

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
                          return SizedBox(
                            child: Column(
                              children: [
                                Container(
                                  color: Colors.transparent,
                                  height: height * 0.32,
                                  width: width * .9,
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(children: [
                                            const CircleAvatar(
                                              backgroundColor: Colors.white,
                                              child: Center(
                                                  child: Icon(
                                                Icons.account_circle,
                                                color: Colors.black,
                                                size: 40,
                                              )),
                                            ),
                                            const SizedBox(
                                              width: 14,
                                            ),
                                            Text(
                                              model[index].createdBY ?? "HR",
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.w900,
                                                  fontSize: 20),
                                            ),
                                          ]),
                                          SizedBox(
                                            height: height / 18,
                                          ),
                                          Text(model[index]
                                              .createdDate!
                                              .substring(0, 10))
                                        ],
                                      ),
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: CachedNetworkImage(
                                          width: width,
                                          height: height / 4,
                                          imageUrl:
                                              model[index].imageEN.toString(),
                                          fit: BoxFit.cover,
                                          placeholder: (context, url) =>
                                              Container(
                                            child: spinkit2,
                                          ),
                                          errorWidget: (context, url, error) =>
                                              const Icon(Icons.error_outline,
                                                  color: Colors.red),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Card(
                                    elevation: 5,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Container(
                                      alignment: Alignment.bottomCenter,
                                      padding: const EdgeInsets.all(15),
                                      height: height * .24,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            width: width * 0.7,
                                            child: Container(
                                              constraints: BoxConstraints(
                                                  maxWidth: width / 3,
                                                  maxHeight: height / 14),
                                              child: Text(
                                                context.locale.languageCode ==
                                                        'ar'
                                                    ? model[index]
                                                        .headerAR
                                                        .toString()
                                                    : model[index]
                                                        .headerEN
                                                        .toString(),
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                                style: GoogleFonts.poppins(
                                                    fontSize: 19,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: width * 0.7,
                                            child: Container(
                                              constraints: BoxConstraints(
                                                  maxWidth: width / 3,
                                                  maxHeight: height / 16),
                                              child: Text(
                                                context.locale.languageCode ==
                                                        'ar'
                                                    ? model[index]
                                                        .detailsAR
                                                        .toString()
                                                    : model[index]
                                                        .detailsEN
                                                        .toString(),
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: GoogleFonts.poppins(
                                                    fontSize: 15),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 12,
                                          ),
                                          Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                InkWell(
                                                  child: const Text(
                                                    "Go To Browser",
                                                    style: TextStyle(
                                                        color: Colors.blue,
                                                        fontSize: 18),
                                                  ),
                                                  onTap: () async {
                                                    String? url = model[index]
                                                        .browserLink!;

                                                    if (await canLaunchUrl(
                                                        Uri.parse(url))) {
                                                      await launchUrl(
                                                          Uri.parse(url));
                                                    } else {
                                                      throw 'Could not launch $url';
                                                    }
                                                  },
                                                ),
                                                InkWell(
                                                  child: const Text(
                                                      "Download File",
                                                      style: TextStyle(
                                                          color: Colors.blue,
                                                          fontSize: 18)),
                                                  onTap: () {},
                                                ),
                                              ]),
                                          const Divider(
                                            height: 6,
                                            color: Colors.black,
                                          ),
                                          const Spacer(),
                                          Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                ElevatedButton(
                                                    onPressed: () {
                                                      setState(() {});
                                                    },
                                                    child: const Row(
                                                      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                      children: [
                                                        Icon(Icons.comment),
                                                        SizedBox(
                                                          width: 9,
                                                        ),
                                                        Text('Comment'),
                                                      ],
                                                    )),
                                                InkWell(
                                                  onTap: () {
                                                    Navigator.push(context,
                                                        MaterialPageRoute(
                                                            builder: (context) {
                                                      return SeeMorePage(
                                                        namePage: namePage,
                                                        model: model[index],
                                                      );
                                                    }));
                                                  },
                                                  child: const Row(
                                                    children: [
                                                      Icon(Icons.list_outlined),
                                                      Text("See More"),
                                                    ],
                                                  ),
                                                ),
                                              ])
                                        ],
                                      ),
                                    )),
                                Divider(
                                  height: height * 0.1,
                                  color: Colors.black,
                                ),
                              ],
                            ),
                          );
                        });
                  } else if (categoryName == "Information") {
                    return Container(
                      width: width/1.1,
                      height: height/1.2,
                      color: Colors.grey.withOpacity(0.2),

                      child: Stack(
                        children: [Positioned(left:20,top: 20,
                            child: Container(width: width/1.7, height: height/3,color: Colors.red,))],
                      ),
                    );
                  }
                  {
                    return Container();
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
