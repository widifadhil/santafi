import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:santafi/Article/articlecard.dart';
import 'package:santafi/Footer.dart';
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
    final String currentCategory = 'Umrah';
    return Scaffold(
      backgroundColor: const Color(0xFFFAFBFC),
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: Header(),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                width: screenWidth * 0.75, // Responsive width
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    _buildBreadcrumbs(context), // Breadcrumbs with navigation
                    const SizedBox(height: 48.0),
                    _buildArticleContent(context), // Main article content
                    const SizedBox(height: 20),
                    _buildRelatedArticles(context, currentCategory,
                        allArticles), // Related articles
                    const SizedBox(height: 40),
                    _buildSocialButtons(),
                    const SizedBox(height: 40),
                    // Share and like buttons
                  ],
                ),
              ),
              Footer()
            ],
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
            overflow: TextOverflow.ellipsis, // Handle long titles
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
                AutoSizeText(
                  title,
                  style: const TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Montserrat',
                    height: 1.25,
                  ),
                  maxLines: 2, // Limit the number of lines (optional)
                  minFontSize: 36, // Minimum font size it can shrink to
                  maxFontSize: 48, // Maximum font size (48 in this case)
                  overflow: TextOverflow.ellipsis, // Handle overflow if needed
                ),
                const SizedBox(height: 10),
                Container(
                  height: 30, // Ensure enough height for the container
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '$category',
                        style: const TextStyle(
                          fontSize: 24,
                          color: Color(0xFF29C6CF),
                          fontFamily: 'PlusJakartaSans',
                        ),
                      ),
                      Container(
                        height:
                            25, // Set the desired height of the vertical divider here
                        child: const VerticalDivider(
                          color: Colors.grey,
                          thickness: 2,
                          width: 20, // Adjust width if needed
                        ),
                      ),
                      Text(
                        '$publishDate',
                        style: const TextStyle(
                          fontSize: 24,
                          color: Colors.grey,
                          fontFamily: 'PlusJakartaSans',
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 46),
                _buildImage(),
                const SizedBox(height: 16),
                Text(
                  description,
                  style: const TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
        if (screenWidth > 768) // Only show sidebar on larger screens
          Expanded(
            flex: 1,
            child: Container(
              width: 395,
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: Color(0xFFD7D7D7), // Set the outline color to grey
                  width: 1.0, // Set the thickness of the outline
                ),// Rounded corners
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey
                        .withOpacity(0.3), // Shadow color with opacity
                    spreadRadius: 0, // How far the shadow spreads
                    blurRadius: 14, // How blurry the shadow is
                    offset: Offset(0, 4), // Offset in x and y direction
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Form Konsultasi Perjalanan',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      fontFamily: montserrat,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Nama Lengkap',
                          hintText: 'John D',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                            borderSide: const BorderSide(
                              color: Colors.black, // Change to your desired color
                              width: 2.0, // Border width when focused
                            ),
                          ),
                          floatingLabelStyle: const TextStyle(
                            color: Colors.black, // Change label color when focused
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Whatsapp',
                          hintText: '08******',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                            borderSide: const BorderSide(
                              color: Colors.black, // Change to your desired color
                              width: 2.0, // Border width when focused
                            ),
                          ),
                          floatingLabelStyle: const TextStyle(
                            color: Colors.black, // Change label color when focused
                          ),
                        ),
                        keyboardType: TextInputType.phone,
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Catatan',
                          hintText: 'Rencana Keberangkatan apa?',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                            borderSide: const BorderSide(
                              color: Colors.black, // Change to your desired color
                              width: 2.0, // Border width when focused
                            ),
                          ),
                          floatingLabelStyle: const TextStyle(
                            color: Colors.black, // Change label color when focused
                          ),
                        ),
                        maxLines: 4,
                      ),
                    ],
                  )
                  ,

                  const SizedBox(height: 16),
                  SizedBox(
                    height: 48,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF0047BB),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4), // Border radius for the button
                        ),
                        minimumSize: const Size(double.infinity, 48), // Adjust the height here (48 is an example)
                      ),
                      onPressed: () {
                        // Handle send action here
                        print('Form submitted');
                      },
                      child: const Text(
                        'Kirim',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w200, fontFamily: montserrat
                        ),
                      ),
                    ),
                  )
                  ,
                  const SizedBox(height: 16),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: '* ',
                          style: TextStyle(color: Colors.red), // Color for the asterisk
                        ),
                        TextSpan(
                          text: 'Kami menjamin kerahasiaan data Anda.',
                          style: TextStyle(color: Colors.black, fontFamily: montserrat, fontWeight: FontWeight.w200), // Color for the rest of the text
                        ),
                      ],
                    ),
                  )
                  ,
                ],
              ),
            ),
          ),
      ],
    );
  }

  // Handle image loading with placeholders and error fallback
  Widget _buildImage() {
    return ClipRRect(
      borderRadius:
          BorderRadius.circular(8.0), // Set your desired border radius here
      child: Image.asset(
        imageUrl,
        fit: BoxFit.cover,
        width: 840,
        height: 300,
        errorBuilder: (context, error, stackTrace) {
          return const Icon(Icons.error, size: 100, color: Colors.red);
        },
      ),
    );
  }

  // Add related articles section at the bottom
  Widget _buildRelatedArticles(BuildContext context, String category,
      List<Map<String, dynamic>> allArticles) {
    // Determine if the screen is large
    bool isLarge = MediaQuery.of(context).size.width > 600;

    // Filter the allArticles list to get articles with the same category
    final List<Map<String, dynamic>> relatedArticles = allArticles
        .where((article) {
          return article['category'] == category;
        })
        .take(4)
        .toList(); // Limit to 4 articles

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Related Articles',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        relatedArticles.isEmpty
            ? const Text('No related articles found.')
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: relatedArticles.map((article) {
                  return Expanded(
                    child: Card(
                      color: Colors.white, // Set card background color to white
                      elevation: 3, // Optional: adds shadow to the card
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            12), // Optional: rounded corners
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            article['imageUrl']!,
                            fit: BoxFit
                                .cover, // Ensure the image fills the available space
                            height: isLarge ? 200 : 150, // Adjust image height
                            width: double
                                .infinity, // Make image take full width of the card
                          ),
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
                                    color: const Color(0xFF29C6CF),
                                    fontFamily: 'Montserrat',
                                    height: 2,
                                  ),
                                ),
                                const SizedBox(height: 18),
                                AutoSizeText(
                                  article['title']!,
                                  style: TextStyle(
                                    fontSize: isLarge ? 20 : 18,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Montserrat',
                                  ),
                                  maxLines: isLarge ? 3 : 2,
                                  minFontSize: isLarge ? 20 : 18,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(height: 8),
                                AutoSizeText(
                                  article['description'] ??
                                      'No description available',
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontFamily: 'Montserrat',
                                    height: 1.5,
                                  ),
                                  maxLines: isLarge ? 7 : 6,
                                  minFontSize: 12,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(height: 24),
                                const Divider(),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      article['publishDate']!,
                                      style: const TextStyle(
                                        color: Color(0xFF333333),
                                        fontFamily: 'Montserrat',
                                        fontSize: 12,
                                        fontWeight: FontWeight.w200,
                                      ),
                                    ),
                                    const SizedBox(width: 16),
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.visibility_rounded,
                                          color: Color(0xFF333333),
                                          size: 12,
                                        ),
                                        const SizedBox(width: 15),
                                        Text(
                                          '${article['readCount']}',
                                          style: const TextStyle(
                                            color: Color(0xFF333333),
                                            fontFamily: 'Montserrat',
                                            fontSize: 11,
                                            fontWeight: FontWeight.w200,
                                          ),
                                        ),
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
                  );
                }).toList(),
              ),
      ],
    );
  }

  Widget _buildSocialButtons() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Share this',
          style: TextStyle(
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w400, // Adjust to get a lighter font weight
            fontSize: 20,
            color: Colors.black54,
          ),
        ),
        const SizedBox(width: 16), // Spacing between text and icons
        IconButton(
          icon: FaIcon(
            FontAwesomeIcons.facebookF, // Facebook icon
            color: Colors.grey,
          ),
          onPressed: () {
            // Add Facebook share functionality
          },
        ),
        const SizedBox(width: 8), // Space between icons
        IconButton(
          icon: FaIcon(
            FontAwesomeIcons.xTwitter, // Twitter icon
            color: Colors.grey,
          ),
          onPressed: () {
            // Add Twitter share functionality
          },
        ),
        const SizedBox(width: 8), // Space between icons
        IconButton(
          icon: FaIcon(
            FontAwesomeIcons.instagram, // Instagram icon
            color: Colors.grey,
          ),
          onPressed: () {
            // Add Instagram share functionality
          },
        ),
      ],
    );
  }
}
