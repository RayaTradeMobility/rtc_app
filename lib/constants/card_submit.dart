import 'package:animate_do/animate_do.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'constant.dart';

class SubmitCard extends StatefulWidget {
  const SubmitCard({super.key, required this.isSubmitCV});

  final bool isSubmitCV;

  @override
  State<SubmitCard> createState() => _SubmitCardState();
}

class _SubmitCardState extends State<SubmitCard> {
  int idx = 5;
  bool imp = false;
  final TextEditingController _title = TextEditingController();
  final TextEditingController _description = TextEditingController();
  String? _fileName;
  String? _filePath;

  Future<void> _selectFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      setState(() {
        _filePath = result.files.single.path;
        _fileName = result.files.single.name;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width * 1;
    final height = MediaQuery.of(context).size.height * 1;
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(28.0),
        child: SingleChildScrollView(
          child: FadeInUp(
            duration: const Duration(seconds: 1),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: height / 30,
                ),
                label(
                  "Submit",
                  40,
                  FontWeight.bold,
                ),
                label("Complaint", 40, FontWeight.bold),
                SizedBox(
                  height: height / 30,
                ),
                label("Title", 20, FontWeight.normal),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Container(
                    width: width - width / 30,
                    height: height / 13,
                    decoration: BoxDecoration(
                        // gradient: gradient(colors[idx]),
                        color: const Color(0xff616B7B),
                        borderRadius: BorderRadius.circular(20)),
                    child: Center(
                      child: TextFormField(
                        controller: _title,
                        style: GoogleFonts.robotoCondensed(
                            color: Colors.white, fontWeight: FontWeight.bold),
                        decoration: InputDecoration(
                            suffixIcon: imp
                                ? Icon(
                                    Icons.star_outline_outlined,
                                    color: Colors.red,
                                    size: width / 15,
                                    shadows: const [
                                      BoxShadow(
                                        color: Colors.red,
                                        blurRadius: 30.0,
                                        spreadRadius: 6.0,
                                      ),
                                    ],
                                  )
                                : null,
                            border: InputBorder.none,
                            hintText: "Add title",
                            hintStyle: const TextStyle(color: Colors.grey),
                            contentPadding:
                                const EdgeInsets.only(left: 20, top: 10)),
                        cursorColor: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: height / 30,
                ),
                label("Message", 20, FontWeight.normal),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Container(
                    width: width - width / 30,
                    height: height / 5,
                    decoration: BoxDecoration(
                        color: const Color(0xff616B7B),
                        //   gradient: gradient(colors[idx]),
                        borderRadius: BorderRadius.circular(20)),
                    child: TextFormField(
                      maxLines: 10,
                      controller: _description,
                      style: GoogleFonts.robotoCondensed(color: Colors.white),
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "Add Message",
                          hintStyle: TextStyle(color: Colors.grey),
                          contentPadding: EdgeInsets.only(left: 20, top: 8)),
                      cursorColor: Colors.white,
                    ),
                  ),
                ),
                widget.isSubmitCV == true
                    ? Row(
                        children: [
                          ElevatedButton(
                            onPressed: _selectFile,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: MyColorsSample.primary,
                            ),
                            child: Text(
                              _filePath != null
                                  ? "File Selected"
                                  : "Choose File",
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                          _filePath != null
                              ? Text("$_fileName")
                              : const Text("  No Selected File")
                        ],
                      )
                    : Container(),
                SizedBox(
                  height: height / 30,
                ),
                Center(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: MyColorsSample.primary,
                    ),
                    child: const Text(
                      "Submit",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget label(String text, double size, FontWeight fontWeight) {
  return Text(text,
      style: GoogleFonts.robotoCondensed(
          textStyle: TextStyle(fontSize: size, fontWeight: fontWeight)));
}
