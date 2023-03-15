import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class CategoriesAppBar extends StatelessWidget implements PreferredSize {
  const CategoriesAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(
          Icons.arrow_back,
          color: Colors.black,
        ),
      ),
      elevation: 0,
      backgroundColor: const Color(0xFFFFFFFF),
      title: Text(
        'Kategoriyalar'.tr(),
        style: const TextStyle(color: Colors.black),
      ),
    );
  }

  @override
  Widget get child => throw UnimplementedError();

  @override
  Size get preferredSize => const Size(double.infinity, 56);
}
