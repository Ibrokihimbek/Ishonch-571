import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ishonch/data/repositories/category_repo.dart';
import 'package:ishonch/screens/bottom_nav/home/bloc/bloc_product/producat_event.dart';
import 'package:ishonch/screens/bottom_nav/home/bloc/bloc_product/product_bloc.dart';
import 'package:ishonch/screens/bottom_nav/home/bloc/bloc_product/product_state.dart';
import 'package:ishonch/screens/bottom_nav/home/view/product/widget/product_widget.dart';
import 'package:ishonch/service/api_service/api_service.dart';

class ArrivalWidget extends StatefulWidget {
  const ArrivalWidget({super.key});

  @override
  State<ArrivalWidget> createState() => _ArrivalWidgetState();
}

class _ArrivalWidgetState extends State<ArrivalWidget> {
bool favoriteTrue = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider( create: (context) => ProductsBloc(CategoriesRepo())..add(FetchAllProducts()),
      child: BlocBuilder<ProductsBloc, ProductsState>(
          builder: (context, state) {
            if (state is InitialProductsState) {
              return const Center(
                child: Text('hali data yoq'),
              );
            } else if (state is LoadProductsInProgress) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is LoadProductsInSuccess) {
              return ProductWidget(data: state.products);
            } else if (state is LoadProductsInFairlure) {
              return Text(state.errorText);
            }
            return const SizedBox();
          }, 
        ),
    );
  }
}



