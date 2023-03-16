import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ishonch/bloc/bloc_product/product_bloc.dart';
import 'package:ishonch/data/repositories/category_repo.dart';
import 'package:ishonch/screens/all_products/widget/all_product_shimmer.dart';
import 'package:ishonch/screens/all_products/widget/all_product_widget.dart';
import '../widgets/global_appbar.dart';

class AllProduct extends StatelessWidget {
  const AllProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ProductsBloc(CategoriesRepo())..add(FetchAllProducts()),
      child: Scaffold(
        appBar: GlobalAppBar(title: "Barcha_produktlar".tr()),
        body: BlocBuilder<ProductsBloc, ProductsState>(
          builder: (context, state) {
            if (state is InitialProductsState) {
              return const Center(child: Text('hali data yoq'));
            } else if (state is LoadProductsInSuccess) {
              return AllProductsScreen(data: state.products);
            } else if (state is LoadProductsInFairlure) {
              return Text(state.errorText);
            } else if (state is LoadProductsInProgress) {
              return const AllProductShimmerWidget();
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
