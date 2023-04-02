import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ishonch/bloc/bloc_category/category_bloc.dart';
import 'package:ishonch/screens/app_router.dart';
import 'package:ishonch/screens/categories/widgets/category_item.dart';
import 'package:ishonch/screens/categories/widgets/category_shimmer.dart';
import 'package:ishonch/screens/widgets/global_appbar.dart';
import 'package:ishonch/utils/my_utils.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class CategoriesInfoPage extends StatefulWidget {
  const CategoriesInfoPage({super.key});

  @override
  State<CategoriesInfoPage> createState() => _CategoriesInfoPageState();
}

class _CategoriesInfoPageState extends State<CategoriesInfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const GlobalAppBar(title: "Kategoriyalar"),
        body: BlocBuilder<CategoriesBloc, CategoriesState>(
          builder: (context, state) {
            if (state is LoadCategoriesInProgress) {
              return const Center(child: CategoryShimmerWidget());
            }
            if (state is LoadCategoriesInSuccess) {
              var data = state.categories;
              return ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: width(context) * 0.06,
                        vertical: height(context) * 0.012),
                    child: ZoomTapAnimation(
                      onTap: () {
                        Navigator.pushNamed(
                            context, RouteName.productByCategory,
                            arguments: data[index]);
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: width(context) * 0.02),
                        height: height(context) * 0.15,
                        width: width(context),
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          border: Border.all(
                              width: 1, color: Theme.of(context).hintColor),
                          borderRadius:
                              BorderRadius.circular(width(context) * 0.04),
                        ),
                        child: CategoryItem(index: index),
                      ),
                    ),
                  );
                },
              );
            }
            return const SizedBox();
          },
        ),);
  }
}
