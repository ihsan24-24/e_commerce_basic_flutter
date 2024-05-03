List<String> categoryList = [];

void addToCategoryList(String category) {
  if (!categoryList.contains(category)) {
    categoryList.add(category);
  }
}
