import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:elevate_task/cubit/product_cubit.dart';
import 'package:elevate_task/cubit/product_state.dart';
import 'package:elevate_task/repository/product_repository.dart';

import 'UI/productListScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productRepository = ProductRepository();
    final productCubit = ProductCubit(productRepository);

    return MaterialApp(
      home: BlocProvider(
        create: (_) => productCubit..fetchProducts(),
        child: ProductListScreen(),
      ),
    );
  }
}
