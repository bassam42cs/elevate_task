import 'package:dio/dio.dart';

class ProductRepository {
  final Dio _dio = Dio();

  Future<List<dynamic>> fetchProducts() async {
    final response = await _dio.get('https://fakestoreapi.com/products');
    return response.data;
  }
}
