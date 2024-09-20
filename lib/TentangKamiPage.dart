import 'package:flutter/material.dart';
import 'header.dart'; // Import the Header

class TentangKamiPage extends StatelessWidget {
  const TentangKamiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: Header(), // Reuse the Header widget here
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Hero Section
            Stack(
              children: [
                Image.asset(
                  'assets/your_background_image.png', // Use your background image here
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Container(
                  height: 400, // Adjust as needed
                  width: double.infinity,
                  color: Colors.black.withOpacity(0.5), // Dark overlay
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Mitra Terpercaya untuk Haji, Umrah, dan Wisata Domestik/Mancanegara',
                        style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Dengan pengalaman melayani lebih dari 12.000 pelanggan...',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: Colors.white70,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {},
                        child: const Text('Lihat Selengkapnya'),
                      ),
                    ],
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

            // About Section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          text: TextSpan(
                            text: 'SantaFi Travel ',
                            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                              color: Colors.orange,
                              fontWeight: FontWeight.bold,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: 'Terpercaya untuk Umrah, Haji, dan Wisata Internasional.',
                                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'Quis ultricies morbi sed et aliquam gravida eget iaculis...',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 16),
                  Image.asset(
                    'assets/your_image.png', // Replace with your image
                    width: 150,
                    height: 150,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ),

            // Services Section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Kami Menawarkan Layanan Terbaik',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  GridView.count(
                    shrinkWrap: true,
                    crossAxisCount: 4,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    children: const [
                      ServiceCard(
                        icon: Icons.star,
                        title: 'Kualitas Terbaik',
                        description: 'Dapatkan kualitas terbaik untuk setiap paket perjalanan.',
                      ),
                      ServiceCard(
                        icon: Icons.check,
                        title: 'Pilihan Luas',
                        description: 'Melayani kebutuhan perjalanan umrah, haji, wisata.',
                      ),
                      ServiceCard(
                        icon: Icons.people,
                        title: 'Pendamping Profesional',
                        description: 'Dukungan tim berpengalaman.',
                      ),
                      ServiceCard(
                        icon: Icons.verified,
                        title: 'Terpercaya & Bersertifikat',
                        description: 'Kualitas terbaik untuk setiap paket perjalanan.',
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Facilities Section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Fasilitas',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  GridView.count(
                    shrinkWrap: true,
                    crossAxisCount: 3,
                    childAspectRatio: 2,
                    children: const [
                      FacilityCard(title: 'Konsumsi', description: 'Penyediaan makanan halal.', icon: Icons.restaurant),
                      FacilityCard(title: 'Pengurusan Visa', description: 'Visa tepat waktu.', icon: Icons.book),
                      FacilityCard(title: 'Perlengkapan Umrah', description: 'Perlengkapan lengkap.', icon: Icons.backpack),
                      FacilityCard(title: 'Tiket Pesawat', description: 'Tiket penerbangan mudah.', icon: Icons.airplane_ticket),
                      FacilityCard(title: 'Tour Guide', description: 'Pemandu berpengalaman.', icon: Icons.person),
                      FacilityCard(title: 'Hotel Penginapan', description: 'Akomodasi nyaman.', icon: Icons.hotel),
                      FacilityCard(title: 'Transportasi', description: 'Transportasi lengkap.', icon: Icons.directions_bus),
                      FacilityCard(title: 'Dokumentasi', description: 'Dokumentasi perjalanan.', icon: Icons.camera),
                    ],
                  ),
                ],
              ),
            ),

            // Certification Section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Text(
                    'Berizin Resmi dan Tersertifikasi',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset('assets/certification1.png', width: 60),
                      Image.asset('assets/certification2.png', width: 60),
                      Image.asset('assets/certification3.png', width: 60),
                      Image.asset('assets/certification4.png', width: 60),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  final String label;
  final String description;

  const InfoCard({super.key, 
    required this.label,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Text(description),
      ],
    );
  }
}

class ServiceCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const ServiceCard({super.key, 
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Icon(icon, size: 40, color: Colors.orange),
            const SizedBox(height: 8),
            Text(
              title,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text(
              description,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}

class FacilityCard extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;

  const FacilityCard({super.key, 
    required this.title,
    required this.description,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 30, color: Colors.orange),
            const SizedBox(height: 8),
            Text(
              title,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text(
              description,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}
