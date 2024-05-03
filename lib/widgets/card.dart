import 'package:demo/global_variables.dart';
import 'package:demo/models/product.dart';
import 'package:demo/pages/product_detail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProductCard extends StatefulWidget {
  
  final Product product;

  const ProductCard({super.key, required this.product});

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    double _width = 300;
    double _height = 300;
    double _imgHeight = 2;

    if (MediaQuery.of(context).size.width < 500){
      setState(() {
        _width = 150;
        _imgHeight =3 ;
      });
    } else if(MediaQuery.of(context).size.width < 940 && MediaQuery.of(context).size.width >= 500){
      setState(() {
        _width = 225;
        _imgHeight = 2.5;
      });
    }
    return SizedBox(
      height: _height,
      width: _width,
      child: GestureDetector(
         onTap: () {
               Navigator.push(context, 
               MaterialPageRoute(builder: (context) => ProductDetail(id: widget.product.id)) 
               );
      
              },
        child: Card(  
          child:Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    widget.product.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                SizedBox(
                  width: _width / 1.4,
                  height: _height / _imgHeight,
                  child: Image.network(widget.product.image, 
                  fit: BoxFit.fill, 
                  
                              
                  ),
                ),
                Expanded(child: Text(widget.product.category)),
                Text(
                  widget.product.description,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  ),
                   SizedBox(height: 10,),
                Expanded(child: Text(widget.product.price.toString())),
                
                Expanded(child: Text(widget.product.rating.rate.toString())),
                // Expanded(child: Text(product.rating.count.toString()))
              ],
              ),
          )
          ),
      ),
    );
  }
}