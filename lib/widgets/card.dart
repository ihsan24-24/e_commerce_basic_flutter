import 'package:demo/models/product.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  
  final Product product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Card(  
        child:Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                product.title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Image.network(product.image, 
              fit: BoxFit.fill, 
              width: MediaQuery.of(context).size.width / 8,
              height: MediaQuery.of(context).size.height / 10,
          
              ),
              Text(product.category),
              Wrap(
                children: [Text(
                  product.description,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  ),
                ]
              ),
              Text(product.price.toString()),
              Text(product.rating.rate.toString()),
              Text(product.rating.count.toString())
            ],
            ),
        )
        ),
    );
  }
}