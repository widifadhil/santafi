import 'package:flutter/material.dart';

const String montserrat = 'Montserrat';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          toolbarHeight: 100,
          title: Center(
            child: SizedBox(
              width: 1280,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    'images/Santafi_logo.png',
                    height: 60,
                    fit: BoxFit.contain,
                  ),
                  Row(
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: const Text('Beranda', style: TextStyle(color: Colors.black, fontFamily: 'Montserrat', fontSize: 16, fontWeight: FontWeight.w600),),
                      ),
                      TextButton(onPressed: () {}, child: const Text('Destinasi', style: TextStyle(color: Colors.grey, fontFamily: 'Montserrat', fontSize: 16, fontWeight: FontWeight.w600))),
                      TextButton(onPressed: () {}, child: const Text('Tentang Kami', style: TextStyle(color: Colors.grey, fontFamily: 'Montserrat', fontSize: 16, fontWeight: FontWeight.w600))),
                      TextButton(onPressed: () {}, child: const Text('Artikel', style: TextStyle(color: Colors.grey, fontFamily: 'Montserrat', fontSize: 16, fontWeight: FontWeight.w600))),
                    ],
                  ),
                  Row(
                    children: [
                      TextButton(onPressed: () {}, child: const Text('Masuk', style: TextStyle(color: Colors.black, fontFamily: 'Montserrat', fontSize: 16, fontWeight: FontWeight.w600))),
                      ElevatedButton(onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            backgroundColor: Colors.blue[900],
                          ),
                          child: const Text('Daftar', style: TextStyle(color: Colors.white, fontFamily: 'Montserrat', fontSize: 16, fontWeight: FontWeight.w400),))
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        body: const SingleChildScrollView(
          child: BerandaPage(),

        ),

      ),
    ),
  );
}



class BerandaPage extends StatelessWidget {
  const BerandaPage({super.key});

  // Daftar destinasi
  final List<Map<String, dynamic>> destinations = const [
    {
      "title": "Haji\n& Umrah",
      "icon": Icons.mosque,
      "tours": "4 Tours",
    },
    {
      "title": "Wisata Domestik",
      "icon": Icons.landscape,
      "tours": "2 Tours",
    },
    {
      "title": "Wisata Internasional",
      "icon": Icons.public,
      "tours": "3 Tours",
    },
    {
      "title": "Layanan\nLainnya",
      "icon": Icons.local_dining,
      "tours": "5 Tours",
    },

  ];

  final List<Map<String, dynamic>> galeri = const [
    {
      "title": "Haji\n& Umrah",
      "icon": Icons.mosque,
      "tours": "4 Tours",
    },
    {
      "title": "Wisata Domestik",
      "icon": Icons.landscape,
      "tours": "2 Tours",
    },
    {
      "title": "Wisata Internasional",
      "icon": Icons.public,
      "tours": "3 Tours",
    },
    {
      "title": "Layanan\nLainnya",
      "icon": Icons.local_dining,
      "tours": "5 Tours",
    },
    {
      "title": "Haji\n& Umrah",
      "icon": Icons.mosque,
      "tours": "4 Tours",
    },
    {
      "title": "Wisata Domestik",
      "icon": Icons.landscape,
      "tours": "2 Tours",
    },
    {
      "title": "Wisata Internasional",
      "icon": Icons.public,
      "tours": "3 Tours",
    },
    {
      "title": "Layanan\nLainnya",
      "icon": Icons.local_dining,
      "tours": "5 Tours",
    },

  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: SizedBox(
            width: 1283,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, // Tambahkan ini jika perlu
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 60),
                          // Headline
                          RichText(
                            text: const TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Perjalanan\nBerharga Bersama',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 70,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                TextSpan(
                                  text: '\nSantaFi.',
                                  style: TextStyle(
                                    color: Colors.orange,
                                    fontSize: 70,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 20),
                          // Subheadline
                          const Text(
                            'Bersama SantaFi Travel, wujudkan impian ibadah Umrah, Haji, '
                                'dan wisata halal\nke berbagai destinasi domestik dan internasional '
                                'dengan layanan terbaik.',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 18,
                            ),
                          ),
                          const SizedBox(height: 40),
                          // Search Bar
                          Center(
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                              width: 650,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(62),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.black12,
                                    blurRadius: 10,
                                  ),
                                ],
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  // Kategori Perjalanan
                                  Row(
                                    children: [
                                      const Icon(Icons.location_on, color: Colors.orange),
                                      const SizedBox(width: 8),
                                      DropdownButton<String>(
                                        value: 'Pilih Tujuan Anda',
                                        items: <String>['Pilih Tujuan Anda', 'Paket1', 'Paket2', 'Paket3']
                                            .map((String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(value),
                                          );
                                        }).toList(),
                                        onChanged: (String? newValue) {
                                          // Add your change logic here
                                        },
                                      ),
                                    ],
                                  ),
                                  // Tahun
                                  Row(
                                    children: [
                                      const Icon(Icons.calendar_today, color: Colors.orange),
                                      const SizedBox(width: 8),
                                      DropdownButton<String>(
                                        value: '2025',
                                        items: <String>['2023', '2024', '2025', '2026']
                                            .map((String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(value),
                                          );
                                        }).toList(),
                                        onChanged: (String? newValue) {
                                          // Add your change logic here
                                        },
                                      ),
                                    ],
                                  ),

                                  // Bulan
                                  Row(
                                    children: [
                                      const Icon(Icons.calendar_today, color: Colors.orange),
                                      const SizedBox(width: 8),
                                      DropdownButton<String>(
                                        value: 'Desember',
                                        items: <String>['Januari', 'Februari', 'Maret', 'Desember']
                                            .map((String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(value),
                                          );
                                        }).toList(),
                                        onChanged: (String? newValue) {
                                          // Add your change logic here
                                        },
                                      ),
                                    ],
                                  ),

                                  // Tombol Cari
                                  ElevatedButton(
                                    onPressed: () {
                                      // Add search logic here
                                    },
                                    style: ElevatedButton.styleFrom(
                                      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      backgroundColor: Colors.blue[900],
                                    ),
                                    child: const Text(
                                      'Cari',
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.white
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Image.asset(
                      'images/jumbo.png',
                      height: 600,
                      fit: BoxFit.contain,
                    )
                  ],
                ),
                const SizedBox(height: 60,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('images/Maskapai/Garuda.png'),
                    Image.asset('images/Maskapai/Emirates.png'),
                    Image.asset('images/Maskapai/Etihad.png'),
                    Image.asset('images/Maskapai/Turkish.png'),
                    Image.asset('images/Maskapai/Singapore.png'),
                    Image.asset('images/Maskapai/Qatar.png'),
                  ],
                ),
                const SizedBox(height: 60,),

                // Section Destinasi
                const Row(
                  children: [
                    Text(
                      'Destinasi',
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Montserrat'
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20,),
                GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,  // Jumlah kolom
                    crossAxisSpacing: 16.0,
                    mainAxisSpacing: 20.0,
                    childAspectRatio: 1 / 1.5, // Rasio aspek untuk mengatur lebar/tinggi item
                  ),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(), // Matikan scrolling dalam GridView
                  itemCount: destinations.length, // Jumlah total item
                  itemBuilder: (BuildContext context, int index) {
                    final destination = destinations[index];
                    return Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16.0),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 8.0,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Stack(
                        children: [
                          // Gambar latar belakang
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16.0),
                              image: const DecorationImage(
                                image: AssetImage('images/ListPaket/Bitmap.png'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          // Overlay gradient
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16.0),
                              gradient: LinearGradient(
                                colors: [
                                  Colors.black.withOpacity(0.6),
                                  Colors.transparent,
                                ],
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                              ),
                            ),
                          ),
                          // Konten di atas gambar dan gradien
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                const Spacer(),
                                Container(
                                  padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                                  decoration: BoxDecoration(
                                    color: Colors.orange,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Text(
                                    destination['tours'],
                                    style: const TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontSize: 10,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  destination['title'],
                                  style: const TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 32,
                                    height: 1.2,
                                    letterSpacing: 1.2,
                                    fontWeight: FontWeight.w900,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
                const SizedBox(height: 60,),

                // Section Promo Banner
                const Row(
                  children: [
                    Text(
                      'Eksplorasi Penawaran Kami',
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Montserrat'
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20,),
                Container(
                  height: 417, // Tambahkan height sesuai kebutuhan
                  width: double.infinity, // atau tentukan lebar tertentu
                  // margin: const EdgeInsets.symmetric(horizontal: 20.0), // Tambahkan margin jika perlu
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16.0),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 8.0,
                        offset: Offset(0, 4),
                      ),
                    ],
                    image: const DecorationImage(
                      image: AssetImage('images/promo.png'),
                      fit: BoxFit.cover, // Pastikan gambar mengisi container
                    ),
                  ),
                ),
                const SizedBox(height: 20,), // Tambahkan jarak jika diperlukan

                const SizedBox(height: 60,),
                const Row(
                  children: [
                    Text(
                      'Galeri',
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Montserrat'
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20,),
                GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,  // Jumlah kolom
                    crossAxisSpacing: 24.0,
                    mainAxisSpacing: 24.0,
                    childAspectRatio: 0.3 / 0.2,  // Rasio aspek, sesuaikan dengan kebutuhanmu
                  ),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: galeri.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16.0),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 8.0,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          image: const DecorationImage(
                            image: AssetImage('images/galeri.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    );
                  },
                ),

                const SizedBox(height: 60,),
                Container(
                  height: 384, // Tambahkan height sesuai kebutuhan
                  width: double.infinity, // atau tentukan lebar tertentu
                  // margin: const EdgeInsets.symmetric(horizontal: 20.0), // Tambahkan margin jika perlu
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16.0),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 8.0,
                        offset: Offset(0, 4),
                      ),
                    ],
                    image: const DecorationImage(
                      image: AssetImage('images/hubungi.png'),
                      fit: BoxFit.cover, // Pastikan gambar mengisi container
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'images/turis.png', // Ganti dengan path gambar orang
                        height: 400.0, // Sesuaikan ukuran gambar
                      ),
                      Row(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('Jangan Ragu, Rencanakan Perjalanan Anda Sekarang',
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 20,
                                color: Colors.white
                                ),
                              ),
                              const Text('Konsultasikan Rencana Perjalanan\nAnda Bersama Kami',
                                style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 38,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600
                                ),
                              ),
                              const SizedBox(height: 20,),
                              ElevatedButton(onPressed: (){
                              },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.orange[600],
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0)
                                  )
                                ), child:
                              const Padding(
                                padding: EdgeInsets.all(6.0),
                                child: Text('Hubungi Kami',
                                style:
                                TextStyle(
                                  fontSize: 20,
                                  fontFamily: 'Montserrat',
                                  color: Colors.white
                                ),),
                              )),


                            ],
                          ),
                        ],
                      )

                     ]
                  ),
                ),
                const SizedBox(height: 60,),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'TESTIMONIAL',
                        style: TextStyle(
                          letterSpacing: 20,
                          color: Colors.blue[900],
                        ),
                      ),
                      const SizedBox(height: 14,),
                      const Text(
                        'Testimoni Pelanggan',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 44,
                          fontFamily: 'Montserrat',
                        ),
                      ),
                      const SizedBox(height: 70,),

                      // Menambahkan testimonial widget di sini
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton.outlined(
                            color: Colors.blue[900],
                            onPressed: () {
                              // Aksi untuk testimonial sebelumnya
                            },
                            icon: Icon(Icons.chevron_left_rounded, color: Colors.blue[900]),
                            iconSize: 50,
                          ),
                          SizedBox(
                            width: 700,
                            child: Expanded(
                              child: testimonialWidget(),
                            ),
                          ),
                          IconButton.outlined(
                            onPressed: () {
                              // Aksi untuk testimonial selanjutnya
                            },
                            icon: Icon(Icons.chevron_right_rounded, color: Colors.blue[900]),
                            iconSize: 50,
                          ),
                        ],
                      ),
                    ],

                  )

                ),
                const SizedBox(height: 60,),

              ],
            ),

          ),
        ),
        Center(
          child: Container(
                color: Colors.black,
                padding: const EdgeInsets.only(top: 40.0, left: 20.0, right: 20.0, bottom: 20.0),
                child: Column(
          children: [
            SizedBox(
              width: 1133,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Logo dan Alamat
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        'images/Santafi_White_Logo.png', // Sesuaikan dengan path logo

                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'Ruko Kalimas Blok B No. 22,\n'
                        'Jalan Chairil Anwar,\n'
                        'Margahayu, Bekasi Timur,\n'
                        'Bekasi 17113',
                        style: TextStyle(color: Colors.white,
                        fontFamily: 'Montserrat'),
                      ),
                    ],
                  ),
                  // Informasi
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Informasi',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                            fontFamily: 'Montserrat'
                        ),
                      ),
                      SizedBox(height: 10),
                      Text('Metode Pembayaran', style: TextStyle(color: Colors.white, fontFamily: 'Montserrat')),
                      Text('Syarat Ketentuan', style: TextStyle(color: Colors.white, fontFamily: 'Montserrat')),
                      Text('Kebijakan Privasi', style: TextStyle(color: Colors.white, fontFamily: 'Montserrat')),
                      Text('Blog', style: TextStyle(color: Colors.white, fontFamily: 'Montserrat')),
                      Text('Galeri', style: TextStyle(color: Colors.white, fontFamily: 'Montserrat')),
                    ],
                  ),
                  // Jam Operasional
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Jam Operasional',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text('Senin - Jumat: 10.00 - 19.00', style: TextStyle(color: Colors.white)),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Icon(Icons.phone, color: Colors.white, size: 16),
                          SizedBox(width: 5),
                          Text('0813-8919-9905', style: TextStyle(color: Colors.white)),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Icon(Icons.email, color: Colors.white, size: 16),
                          SizedBox(width: 5),
                          Text('contact@santafi.co.id', style: TextStyle(color: Colors.white)),
                        ],
                      ),
                    ],
                  ),
                  // Follow Us
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Follow Us',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text('Facebook', style: TextStyle(color: Colors.white)),
                      Text('Twitter', style: TextStyle(color: Colors.white)),
                      Text('Instagram', style: TextStyle(color: Colors.white)),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
            const Divider(color: Colors.grey),
            const SizedBox(height: 20),
            const Text(
              'Copyright ©2021 - santafi.co.id',
              style: TextStyle(color: Colors.white),
            ),
          ],
                ),
              ),
        )
      ],
    );
  }
}

// Testimonial Widget
Widget testimonialWidget() {
  return Container(
    width: 1024,
    margin: const EdgeInsets.symmetric(vertical: 20.0,),
    padding: const EdgeInsets.symmetric(vertical: 40.0,),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20.0),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.1),
          blurRadius: 10.0,
          spreadRadius: 5.0,
          offset: const Offset(0, 5),
        ),
      ],
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        const CircleAvatar(
          radius: 70.0,
          backgroundImage: AssetImage('assets/profile_image.png'),
        ),
        const SizedBox(height: 46.0),
        const Text(
          'Irfan Rahmat',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24.0,
          ),
        ),
        const SizedBox(height: 5.0),
        const Text(
          'Travel Enthusiast',
          style: TextStyle(
            color: Colors.grey,
            fontSize: 18,
          ),
        ),
        const SizedBox(height: 10.0),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(5, (index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              child: Icon(
                Icons.star,
                color: Colors.yellow[700],
                size: 20.0,
              ),
            );
          }),
        ),
        const SizedBox(height: 10.0),
        const Text(
          'I love Santafi, this is the best place to buy ticket and help\nyou find your dream holiday.',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.grey,
            fontSize: 24.0,
          ),
        ),
      ],
    ),
  );

}

