import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class DataService {



   Future<dynamic> get() async {

    await dotenv.load(fileName: 'assets/.env');
     String kBaseUrl = dotenv.get('ENDPOINT');
    final response = await http.get(Uri.parse('$kBaseUrl/api/product/'));

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
    await dotenv.load(fileName: 'assets/.env');
    String kBaseUrl = dotenv.get('ENDPOINT');
     final response = await http.post(Uri.parse('$kBaseUrl/api/product/'),
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