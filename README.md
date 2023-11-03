# tugas pbp flutter
Kevin Ignatius Wijaya
2206083470

<details>
    <summary>Tugas 7 </summary>

1. Apa perbedaan utama antara stateless dan stateful widget dalam konteks pengembangan aplikasi Flutter?

Stateless widget adalah widget yang tidak memiliki keadaan internal. Ini berarti bahwa sekali widget tersebut dibangun, ia tidak dapat berubah atau memiliki data yang berubah.

Stateful widget adalah widget yang dapat memiliki keadaan internal yang dapat berubah selama siklus hidup widget. Keadaan ini memungkinkan widget merespons perubahan data atau kejadian tertentu.

Dengan demikian, perbedaan utama antara stateless dan stateful widget adalah kemampuan stateful widget untuk mengelola keadaan internal dan merespons perubahan data, sedangkan stateless widget hanya digunakan untuk tampilan yang statis. Pemilihan widget mana yang harus digunakan tergantung pada kebutuhan aplikasi Anda.

2. Sebutkan seluruh widget yang kamu gunakan untuk menyelesaikan tugas ini dan jelaskan fungsinya masing-masing.

MyHomePage (Stateless Widget): Ini adalah widget beranda utama yang membangun tampilan halaman beranda toko. Ini digunakan untuk mengelola tampilan utama aplikasi.

Scaffold: Scaffold adalah kerangka kerja dasar yang digunakan untuk membuat tampilan aplikasi yang memiliki fitur-fitur seperti AppBar, body, dan banyak elemen antarmuka pengguna lainnya. Dalam kasus ini, itu digunakan untuk mengatur halaman utama dengan AppBar dan body.

AppBar: Ini adalah elemen yang digunakan untuk menampilkan judul aplikasi di bagian atas layar. Dalam kode tersebut, AppBar digunakan untuk menampilkan judul "Tugas PBP" dengan latar belakang berwarna indigo.

Text: Widget ini digunakan untuk menampilkan teks dalam antarmuka pengguna. Dalam kode ini, Text digunakan untuk menampilkan judul "PBP Shop" di tengah halaman beranda.

Padding: Widget Padding digunakan untuk menambahkan padding (jeda) di sekitar elemen-elemen lainnya. Dalam kode ini, Padding digunakan untuk memberikan jarak antara elemen-elemen dalam Column.

Column: Column digunakan untuk mengatur elemen-elemen secara vertikal. Dalam kode ini, itu digunakan untuk mengelompokkan elemen-elemen dalam tampilan halaman beranda.

GridView.count: Widget ini digunakan untuk membuat tampilan grid dengan jumlah kolom yang ditentukan. Dalam kode ini, GridView.count digunakan untuk menampilkan item-item toko dalam tata letak grid dengan 3 kolom.

ShopItem (Model class): Ini adalah kelas model yang digunakan untuk merepresentasikan item toko. Setiap instance dari kelas ini memiliki nama dan ikon yang digunakan untuk membuat item-item dalam daftar toko.

ShopCard (Stateless Widget): ShopCard adalah widget yang digunakan untuk menampilkan setiap item toko dalam bentuk kartu (card). Ini digunakan untuk menampilkan ikon, teks, dan latar belakang yang berbeda untuk setiap item toko.

Material: Widget ini digunakan untuk memberikan latar belakang berwarna kepada setiap kartu item toko dalam ShopCard.

InkWell: InkWell adalah widget yang digunakan untuk membuat area yang responsif terhadap sentuhan. Dalam kode ini, InkWell digunakan untuk mendeteksi ketika kartu item toko diklik.

Container: Widget ini digunakan untuk mengelompokkan ikon dan teks dalam kartu item toko.

Icon: Icon digunakan untuk menampilkan ikon sesuai dengan item toko yang diwakili oleh kartu.

SnackBar: SnackBar digunakan untuk menampilkan pesan sementara kecil ketika pengguna mengklik kartu item toko. Itu memberi tahu pengguna item apa yang telah mereka klik.

3. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step (bukan hanya sekadar mengikuti tutorial)

a. Pertama tama membuat project dengan code dan masuk ke direktori tersebut dan menjalankannya di command prompt
<pre>
    flutter create pbptugas7
    cd pbptugas7
    flutter run

</pre>

b. Lalu membuat dan mengedit menu.dart dan main.dart

file main.dart yang diubah akan menjadi seperti ini


<pre>

import 'package:flutter/material.dart';
import 'package:tugaspbp7/menu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}





</pre>

lalu di menu.dart tambahkan ini

<pre>

class MyHomePage extends StatelessWidget {
    MyHomePage({Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            ...
        );
    }
}



</pre>

Ini akan mengubah widget dari statefull ke stateless
Lalu tambahkan kode berikut untuk tambahin object barang yang dijual 


<pre>
class ShopItem {
  final String name;
  final IconData icon;

  ShopItem(this.name, this.icon);
}



</pre>

ini akan membuat object shopitem lalu tambahkan ini untuk menambahkan attibute class MyHomePage

<pre>
final List<ShopItem> items = [
    ShopItem("Lihat Item", Icons.checklist),
    ShopItem("Tambah Item", Icons.add_shopping_cart),
    ShopItem("Logout", Icons.logout),
  ];


</pre>

lalu tambahkan widget agar membentuk sesuai yang diinginkan


<pre>
 Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Tugas PBP',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.indigo,
      ),
      body: SingleChildScrollView(
        // Widget wrapper yang dapat discroll
        child: Padding(
          padding: const EdgeInsets.all(10.0), // Set padding dari halaman
          child: Column(
            // Widget untuk menampilkan children secara vertikal
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                // Widget Text untuk menampilkan tulisan dengan alignment center dan style yang sesuai
                child: Text(
                  'PBP Shop', // Text yang menandakan toko
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              // Grid layout
              GridView.count(
                // Container pada card kita.
                primary: true,
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 3,
                shrinkWrap: true,
                children: items.map((ShopItem item) {
                  // Iterasi untuk setiap item
                  return ShopCard(item);
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }

</pre>

setelah itu tinggal tambahkan widget yang ada di dalamnya 3 kotak tersebut seperti ini . kode counter dibawah ini untuk mengerjakan soal bonusnya agar 3 kotak tersebut punya warna berbeda


<pre>


lass ShopCard extends StatelessWidget {
  final ShopItem item;

  const ShopCard(this.item, {super.key}); // Constructor

  static int counter = 0;

  Color getCounter() {
    if (counter == 0) {
      counter++;
      return Colors.red;
    } else if (counter == 1) {
      counter++;
      return Colors.yellow;
    }
    return Colors.blue;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: getCounter(),
      child: InkWell(
        // Area responsive terhadap sentuhan
        onTap: () {
          // Memunculkan SnackBar ketika diklik
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
                content: Text("Kamu telah menekan tombol ${item.name}!")));
        },
        child: Container(
          // Container untuk menyimpan Icon dan Text
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  item.icon,
                  color: Colors.white,
                  size: 30.0,
                ),
                const Padding(padding: EdgeInsets.all(3)),
                Text(
                  item.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}



</pre>

Setelah itu selesai dan tinggal di jalankan



</details>
