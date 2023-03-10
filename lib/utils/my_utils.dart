import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

height(context) => MediaQuery.of(context).size.height;
width(context) => MediaQuery.of(context).size.width;


void showInfoSnackBar(context,title){
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(title)));
}