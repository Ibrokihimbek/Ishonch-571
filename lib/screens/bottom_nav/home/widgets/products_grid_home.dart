import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ishonch/bloc/bloc_product/product_bloc.dart';
import 'package:ishonch/screens/app_router.dart';
import 'package:ishonch/screens/product_by_category/widgets/product_item.dart';

class ProductsGridWidget extends StatelessWidget {
  const ProductsGridWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsBloc, ProductsState>(
      builder: (context, state) {
        if (state is LoadProductsInSuccess) {
          return SliverGrid(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return ProductByCategoryItem(
                  productId: state.products[index].id,
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      RouteName.productDetail,
                      arguments: state.products[index].id,
                    );
                  },
                );
              },
              childCount: state.products.length,
            ),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.75,
              mainAxisSpacing: 5,
              crossAxisSpacing: 5,
            ),
          );
        } else if (state is LoadProductsInFairlure) {
          return SliverToBoxAdapter(
              child: Center(child: Text(state.errorText)));
        }
        return const SliverToBoxAdapter(child: SizedBox());
      },
    );
  }
}
