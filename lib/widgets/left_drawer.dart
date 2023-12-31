import 'package:flutter/material.dart';
import 'package:tugaspbp7/screens/menu.dart';
// xxx
import 'package:tugaspbp7/screens/shoplist_form.dart';
import 'package:tugaspbp7/screens/list_item.dart';

class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.indigo,
            ),
            child: Column(
              children: [
                Text(
                  'PBP Shop',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Padding(padding: EdgeInsets.all(10)),
                Text(
                  "Catat seluruh keperluan belanjamu di sini!",
                  // xxx
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text('Halaman Utama'),
            // Bagian redirection ke MyHomePage
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyHomePage(),
                  ));
            },
          ),
          ListTile(
            leading: const Icon(Icons.add_shopping_cart),
            title: const Text('Tambah Item'),
            // Bagian redirection ke ShopFormPage
            onTap: () {
              /* xxx
    */
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ShopFormPage()));
            },
          ),

          ListTile(
            leading: const Icon(Icons.shopping_basket),
            title: const Text('Daftar Item'),
            onTap: () {
        // Route menu ke halaman produk
              Navigator.push(
              context,
            MaterialPageRoute(builder: (context) => const ItemPage()),
            ) ;
            },
          ),
        ],
      ),
    );
  }
}
