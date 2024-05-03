import 'package:demo/services/product_detail_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProductDetail extends StatelessWidget {
  final int id;
  const ProductDetail({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
          child: FutureBuilder(
              future: fetchProductDetail(id),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Text(
                      "veri çekerken bir hata oluştu...${snapshot.error}");
                } else if (snapshot.hasData) {
                  final product = snapshot.data!;
                  return Padding(
  padding: const EdgeInsets.all(8.0),
  child: Container(
    height: MediaQuery.of(context).size.width,
    decoration: BoxDecoration(
      border: Border.all(
        color: Colors.grey,
        style: BorderStyle.solid,
      ),
      borderRadius: BorderRadius.all(Radius.circular(20)),
    ),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                child: Image.network(product.image),
              ),
            ),
          ),
          Flexible(
            flex: 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  product.title,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(product.category),
                Text(product.description),
               
                Text(
                  product.price.toString(),
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(product.rating.rate.toString()),
                Text(product.rating.count.toString()),
              ],
            ),
          ),
        ],
      ),
    ),
  ),
);

                } else {
                  return CircularProgressIndicator();
                }
              })
              ),
    );
  }
}
