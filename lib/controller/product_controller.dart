import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shopping_app_sample/model/product_model.dart';

class ProductProvider extends ChangeNotifier {
  List<Product> productList = [];
  bool _isLoading = false;
  int _skip = 0;
  bool _hasMoreData = true;
  String _errorMessage = '';

  String get errorMessage => _errorMessage;
  bool get isLoading => _isLoading;
  bool get hasMoreData => _hasMoreData;

  Future<void> fetchProducts() async {
    if (_isLoading || !_hasMoreData) {
      return;
    }

    _isLoading = true;
    notifyListeners();

    final url =
        Uri.parse('https://dummyjson.com/products?limit=10&skip=$_skip');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      _isLoading = false;
      //productList.clear();
      final bodyAsJson = jsonDecode(response.body) as Map<String, dynamic>;
      if (bodyAsJson.isNotEmpty) {
        final products = bodyAsJson['products'];
        for (var productJson in products) {
          final data = Product.fromJson(productJson);
          productList.add(data);
        }

        _skip = _skip + 10;
      } else {
        _hasMoreData = false;
      }
    } else {
      _errorMessage = 'Oops,Something went wrong';
    }
    notifyListeners();
  }
}
