import 'dart:io';
import 'package:flutter/material.dart';

class DisplayPicture extends StatelessWidget {
  
  DisplayPicture({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: Icon(Icons.check,size: 50,color: Colors.greenAccent,));
  }
}
