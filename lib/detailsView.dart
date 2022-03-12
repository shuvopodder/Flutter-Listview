
// ignore_for_file: file_names

import 'package:flutter/cupertino.dart';
 import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:url_launcher/url_launcher.dart';

class detailsView extends StatelessWidget {
  final String id,url,author;
  final int width,height;
  const detailsView({Key? key, required this.id, required this.url, required this.author, required this.width, required this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Details Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("ID: "+ id),
            Text("Author: "+ author),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("Width: "+ width.toString()),
                Text("Height: "+ height.toString()),],
            ),
            Linkify(
              onOpen: _onOpen,
              textScaleFactor: 2,
              text: "Photo Url: "+ url,
            ),

          ],
        ),
      ),
    );
  }
  Future<void> _onOpen(LinkableElement link) async {
    if (await canLaunch(link.url)) {
      await launch(link.url,forceWebView: true);
    } else {
      throw 'Could not launch $link';
    }
  }
}

