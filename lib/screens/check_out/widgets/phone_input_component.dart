import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ishonch/utils/text_style.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:easy_localization/easy_localization.dart';

class PhoneInputComponent extends StatefulWidget {
  const PhoneInputComponent({
    Key? key,
    required this.onChanged,
    required this.initialValue,
  }) : super(key: key);

  final ValueChanged<String> onChanged;
  final String initialValue;

  @override
  State<PhoneInputComponent> createState() => _PhoneInputComponentState();
}

class _PhoneInputComponentState extends State<PhoneInputComponent> {
  late MaskTextInputFormatter phoneMaskFormatter;
  final FocusNode phoneFocusNode = FocusNode();
  final TextEditingController controller = TextEditingController();
  String shadowText = "90 123-45-67";

  String updateShadowText(String currentText) {
    shadowText = "90 123-45-67";
    shadowText = shadowText.substring(currentText.length, shadowText.length);
    return currentText + shadowText;
  }

  @override
  void initState() {
    phoneMaskFormatter = MaskTextInputFormatter(
      mask: '+998 ## ###-##-##',
      filter: {
        "#": RegExp(r"[0-9]"),
      },
    );
    controller.text = phoneMaskFormatter.maskText(widget.initialValue);
    updateShadowText(widget.initialValue);
    super.initState();
  }

  @override
  void dispose() {
    phoneFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(width: 20.w),
            Text(
              'telefon_raqami'.tr(),
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    fontSize: 16.sp,
                  ),
            ),
            Text(
              '*',
              style: fontRobotoW400(appcolor: Colors.red)
                  .copyWith(fontSize: 16.sp),
            ),
          ],
        ),
        SizedBox(height: 5.h),
        Padding(
          padding: EdgeInsets.only(left: 16.w, right: 16.w).w,
          child: Material(
            borderRadius: BorderRadius.circular(30.r).r,
            shadowColor: Colors.blue.withOpacity(0.12),
            elevation: 25,
            child: TextField(
              cursorColor: Theme.of(context).cardColor,
              controller: controller,
              inputFormatters: [phoneMaskFormatter],
              keyboardType: const TextInputType.numberWithOptions(
                  signed: false, decimal: true),
              focusNode: phoneFocusNode,
              onChanged: (String value) {
                setState(() {
                  if (value.length == 12) {
                    phoneFocusNode.unfocus();
                  }
                  widget.onChanged.call(value);
                });
              },
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(fontSize: 18.sp),
              decoration: InputDecoration(
                hintText: "90 123-45-67",
                contentPadding: EdgeInsets.only(left: 20.w).w,
                hintStyle: TextStyle(color: Theme.of(context).hintColor),
                filled: true,
                fillColor: Theme.of(context).primaryColor,
                border: const OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30.r).r),
                  borderSide: BorderSide(width: 2.w),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30.r).r),
                  borderSide: BorderSide(width: 2.w),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(100.r).r),
                  borderSide: BorderSide(width: 2.w),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(100.r).r),
                  borderSide: BorderSide(width: 2.w),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
