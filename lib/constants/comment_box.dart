// ignore_for_file: file_names

import 'package:flutter/material.dart';

class CommentBox extends StatefulWidget {
  final TextEditingController controller;
  final BorderRadius inputRadius;
  final void Function() onSend;

  const CommentBox({
    Key? key,
    required this.controller,
    required this.inputRadius,
    required this.onSend,
  }) : super(key: key);

  @override
  CommentBoxState createState() => CommentBoxState();
}

class CommentBoxState extends State<CommentBox> {
  Widget? image;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          controller: widget.controller,
          decoration: InputDecoration(
            hintText: "Type your comment here...",
            suffixIcon: IconButton(
              icon: const Icon(
                Icons.send,
                // color: Theme.of(context).primaryColor,
              ),
              onPressed: widget.onSend,
            ),
            filled: true,
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: widget.inputRadius,
            ),
          ),
        ),
      ],
    );
  }
}
