// Reusable widget for the article card with a "Load More" button pagination
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:santafi/main.dart';



class ArticleCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;
  final String category;
  final bool isLarge;
  final String publishDate;
  final int readCount;
  final VoidCallback onTap; // This is the tap callback

  const ArticleCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.description,
    this.isLarge = false, // Default to false for regular-sized cards
    required this.publishDate,
    required this.readCount,
    required this.category,
    required this.onTap, // Make sure this is passed
  });

  @override
  Widget build(BuildContext context) {
    return InkWell( // Use InkWell to handle taps and show ripple effect
      onTap: onTap, // When tapped, this function will be called
      child: Card(
        elevation: 4,
        color: Colors.white,
        child: SizedBox(
          height: 480,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(imageUrl,
                  fit: BoxFit.fill,
                  height: isLarge ? 300 : 169,
                  width: double.infinity),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      category,
                      style: TextStyle(
                        fontSize: isLarge ? 20 : 12,
                        fontWeight: FontWeight.w200,
                        color: Color(0xFF29C6CF),
                        fontFamily: 'Montserrat',
                        height: 2,
                      ),
                    ),
                    SizedBox(height: 18),
                    AutoSizeText(
                      title,
                      style: TextStyle(
                        fontSize: isLarge ? 20 : 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Montserrat',
                      ),
                      maxLines: isLarge ? 3 : 2,
                      minFontSize: isLarge ? 20 : 18,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 8),
                    AutoSizeText(
                      description,
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Montserrat',
                        height: 1.5,
                      ),
                      maxLines: isLarge ? 7 : 6,
                      minFontSize: 12,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 24),
                    Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          publishDate,
                          style: TextStyle(
                              color: Color(0xFF333333),
                              fontFamily: montserrat,
                              fontSize: 12,
                              fontWeight: FontWeight.w200),
                        ),
                        SizedBox(width: 16),
                        Row(
                          children: [
                            Icon(
                              Icons.visibility_rounded,
                              color: Color(0xFF333333),
                              size: 12,
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Text(
                                '$readCount',
                                style: TextStyle(
                                    color: Color(0xFF333333),
                                    fontFamily: montserrat,
                                    fontSize: 11,
                                    fontWeight: FontWeight.w200)),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}







final List<Map<String, dynamic>> allArticles = [
  {
    'title': 'Panduan Lengkap Umrah untuk Pemula: Langkah Demi Langkah',
    'category': 'Umrah',
    'description':
    'Umrah adalah salah satu perjalanan spiritual yang diimpikan oleh banyak umat Muslim di seluruh dunia. Namun, untuk memastikan perjalanan ini berjalan lancar dan khusyuk, persiapan yang matang sangatlah penting. Dalam artikel ini, kami akan membahas langkah-langkah penting yang perlu Anda lakukan sebelum berangkat Umrah, dari persiapan dokumen hingga tips menjaga kesehatan selama ibadah.'
        '\n\n1. **Persiapan Dokumen:** Pastikan paspor Anda masih berlaku minimal 6 bulan dari tanggal keberangkatan. Selain itu, visa Umrah perlu diurus dengan teliti. Jika Anda menggunakan jasa travel resmi seperti SantaFi, biasanya proses pengurusan visa akan dibantu oleh pihak agen. Jangan lupa untuk membawa salinan paspor, tiket pesawat, dan dokumen lainnya sebagai cadangan.'
        '\n\n2. **Pemilihan Paket Umrah yang Tepat:** Memilih paket Umrah yang sesuai dengan kebutuhan dan budget Anda adalah hal penting lainnya. SantaFi menawarkan berbagai pilihan paket, mulai dari paket hemat hingga paket eksklusif dengan fasilitas premium.'
        '\n\n3. **Persiapan Mental dan Spiritual:** Mulailah memperbanyak ibadah agar hati dan pikiran Anda siap untuk menjalani ibadah Umrah.'
        '\n\n4. **Kesehatan dan Vaksinasi:** Pastikan kondisi kesehatan Anda dalam keadaan baik sebelum berangkat. Lakukan pemeriksaan kesehatan secara menyeluruh dan konsultasikan dengan dokter mengenai vaksinasi yang diperlukan.'
        '\n\n5. **Tips Packing:** Packing untuk Umrah berbeda dengan packing untuk perjalanan biasa. Pastikan Anda membawa perlengkapan seperti sandal yang nyaman dan masker.'
        '\n\n6. **Menjaga Etika dan Adab Selama Umrah:** Jaga perilaku, hormati sesama jamaah, dan hindari tindakan yang bisa mengganggu kenyamanan orang lain.'
        '\n\n7. **Mengenal Kota Suci:** Selain melaksanakan ibadah Umrah, sempatkan diri Anda untuk menjelajahi keindahan dan sejarah kota suci Makkah dan Madinah.'
        '\n\n**Kesimpulan:** Persiapan yang baik adalah kunci untuk menjalani ibadah Umrah dengan tenang dan khusyuk. Dengan mengikuti panduan di atas, Anda dapat memastikan bahwa perjalanan spiritual Anda akan menjadi pengalaman yang tak terlupakan.',
    'imageUrl': 'images/thumbnail.png',
    'publishDate': '12 Jan 2024',
    'readCount': 1250,
  },
  {
    'title': 'Tips Wisata Halal Domestik',
    'category': 'Domestik',
    'description':
    'Menyajikan wisata halal di berbagai destinasi dalam negeri, artikel ini membahas tempat-tempat wisata yang menawarkan fasilitas ramah Muslim, seperti masjid, tempat wudhu, dan restoran halal. Jelajahi keindahan alam Indonesia sambil tetap menjalankan kewajiban ibadah dengan nyaman.',
    'imageUrl': 'images/ArticleThumbnail/thumbnail2.png',
    'publishDate': '5 Feb 2024',
    'readCount': 980,
  },
  {
    'title': 'Perjalanan Mancanegara yang Inspiratif',
    'category': 'Mancanegara',
    'description':
    'Jelajahi keindahan dunia dengan perspektif wisata halal. Temukan destinasi mancanegara yang tidak hanya menawarkan pemandangan spektakuler, tetapi juga menyediakan layanan ramah Muslim. Mulai dari akomodasi hingga pilihan makanan halal, perjalanan Anda akan terasa lebih nyaman dan bermakna.',
    'imageUrl': 'images/ArticleThumbnail/thumbnail3.png',
    'publishDate': '20 Feb 2024',
    'readCount': 1345,
  },
  {
    'title': 'Panduan Haji 2024',
    'category': 'Haji',
    'description':
    'Persiapan lengkap untuk menjalankan ibadah haji di tahun 2024. Artikel ini mencakup informasi tentang prosedur pendaftaran, perlengkapan yang diperlukan, serta persiapan mental dan spiritual. Dapatkan juga panduan untuk menjalani ibadah haji dengan khusyuk dan penuh berkah.',
    'imageUrl': 'images/ArticleThumbnail/thumbnail4.png',
    'publishDate': '15 Mar 2024',
    'readCount': 1900,
  },
  {
    'title': 'Umrah di Tengah Pandemi',
    'category': 'Umrah',
    'description':
    'Cara melaksanakan umrah dengan aman dan nyaman di masa pandemi. Panduan ini mencakup protokol kesehatan yang harus diikuti, tips menjaga kesehatan selama perjalanan, serta perubahan aturan terkait ibadah Umrah di masa COVID-19.',
    'imageUrl': 'images/ArticleThumbnail/thumbnail5.png',
    'publishDate': '22 Mar 2024',
    'readCount': 840,
  },
  {
    'title': 'Tips Hemat Wisata di Musim Liburan',
    'category': 'Domestik',
    'description':
    'Cara berwisata hemat saat liburan panjang. Temukan cara mengelola anggaran perjalanan Anda tanpa mengorbankan kenyamanan. Dari pilihan transportasi hingga akomodasi, artikel ini memberikan berbagai trik untuk menikmati liburan yang menyenangkan dengan biaya yang efisien.',
    'imageUrl': 'images/ArticleThumbnail/thumbnail6.png',
    'publishDate': '1 Apr 2024',
    'readCount': 1600,
  },
  {
    'title': 'Wisata Kuliner Halal di Mancanegara',
    'category': 'Mancanegara',
    'description':
    'Panduan mencari kuliner halal di berbagai negara. Artikel ini membahas restoran halal di destinasi populer mancanegara, bagaimana cara menemukan makanan yang sesuai dengan syariat Islam, dan rekomendasi aplikasi pencari restoran halal yang dapat mempermudah perjalanan Anda.',
    'imageUrl': 'images/ArticleThumbnail/thumbnail7.png',
    'publishDate': '10 Apr 2024',
    'readCount': 1340,
  },
  {
    'title': 'Tempat Wisata Halal Terbaik di Indonesia',
    'category': 'Domestik',
    'description':
    'Destinasi wisata halal terbaik di Indonesia yang wajib dikunjungi. Mulai dari Sabang hingga Merauke, Indonesia menawarkan keindahan alam yang tak tertandingi sekaligus kemudahan dalam menjalankan ibadah bagi umat Muslim.',
    'imageUrl': 'images/ArticleThumbnail/thumbnail8.png',
    'publishDate': '18 Apr 2024',
    'readCount': 920,
  },
  {
    'title': 'Umrah dengan Budget Terbatas: Tips dan Trik',
    'category': 'Umrah',
    'description':
    'Tips dan trik melakukan umrah dengan anggaran yang terbatas. Temukan cara memaksimalkan dana Anda tanpa mengorbankan kenyamanan dan kualitas ibadah. Artikel ini memberikan informasi tentang paket-paket umrah murah dan bagaimana menghemat selama perjalanan.',
    'imageUrl': 'images/ArticleThumbnail/thumbnail9.png',
    'publishDate': '25 Apr 2024',
    'readCount': 1100,
  },
  {
    'title': 'Haji: Langkah-langkah Penting untuk Persiapan Spiritual',
    'category': 'Haji',
    'description':
    'Panduan untuk persiapan spiritual yang lebih baik sebelum Haji. Dari memperdalam ilmu agama hingga membersihkan hati dan niat, artikel ini memberikan langkah-langkah penting untuk menjalani ibadah haji dengan lebih khusyuk dan bermakna.',
    'imageUrl': 'images/ArticleThumbnail/thumbnail2.png',
    'publishDate': '30 Apr 2024',
    'readCount': 1450,
  },
  {
    'title': 'Pengalaman Spiritual di Tanah Suci',
    'category': 'Umrah',
    'description':
    'Berbagai pengalaman spiritual yang bisa dirasakan selama berada di tanah suci. Artikel ini membahas tempat-tempat penting di sekitar Masjidil Haram dan Masjid Nabawi yang bisa memberikan pengalaman spiritual yang mendalam bagi setiap jemaah.',
    'imageUrl': 'images/ArticleThumbnail/thumbnail2.png',
    'publishDate': '7 May 2024',
    'readCount': 1575,
  },
  {
    'title': 'Wisata Religi di Indonesia: Destinasi Terbaik',
    'category': 'Domestik',
    'description':
    'Artikel ini menyajikan destinasi wisata religi di Indonesia yang menarik untuk dikunjungi. Mulai dari Masjid Istiqlal hingga Masjid Agung Jawa Tengah, setiap tempat memiliki keunikan dan nilai sejarah yang tinggi.',
    'imageUrl': 'images/ArticleThumbnail/thumbnail2.png',
    'publishDate': '15 May 2024',
    'readCount': 1200,
  },
  {
    'title': 'Keindahan Alam yang Menenangkan di Wisata Mancanegara',
    'category': 'Mancanegara',
    'description':
    'Nikmati ketenangan alam dengan wisata halal di luar negeri. Artikel ini menjelaskan tempat-tempat indah dan menenangkan yang cocok untuk relaksasi dan spiritual healing, sambil tetap mendapatkan fasilitas halal.',
    'imageUrl': 'images/ArticleThumbnail/thumbnail2.png',
    'publishDate': '25 May 2024',
    'readCount': 900,
  },
  {
    'title': 'Mempersiapkan Umrah: Persiapan Mental dan Fisik',
    'category': 'Umrah',
    'description':
    'Persiapan mental dan fisik yang diperlukan untuk menjalankan ibadah Umrah. Artikel ini memberikan panduan langkah demi langkah mulai dari menjaga kebugaran tubuh hingga mempersiapkan hati untuk beribadah.',
    'imageUrl': 'images/ArticleThumbnail/thumbnail2.png',
    'publishDate': '1 Jun 2024',
    'readCount': 1340,
  },
  {
    'title': 'Eksplorasi Wisata Halal di Benua Eropa',
    'category': 'Mancanegara',
    'description':
    'Temukan destinasi wisata halal di Benua Eropa yang semakin berkembang. Dari kota-kota besar seperti London dan Paris, hingga tempat-tempat tersembunyi yang menawarkan keindahan dan keramahan terhadap wisatawan Muslim.',
    'imageUrl': 'images/ArticleThumbnail/thumbnail2.png',
    'publishDate': '10 Jun 2024',
    'readCount': 980,
  },
  {
    'title': 'Keutamaan Ibadah Haji: Perspektif Spiritual dan Historis',
    'category': 'Haji',
    'description':
    'Artikel ini mengulas keutamaan ibadah haji dari perspektif spiritual dan historis. Jelaskan perjalanan panjang umat Muslim dari berbagai belahan dunia dalam menunaikan salah satu rukun Islam ini.',
    'imageUrl': 'images/ArticleThumbnail/thumbnail2.png',
    'publishDate': '20 Jun 2024',
    'readCount': 2100,
  },
  {
    'title': 'Umrah di Musim Dingin: Persiapan dan Tantangan',
    'category': 'Umrah',
    'description':
    'Melaksanakan Umrah di musim dingin memiliki tantangan tersendiri. Artikel ini memberikan panduan lengkap mengenai persiapan yang harus dilakukan, mulai dari perlengkapan yang dibawa hingga tips menjaga kesehatan di cuaca dingin.',
    'imageUrl': 'images/ArticleThumbnail/thumbnail2.png',
    'publishDate': '30 Jun 2024',
    'readCount': 880,
  },
  {
    'title': 'Menemukan Wisata Halal di Jepang: Panduan Lengkap',
    'category': 'Mancanegara',
    'description':
    'Jepang semakin ramah terhadap wisatawan Muslim dengan berbagai fasilitas halal. Temukan restoran halal, masjid, serta tempat-tempat wisata yang memberikan kemudahan bagi wisatawan Muslim di negeri sakura.',
    'imageUrl': 'images/ArticleThumbnail/thumbnail2.png',
    'publishDate': '5 Jul 2024',
    'readCount': 1500,
  },
  {
    'title': 'Panduan Lengkap Menjalankan Ibadah Haji di Tahun 2024',
    'category': 'Haji',
    'description':
    'Panduan praktis dan lengkap untuk menjalankan ibadah Haji di tahun 2024. Artikel ini mencakup persiapan, proses haji, hingga tips selama berada di tanah suci untuk memastikan kelancaran ibadah Anda.',
    'imageUrl': 'images/ArticleThumbnail/thumbnail2.png',
    'publishDate': '15 Jul 2024',
    'readCount': 2150,
  },
];