import 'package:elevate_task/UI/productCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:elevate_task/cubit/product_cubit.dart';
import 'package:elevate_task/cubit/product_state.dart';
import 'package:elevate_task/repository/product_repository.dart';
class ProductListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Product List')),
      body: BlocBuilder<ProductCubit, ProductState>(
        builder: (context, state) {
          if (state is ProductLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is ProductLoaded) {
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // يعرض عنصرين في كل صف
                childAspectRatio: 0.75, // نسبة العرض إلى الارتفاع للعناصر
              ),
              itemCount: state.products.length,
              itemBuilder: (context, index) {
                final product = state.products[index];
                return  ProductCard(product: product);
              },
            );
          } else if (state is ProductError) {
            return Center(child: Text(state.message));
          }
          return Container();
        },
      ),
    );
  }
}
