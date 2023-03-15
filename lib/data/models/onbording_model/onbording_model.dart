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
      lottieName: AppImages.lottieItem,
      title: 'Sevimli_texnikalaringizni_toping',
    ),
    OnboardingModel(
      lottieName: AppImages.lottiePayment,
      title: "Oson_va_xavfsiz_to'lov",
    ),
    OnboardingModel(
      lottieName: AppImages.lottieDelivery,
      title: 'Yetkazib_berish_xizmatini_taqdim_etishga_tayyormiz',
    ),
  ];
}
