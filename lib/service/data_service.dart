import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/product.dart';

class DataService {
  final String kBaseUrl = "http://127.0.0.1:3000/api/product/";

   Future<dynamic> get() async {

    final response = await http.get(Uri.parse(kBaseUrl));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load data');
    }
    //  if (response.statusCode == 200) {
    //    final obj = jsonDecode(response.body);
    //    log('${obj['product'][0]['name']}');
    //    List<Product> products = [];
    //  }

    // if (kDebugMode) {
    //   print(response.body);
    // }
    //
    // final json = jsonDecode(response.body);
    // return Product.fromJson(json);
  }

  Future<dynamic> post(Map<String, dynamic> data) async {
     final response = await http.post(Uri.parse(kBaseUrl),
         headers: <String, String> {
     'Content-Type': 'application/json; charset=UTF-8',
     },
         body: jsonEncode(data),
     );

     if (response.statusCode == 201) {
       return json.decode(response.body);
     } else {
       throw Exception('Failed to post data');
     }
  }
}