// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ivan/data.dart';
import 'package:ivan/detailRoute.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Startup Name Generator',
      home: MainAppPage(),
    );
  }
}

class MainAppPage extends StatefulWidget {
  MainAppPage({Key key}) : super(key: key);

  @override
  _MainAppPageState createState() => _MainAppPageState();
}

class _MainAppPageState extends State<MainAppPage> {
  List<Data> widgets = [];

  @override
  void initState() {
    super.initState();

    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("IVAN"),
        ),
        body: ListView.builder(
            itemCount: widgets.length,
            itemBuilder: (BuildContext context, int position) {
              return GestureDetector(
                child: getRow(position), 
                onTap: () {
                  Navigator.push(context,
                  MaterialPageRoute(builder: (context) => DetailRoute(data: widgets[position])));
                });
            }));
  }

  Widget getRow(int i) {
    return Container(
        padding: EdgeInsets.all(10.0),
        child: Row(
          children: [
            Padding(
                padding: EdgeInsets.all(10),
                child: Column(children: [
                  Text("●", 
                  style: TextStyle(
                    color: widgets[i].color, 
                    fontWeight: FontWeight.bold)),
                  Text(widgets[i].monitorId.toString())
                ])),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widgets[i].address, style: TextStyle(color: Colors.black87)),
                Text(widgets[i].city, style: TextStyle(color: Colors.blueAccent))
            ])
          ],
        ));
  }

  loadData() async {
    String dataURL = "https://api.ivanonline.org/v1/air/data/";
    http.Response response = await http.get(dataURL);
    Map dataMap = jsonDecode(response.body);
    var data = DataResponse.fromJson(dataMap);
    setState(() {
      widgets = data.data;
    });
  }
}
