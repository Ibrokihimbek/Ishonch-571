import 'package:ishonch/utils/app_image.dart';

class OnBoardingModel {
  String lottieName;
  String title;

  OnBoardingModel({
    required this.lottieName,
    required this.title,
  });

  static List<OnBoardingModel> onboard = [
    OnBoardingModel(
      lottieName: AppImages.lottieItem,
      title: 'Sevimli_texnikalaringizni_toping',
    ),
    OnBoardingModel(
      lottieName: AppImages.lottiePayment,
      title: "Oson_va_xavfsiz_to'lov",
    ),
    OnBoardingModel(
      lottieName: AppImages.lottieDelivery,
      title: 'Yetkazib_berish_xizmatini_taqdim_etishga_tayyormiz',
    ),
  ];
}
