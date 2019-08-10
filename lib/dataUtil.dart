import 'package:flutter/material.dart';

class DataUtil {
  Color build(String literal) {
    switch (literal) {
      case "green": {
        return Colors.green[400];
      }
      case "yellow": {
        return Colors.yellowAccent[700];
      }
      case "orange": {
        return Colors.orange[900];
      }
      case "red": {
        return Colors.red[400];
      }
      default: {
        print(literal);
        return Colors.grey;
      }
    }
  }

  String quality(int val) {
    if (val >= 0 && val <= 50) {
      return "Good";
    }

    if (val >= 51 && val <= 100) {
      return "Moderate";
    }

    if (val >= 101 && val <= 150) {
      return "Unhealthy for Sensitive Groups";
    }

    if (val >= 151 && val <= 200) {
      return "Unhealthy";
    }

    return "Unavailable";
  }
}