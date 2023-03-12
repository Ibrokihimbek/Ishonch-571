import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ishonch/bloc/orders_bloc/orders_bloc.dart';
import 'package:ishonch/cubit/mapping/map_cubit.dart';
import 'package:ishonch/cubit/order_create/order_create_cubit.dart';
import 'package:ishonch/data/models/create_order_dto/create_order_dto.dart';
import 'package:ishonch/data/models/helper/lat_long_model.dart';
import 'package:ishonch/screens/app_router.dart';
import 'package:ishonch/screens/product_detail/sub_screens/check_out/widgets/my_text_field.dart';
import 'package:ishonch/screens/product_detail/sub_screens/check_out/widgets/phone_input_component.dart';
import 'package:ishonch/screens/product_detail/sub_screens/check_out/widgets/succes_dialog_widget.dart';
import 'package:ishonch/screens/widgets/animated_snackbar.dart';
import 'package:ishonch/screens/widgets/global_appbar.dart';
import 'package:ishonch/screens/widgets/global_button.dart';
import 'package:ishonch/utils/app_colors.dart';
import 'package:ishonch/utils/app_image.dart';
import 'package:ishonch/utils/my_utils.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import '../../../../bloc/orders_bloc/orders_event.dart';

class CheckOutScreen extends StatefulWidget {
  const CheckOutScreen({Key? key, required this.latLong}) : super(key: key);

  final LatLongModel latLong;

  @override
  State<CheckOutScreen> createState() => _CheckOutScreenState();
}

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
late TextEditingController _fullNameController;
late TextEditingController _addressController;
late TextEditingController _phoneController;
late MaskTextInputFormatter phoneMaskInputFormatter;
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
    _phoneController.text = phoneMaskInputFormatter.maskText('');
    super.initState();
  }

  @override
  void dispose() {
    _fullNameController.dispose();
    _addressController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MapCubit, MapState>(
      builder: (context, state) {
        _addressController.text = state.currentAddress;
        return Scaffold(
          backgroundColor: AppColors.white,
          appBar: const GlobalAppBar(title: "Checkout"),
          body: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(height: 10.h),
                  MyTextField(
                    title: "Name",
                    maxLines: 1,
                    controller: _fullNameController,
                    hintText: "Enter your name",
                  ),
                  SizedBox(height: 30.h),
                  MyTextField(
                    maxLines: 4,
                    title: "Address",
                    controller: _addressController,
                    hintText: "Enter your address",
                  ),
                  SizedBox(height: 20.h),
                  GlobalButton(
                    isActive: true,
                    buttonText: "Select on Map  🗺",
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
                ],
              ),
            ),
          ),
          bottomNavigationBar: BlocListener<OrderCreateCubit, OrderCreateState>(
            listener: (context, state) {
              if (state is OrderCreateLoading) {
                showInfoSnackBar(context, "Loading...");
              }
              if (state is OrderCreateSuccess) {
                showInfoSnackBar(context, "Order Added");
                BlocProvider.of<OrdersBloc>(context).add(FetchAllOrders());
              }
            },
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 16, right: 16, bottom: 20, top: 20),
              child: GlobalButton(
                isActive: true,
                buttonText: "Purchase",
                onTap: () async {
                  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
                  AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
                  debugPrint('DEVICE MODEL ${androidInfo.model}');
                  // ignore: use_build_context_synchronously
                  if (_fullNameController.text.length >= 3) {
                    if (_addressController.text.length >= 5) {
                      if (phoneNumber.length == 17) {
                        return context.read<OrderCreateCubit>().createOrder(
                              CreateOrderDto(
                                productId: widget.latLong.productId!,
                                clientName: _fullNameController.text,
                                clientAddress:
                                    "${state.latLongModel.lat}/${state.latLongModel.long}",
                                clientPhone: phoneNumber,
                                deviceId: androidInfo.model,
                              ),
                            );
                      }
                      else {
                         return MySnackBar(
                          context,
                          notification: "Telefon raqamingizni kiriting kiriting.",
                          color: Colors.red,
                          icon: const Icon(
                            Icons.error,
                            color: Colors.white,
                          ),
                        );
                      }
                    }
                    else {
                      return MySnackBar(
                        context,
                        notification: "Adresingizni kiriting.",
                        color: Colors.red,
                        icon: const Icon(
                          Icons.error,
                          color: Colors.white,
                        ),
                      );
                    }
                  }
                  else {
                    return MySnackBar(
                      context,
                      notification: "Ismingizni kiriting.",
                      color: Colors.red,
                      icon: const Icon(
                        Icons.error,
                        color: Colors.white,
                      ),
                    );
                  }
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
