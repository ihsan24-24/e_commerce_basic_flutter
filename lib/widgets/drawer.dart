import 'package:demo/global_variables.dart';
import 'package:flutter/material.dart';

class MyDarewer extends StatelessWidget {
  const MyDarewer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          ListTile(
            title: Text(categoryList[0]),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/');
            },
          ),
          ListTile(
            title: Text(categoryList[1]),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/hakkimizda');
            },
          ),
          ListTile(
            title: Text('İletişim'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/iletisim');
            },
          ),
          ListTile(
            title: Text('Menüyü Kapat'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
