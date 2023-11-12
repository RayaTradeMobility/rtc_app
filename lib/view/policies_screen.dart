import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:rtc_app/constants/constant.dart';
import 'package:rtc_app/models/news_model.dart';

import '../constants/appbar_default.dart';
import '../constants/card_information.dart';
import '../constants/drawer_default.dart';
import '../models/LoginModel.dart';
import '../repo/news_repository.dart';

class PoliciesScreen extends StatefulWidget {
  const PoliciesScreen({super.key, required this.user});

  final LoginModel user;

  @override
  State<PoliciesScreen> createState() => _PoliciesScreenState();
}

class _PoliciesScreenState extends State<PoliciesScreen>
    with SingleTickerProviderStateMixin {
  NewsRepository api = NewsRepository();
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width * 1;
    final height = MediaQuery.sizeOf(context).height * 1;

    return Scaffold(
      appBar: const MyAppBar(),
      drawer: MyDrawer(user: widget.user),
      body: Column(
        children: [
          TabBar(
            controller: _tabController,
            unselectedLabelColor: Theme.of(context).colorScheme.primary,
            labelColor: Theme.of(context).colorScheme.primary,
            tabs: const [
              Tab(text: 'View'),
              Tab(text: 'Information'),
            ],
            onTap: (index) {},
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                Center(
                  child: SizedBox(
                    height: height / 1.25,
                    width: width,
                    child: FutureBuilder<List<NewsModel>>(
                        future: api.getPoliciesCards(widget.user.hRID!),
                        builder: (BuildContext context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
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
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                child: CachedNetworkImage(
                                                  width: width,
                                                  height: height / 4,
                                                  imageUrl: context.locale ==
                                                          const Locale('ar')
                                                      ? model[index]
                                                          .imageAR
                                                          .toString()
                                                      : model[index]
                                                          .imageEN!
                                                          .toString(),
                                                  fit: BoxFit.cover,
                                                  placeholder: (context, url) =>
                                                      Container(
                                                    child: spinkit2,
                                                  ),
                                                  errorWidget: (context, url,
                                                          error) =>
                                                      const Icon(
                                                          Icons.error_outline,
                                                          color: Colors.red),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Card(
                                            elevation: 5,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12),
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
                                                    child: Text(
                                                      context.locale
                                                                  .languageCode ==
                                                              'ar'
                                                          ? model[index]
                                                              .headerAR
                                                              .toString()
                                                          : model[index]
                                                              .headerEN
                                                              .toString(),
                                                      maxLines: 3,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style:
                                                          GoogleFonts.poppins(
                                                              fontSize: 19,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: width * 0.7,
                                                    child: Text(
                                                      context.locale
                                                                  .languageCode ==
                                                              'ar'
                                                          ? model[index]
                                                              .detailsAR
                                                              .toString()
                                                          : model[index]
                                                              .detailsEN
                                                              .toString(),
                                                      maxLines: 3,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style:
                                                          GoogleFonts.poppins(
                                                              fontSize: 17),
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 12,
                                                  ),
                                                  Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      children: [
                                                        InkWell(
                                                          child: const Text(
                                                            "Go To Browser",
                                                            style: TextStyle(
                                                                color:
                                                                    Colors.blue,
                                                                fontSize: 18),
                                                          ),
                                                          onTap: () {},
                                                        ),
                                                        InkWell(
                                                          child: const Text(
                                                              "Download File",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .blue,
                                                                  fontSize:
                                                                      18)),
                                                          onTap: () {},
                                                        ),
                                                      ]),
                                                  const Spacer(),
                                                ],
                                              ),
                                            )),
                                        // Divider(
                                        //   height: height * 0.1,
                                        //   color: Colors.black,
                                        // )
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
                ),
                const Center(child: MyCard()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
