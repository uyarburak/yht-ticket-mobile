import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CommonWidget {
  static SizedBox rowHeight({double height = 30}) {
    return SizedBox(height: height);
  }

  static SizedBox rowWidth({double width = 30}) {
    return SizedBox(width: width);
  }

  static void toast(String error) async {
    await Fluttertoast.showToast(
        msg: error,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 3,
        backgroundColor: Colors.grey.shade100,
        textColor: Colors.black.withOpacity(0.8),
        fontSize: 16.0);
  }
}
