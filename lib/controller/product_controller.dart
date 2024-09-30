import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shopping_app_sample/model/product_model.dart';

class ProductProvider extends ChangeNotifier {
  List<Product> productList = [];
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String _errorMessage = '';
  String get errorMessage => _errorMessage;

  Future<void> fetchProducts() async {
    _isLoading = true;
    notifyListeners();

    final url = Uri.parse('https://dummyjson.com/products');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      productList.clear();
      final bodyAsJson = jsonDecode(response.body) as Map<String, dynamic>;
      final products = bodyAsJson['products'];
      for (var productJson in products) {
        final data = Product.fromJson(productJson);
        productList.add(data);
      }

      notifyListeners();
    } else {
      _errorMessage = 'Oops,Something went wrong';
    }
  }
}
