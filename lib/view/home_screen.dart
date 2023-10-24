// import 'package:cached_network_image/cached_network_image.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../constants/appbar_default.dart';
import '../constants/drawer_default.dart';
import '../models/news_channels_headlines_model.dart';
import '../view-model/news_view_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

enum FilterList { bbcNews, afr, mode }

class _HomeScreenState extends State<HomeScreen> {
  NewsViewModel newsViewModel = NewsViewModel();

  FilterList? selectedMenu;

  final format = DateFormat('MMMM dd, yyyy');
  String channelName = 'bbc-news';

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width * 1;
    final height = MediaQuery.sizeOf(context).height * 1;
    bool isLiked = false;

    return Scaffold(
      appBar: const MyAppBar(),
      drawer: const MyDrawer(),
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
            height: height,
            width: width,
            child: FutureBuilder<NewsChannelsHeadlinesModel>(
                future: newsViewModel.fetchNewsChannelHeadlinesApi(channelName),
                builder: (BuildContext context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                        child: SpinKitCircle(
                      size: 50,
                      color: Colors.blue,
                    ));
                  } else {
                    return ListView.builder(
                        itemCount: snapshot.data!.articles!.length,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) {
                          return SizedBox(
                            child: Column(
                              children: [
                                Container(
                                  color: Colors.white,
                                  height: height * 0.3,
                                  width: width * .9,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(50),
                                    child: CachedNetworkImage(
                                      imageUrl: snapshot
                                          .data!.articles![index].urlToImage
                                          .toString(),
                                      fit: BoxFit.cover,
                                      placeholder: (context, url) => Container(
                                        child: spinkit2,
                                      ),
                                      errorWidget: (context, url, error) =>
                                          const Icon(Icons.error_outline,
                                              color: Colors.red),
                                    ),
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
                                      height: height * .22,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                            width: width * 0.7,
                                            child: Text(
                                              snapshot
                                                  .data!.articles![index].title
                                                  .toString(),
                                              maxLines: 3,
                                              overflow: TextOverflow.ellipsis,
                                              style: GoogleFonts.poppins(
                                                  fontSize: 17),
                                            ),
                                          ),
                                          const Spacer(),
                                          Row(
                                              // mainAxisAlignment:
                                              //     MainAxisAlignment.spaceBetween,
                                              children: [
                                            InkWell(
                                              onTap: () {
                                                setState(() {
                                                  isLiked = !isLiked;
                                                });
                                              },
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: isLiked
                                                      ? Colors.blue
                                                      : Colors.grey,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8),
                                                ),
                                                padding: const EdgeInsets.all(12),
                                                child: const Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    Icon(
                                                      Icons.thumb_up,
                                                      color: Colors.white,
                                                    ),
                                                    SizedBox(width: 9),
                                                    Text(
                                                      'Like',
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: width * 0.3,
                                            ),
                                            ElevatedButton(
                                                onPressed: () {},
                                                child: const Row(
                                                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                  children: [
                                                    Icon(Icons.comment),
                                                    SizedBox(
                                                      width: 9,
                                                    ),
                                                    Text('Comment'),
                                                  ],
                                                ))
                                          ])
                                        ],
                                      ),
                                    )),
                                Divider(
                                  height: height * 0.1,
                                  color: Colors.black,
                                )
                              ],
                            ),
                          );
                        });
                  }
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

const spinkit2 = SpinKitFadingCircle(
  color: Colors.amber,
  size: 50,
);
