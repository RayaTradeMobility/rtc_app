import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rtc_app/models/news_model.dart';

import '../constants/constant.dart';
import '../constants/comment_box.dart';

class SeeMorePage extends StatefulWidget {
  const SeeMorePage({super.key, required this.namePage, required this.model});

  final String namePage;
  final NewsModel model;

  @override
  State<SeeMorePage> createState() => _SeeMorePageState();
}

class _SeeMorePageState extends State<SeeMorePage> {
  TextEditingController commentController = TextEditingController();
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width * 1;
    final height = MediaQuery.sizeOf(context).height * 1;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.namePage),
        backgroundColor: MyColorsSample.primary,
      ),
      body: ListView(children: [
        Column(
          children: [
            SizedBox(
              height: height / 1,
              width: width,
              child: ListView.builder(
                  itemCount: 1,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return SizedBox(
                      // height: height * 0.82,
                      // width: width * .9,
                      child: Column(
                        children: [
                          Container(
                            color: Colors.transparent,
                            height: height * 0.42,
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
                                        widget.model.createdBY ??
                                            "Human Resources",
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w900,
                                            fontSize: 20),
                                      ),
                                    ]),
                                    SizedBox(
                                      height: height / 18,
                                    ),
                                    Text(widget.model.createdDate!
                                        .substring(0, 10))
                                  ],
                                ),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: CachedNetworkImage(
                                    width: width,
                                    height: height / 4,
                                    imageUrl:
                                        context.locale == const Locale('ar')
                                            ? widget.model.imageAR.toString()
                                            : widget.model.imageEN!.toString(),
                                    fit: BoxFit.cover,
                                    placeholder: (context, url) => Container(
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
                                height: height * .25,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: width * 0.7,
                                      child: Text(
                                        context.locale.languageCode == 'ar'
                                            ? widget.model.headerAR.toString()
                                            : widget.model.headerEN.toString(),
                                        // overflow: TextOverflow.ellipsis,
                                        style: GoogleFonts.poppins(
                                            fontSize: 19,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                    SizedBox(
                                      width: width * 0.7,
                                      child: Text(
                                        context.locale.languageCode == 'ar'
                                            ? widget.model.detailsAR.toString()
                                            : widget.model.detailsEN.toString(),
                                        // overflow: TextOverflow.ellipsis,
                                        style:
                                            GoogleFonts.poppins(fontSize: 15),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 12,
                                    ),
                                    const Spacer(),
                                  ],
                                ),
                              )),
                          isPressed == false
                              ? Padding(
                                  padding: EdgeInsets.only(
                                      left: width / 10, top: height / 26),
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        isPressed = true;
                                      });
                                    },
                                    child: const Row(
                                      children: [
                                        Icon(Icons.comment),
                                        Text(
                                          " Comment",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w700),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              : Container(),
                          isPressed == true
                              ? Padding(
                                  padding: EdgeInsets.only(top: height / 7.6),
                                  child: CommentBox(
                                    controller: commentController,
                                    inputRadius: BorderRadius.circular(20),
                                    onSend: () {
                                      setState(() {
                                        commentController.clear();
                                        isPressed = false;
                                      });
                                    },
                                  ),
                                )
                              : Container(),
                        ],
                      ),
                    );
                  }),
            )
          ],
        ),
      ]),
    );
  }
}
