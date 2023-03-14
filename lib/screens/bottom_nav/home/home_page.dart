import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ishonch/data/repositories/category_repo.dart';
import 'package:ishonch/screens/bottom_nav/home/bloc/bloc_category/category_bloc.dart';
import 'package:ishonch/screens/bottom_nav/home/bloc/bloc_category/category_event.dart';
import 'package:ishonch/screens/bottom_nav/home/bloc/bloc_category/category_state.dart';
import 'package:ishonch/screens/bottom_nav/home/widgets/home_screen_appbar.dart';
import 'package:ishonch/screens/bottom_nav/home/widgets/home_widget.dart';
import 'package:ishonch/screens/bottom_nav/home/widgets/home_screen_shimmer_loader.dart';

class HomePage extends StatefulWidget {
  final VoidCallback onTap;

  const HomePage({super.key, required this.onTap});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          CategoriesBloc(CategoriesRepo())..add(FetchAllCategories()),
      child: Scaffold(
        appBar: HomeScreenAppBar(
          title: 'Xush Kelibsiz'.tr(),
          onTap: widget.onTap,
        ),
        body: BlocBuilder<CategoriesBloc, CategoriesState>(
          builder: (context, state) {
            if (state is InitialCategoriesState) {
              return HomeScreenShimmerLoader();
            } else if (state is LoadCategoriesInProgress) {
              return HomeScreenShimmerLoader();
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
