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


<details>

<summary>Tugas 8 </summary>


1. Jelaskan perbedaan antara Navigator.push() dan Navigator.pushReplacement(), disertai dengan contoh mengenai penggunaan kedua metode tersebut yang tepat!

Navigator.push():

a. Menggeser atau menambahkan halaman baru ke dalam tumpukan navigasi.

b. Tetap menyimpan halaman sebelumnya di dalam tumpukan navigasi.

c. Cocok untuk navigasi ke halaman baru tanpa menggantikan halaman sebelumnya.
Contoh
<pre>

onPressed: () {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => HalamanBaru()),
  );
}


</pre>

Navigator.pushReplacement():

a. Menggantikan halaman terakhir dalam tumpukan navigasi dengan halaman baru.

b. Halaman sebelumnya dihapus dari tumpukan navigasi.

c. Cocok untuk menggantikan halaman saat aplikasi berpindah ke halaman baru dan Anda tidak ingin kembali ke halaman sebelumnya.

<pre>
onLoginPressed: () {
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => Dashboard()),
  );
}

</pre>


2.  Jelaskan masing-masing layout widget pada Flutter dan konteks penggunaannya masing-masing!

a. container, widget layout serbaguna yang dapat digunakan untuk mengatur, mendekorasi, dan menentukan batasan ukuran anak-anaknya.

b. Row dan Column, Row digunakan untuk menata widget secara horizontal, sementara Column digunakan untuk menata widget secara vertikal. 

c. ListView, widget untuk menampilkan daftar elemen yang dapat digulir. 

d. Stack, digunakan untuk menumpuk widget di atas satu sama lain.

e. GridView, digunakan untuk menampilkan elemen dalam bentuk grid.

f. Expanded dan Flexible, digunakan dalam Row atau Column untuk memberikan fleksibilitas dalam pengaturan ruang. Expanded mengalokasikan sebanyak mungkin ruang yang tersedia, sementara Flexible memberikan kontrol lebih besar atas seberapa banyak ruang yang dialokasikan.

3. Sebutkan apa saja elemen input pada form yang kamu pakai pada tugas kali ini dan jelaskan mengapa kamu menggunakan elemen input tersebut!


Ada 3 elemen input pada form yaitu TextForm Field untuk nama, harga, dan deskripsi.

TextForm field nama digunakan untuk mengumpulkan nama item dari pengguna. Dan divalidasi tidak boleh kosong.

TextForm field harga digunakan untuk mengumpulkan harga item dari pengguna. Dan divalidasi tidak boleh kosong dan harus berupa angka.

TextForm field deskripsi digunakan untuk mengumpulkan deskripsi item dari pengguna. Dan divalidasi tidak boleh kosong. 

4. Bagaimana penerapan clean architecture pada aplikasi Flutter?

Penerapan Clean Architecture pada aplikasi Flutter melibatkan pembagian kode ke dalam beberapa lapisan yang berbeda.

a. Entities, Biasanya didefinisikan sebagai kelas POJO (Plain Old Dart Object) tanpa ketergantungan pada Flutter atau framework lainnya.

b. Use Cases (Interactors), diimplementasikan sebagai kelas Dart biasa yang tidak memiliki ketergantungan pada framework. 

c. Repositories, untuk berkomunikasi dengan sumber data eksternal, seperti API atau database.

d. Frameworks & Drivers, seperti widget, routing, dan koneksi ke layanan Flutter.

e. Presentation, untuk menangani presentasi UI seperti Widget flutter.

5. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial)

a. Membuat minimal satu halaman baru pada aplikasi, yaitu halaman formulir tambah item baru dengan ketentuan sebagai berikut:

kode nya ada di shoplist_form.dart

Memakai minimal tiga elemen input, yaitu name, amount, description. Tambahkan elemen input sesuai dengan model pada aplikasi tugas Django yang telah kamu buat.
 Memiliki sebuah tombol Save.
 Setiap elemen input di formulir juga harus divalidasi dengan ketentuan sebagai berikut:
 Setiap elemen input tidak boleh kosong.
 Setiap elemen input harus berisi data dengan tipe data atribut modelnya.


 <pre>


class _ShopFormPageState extends State<ShopFormPage> {
  final _formKey = GlobalKey<FormState>();
  String _name = "";
  int _price = 0;
  String _description = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Form Tambah Item',
          ),
        ),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      // xxx
      drawer: const LeftDrawer(),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: "Nama Item",
                  labelText: "Nama Item",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                onChanged: (String? value) {
                  setState(() {
                    _name = value!;
                  });
                },
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "Nama tidak boleh kosong!";
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: "Harga",
                  labelText: "Harga",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                onChanged: (String? value) {
                  setState(() {
                    _price = int.parse(value!);
                  });
                },
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "Harga tidak boleh kosong!";
                  }
                  if (int.tryParse(value) == null) {
                    return "Harga harus berupa angka!";
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: "Deskripsi",
                  labelText: "Deskripsi",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                onChanged: (String? value) {
                  setState(() {
                    _description = value!;
                  });
                },
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "Deskripsi tidak boleh kosong!";
                  }
                  return null;
                },
              ),
            ),
            

 </pre>

Pada kode diatas pertama dibuat name,price,dan description
Lalu dilanjutkan dengan membuat form validasi seperti kode diatas. Jika kosong maka buat ... tidak boleh kosong sehingga form tervalidasi Jika kosong return null



Di bagian padding ditambahkan form masing masing utk nama,
harga, dan deskripsi. Lalu tambahkan button save jika sudah di paling bawa kode di bagian child

<pre>

 child: const Text(
                    "Save",
                    style: TextStyle(color: Colors.white),
                  ),

</pre>


b. Mengarahkan pengguna ke halaman form tambah item baru ketika menekan tombol Tambah Item pada halaman utama.

Tambahkan kode ini di menu.dart agar bisa navigate ke halaman lain

<pre>
if (item.name == "Tambah Item") {
            // xxx
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const ShopFormPage()));
          }


</pre>

c. Memunculkan data sesuai isi dari formulir yang diisi dalam sebuah pop-up setelah menekan tombol Save pada halaman formulir tambah item baru.

tambahkan padding ini di shoplist_form.dart di paling bawah

<pre>

Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: "Deskripsi",
                  labelText: "Deskripsi",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                onChanged: (String? value) {
                  setState(() {
                    _description = value!;
                  });
                },
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "Deskripsi tidak boleh kosong!";
                  }
                  return null;
                },
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.indigo),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text('Item berhasil tersimpan'),
                            content: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Nama: $_name'),
                                  Text('Price: $_price'),
                                  Text('Description: $_description'),
                                ],
                              ),
                            ),
                            actions: [
                              TextButton(
                                child: const Text('OK'),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                            ],
                          );
                        },
                      );
                      
                        _formKey.currentState!.reset();
                    }
                  

</pre>

Setelah ditambahkan maka akan muncul pop up nya.

d. Membuat sebuah drawer pada aplikasi dengan ketentuan sebagai berikut:
 Drawer minimal memiliki dua buah opsi, yaitu Halaman Utama dan Tambah Item.
 Ketika memiih opsi Halaman Utama, maka aplikasi akan mengarahkan pengguna ke halaman utama.
 Ketika memiih opsi (Tambah Item), maka aplikasi akan mengarahkan pengguna ke halaman form tambah item baru.


 Untuk membuat drawer maka code ini dituliskan pada left_drawer.dart

 <pre>
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


 </pre>
 kode dibawah ini untuk pindah pindah pagr


 <pre>
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

 </pre>

 Ini untuk balik ke homepage


 <pre>

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
        ],


 </pre>


 code ini untuk menuju tambah item tambahkan ini



</details>


<details>
     <summary>Tugas 9 </summary>

1. Apakah bisa kita melakukan pengambilan data JSON tanpa membuat model terlebih dahulu? Jika iya, apakah hal tersebut lebih baik daripada membuat model sebelum melakukan pengambilan data JSON?

Kita  dapat melakukan pengambilan data JSON tanpa membuat model terlebih dahulu. Hal tersebut tidak lebih baik jika membuat sebuah project yang membutuhkan data yang sangat banyak. 

Dengan kata lain, pemilihan untuk membuat model atau tidak sebaiknya didasarkan pada kebutuhan spesifik dan kompleksitas tugas yang ingin dilakukan terhadap data JSON tersebut.

2. Jelaskan fungsi dari CookieRequest dan jelaskan mengapa instance CookieRequest perlu untuk dibagikan ke semua komponen di aplikasi Flutter.

Cookies adalah mekanisme penyimpanan data di sisi klien yang digunakan oleh protokol HTTP untuk melacak status sesi dan informasi pengguna lainnya antara permintaan. Mereka dapat digunakan untuk menyimpan informasi di perangkat klien dan mengirimkannya kembali ke server bersama dengan setiap permintaan.

Jika ada informasi atau status sesi yang perlu disimpan dan diteruskan antar halaman atau komponen aplikasi, menggunakan objek CookieRequest yang dibagikan dapat membantu memastikan bahwa informasi ini dapat diakses dan diperbarui secara konsisten di seluruh aplikasi.

Sehingga CookieRequest perlu dibagikan kepada semua komponen aplikasi Flutter.

3. Jelaskan mekanisme pengambilan data dari JSON hingga dapat ditampilkan pada Flutter.


Pada dasarnya, mekanisme pengambilan data dari JSON hingga ditampilkan di aplikasi Flutter melibatkan beberapa langkah dasar, yaitu:

Mendapatkan Data JSON:
Pertama, perlu mendapatkan data JSON dari sumbernya. Ini bisa berupa API endpoint, file JSON lokal, atau sumber data lainnya

Parsing Data JSON:
Setelah mendapatkan data JSON, langkah berikutnya adalah mengurai (parsing) data tersebut. Parsing adalah proses mengubah representasi teks JSON menjadi struktur data yang dapat digunakan dalam Flutter. 

Membuat Model Data:
Sebaiknya, Anda membuat model Dart yang sesuai dengan struktur data yang diambil dari JSON. Model ini membantu mengorganisasi data dan membuat kode lebih mudah dipahami. 

Menggunakan Model dalam Flutter Widget:
Setelah parsing dan membuat model, Anda dapat menggunakan model tersebut dalam widget Flutter untuk menampilkan data

Menggunakan Widget dalam Aplikasi:
Terakhir, Anda dapat menggunakan widget yang Anda buat di aplikasi Flutter Anda untuk menampilkan data

4. Jelaskan mekanisme autentikasi dari input data akun pada Flutter ke Django hingga selesainya proses autentikasi oleh Django dan tampilnya menu pada Flutter.

Mekanisme autentikasi antara aplikasi Flutter dan server Django melibatkan beberapa langkah, dan umumnya menggunakan protokol autentikasi seperti JSON Web Token (JWT). Berikut adalah langkah-langkah umum yang dapat Anda ikuti:

Pada Sisi Flutter (Aplikasi Klien):
Input Data Akun:

Pengguna memasukkan informasi akun seperti nama pengguna dan kata sandi pada antarmuka pengguna di aplikasi Flutter.
Permintaan Autentikasi ke Django:

Aplikasi Flutter mengirim permintaan HTTP ke server Django untuk mengotentikasi pengguna. Permintaan ini biasanya berisi informasi kredensial pengguna (misalnya, nama pengguna dan kata sandi) dalam payload permintaan.
Menerima Token JWT:

Jika informasi kredensial valid, server Django dapat menghasilkan dan mengirimkan token JWT ke aplikasi Flutter sebagai respons. Token ini berfungsi sebagai bukti bahwa pengguna telah diotentikasi.
Pada Sisi Django (Server):
Verifikasi Kredensial:

Django mengambil informasi kredensial dari permintaan, memverifikasi kebenaran kredensial pengguna, dan, jika valid, melanjutkan ke langkah selanjutnya.
Generasi Token JWT:

Jika kredensial valid, server Django menghasilkan token JWT menggunakan informasi identitas pengguna (misalnya, ID pengguna) dan mengirimkannya sebagai respons.
Mengirim Token JWT:

Token JWT dikirimkan ke aplikasi Flutter sebagai bagian dari respons HTTP.
Kembali ke Sisi Flutter (Aplikasi Klien):
Penyimpanan Token:

Aplikasi Flutter menyimpan token JWT yang diterima secara lokal, misalnya dalam penyimpanan aman atau penyimpanan sesi.
Penggunaan Token untuk Permintaan Berikutnya:

Setiap kali aplikasi Flutter melakukan permintaan ke server Django yang memerlukan otentikasi, token JWT disertakan dalam header permintaan untuk membuktikan otentikasi pengguna.
Navigasi ke Menu:

Jika otentikasi berhasil, aplikasi Flutter dapat menavigasi pengguna ke menu atau tampilan lain yang memerlukan otentikasi.


5. Sebutkan seluruh widget yang kamu pakai pada tugas ini dan jelaskan fungsinya masing-masing.

Widget LoginApp:
MaterialApp: Representasi root aplikasi Flutter dan menyediakan layanan seperti tema, navigator, dan lainnya.
Widget LoginPage:
Scaffold: Menyediakan struktur dasar untuk antarmuka visual aplikasi, termasuk app bar dan body.

AppBar: Menampilkan judul "Login" di bagian atas layar.

Container: Kotak yang dapat berisi widget lain, digunakan untuk memberikan padding.

Column: Widget yang menampilkan anak-anaknya dalam susunan vertikal.

TextField (Username): Widget untuk mengambil input pengguna untuk nama pengguna.

TextField (Password): Widget untuk mengambil input pengguna untuk kata sandi. Properti obscureText: true digunakan untuk menyembunyikan teks yang dimasukkan.

ElevatedButton (Login): Tombol yang memicu proses login.

Widget ItemPage:
Scaffold: Menyediakan struktur dasar untuk antarmuka visual.

AppBar: Menampilkan judul "Item" di bagian atas.

Drawer (LeftDrawer): Widget drawer kustom, mungkin berisi tautan navigasi.

FutureBuilder: Widget yang membangun dirinya secara asinkron berdasarkan snapshot terbaru dari Future.

ListView.builder: Daftar widget yang dapat digulirkan yang dibuat sesuai kebutuhan.

Container: Kotak yang berisi widget lain, memberikan padding.

Column: Mengatur anak-anaknya dalam susunan vertikal.

Text: Menampilkan nama item.

Text: Menampilkan jumlah item.

Text: Menampilkan deskripsi item.

Widget MyHomePage:
Scaffold: Menyediakan struktur dasar untuk antarmuka visual.

AppBar: Menampilkan judul "PBP Shop" di bagian atas.

Drawer (LeftDrawer): Widget drawer kustom, mungkin berisi tautan navigasi.

SingleChildScrollView: Kotak di mana satu widget dapat digulir.

Padding: Memberikan padding untuk anak-anaknya.

Column: Mengatur anak-anaknya dalam susunan vertikal.

Text: Menampilkan judul "PBP Shop".

GridView.count: Membuat grid yang dapat digulir dari widget.

ShopCard: Mewakili kartu item di toko.
Widget di Luar Kelas:
CircularProgressIndicator: Widget yang menampilkan roda yang berputar untuk menunjukkan bahwa aplikasi sedang sibuk.

AlertDialog: Kotak dialog yang mengganggu alur kerja pengguna untuk mendapatkan tanggapan. Digunakan untuk menampilkan pesan kegagalan login.

SnackBar: Pesan ringan dengan tindakan opsional. Digunakan untuk menampilkan pesan login yang berhasil.

Widget Kustom:
LeftDrawer: Widget drawer kustom, mungkin berisi tautan navigasi.

ShopCard: Widget kustom yang mewakili kartu item di toko, digunakan dalam widget MyHomePage.


6.  Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial).

 a.  Memastikan deployment proyek tugas Django kamu telah berjalan dengan baik.

 tinggal di liat di link https://kevin-ignatius-tugas.pbp.cs.ui.ac.id/

 b. Membuat halaman login pada proyek tugas Flutter.

 membuat file login.dart dan mengisinya dengan code seperti ini

 <pre>
// ignore_for_file: use_build_context_synchronously, library_private_types_in_public_api

import 'package:tugaspbp7/screens/menu.dart';
import 'package:flutter/material.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

void main() {
    runApp(const LoginApp());
}

class LoginApp extends StatelessWidget {
const LoginApp({super.key});

@override
Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Login',
        theme: ThemeData(
            primarySwatch: Colors.blue,
    ),
    home: const LoginPage(),
    );
    }
}

class LoginPage extends StatefulWidget {
    const LoginPage({super.key});

    @override
    _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
    final TextEditingController _usernameController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();

    @override
    Widget build(BuildContext context) {
        final request = context.watch<CookieRequest>();
        return Scaffold(
            appBar: AppBar(
                title: const Text('Login'),
            ),
            body: Container(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                        TextField(
                            controller: _usernameController,
                            decoration: const InputDecoration(
                                labelText: 'Username',
                            ),
                        ),
                        const SizedBox(height: 12.0),
                        TextField(
                            controller: _passwordController,
                            decoration: const InputDecoration(
                                labelText: 'Password',
                            ),
                            obscureText: true,
                        ),
                        const SizedBox(height: 24.0),
                        ElevatedButton(
                            onPressed: () async {
                                String username = _usernameController.text;
                                String password = _passwordController.text;

                                // Cek kredensial
                                // url ini
                                // Untuk menyambungkan Android emulator dengan Django pada localhost,
                                // gunakan URL http://10.0.2.2/
                                final response = await request.login("http://127.0.0.1:8000/auth/login/", {
                                'username': username,
                                'password': password,
                                });
                    
                                if (request.loggedIn) {
                                    String message = response['message'];
                                    String uname = response['username'];
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(builder: (context) => MyHomePage()),
                                    );
                                    ScaffoldMessenger.of(context)
                                        ..hideCurrentSnackBar()
                                        ..showSnackBar(
                                            SnackBar(content: Text("$message Selamat datang, $uname.")));
                                    } else {
                                    showDialog(
                                        context: context,
                                        builder: (context) => AlertDialog(
                                            title: const Text('Login Gagal'),
                                            content:
                                                Text(response['message']),
                                            actions: [
                                                TextButton(
                                                    child: const Text('OK'),
                                                    onPressed: () {
                                                        Navigator.pop(context);
                                                    },
                                                ),
                                            ],
                                        ),
                                    );
                                }
                            },
                            child: const Text('Login'),
                        ),
                    ],
                ),
            ),
        );
    }
}

 </pre>

 c. Mengintegrasikan sistem autentikasi Django dengan proyek tugas Flutter.

 pertama membuat authentication di django dan ditambahkan semua variable yg penting pada settings.py 

 tambahkan variable ini 
 
 CORS_ALLOW_ALL_ORIGINS = True
CORS_ALLOW_CREDENTIALS = True
CSRF_COOKIE_SECURE = True
SESSION_COOKIE_SECURE = True
CSRF_COOKIE_SAMESITE = 'None'
SESSION_COOKIE_SAMESITE = 'None'

lalu buatlah authentication/views.py serta urls.py

lalu pada flutter tambahkan flutter pub add provider dan pbp_django_auth lalu isi login.dartnya

d.  Membuat model kustom sesuai dengan proyek aplikasi Django.

masukan ke quicktype dan isi dengan data json lalu ubah ke dart dan filenya ada di models/item.dart

e.  Membuat halaman yang berisi daftar semua item yang terdapat pada endpoint JSON di Django yang telah kamu deploy.
 Tampilkan name, amount, dan description dari masing-masing item pada halaman ini.

 kita membuatnya dengan cara melakukan fetch data dr django  dengan menambahkan dependensi http lalu isi list_item.dart dengan kode ini 
 <pre>

// ignore_for_file: library_private_types_in_public_api, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:tugaspbp7/models/items.dart';
import 'package:tugaspbp7/widgets/left_drawer.dart';

class ItemPage extends StatefulWidget {
    const ItemPage({Key? key}) : super(key: key);

    @override
    _ItemPageState createState() => _ItemPageState();
}

class _ItemPageState extends State<ItemPage> {
Future<List<Item>> fetchProduct() async {
    // url ini
    var url = Uri.parse(
        'http://127.0.0.1:8000/json/');
    var response = await http.get(
        url,
        headers: {"Content-Type": "application/json"},
    );

    // melakukan decode response menjadi bentuk json
    var data = jsonDecode(utf8.decode(response.bodyBytes));

    // melakukan konversi data json menjadi object Product
    List<Item> list_product = [];
    for (var d in data) {
        if (d != null) {
            list_product.add(Item.fromJson(d));
        }
    }
    return list_product;
}

@override
Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: const Text('Item'),
        ),
        drawer: const LeftDrawer(),
        body: FutureBuilder(
            future: fetchProduct(),
            builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.data == null) {
                    return const Center(child: CircularProgressIndicator());
                } else {
                    if (!snapshot.hasData) {
                    return const Column(
                        children: [
                        Text(
                            "Tidak ada data item.",
                            style:
                                TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                        ),
                        SizedBox(height: 8),
                        ],
                    );
                } else {
                    return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (_, index) => Container(
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 12),
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                    Text(
                                    "${snapshot.data![index].fields.name}",
                                    style: const TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold,
                                    ),
                                    ),
                                    const SizedBox(height: 10),
                                    Text("${snapshot.data![index].fields.amount}"),
                                    const SizedBox(height: 10),
                                    Text(
                                        "${snapshot.data![index].fields.description}")
                                ],
                                ),
                            ));
                    }
                }
            }));
    }
}
 </pre>
 
 dengan mensnapshot index.field kita mengambil data dari model yang ada di django 


  e. Membuat halaman detail untuk setiap item yang terdapat pada halaman daftar Item.
 Halaman ini dapat diakses dengan menekan salah satu item pada halaman daftar Item.
 Tampilkan seluruh atribut pada model item kamu pada halaman ini.
 Tambahkan tombol untuk kembali ke halaman daftar item.

 Dengan cara menambahkan file halaman_item.dart dan mengubah bbrp di django sehingga bisa mengakses daftar item serta membuat tombolnya






</details>
