// ignore_for_file: file_names

import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../API Online/API.dart';
import '../models/news_model.dart';
import '../view/see_more_screen.dart';
import 'comment_box.dart';
import 'constant.dart';

class CardItem extends StatefulWidget {
  const CardItem(
      {super.key,
      required this.model,
      required this.namePage,
      required this.index});

  final List<NewsModel> model;
  final String namePage;
  final int index;

  @override
  State<CardItem> createState() => _CardItemState();
}

class _CardItemState extends State<CardItem> {
  API api = API();
  TextEditingController commentController = TextEditingController();
  bool isPressed = false;
  late List<bool> isLikedList =
      List.generate(widget.model.length, (index) => true);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width * 1;
    final height = MediaQuery.sizeOf(context).height * 1;

    return Container(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      child: SizedBox(
        child: Column(
          children: [
            Container(
                color: Colors.transparent,
                width: width / 1.1,
                height: height / 1.55,
                child: Column(children: [
                  Column(
                    children: [
                      Column(
                        children: [
                          Column(
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
                                      widget.model[widget.index].createdBY ??
                                          "HR",
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w900,
                                          fontSize: 20),
                                    ),
                                  ]),
                                  SizedBox(
                                    height: height / 18,
                                  ),
                                  Text(widget.model[widget.index].createdDate!
                                      .substring(0, 10))
                                ],
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: CachedNetworkImage(
                                  width: width,
                                  height: height / 4,
                                  imageUrl: context.locale == const Locale('ar')
                                      ? widget.model[widget.index].imageAR!
                                      : widget.model[widget.index].imageEN!,
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
                        ],
                      ),
                      Card(
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Container(
                            alignment: Alignment.bottomCenter,
                            padding: const EdgeInsets.all(15),
                            height: height * .33,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: width * 0.7,
                                  child: Container(
                                    constraints: BoxConstraints(
                                        maxWidth: width / 3,
                                        maxHeight: height / 14),
                                    child: Text(
                                      context.locale.languageCode == 'ar'
                                          ? widget.model[widget.index].headerAR
                                              .toString()
                                          : widget.model[widget.index].headerEN
                                              .toString(),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.poppins(
                                          fontSize: 19,
                                          fontWeight: FontWeight.w600),
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
                                      context.locale.languageCode == 'ar'
                                          ? widget.model[widget.index].detailsAR
                                              .toString()
                                          : widget.model[widget.index].detailsEN
                                              .toString(),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.poppins(fontSize: 15),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 14,
                                ),
                                Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      InkWell(
                                        child: const Text(
                                          "Go To Browser",
                                          style: TextStyle(
                                              color: Colors.blue, fontSize: 18),
                                        ),
                                        onTap: () async {
                                          String? url = widget
                                              .model[widget.index].browserLink!;

                                          if (await canLaunchUrl(
                                              Uri.parse(url))) {
                                            await launchUrl(Uri.parse(url));
                                          } else {
                                            throw 'Could not launch $url';
                                          }
                                        },
                                      ),
                                      InkWell(
                                        child: const Text("Download File",
                                            style: TextStyle(
                                                color: Colors.blue,
                                                fontSize: 18)),
                                        onTap: () async {
                                          api.downloadFile(widget
                                              .model[widget.index]
                                              .attached1Path!);
                                        },
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
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            isLikedList[widget.index] =
                                                !isLikedList[widget.index];
                                          });
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          padding: const EdgeInsets.all(12),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Icon(
                                                Icons.thumb_up,
                                                color: isLikedList[widget.index]
                                                    ? Colors.black
                                                    : Colors.blue,
                                              ),
                                              const SizedBox(width: 9),
                                              Text(
                                                'Like',
                                                style: TextStyle(
                                                  color:
                                                      isLikedList[widget.index]
                                                          ? Colors.black
                                                          : Colors.blue,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                          onTap: () {
                                            setState(() {
                                              isPressed = true;
                                            });
                                          },
                                          child: const Row(
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
                                              namePage: widget.namePage,
                                              model: widget.model[widget.index],
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
                                    ]),
                                isPressed == true
                                    ? CommentBox(
                                        controller: commentController,
                                        inputRadius: BorderRadius.circular(20),
                                        onSend: () {
                                          setState(() {
                                            commentController.clear();
                                            isPressed = false;
                                          });
                                        },
                                      )
                                    : Container(),
                              ],
                            ),
                          )),
                    ],
                  ),
                ])),
            Divider(
              height: height * 0.1,
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
