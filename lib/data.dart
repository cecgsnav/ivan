import 'package:ivan/colorUtil.dart';
import 'package:flutter/material.dart';

class DataResponse {
  final int statusCode;
  final List<Data> data;

  DataResponse(this.statusCode, this.data);

  factory DataResponse.fromJson(Map<String, dynamic> json) {
    var list = new List.from(json['data']['data']);
    var map = list.map((i) => Data.fromJson(i));
    List<Data> dataList = map.toList();

    return DataResponse(
      json['statusCode'],
      dataList
    );
  }
}

class Data {
  final int monitorId;
  final String city;
  final String address;
  final String place;

  final Color color;
  final int value;

  Data(this.monitorId, this.city, this.address, this.place, this.color, this.value);

  factory Data.fromJson(Map<String, dynamic> json) {
    var color = "grey";
    var value = 0;
    if (json['caql']['current'] != null) {
      color = json['caql']['current']['color'];
      value = json['caql']['current']['value'];
    }

    return Data(
      json['monitorId'],
      json['city'],
      json['address'],
      json['place'],
      ColorUtil().build(color),
      value
    );
  }
}