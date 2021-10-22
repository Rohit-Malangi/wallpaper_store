import 'package:flutter/material.dart';

Widget appbarName() {
  return RichText(
    text: TextSpan(
      text: 'WallPaper',
      style: const TextStyle(fontSize: 28, color: Colors.black),
      children: <TextSpan>[
        TextSpan(
          text: 'Store',
          style: TextStyle(fontSize: 28, color: Colors.blue.shade500),
        ),
      ],
    ),
  );
}
