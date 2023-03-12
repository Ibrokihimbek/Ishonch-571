import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ishonch/data/models/model_category/categories/product/product_model.dart';
import 'package:ishonch/utils/my_utils.dart';

import '../../../../app_router.dart';
import '../../../../product_by_category/widgets/product_item.dart';
import '../../bloc/bloc_product/product_bloc.dart';
import '../../bloc/bloc_product/product_state.dart';

class ProductsGridWidget extends StatelessWidget {
  const ProductsGridWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsBloc, ProductsState>(
      builder: (context, state) {
        if (state is LoadProductsInProgress) {
          return const SliverToBoxAdapter(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (state is LoadProductsInSuccess) {
          return SliverGrid(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return ProductByCategoryItem(
                  productId: state.products[index].id,
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      RouteName.productDetail,
                      arguments: state.products[index],
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
        return SliverToBoxAdapter(child: const SizedBox());
      },
    );
  }
}
