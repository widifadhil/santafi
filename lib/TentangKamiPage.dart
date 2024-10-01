import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:santafi/Footer.dart';
import 'package:santafi/main.dart';
import 'header.dart'; // Import the Header

class TentangKamiPage extends StatelessWidget {
  const TentangKamiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(100),
          child: Header(), // Reuse the Header widget here
        ),
        body: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          // Hero Section
          Stack(
            children: [
              Container(
                height: 663,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                        'images/TentangKami.png'), // Background image
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40), // Adjust as needed
                    bottomRight: Radius.circular(40),
                  ),
                ),
              ),
              // Centering the Text
              Positioned.fill(
                child: Center(
                  child: Column(
                    mainAxisAlignment:
                        MainAxisAlignment.center, // Center vertically
                    crossAxisAlignment:
                        CrossAxisAlignment.center, // Center horizontally
                    children: [
                      Text(
                        'PT. SANTAFI SUKSES MANDIRI',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            letterSpacing: 1.5,
                            fontWeight: FontWeight.w400,
                            fontFamily: plusjakartasans),
                      ),
                      SizedBox(height: 8), // Space between lines
                      Text(
                        'Mitra Terpercaya untuk Haji, Umrah,\n dan Wisata Domestik/Mancanegara',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 62,
                            fontWeight: FontWeight.bold,
                            height: 1.2, // Adjust line spacing
                            fontFamily: plusjakartasans),
                        textAlign: TextAlign.center, // Center text
                      ),
                      SizedBox(height: 16), // Space between text and subtitle
                      Text(
                        'Dengan pengalaman melayani lebih dari 12.000 pelanggan, kami memastikan setiap perjalanan spiritual \nke Tanah Suci dan wisata dunia menjadi istimewa dan tak terlupakan.',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            height: 1.5, // Adjust line spacing
                            fontFamily: plusjakartasans,
                            fontWeight: FontWeight.w200),
                        textAlign: TextAlign.center, // Center text
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),

          // Info Section
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InfoCard(label: '+10,000', description: 'Pelanggan'),
                InfoCard(label: '+12', description: 'Tour Guide'),
                InfoCard(label: '+20', description: 'Pilih Paket'),
              ],
            ),
          ),

          const SizedBox(height: 20),
          // About Section
          Container(
            color: Color(0xFFF4F7FA),
            height:
                MediaQuery.of(context).size.height * 0.60, // Responsive height
            child: Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.70,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // Left Column with Text
                          Expanded(
                            flex: 1,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  RichText(
                                    text: TextSpan(
                                      style: TextStyle(
                                        fontSize: 36,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                      children: [
                                        TextSpan(
                                          text: 'SantaFi Travel',
                                          style: TextStyle(
                                            color: Colors.orange,
                                            fontFamily:
                                                'Montserrat', // Ensure this is defined
                                            fontWeight: FontWeight.w900,
                                            fontSize: 36,
                                          ),
                                        ),
                                        TextSpan(
                                          text:
                                              ' Terpercaya untuk \nUmrah, Haji, dan Wisata \nInternasional.',
                                          style: TextStyle(
                                            fontSize: 36,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                            fontFamily: 'Montserrat',
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 12),
                                  Text(
                                    'Quis ultricies morbi sed et aliquam gravida eget iaculis. Risus \ndictum non quis interdum lorem sed aliquam. '
                                    'Fames \nrhoncus aliquam sem ac faucibus neque parturient morbi. \nVulputate rhoncus euismod lacinia nec dis turpis. '
                                    'Cursus \ntellus etiam cum purus id varius. Diam ac risus tincidunt \nauctor nunc ut.'
                                    'Nunc duis tristique quam diam. Praesent \ninteger in nisi diam at nulla. Ornare amet eu dapibus sit tellus \na tortor maecenas libero.',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          // Right Column with Image
                          Expanded(
                            flex: 1,
                            child: Column(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.asset(
                                    'images/About.png', // Replace with your image path
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                // Social Media Icons Row
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    FaIcon(FontAwesomeIcons.facebookF,
                                        size: 16, color: Colors.black),
                                    SizedBox(width: 8),
                                    Text('Facebook',
                                        style: TextStyle(fontSize: 16)),
                                    SizedBox(width: 24),
                                    FaIcon(FontAwesomeIcons.xTwitter,
                                        size: 16, color: Colors.black),
                                    SizedBox(width: 8),
                                    Text('Twitter',
                                        style: TextStyle(fontSize: 16)),
                                    SizedBox(width: 24),
                                    FaIcon(FontAwesomeIcons.instagram,
                                        size: 16, color: Colors.black),
                                    SizedBox(width: 8),
                                    Text('Instagram',
                                        style: TextStyle(fontSize: 16)),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
                    ],
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(height: 67),
          // Services Section
          Center(
            child: Text(
              'Kami Menawarkan Layanan Terbaik',
              style: TextStyle(
                  fontFamily: plusjakartasans,
                  fontSize: 40,
                  fontWeight: FontWeight.w600),
            ),
          ),
          const SizedBox(height: 20),
          Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  // Card 1
                  Expanded(
                    child: FeatureCard(
                      imagePath: 'images/IconService/Piala.png',
                      title: 'Kualitas Terbaik',
                      description:
                          'Dapatkan kualitas \nterbaik untuk setiap \npaket perjalanan.',
                    ),
                  ),
                  SizedBox(width: 20),
                  // Card 2
                  Expanded(
                    child: FeatureCard(
                      imagePath: 'images/IconService/Pilihan.png',
                      title: 'Pilihan Luas',
                      description:
                          'Melayani kebutuhan \nperjalanan umrah, haji, wisata dan sebagainya.',
                    ),
                  ),
                  SizedBox(width: 20),
                  // Card 3
                  Expanded(
                    child: FeatureCard(
                      imagePath: 'images/IconService/Pendamping.png',
                      title: 'Pendamping Professional',
                      description: 'Dukungan tim \nberpengalaman.',
                    ),
                  ),
                  SizedBox(width: 20),
                  // Card 4
                  Expanded(
                    child: FeatureCard(
                      imagePath: 'images/IconService/Terpercaya.png',
                      title: 'Terpercaya & Bersertifikat',
                      description:
                          'Kualitas terbaik untuk \nsetiap paket perjalanan.',
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 67),

          // Facilities Section
          Column(
            children: [
              Center(
                child: Text(
                  'Fasilitas',
                  style: TextStyle(
                      fontFamily: plusjakartasans,
                      fontSize: 40,
                      fontWeight: FontWeight.w600),
                ),
              ),
              Center(
                child: Text(
                  'Fasilitas Lengkap untuk Kenyamanan Pelanggan',
                  style: TextStyle(
                      fontFamily: plusjakartasans,
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                ),
              )
            ],
          ),
          const SizedBox(height: 20),
          Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: Row(
                children: [
                  Expanded(
                    child: GridView.count(
                      crossAxisCount: 4,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      childAspectRatio: 1.8,
                      shrinkWrap:
                          true, // Important to allow GridView to shrink and work with constrained height
                      physics:
                          NeverScrollableScrollPhysics(), // Prevent GridView from scrolling inside Row
                      children: [
                        FacilityCard(
                          title: 'Konsumsi',
                          description:
                              'Penyediaan makanan halal yang berkualitas.',
                          icon: Icons.restaurant,
                        ),
                        FacilityCard(
                          title: 'Pengurusan  Visa',
                          description: 'Pengurusan visa cepat dan efisien.',
                          icon: Icons.card_travel,
                        ),
                        FacilityCard(
                          title: 'Perlengkapan Umrah',
                          description:
                              'Perlengkapan lengkap untuk keperluan Umrah.',
                          icon: Icons.luggage_rounded,
                        ),
                        FacilityCard(
                          title: 'Tiket Pesawat',
                          description:
                              'Tiket penerbangan dengan maskapai terpercaya.',
                          icon: Icons.airplane_ticket_rounded,
                        ),
                        FacilityCard(
                          title: 'Tour Guide',
                          description:
                              'Pemandu berpengalaman yang siap membantu',
                          icon: Icons.tour_rounded,
                        ),
                        FacilityCard(
                          title: 'Hotel Penginapan',
                          description: 'Akomodasi nyaman dan strategis.',
                          icon: Icons.hotel_rounded,
                        ),
                        FacilityCard(
                          title: 'Transportasi',
                          description:
                              'Layanan transportasi yang aman dan nyaman..',
                          icon: Icons.directions_bus_filled_rounded,
                        ),
                        FacilityCard(
                          title: 'Dokumentasi',
                          description:
                              'Dokumentasi perjalanan untuk mengabadikan momen.',
                          icon: Icons.camera,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 67),

          // Izin Resmi Sertifikasi
          Center(
            child: Text(
              'Berizin Resmi dan Tersertifikasi.',
              style: TextStyle(
                  fontFamily: plusjakartasans,
                  fontSize: 40,
                  fontWeight: FontWeight.w600),
            ),
          ),
          const SizedBox(height: 20),
          Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: Row(
                children: [
                  Expanded(
                    child: GridView.count(
                      crossAxisCount: 5,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      childAspectRatio: 2.0,
                      shrinkWrap:
                          true, // Important to allow GridView to shrink and work with constrained height
                      physics:
                          NeverScrollableScrollPhysics(), // Prevent GridView from scrolling inside Row
                      children: [
                        IzinCard(
                          imagePath: 'images/kemenag.png',
                        ),
                        IzinCard(
                          imagePath: 'images/sisko.jpeg',
                        ),
                        IzinCard(
                          imagePath: 'images/logo_bnsp.png',
                        ),
                        IzinCard(
                          imagePath: 'images/sisko.jpeg',
                        ),
                        IzinCard(
                          imagePath: 'images/logo_bnsp.png',
                        ),

                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 100),
          Footer()
        ])));
  }
}

class InfoCard extends StatelessWidget {
  final String label;
  final String description;

  const InfoCard({
    super.key,
    required this.label,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Label (e.g., "+10,000")
        Text(
          label,
          style: TextStyle(
              fontSize: 48, // Adjust the font size for the label
              fontWeight: FontWeight.bold, // Adjust font weight for label
              color: Colors.black, // Customize color if needed
              fontFamily: montserrat),
        ),
        SizedBox(height: 10), // Space between label and description
        // Description (e.g., "Pelanggan")
        Text(
          description,
          style: TextStyle(
            fontSize: 18, // Adjust font size for description
            fontWeight: FontWeight.normal, // Customize weight for description
            color: Colors.grey[600], // Change color if necessary
          ),
        ),
      ],
    );
  }
}

class FeatureCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;

  const FeatureCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300, // Adjust based on your needs
      width: 200,
      child: Card(
        color: Colors.white,
        elevation: 8.0,
        shadowColor: Colors.black.withOpacity(0.4),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Image/Icon at the top
              Image.asset(
                imagePath, // Load image from assets
                height: 80, // Set image size
                width: 72,
              ),
              SizedBox(height: 30),
              // Title
              Text(
                title,
                style: TextStyle(
                  fontFamily: plusjakartasans,
                  letterSpacing: 0.34,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 10),
              // Description
              Text(
                description,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[700],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FacilityCard extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;

  const FacilityCard({
    super.key,
    required this.title,
    required this.description,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 8,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, size: 50, color: Colors.orange),
            const SizedBox(height: 8),
            Text(
              title,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  fontFamily: plusjakartasans,
                  fontSize: 20),
            ),
            const SizedBox(height: 4),
            Text(
              description,
              textAlign: TextAlign.left,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  fontFamily: plusjakartasans),
            ),
          ],
        ),
      ),
    );
  }
}

class IzinCard extends StatelessWidget {
  final String imagePath;

  const IzinCard({
    super.key,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100, // Adjust based on your needs
      width: 200,
      child: Card(
        color: Colors.white,
        elevation: 8.0,
        shadowColor: Colors.black.withOpacity(0.4),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Image/Icon at the top
              Image.asset(
                imagePath, // Load image from assets
                height: 100, // Set image size
                width: 100,
              ),
              // Title
            ],
          ),
        ),
      ),
    );
  }
}
