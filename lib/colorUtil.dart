import 'package:flutter/material.dart';

class ColorUtil {
  Color build(String literal) {
    switch (literal) {
      case "green": {
        return Colors.green[400];
      }
      case "yellow": {
        return Colors.yellow[400];
      }
      case "orange": {
        return Colors.orange[400];
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
}