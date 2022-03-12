// ignore_for_file: file_names

import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class getData with ChangeNotifier{
  List<ListData> data = [];

  Future getListData() async{
    var response =
    await http.get(
        Uri.parse('https://picsum.photos/v2/list?page=pageNumber&limit=20'));

    var jsonData = json.decode(response.body);
    for(var u in jsonData){
      ListData list = ListData(u["id"],u["author"],u["width"],u["height"],u["url"]);
      data.add(list);
    }

    notifyListeners();
    return data;
  }
}

class ListData{
  final String id, author, url;
  final int width, height;
  ListData(this.id,this.author,this.width,this.height,this.url);
}