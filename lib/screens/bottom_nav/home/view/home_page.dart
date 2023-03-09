import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ishonch/data/repositories/category_repo.dart';
import 'package:ishonch/screens/bottom_nav/home/bloc/bloc_category/category_bloc.dart';
import 'package:ishonch/screens/bottom_nav/home/bloc/bloc_category/category_event.dart';
import 'package:ishonch/screens/bottom_nav/home/bloc/bloc_category/category_state.dart';
import 'package:ishonch/screens/bottom_nav/home/drawer/drawer.dart';
import 'package:ishonch/screens/bottom_nav/home/view/widget/home_widget.dart';
import 'package:ishonch/service/api_service/api_service.dart';
import 'package:ishonch/utils/app_image.dart';
import 'package:ishonch/utils/my_utils.dart';


class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  bool IsNightMode = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          CategoriesBloc(CategoriesRepo(apiService: ApiService()))
            ..add(FetchAllCategories()),
      child: Scaffold(
        drawer: MyDrawer(
          onChanged: (value) {
            setState(() {});
            IsNightMode = !IsNightMode;
          },
          IsNightMode: IsNightMode,
        ),
        key: _key,
        backgroundColor: const Color(0xFFFFFFFF),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: const Color(0xFFFFFFFF),
          leading: Padding(
            padding: EdgeInsets.only(
                left: width(context) * 0.055, top: height(context) * 0.024),
            child: InkWell(
              borderRadius: BorderRadius.circular(25),
              onTap: () => _key.currentState!.openDrawer(),
              child: SvgPicture.asset(
                AppImages.iconMenu,
              ),
            ),
          ),
          actions: [
            Padding(
              padding: EdgeInsets.only(
                  right: width(context) * 0.014, top: height(context) * 0.014),
              child: Container(
                height: height(context) * 0.1,
                width: width(context) * 0.2,
                decoration: const BoxDecoration(
                    color: Color(0xFFDDDDDD), shape: BoxShape.circle),
                child: Image.asset(AppImages.homeImage),
              ),
            )
          ],
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
