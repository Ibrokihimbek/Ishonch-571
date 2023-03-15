import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ishonch/bloc/bloc_category/category_bloc.dart';
import 'package:ishonch/utils/my_utils.dart';
import 'category_shimmer.dart';

class CategoryItem extends StatelessWidget {
  CategoryItem({Key? key, required this.index}) : super(key: key);

  int index;
  bool isTrue = false;

  @override
  Widget build(BuildContext context) {
    index % 2 == 0 ? isTrue = false : isTrue = true;
    return BlocBuilder<CategoriesBloc, CategoriesState>(
      builder: (context, state) {
        if (state is LoadCategoriesInSuccess) {
          var data = state.categories;
          return CachedNetworkImage(
            imageUrl: 'http://146.190.207.16:3000/${data[index].categoryImage}',
            imageBuilder: (context, imageProvider) => Container(
              height: height(context) * 0.15,
              width: width(context) * 0.54,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                  image: DecorationImage(
                      colorFilter: const ColorFilter.mode(
                          Color(0XFFF2F2F2), BlendMode.darken),
                      alignment:
                          isTrue ? Alignment.centerLeft : Alignment.centerRight,
                      image: imageProvider)),
              child: Column(
                crossAxisAlignment:
                    isTrue ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: height(context) * 0.038,
                  ),
                  Text(
                    data[index].categoryName,
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(fontSize: 18,),
                  ),
                  SizedBox(
                    height: height(context) * 0.003,
                  ),
                  Text(
                    '${data[index].product.length} Produkt'.tr(),
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  )
                ],
              ),
            ),
          );
        }
        if (state is LoadCategoriesInProgress) {
          return const Center(
            child: CategoryShimmerWidget(),
          );
        }
        return const SizedBox();
      },
    );
  }
}
