import 'package:flutter/material.dart';
import 'package:ishonch/utils/app_colors.dart';
import 'package:photo_view/photo_view.dart';

class ImageView extends StatelessWidget {
  final String imageUrl;
  const ImageView({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: PhotoView(
          imageProvider: NetworkImage(imageUrl),
          backgroundDecoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor == Colors.white
                ? AppColors.white
                : AppColors.black,
          ),
        ),
      ),
    );
  }
}
