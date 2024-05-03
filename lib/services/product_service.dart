import 'dart:convert';

import 'package:demo/global_variables.dart';
import 'package:demo/models/product.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

String url = "https://fakestoreapi.com/products";

Future<List<Product>> fetchProducts () async {
  final response = await http.get(Uri.parse(url));
  if (response.statusCode == 200){
    final data = json.decode(response.body) as List<dynamic>;
    // return data.map((pro) =>  Product.fromJson(pro)).toList();
  List<Product> products = data.map((productData) {
  final product = Product.fromJson(productData);
  addToCategoryList(productData["category"]);
  return product;
}).toList();
return products;

  } else {
    throw Exception("data fetch error");
  }
}