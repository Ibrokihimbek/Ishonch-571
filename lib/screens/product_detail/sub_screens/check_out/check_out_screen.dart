import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ishonch/data/models/helper/lat_long_model.dart';
import 'package:ishonch/screens/app_router.dart';
import 'package:ishonch/screens/product_detail/sub_screens/check_out/widgets/my_text_field.dart';
import 'package:ishonch/screens/product_detail/sub_screens/check_out/widgets/phone_input_component.dart';
import 'package:ishonch/screens/product_detail/sub_screens/map/map_screen.dart';
import 'package:ishonch/utils/app_colors.dart';
import 'package:ishonch/utils/text_style.dart';
import 'package:location/location.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class CheckOutScreen extends StatefulWidget {
  const CheckOutScreen({Key? key}) : super(key: key);

  @override
  State<CheckOutScreen> createState() => _CheckOutScreenState();
}

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
int selectAge = 5;
final TextEditingController _fullNameController = TextEditingController();
final TextEditingController _addressController = TextEditingController();
final TextEditingController _phoneController = TextEditingController();
late MaskTextInputFormatter phoneMaskInputFormatter;
final FocusNode cardFocusNode = FocusNode();

String dropdownValue = 'Gender';
String phoneNumber = '';

class _CheckOutScreenState extends State<CheckOutScreen> {
  getLocationPermission() async {
    Location location = Location();

    bool serviceEnabled;
    PermissionStatus permissionGranted;
    LocationData locationData;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    locationData = await location.getLocation();
    if (locationData.latitude != null) {
      if (!mounted) return;
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MapScreen(
            latLong: LatLongModel(
              lat: locationData.latitude ?? 0.0,
              long: locationData.longitude ?? 0.0,
            ),
          ),
        ),
      );
    }
    print("LONGITUDE:${locationData.longitude} AND ${locationData.latitude}");
  }

  @override
  void initState() {
    super.initState();
    phoneMaskInputFormatter = MaskTextInputFormatter(
      mask: '### ## ### ## ##',
      filter: {
        '#': RegExp(r'[0-9]'),
      },
    );
    _phoneController.text = phoneMaskInputFormatter.maskText('');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.white,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              size: 30,
              color: AppColors.black,
            )),
        centerTitle: true,
        title: Text("Checkout",
            style: fontRobotoW700(appcolor: AppColors.black)
                .copyWith(fontSize: 18.sp)),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            MyTextField(
              title: "Name",
              controller: _fullNameController,
              hintText: "Enter your name",
            ),
            SizedBox(
              height: 30.h,
            ),
            MyTextField(
              title: "Address",
              controller: _addressController,
              hintText: "Enter your address",
            ),
            SizedBox(
              height: 30.h,
            ),
            PhoneInputComponent(
              onChanged: (String v) {
                phoneNumber = "+998${v.removeWhitespace().removeTire()}";
              },
              initialValue: '',
            ),
            SizedBox(
              height: 30.h,
            ),
            Center(
              child: ElevatedButton(
                  onPressed: () async {
                    // getLocationPermission();


                    if(await Location().serviceEnabled()){
                      // ignore: use_build_context_synchronously
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MapScreen(
                            latLong: LatLongModel(
                              lat: 41.2858473,
                              long: 69.2030878,
                            ),
                          ),
                        ),
                      );

                    }else{
                      Location().getLocation();
                    }


                  },
                  child: Text("Map")),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        padding:
            EdgeInsets.only(bottom: 30.h, left: 24.w, right: 24.w, top: 15).w,
        child: ZoomTapAnimation(
          onTap: () {
            // Navigator.pushNamed(context, RouteName.);
          },
          child: Container(
            height: 50.h,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30).r,
              color: Colors.black87,
            ),
            child: Center(
              child: Text(
                "Purchase",
                style: TextStyle(
                  fontSize: 18.0.sp,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

extension StringExtensions on String {
  String removeWhitespace() {
    return replaceAll(' ', '');
  }

  String removeTire() {
    return replaceAll('-', '');
  }
}
