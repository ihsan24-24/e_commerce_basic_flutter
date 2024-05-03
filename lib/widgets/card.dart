import 'package:demo/models/product.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  
  final Product product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 7,
      height: MediaQuery.of(context).size.height / 3,
      child: Card(  
        child:Column(
          children: [
            Text(product.title),
            Image.network(product.image, 
            fit: BoxFit.fill, 
            width: MediaQuery.of(context).size.width / 8,
            height: MediaQuery.of(context).size.height / 10,

            ),
            Text(product.category),
            Text(product.description),
            Text(product.price.toString()),
            Text(product.rating.rate.toString()),
            Text(product.rating.count.toString())


          ],
          )
        ),
    );
  }
}