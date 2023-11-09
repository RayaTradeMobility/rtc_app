import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import 'card_submit.dart';

class MyCard extends StatelessWidget {
  const MyCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width * 1;
    final height = MediaQuery.of(context).size.height * 1;
    return FadeInUp(
      duration: const Duration(seconds: 1),
      child: SizedBox(
        width: width * 0.9,
        child: Padding(
          padding: EdgeInsets.only(bottom: height / 3),
          child: DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.grey[400],
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: EdgeInsets.only(
                    right: width / 4,
                    left: width / 26,
                    top: height / 44,
                    bottom: height / 30),
                child: Card(
                  color: Colors.white,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(children: [
                                  const Icon(
                                    Icons.account_circle,
                                    color: Colors.grey,
                                    size: 34,
                                  ),
                                  label(
                                    "Admin |",
                                    19,
                                    FontWeight.w700,
                                  ),
                                ]),
                                label(
                                  "Oct 23 , 2019",
                                  10,
                                  FontWeight.w500,
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  label(
                                    "Hello!",
                                    16,
                                    FontWeight.w600,
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Container(
                                    constraints:
                                        BoxConstraints(maxWidth: width / 2.7),
                                    child: const Text(
                                        "Welcome to out new HR portal. We aim to improve our communication tools and bring your all the information and business updates you need."),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )),
        ),
      ),
    );
  }
}
