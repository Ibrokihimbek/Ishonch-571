import 'package:ishonch/utils/app_image.dart';

class OnboardingModel {
  String lottieName;
  String title;

  OnboardingModel({
    required this.lottieName,
    required this.title,
  });

  static List<OnboardingModel> onboard = [
    OnboardingModel(
      lottieName: AppImage.lottieItem,
      title: 'Sevimli texnikalaringizni toping',
    ),
    OnboardingModel(
      lottieName: AppImage.lottiePayment,
      title: "Oson va xavfsiz to'lov",
    ),
    OnboardingModel(
      lottieName: AppImage.lottieDelivery,
      title: 'Yetkazib berish xizmatini taqdim etishga tayyormiz',
    ),
  ];
}
