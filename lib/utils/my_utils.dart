import 'package:flutter/material.dart';

height(context) => MediaQuery.of(context).size.height;

width(context) => MediaQuery.of(context).size.width;

void showInfoSnackBar(context, title) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      showCloseIcon: true,
      duration: const Duration(seconds: 1),
      closeIconColor: Colors.red,
      content: Text(title),
    ),
  );
}
