import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
Future<void> MySnackBar(context,
    {required String notification,
    required Color color,
    required Icon icon,
    Color texColor = Colors.white}) {
  return AnimatedSnackBar(
          builder: ((context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(1),
              decoration: BoxDecoration(
                  color: color, borderRadius: BorderRadius.circular(12)),
              child: Row(
                children: [
                  const SizedBox(
                    width: 6,
                  ),
                  icon,
                  const SizedBox(
                    width: 20,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.65,
                    child: Text(
                      notification,
                      maxLines: 5,
                      style: TextStyle(color: texColor),
                    ),
                  )
                ],
              ),
            );
          }),
          duration: const Duration(seconds: 5),
          snackBarStrategy: const ColumnSnackBarStrategy())
      .show(context);
}
