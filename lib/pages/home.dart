import 'package:demo/services/products_service.dart';
import 'package:demo/widgets/card.dart';
import 'package:demo/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    int _crossAxisCount = 1;

    if (MediaQuery.of(context).size.width >= 1800) {
      setState(() {
        _crossAxisCount = 7;
      });
    } else if (1800 > MediaQuery.of(context).size.width &&
        MediaQuery.of(context).size.width > 1501) {
      setState(() {
        _crossAxisCount = 6;
      });
    } else if (1500 >= MediaQuery.of(context).size.width &&
        MediaQuery.of(context).size.width > 1201) {
      setState(() {
        _crossAxisCount = 5;
      });
    } else if (1200 >= MediaQuery.of(context).size.width &&
        MediaQuery.of(context).size.width > 901) {
      setState(() {
        _crossAxisCount = 4;
      });
    } else if (900 >= MediaQuery.of(context).size.width &&
        MediaQuery.of(context).size.width > 601) {
      setState(() {
        _crossAxisCount = 3;
      });
    } else if (600 >= MediaQuery.of(context).size.width &&
        MediaQuery.of(context).size.width > 301) {
      setState(() {
        _crossAxisCount = 2;
      });
    } else {
      setState(() {
        _crossAxisCount = 1;
      });
    }

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Center(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: FutureBuilder(
              future: fetchProducts(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Text(
                      "veri çekerken bir hata oluştu...${snapshot.error}");
                } else if (snapshot.hasData) {
                  final products = snapshot.data!;
                    
                  return Wrap(
                spacing: 8.0, // Ürünler arasındaki boşluk
                runSpacing: 8.0, // Satırlar arasındaki boşluk
                children: products.map((product) {
                  return ProductCard(product: product);
                }).toList(),
              );
          //                       SliverList(
          //   delegate: SliverChildBuilderDelegate(
          //     (context, index) {
          //       return ProductCard(product: products[index]);
          //     },
          //     childCount: products.length,
          //   ),
          // // );
          //                       ListView.builder(
          //                         shrinkWrap: true,
          //                         itemCount: products.length, // Satır sayısı
          //                         itemBuilder: (context, rowIndex) {
          //                           return ProductCard(product: products[rowIndex]);
          //                         },
          //                       );
                  // ListView.builder(
                  //   itemCount: products.length,
                  //   shrinkWrap: true,
                  //   itemBuilder: (context, index) {
                  //     return ProductCard(product: products[index]);
                  //   }
                  //   );
                  // GridView.count(
                  //   crossAxisCount: _crossAxisCount, // Her satırda _crossAxisCount kadar ürün görüntüle
                  //   shrinkWrap:
                  //       true, // GridView'in yüksekliğini içeriğine göre ayarlayın
                  //   children: products
                  //       .map((product) => Padding(
                  //         padding: const EdgeInsets.all(8.0),
                  //         child: ProductCard(product: product),
                  //       ))
                  //       .toList(),
                  // );
                } else {
                  return CircularProgressIndicator();
                }
              }),
        )),
      ),
      drawer: const MyDarewer(),
      // bottomNavigationBar:
    );
  }
}
