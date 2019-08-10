import 'package:flutter/material.dart';
import 'package:ivan/data.dart';

class DetailRoute extends StatelessWidget {
  final Data data;

  // In the constructor, require a Todo.
  DetailRoute({Key key, @required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail"),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
          Text(data.place),
          Text(data.address),
          Text(data.city),
          Text("${data.value.toString()}/150")
        ])
      ),
    );
  }
}