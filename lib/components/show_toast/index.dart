import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

/// showToast
void showToast(String text, {ToastGravity gravity = ToastGravity.CENTER, Toast toastLength = Toast.LENGTH_SHORT}) {
  // 这里使用Fluttertoast包
  Fluttertoast.showToast(
    msg: text,
    toastLength: toastLength,
    gravity: gravity,
    timeInSecForIosWeb: 1,
    backgroundColor: Colors.grey[600],
    fontSize: 16,
  );
}
