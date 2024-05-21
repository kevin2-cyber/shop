import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:shop/model/product.dart';
class DataService {

  static Future<Product> getProducts() async {
    final uri = Uri.http('http://localhost:9080','/v1/products');

    final response = await http.get(uri);

    if (kDebugMode) {
      print(response.body);
    }

    final json = jsonDecode(response.body);
    return Product.fromJson(json);
  }
}