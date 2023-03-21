import 'package:device_info_plus/device_info_plus.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ishonch/bloc/orders_bloc/orders_bloc.dart';
import 'package:ishonch/cubit/mapping/map_cubit.dart';
import 'package:ishonch/cubit/order_create/order_create_cubit.dart';
import 'package:ishonch/data/models/create_order_dto/create_order_dto.dart';
import 'package:ishonch/data/models/helper/lat_long_model.dart';
import 'package:ishonch/screens/app_router.dart';
import 'package:ishonch/screens/check_out/widgets/my_text_field.dart';
import 'package:ishonch/screens/check_out/widgets/phone_input_component.dart';
import 'package:ishonch/screens/widgets/dialog_widget.dart';
import 'package:ishonch/screens/widgets/global_appbar.dart';
import 'package:ishonch/screens/widgets/global_button.dart';
import 'package:ishonch/utils/app_image.dart';
import 'package:lottie/lottie.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import '../../bloc/orders_bloc/orders_event.dart';
import '../../utils/my_utils.dart';

class CheckOutScreen extends StatefulWidget {
  const CheckOutScreen({
    Key? key,
    required this.latLong,
    required this.productId,
  }) : super(key: key);

  final LatLongModel latLong;
  final int productId;

  @override
  State<CheckOutScreen> createState() => _CheckOutScreenState();
}

TextEditingController? _fullNameController;
TextEditingController? _addressController;
TextEditingController? _phoneController;
MaskTextInputFormatter? phoneMaskInputFormatter;
final FocusNode cardFocusNode = FocusNode();

String phoneNumber = '';

class _CheckOutScreenState extends State<CheckOutScreen> {
  @override
  void initState() {
    _fullNameController = TextEditingController();
    _addressController = TextEditingController();
    _phoneController = TextEditingController();
    phoneMaskInputFormatter = MaskTextInputFormatter(
      mask: '### ## ### ## ##',
      filter: {
        '#': RegExp(r'[0-9]'),
      },
    );
    _phoneController?.text = phoneMaskInputFormatter?.maskText('') ?? "";
    super.initState();
  }

  @override
  void dispose() {
    _fullNameController?.dispose();
    _addressController?.dispose();
    _phoneController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MapCubit, MapState>(
      builder: (context, state) {
        _addressController!.text = state.currentAddress;
        return Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: GlobalAppBar(title: 'tekshirish'.tr()),
          body: Column(
            children: [
              SizedBox(height: 10.h),
              MyTextField(
                title: "ism".tr(),
                maxLines: 1,
                controller: _fullNameController!,
                hintText: "ismingizni_kiriting".tr(),
              ),
              SizedBox(height: 30.h),
              MyTextField(
                maxLines: 4,
                title: "manzil".tr(),
                controller: _addressController!,
                hintText: "manzilingizni_kiriting".tr(),
              ),
              SizedBox(height: 20.h),
              GlobalButton(
                isActive: true,
                buttonText: "xaritadan_tanlang".tr(),
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    RouteName.map,
                    arguments: LatLongModel(
                      lat: widget.latLong.lat,
                      long: widget.latLong.long,
                    ),
                  );
                },
              ),
              SizedBox(height: 30.h),
              PhoneInputComponent(
                onChanged: (String v) {
                  phoneNumber = v;
                },
                initialValue: '',
              ),
              SizedBox(height: 30.h),
              const Spacer(),
              BlocListener<OrderCreateCubit, OrderCreateState>(
                listener: (context, state) {
                  if (state is OrderCreateLoading) {}
                  if (state is OrderCreateSuccess) {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      RouteName.bottomNavigation,
                      (route) => false,
                    );
                    BlocProvider.of<OrdersBloc>(context).add(FetchAllOrders());
                  }
                },
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 16.w,
                    right: 16.w,
                    bottom: 20.h,
                    top: 20.h,
                  ).w,
                  child: GlobalButton(
                    isActive: true,
                    buttonText: "sotib_olish".tr(),
                    onTap: () async {
                      DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
                      AndroidDeviceInfo androidInfo =
                          await deviceInfo.androidInfo;
                      debugPrint('DEVICE MODEL ${androidInfo.model}');
                      // ignore: use_build_context_synchronously
                      if (_fullNameController!.text.length >= 3) {
                        if (_addressController!.text.length >= 5) {
                          if (phoneNumber.length == 17) {
                            // ignore: use_build_context_synchronously
                            context.read<OrderCreateCubit>().createOrder(
                                  CreateOrderDto(
                                    productId: widget.productId,
                                    clientName: _fullNameController!.text,
                                    clientAddress:
                                        "${state.latLongModel.lat}/${state.latLongModel.long}",
                                    clientPhone: phoneNumber,
                                    deviceId: androidInfo.id,
                                  ),
                                );
                            // ignore: use_build_context_synchronously
                            showDialog(
                                barrierDismissible: false,
                                builder: (context) => LoadingDialog(
                                      widget:
                                          Lottie.asset(AppImages.lottiePayment),
                                    ),
                                context: context);
                          } else {
                            // ignore: use_build_context_synchronously
                            return showInfoSnackBar(
                              context,
                              "telefon_raqamingizni_kiriting".tr(),
                            );
                          }
                        } else {
                          // ignore: use_build_context_synchronously
                          return showInfoSnackBar(
                            context,
                            "manzilingizni_kiriting".tr(),
                          );
                        }
                      } else {
                        // ignore: use_build_context_synchronously
                        return showInfoSnackBar(
                          context,
                          "ismingizni_kiriting".tr(),
                        );
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
