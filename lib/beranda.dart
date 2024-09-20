import 'package:flutter/material.dart';
import 'package:santafi/SearchWidget.dart';
import 'package:santafi/galeri_widget.dart';
import 'package:santafi/Footer.dart';
import 'testimonial_widget.dart';
import 'package:santafi/Header.dart';


class BerandaPage extends StatefulWidget {
  final String tahun;
  final String kategori;
  const BerandaPage({super.key, this.tahun = 'Default Year', this.kategori = 'Default Category', });

  @override
  State<BerandaPage> createState() => _BerandaPageState();
}

class _BerandaPageState extends State<BerandaPage> {
  String selectedCategory = 'Semua Paket'; // Default to 'All' for no category filter
  String selectedYear = 'Semua Tahun'; // Default value for Year
  String selectedMonth = 'Semua Bulan';

  void _updateFilters(String? category, String? year, String? month) {
    setState(() {
      selectedCategory = category ?? 'Semua Paket';
      selectedYear = year ?? 'Semua Tahun';
      selectedMonth = month ?? 'Semua Bulan';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: Header(), // Reuse the Header widget here
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: SizedBox(
                width: 1283,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      alignment: Alignment.topLeft,
                      children: [
                        // Perjalanan bersama
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 75),
                            // Headline
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Perjalanan\nBerharga Bersama',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 70,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'PlusJakartaSans'),
                                  ),
                                  TextSpan(
                                    text: '\nSantaFi.',
                                    style: TextStyle(
                                        color: Colors.orange[700],
                                        fontSize: 70,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'PlusJakartaSans'),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 30),
                            // Subheadline
                            Text(
                              'Bersama SantaFi Travel, wujudkan impian ibadah Umrah, Haji, '
                                  'dan wisata halal\nke berbagai destinasi domestik dan internasional '
                                  'dengan layanan terbaik.',
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 18,
                                  fontFamily: 'PlusJakartaSans',
                                  fontWeight: FontWeight.w400),
                            ),
                            SizedBox(height: 80),
                            // Search Bar
                            SearchWidget(
                            ),
                          ],
                        ),
                        Container(
                          alignment: Alignment(1.0, -0.75),
                          child: Image.asset(
                            'images/jumbo.png',
                            height: 672,
                            fit: BoxFit.contain,
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 60),
                    // Maskapai
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
                    SizedBox(height: 60),
                    // Section Destinasi
                    Row(
                      children: [
                        Text(
                          'Destinasi',
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Montserrat'),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),

                    SizedBox(height: 60),
                    // Section Promo Banner
                    Row(
                      children: [
                        Text(
                          'Eksplorasi Penawaran Kami',
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Montserrat'),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Container(
                      height: 417,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 8.0,
                            offset: Offset(0, 4),
                          ),
                        ],
                        image: DecorationImage(
                          image: AssetImage('images/promo.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    SizedBox(height: 60),
                    Row(
                      children: [
                        Text(
                          'Galeri',
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Montserrat'),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    GaleriWidget(),
                    SizedBox(height: 60),
                    Container(
                      height: 384,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 8.0,
                            offset: Offset(0, 4),
                          ),
                        ],
                        image: DecorationImage(
                          image: AssetImage('images/hubungi.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'images/turis.png',
                              height: 400.0,
                            ),
                            Row(
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Jangan Ragu, Rencanakan Perjalanan Anda Sekarang',
                                      style: TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontSize: 20,
                                          color: Colors.white),
                                    ),
                                    Text(
                                      'Konsultasikan Rencana Perjalanan\nAnda Bersama Kami',
                                      style: TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontSize: 38,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    SizedBox(height: 20),
                                    ElevatedButton(
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.orange[600],
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10.0),
                                        ),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.all(6.0),
                                        child: Text(
                                          'Hubungi Kami',
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontFamily: 'Montserrat',
                                              color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            )
                          ]),
                    ),
                    SizedBox(height: 60),
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
                            SizedBox(height: 14),
                            Text(
                              'Testimoni Pelanggan',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 44,
                                fontFamily: 'Montserrat',
                              ),
                            ),
                            SizedBox(height: 70),
                            // Menambahkan testimonial widget di sini
                            Stack(
                              alignment: Alignment.center,
                              children: [
                                // Left IconButton
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: IconButton.outlined(
                                    color: Colors.blue[900],
                                    onPressed: () {
                                      // Action for previous testimonial
                                    },
                                    icon: Icon(Icons.chevron_left_rounded, color: Colors.blue[900]),
                                    iconSize: 50,
                                  ),
                                ),
                                // Testimonial Widget
                                SizedBox(
                                  width: 700,
                                  child: testimonialWidget(),
                                ),
                                // Right IconButton
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: IconButton.outlined(
                                    onPressed: () {
                                      // Action for next testimonial
                                    },
                                    icon: Icon(Icons.chevron_right_rounded, color: Colors.blue[900]),
                                    iconSize: 50,
                                  ),
                                ),
                              ],
                            )
                          ],
                        )),
                    SizedBox(height: 60),
                  ],
                ),
              ),
            ),
            Footer()
          ],
        ),
      ),
    );
  }
}
