import 'package:flutter/material.dart';
import 'header.dart'; // Import the Header

class ArtikelPage extends StatelessWidget {
  const ArtikelPage({super.key});

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
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Artikel',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: Colors.blue[900],
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            // Add your content for DestinasiPage here
            // Example:
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Explore our various destinations and tours.',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
