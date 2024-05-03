import 'package:demo/services/product_service.dart';
import 'package:demo/widgets/card.dart';
import 'package:demo/widgets/drawer.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    int _crossAxisCount = 2;

    if (MediaQuery.of(context).size.width > 2000) {
      setState(() {
      _crossAxisCount = 6;
      });
    } else if (2000 > MediaQuery.of(context).size.width && MediaQuery.of(context).size.width  > 900){
      setState(() {
      _crossAxisCount = 4;
      });
    } else if (900 > MediaQuery.of(context).size.width && MediaQuery.of(context).size.width  > 500){
      setState(() {
      _crossAxisCount = 3;
      });
    } else {
       setState(() {
      _crossAxisCount = 2;
      });
    }

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Center(
            child: Column(
          children: [
            FutureBuilder(
                future: fetchProducts(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text(
                        "veri çekerken bir hata oluştu...${snapshot.error}");
                  } else if (snapshot.hasData) {
                    final products = snapshot.data!;

                    return GridView.count(
                      crossAxisCount: _crossAxisCount, // Her satırda 2 ürün görüntüle
                      shrinkWrap:
                          true, // GridView'in yüksekliğini içeriğine göre ayarlayın
                      children: products
                          .map((product) => ProductCard(product: product))
                          .toList(),
                    );
                  } else {
                    return CircularProgressIndicator();
                  }
                })
          ],
        )),
      ),
      drawer: const MyDarewer(),
      // bottomNavigationBar:
    );
  }
}
