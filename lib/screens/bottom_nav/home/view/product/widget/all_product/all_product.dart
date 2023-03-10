import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ishonch/data/repositories/category_repo.dart';
import 'package:ishonch/screens/bottom_nav/home/bloc/bloc_product/producat_event.dart';
import 'package:ishonch/screens/bottom_nav/home/bloc/bloc_product/product_bloc.dart';
import 'package:ishonch/screens/bottom_nav/home/bloc/bloc_product/product_state.dart';
import 'package:ishonch/screens/bottom_nav/home/view/product/widget/all_product/widget/all_product_widget.dart';
import 'package:ishonch/service/api_service/api_service.dart';

class AllProduct extends StatelessWidget {
  const AllProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider( create: (context) => ProductsBloc(CategoriesRepo())..add(FetchAllProducts()),
      child: Scaffold(
        backgroundColor: const Color(0xFFFFFFFF),
        appBar: AppBar(
          leading: IconButton(onPressed: () {
           Navigator.pop(context);
          }, icon: const Icon(Icons.arrow_back,color: Colors.black,)),
         elevation: 0,
        backgroundColor: const Color(0xFFFFFFFF),
          title: const Text('All Product',style: TextStyle(color: Colors.black),),),
        body: BlocBuilder<ProductsBloc, ProductsState>(
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
                return AllProductwidget(data: state.products);
              } else if (state is LoadProductsInFairlure) {
                return Text(state.errorText);
              }
              return const SizedBox();
            }, 
          ),
      ),
    );
  }
}