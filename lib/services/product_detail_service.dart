import 'dart:convert';

import 'package:demo/global_variables.dart';
import 'package:demo/models/product.dart';
import 'package:http/http.dart' as http;

Future<Product> fetchProductDetail (int id) async {
  
  final String url = "https://fakestoreapi.com/products/${id}";
  final response = await http.get(Uri.parse(url));
  if (response.statusCode == 200){
  final data = json.decode(response.body);
  return Product.fromJson(data);
  } else {
    throw Exception("Veri çekilirken hata oluştu.");
  }
} 