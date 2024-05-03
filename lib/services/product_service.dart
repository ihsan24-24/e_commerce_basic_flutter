import 'dart:convert';

import 'package:demo/models/product.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

String url = "https://fakestoreapi.com/products";

Future<List<Product>> fetchProducts () async {
  final response = await http.get(Uri.parse(url));
  if (response.statusCode == 200){
    final data = json.decode(response.body) as List<dynamic>;
    return data.map((pro) =>  Product.fromJson(pro)).toList();
  } else {
    throw Exception("data fetch error");
  }
}