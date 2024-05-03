import 'package:flutter/material.dart';

List<String> categoryList = [];
int productId = 0;

void addToCategoryList(String category) {
  if (!categoryList.contains(category)) {
    categoryList.add(category);
  }
}
