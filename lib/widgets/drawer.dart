import 'package:demo/global_variables.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  TextEditingController _minPriceController = TextEditingController();
  TextEditingController _maxPriceController = TextEditingController();

  void _applyFilters() {
    double minPrice = double.tryParse(_minPriceController.text) ?? 0.0;
    double maxPrice = double.tryParse(_maxPriceController.text) ?? 0.0;
    print(
        "Seçilen Fiyat Aralığı: \$${minPrice.toStringAsFixed(2)} - \$${maxPrice.toStringAsFixed(2)}");
    // Burada filtreleme veya başka bir işlem yapabilirsiniz
  }

  @override
  void dispose() {
    // Dispose controllers to avoid memory leaks
    _minPriceController.dispose();
    _maxPriceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double _minPrice = 0; // Minimum fiyat değeri
    double _maxPrice = 100; // Maksimum fiyat değeri
    return Drawer(
      child: ListView.builder(
          itemCount: categoryList.length + 2,
          itemBuilder: (context, index) {
            if (index == 0) {
              return ListTile(
                title: Text("Kategoriler",
                    style: TextStyle(fontWeight: FontWeight.bold)),
              );
            } else if (categoryList.length >= index) {
              final categoryIndex = index - 1;
              return ListTile(
                title: Text(categoryList[categoryIndex]),
                onTap: () {},
              );
            } else {
              return ListTile(
                title: Text("Fiyat Aralığı", style: TextStyle(fontWeight: FontWeight.bold),),
                subtitle: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: _minPriceController,
                        keyboardType:
                            TextInputType.numberWithOptions(decimal: true),
                        decoration: InputDecoration(
                          hintText: "Minimum Fiyat",
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: TextFormField(
                        controller: _maxPriceController,
                        keyboardType:
                            TextInputType.numberWithOptions(decimal: true),
                        decoration: InputDecoration(
                          hintText: "Maksimum Fiyat",
                        ),
                        // enter tuşuna basıldığında da fonksiyon çalışacak

                        onFieldSubmitted: (_) => _applyFilters(),
                      ),
                    ),
                  ],
                ),
                trailing: ElevatedButton(
                  onPressed: _applyFilters,
                  child: Text("Uygula"),
                ),
              );
            }
          }),
    );
  }
}
