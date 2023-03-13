import 'package:flutter/material.dart';

class LoadingDialog extends StatelessWidget {
  final Widget widget;

  const LoadingDialog({required this.widget, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20))),
      content: Builder(
        builder: (context) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 200,
                height: 200,
                child: widget,
              ),
              const CircularProgressIndicator(
                color: Colors.black,
              ),
            ],
          );
        },
      ),
    );
  }
}
