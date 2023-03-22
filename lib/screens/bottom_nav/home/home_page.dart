import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ishonch/bloc/bloc_category/category_bloc.dart';
import 'package:ishonch/data/repositories/category_repo.dart';
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
          title: 'Xush_Kelibsiz',
          onTap: widget.onTap,
        ),
        body: BlocBuilder<CategoriesBloc, CategoriesState>(
          builder: (context, state) {
            if (state is InitialCategoriesState) {
              return const HomeScreenShimmerLoader();
            } else if (state is LoadCategoriesInProgress) {
              return const HomeScreenShimmerLoader();
            } else if (state is LoadCategoriesInSuccess) {
              return HomeWidget(data: state.categories);
            } else if (state is LoadCategoriesInFailure) {
              return Center(
                child: Text(
                  state.errorText,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
