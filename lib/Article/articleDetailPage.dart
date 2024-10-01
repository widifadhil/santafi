import 'package:flutter/material.dart';
import 'package:santafi/Header.dart';
import 'package:santafi/main.dart';

class ArticleDetailPage extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;
  final String publishDate;
  final int readCount;
  final String category;

  const ArticleDetailPage({
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.publishDate,
    required this.readCount,
    required this.category,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xFFFAFBFC),
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: Header(),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: SizedBox(
            width: screenWidth * 0.75, // Responsive width
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                _buildBreadcrumbs(context),  // Breadcrumbs with navigation
                const SizedBox(height: 48.0),
                _buildArticleContent(context),  // Main article content
                const SizedBox(height: 20),
                _buildRelatedArticles(),  // Related articles
                const SizedBox(height: 40),
                _buildSocialButtons(),  // Share and like buttons
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Breadcrumbs with clickable navigation
  Widget _buildBreadcrumbs(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () => Navigator.pop(context), // Navigate back to the homepage
          child: const Text(
            'Beranda',
            style: TextStyle(
                color: Color(0xFFFE6D00),
                fontFamily: montserrat,
                fontWeight: FontWeight.w400,
                fontSize: 14),
          ),
        ),
        const Icon(Icons.chevron_right_rounded),
        const Text(
          'Artikel',
          style: TextStyle(
              color: Color(0xFFFE6D00),
              fontFamily: montserrat,
              fontWeight: FontWeight.w400,
              fontSize: 14),
        ),
        const Icon(Icons.chevron_right_rounded),
        Expanded(
          child: Text(
            title,
            style: const TextStyle(
                color: Color(0xFF000000),
                fontFamily: montserrat,
                fontWeight: FontWeight.w400,
                fontSize: 14),
            overflow: TextOverflow.ellipsis,  // Handle long titles
          ),
        ),
      ],
    );
  }

  // Main article content with image and details
  Widget _buildArticleContent(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildImage(),  // Improved image with error and loading handling
                const SizedBox(height: 16),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Published on $publishDate',
                  style: const TextStyle(fontSize: 16, color: Colors.grey),
                ),
                const SizedBox(height: 8),
                Text(
                  'Category: $category',
                  style: const TextStyle(fontSize: 16, color: Colors.blue),
                ),
                const SizedBox(height: 16),
                Text(
                  description,
                  style: const TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    const Icon(Icons.visibility_rounded),
                    const SizedBox(width: 8),
                    Text('$readCount reads'),
                  ],
                ),
              ],
            ),
          ),
        ),
        if (screenWidth > 768) // Only show sidebar on larger screens
          Expanded(
            flex: 1,
            child: Container(
              padding: const EdgeInsets.all(16.0),
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Form Konsultasi Perjalanan',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Column(
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Nama Lengkap',
                          hintText: 'John D',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Whatsapp',
                          hintText: '08******',
                          border: OutlineInputBorder(),
                        ),
                        keyboardType: TextInputType.phone,
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Catatan',
                          hintText: 'Rencana Keberangkatan apa?',
                          border: OutlineInputBorder(),
                        ),
                        maxLines: 4,
                      ),
                    ],
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        print('kirim');
                        // Handle send action here
                      },
                      child: const Text('Kirim'),
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    '* Kami menjamin kerahasiaan data Anda.',
                    style: TextStyle(color: Colors.red),
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }

  // Handle image loading with placeholders and error fallback
  Widget _buildImage() {
    return Image.network(
      imageUrl,
      fit: BoxFit.cover,
      width: 840,
      height: 300,
      errorBuilder: (context, error, stackTrace) {
        return const Icon(Icons.error, size: 100, color: Colors.red);
      },
    );
  }

  // Add related articles section at the bottom
  Widget _buildRelatedArticles() {
    // Sample data for related articles
    final List<Map<String, String>> relatedArticles = [
      {
        'title': 'Related Article 1',
        'imageUrl': 'https://example.com/related1.jpg',
      },
      {
        'title': 'Related Article 2',
        'imageUrl': 'https://example.com/related2.jpg',
      },
      {
        'title': 'Related Article 3',
        'imageUrl': 'https://example.com/related3.jpg',
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Related Articles',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: relatedArticles.map((article) {
            return Expanded(
              child: Column(
                children: [
                  Image.network(
                    article['imageUrl']!,
                    fit: BoxFit.cover,
                    height: 100,
                    width: 100,
                  ),
                  const SizedBox(height: 8),
                  Text(article['title']!,
                      style: const TextStyle(fontSize: 16),
                      textAlign: TextAlign.center),
                ],
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  // Add social media share and like buttons
  Widget _buildSocialButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ElevatedButton.icon(
          onPressed: () {
            // Add share functionality here
          },
          icon: const Icon(Icons.share),
          label: const Text('Share'),
        ),
        const SizedBox(width: 16),
        ElevatedButton.icon(
          onPressed: () {
            // Add like functionality here
          },
          icon: const Icon(Icons.thumb_up),
          label: const Text('Like'),
        ),
      ],
    );
  }
}
