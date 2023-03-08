import 'package:flutter/material.dart';

class LanguageModel {
  String ImgUrl;
  String Name;
  bool IsSelected;

  LanguageModel(
      {required this.ImgUrl, required this.Name, required this.IsSelected});

  static List<LanguageModel> languages = [
    LanguageModel(
        ImgUrl: "assets/images/usa.png", Name: "English", IsSelected: true),
    LanguageModel(
        ImgUrl: "assets/images/russia.png", Name: "Russian", IsSelected: false),
    LanguageModel(
        ImgUrl: "assets/images/uzbek.png", Name: "Uzbek", IsSelected: false),
  ];
}
