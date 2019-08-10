import 'package:flutter/material.dart';
import 'package:ivan/data.dart';

import 'dataUtil.dart';

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
        body: ListView(
          children: <Widget>[
            Card(child: ListTile(
              leading: Text("${data.value}/150", style: TextStyle(color: data.color, fontWeight: FontWeight.bold),),
              title: Text(data.place, style: Theme.of(context).textTheme.title,))
            ),
            Card(
              child: ListTile(
                title: Text(data.address),
                subtitle: Text(data.city),
              ),
            ),
            Card(
              child: ListTile(
                title: Text('The air quality is ${DataUtil().quality(data.value)}'),
              )
            )
          ],
        ));
  }
}
