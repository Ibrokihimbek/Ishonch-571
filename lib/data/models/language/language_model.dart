class LanguageModel {
  String imgUrl;
  String name;
  bool isSelected;

  LanguageModel(
      {required this.imgUrl, required this.name, required this.isSelected});

  static List<LanguageModel> languages = [
    LanguageModel(
        imgUrl: "assets/images/usa.png", name: "English", isSelected: true),
    LanguageModel(
        imgUrl: "assets/images/russia.png", name: "Russian", isSelected: false),
    LanguageModel(
        imgUrl: "assets/images/uzbek.png", name: "Uzbek", isSelected: false),
  ];
}
