import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ishonch/utils/text_style.dart';

class MyTextField extends StatelessWidget {
  const MyTextField({
    Key? key,
    required this.title,
    required this.controller,
    required this.hintText,
    required this.maxLines,
  }) : super(key: key);

  final String title;
  final String hintText;
  final int maxLines;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(width: 20),
            Text(
              title,
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    fontSize: 16.sp,
                  ),
            ),
            Text(
              '*',
              style:
                  fontRobotoW400(appcolor: Colors.red).copyWith(fontSize: 16),
            ),
          ],
        ),
        SizedBox(height: 5.h),
        Padding(
          padding: const EdgeInsets.only(
            left: 16,
            right: 16,
          ),
          child: title == "Address"
              ? TextField(
                  maxLines: maxLines,
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .copyWith(fontSize: 18.sp),
                  cursorColor: Theme.of(context).cardColor,
                  controller: controller,
                  decoration: InputDecoration(
                    hintStyle: TextStyle(color: Theme.of(context).hintColor),
                    filled: true,
                    contentPadding: const EdgeInsets.all(12),
                    fillColor: Theme.of(context).primaryColor,
                    border: const OutlineInputBorder(),
                    enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                      borderSide: BorderSide(width: 2),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                      borderSide: BorderSide(width: 2),
                    ),
                    focusedErrorBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                      borderSide: BorderSide(),
                    ),
                    errorBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                      borderSide: BorderSide(),
                    ),
                  ),
                )
              : TextField(
                  maxLines: maxLines,
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .copyWith(fontSize: 18.sp),
                  cursorColor: Theme.of(context).cardColor,
                  controller: controller,
                  decoration: InputDecoration(
                    hintStyle: TextStyle(color: Theme.of(context).hintColor),
                    filled: true,
                    hintText: hintText,
                    contentPadding: const EdgeInsets.all(12),
                    fillColor: Theme.of(context).primaryColor,
                    border: const OutlineInputBorder(),
                    enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                      borderSide: BorderSide(width: 2),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                      borderSide: BorderSide(width: 2),
                    ),
                    focusedErrorBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                      borderSide: BorderSide(),
                    ),
                    errorBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                      borderSide: BorderSide(),
                    ),
                  ),
                ),
        ),
      ],
    );
  }
}
