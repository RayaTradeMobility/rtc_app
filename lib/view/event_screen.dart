import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:rtc_app/constants/constant.dart';
import 'package:rtc_app/models/news_model.dart';
import 'package:rtc_app/view/see_more_screen.dart';

import '../constants/appbar_default.dart';
import '../constants/drawer_default.dart';
import '../models/LoginModel.dart';
import '../repo/news_repository.dart';

class EventScreen extends StatefulWidget {
  const EventScreen({super.key, required this.user});

  final LoginModel user;

  @override
  State<EventScreen> createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {
  NewsRepository api = NewsRepository();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width * 1;
    final height = MediaQuery.sizeOf(context).height * 1;
    String namePage = "Events";

    return Scaffold(
      appBar: const MyAppBar(),
      drawer: MyDrawer(user: widget.user),
      body: ListView(
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
            height: height / 1.2,
            width: width,
            child: FutureBuilder<List<NewsModel>>(
                future: api.getEventCards(widget.user.hRID!),
                builder: (BuildContext context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                        child: SpinKitCircle(
                      size: 50,
                      color: Colors.blue,
                    ));
                  } else if (snapshot.hasData) {
                    final model = snapshot.data!;
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
                                      SizedBox(
                                        height: height / 18,
                                      ),
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: CachedNetworkImage(
                                          width: width,
                                          height: height / 4,
                                          imageUrl: context.locale ==
                                                  const Locale('ar')
                                              ? model[index].imageAR.toString()
                                              : model[index]
                                                  .imageEN!
                                                  .toString(),
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
                                        // mainAxisAlignment:
                                        //     MainAxisAlignment.end,
                                        // crossAxisAlignment:
                                        //     CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            width: width * 0.7,
                                            child: Text(
                                              context.locale.languageCode ==
                                                      'ar'
                                                  ? model[index]
                                                      .headerAR
                                                      .toString()
                                                  : model[index]
                                                      .headerEN
                                                      .toString(),
                                              maxLines: 3,
                                              overflow: TextOverflow.ellipsis,
                                              style: GoogleFonts.poppins(
                                                  fontSize: 19,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ),
                                          SizedBox(
                                            width: width * 0.7,
                                            child: Text(
                                              context.locale.languageCode ==
                                                      'ar'
                                                  ? model[index]
                                                      .detailsAR
                                                      .toString()
                                                  : model[index]
                                                      .detailsEN
                                                      .toString(),
                                              maxLines: 3,
                                              overflow: TextOverflow.ellipsis,
                                              style: GoogleFonts.poppins(
                                                  fontSize: 17),
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
                                                    "Download File 1",
                                                    style: TextStyle(
                                                        color: Colors.blue,
                                                        fontSize: 18),
                                                  ),
                                                  onTap: () {},
                                                ),
                                                InkWell(
                                                  child: const Text(
                                                      "Download File 2",
                                                      style: TextStyle(
                                                          color: Colors.blue,
                                                          fontSize: 18)),
                                                  onTap: () {},
                                                ),
                                              ]),
                                          const SizedBox(
                                            height: 12,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
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
                                                    Icon(
                                                      Icons.list_outlined,
                                                      size: 34,
                                                    ),
                                                    Text("See More"),
                                                  ],
                                                ),
                                              )
                                            ],
                                          )

                                          // const Spacer(),
                                        ],
                                      ),
                                    )),
                              ],
                            ),
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
        ],
      ),
    );
  }
}
