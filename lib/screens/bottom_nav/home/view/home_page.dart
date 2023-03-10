import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ishonch/data/repositories/category_repo.dart';
import 'package:ishonch/screens/bottom_nav/home/bloc/bloc_category/category_bloc.dart';
import 'package:ishonch/screens/bottom_nav/home/bloc/bloc_category/category_event.dart';
import 'package:ishonch/screens/bottom_nav/home/bloc/bloc_category/category_state.dart';
import 'package:ishonch/screens/bottom_nav/home/view/widget/home_screen_appbar.dart';
import 'package:ishonch/screens/drawer/drawer.dart';
import 'package:ishonch/screens/bottom_nav/home/view/widget/home_widget.dart';
import 'package:ishonch/service/api_service/api_service.dart';
import 'package:ishonch/utils/app_image.dart';
import 'package:ishonch/utils/my_utils.dart';

class HomePage extends StatefulWidget {
  VoidCallback onTap;

  HomePage({super.key, required this.onTap});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          CategoriesBloc(CategoriesRepo())
            ..add(FetchAllCategories()),
      child: Scaffold(
        backgroundColor: const Color(0xFFFFFFFF),
        appBar: HomeScreenAppBar(
          title: 'Xush Kelibsiz'.tr(),
          onTap: widget.onTap,
        ),
        body: BlocBuilder<CategoriesBloc, CategoriesState>(
          builder: (context, state) {
            if (state is InitialCategoriesState) {
              return const Center(
                child: Text('hali data yoq'),
              );
            } else if (state is LoadCategoriesInProgress) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is LoadCategoriesInSuccess) {
              return HomeWidget(data: state.categories);
            } else if (state is LoadCategoriesInFairlure) {
              return Text(state.errorText);
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
