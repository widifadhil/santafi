import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // Use LayoutBuilder to adjust the layout based on available width
    return LayoutBuilder(
      builder: (context, constraints) {
        // Determine if the screen width is mobile or web
        bool isMobile = constraints.maxWidth < 600;

        return Center(
          child: Container(
            color: const Color(0xFF1B1B1B),
            padding: EdgeInsets.symmetric(
              vertical: isMobile ? 20.0 : 40.0,
              horizontal: isMobile ? 10.0 : 20.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Logo and Address
                if (!isMobile)
                  Center(
                    child: SizedBox(
                      width: 1133,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildLogoAndAddress(),
                          _buildInfoSection(),
                          _buildOperatingHours(),
                          _buildFollowUs(),
                        ],
                      ),
                    ),
                  )
                else
                  Column(
                    children: [
                      _buildLogoAndAddress(),
                      const SizedBox(height: 20),
                      _buildInfoSection(),
                      const SizedBox(height: 20),
                      _buildOperatingHours(),
                      const SizedBox(height: 20),
                      _buildFollowUs(),
                    ],
                  ),
                const SizedBox(height: 40),
                const Divider(color: Colors.grey),
                const SizedBox(height: 20),
                const Center(
                  child: Text(
                    'Copyright ©2021 - santafi.co.id',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildLogoAndAddress() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          'images/Santafi_White_Logo_2.png', // Update the path if needed
          width: 100,
        ),
        const SizedBox(height: 10),
        const Text(
          'Ruko Kalimas Blok B No. 22,\n'
              'Jalan Chairil Anwar,\n'
              'Margahayu, Bekasi Timur,\n'
              'Bekasi 17113',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Montserrat',
          ),
        ),
      ],
    );
  }

  Widget _buildInfoSection() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Informasi',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
            fontFamily: 'Montserrat',
          ),
        ),
        SizedBox(height: 10),
        Text('Metode Pembayaran', style: TextStyle(color: Colors.white, fontFamily: 'Montserrat')),
        Text('Syarat Ketentuan', style: TextStyle(color: Colors.white, fontFamily: 'Montserrat')),
        Text('Kebijakan Privasi', style: TextStyle(color: Colors.white, fontFamily: 'Montserrat')),
        Text('Blog', style: TextStyle(color: Colors.white, fontFamily: 'Montserrat')),
        Text('Galeri', style: TextStyle(color: Colors.white, fontFamily: 'Montserrat')),
      ],
    );
  }

  Widget _buildOperatingHours() {
    return const Column(
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
    );
  }

  Widget _buildFollowUs() {
    return const Column(
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
    );
  }
}
