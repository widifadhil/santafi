import 'package:flutter/material.dart';

const List<Map<String, dynamic>> destinations = [
  {
    "title": "Haji\n& Umrah",
    "tours": "4 Tours",
    "image": 'images/ListPaket/Bitmap.png',
  },
  {
    "title": "Wisata Domestik",
    "tours": "2 Tours",
    "image": 'images/ListPaket/BitmapDomestik.png',
  },
  {
    "title": "Wisata Internasional",
    "tours": "3 Tours",
    "image": 'images/ListPaket/BitmapInternasional.png',
  },
  {
    "title": "Layanan\nLainnya",
    "tours": "5 Tours",
    "image": 'images/ListPaket/BitmapLainnya.png',
  },
];

class DestinasiSection extends StatelessWidget {
  const DestinasiSection({super.key, required String category});

  @override
  Widget build(BuildContext context) {
    // Get the screen width
    final screenWidth = MediaQuery.of(context).size.width;

    // Determine the number of columns based on screen width
    int crossAxisCount;
    double childAspectRatio;

    if (screenWidth > 1200) {
      // Large screens (web)
      crossAxisCount = 4;
      childAspectRatio = 1 / 1.5;
    } else if (screenWidth > 800) {
      // Medium screens (tablets)
      crossAxisCount = 3;
      childAspectRatio = 1 / 1.5;
    } else {
      // Small screens (mobile)
      crossAxisCount = 2;
      childAspectRatio = 1 / 1.2;
    }

    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,  // Number of columns
        crossAxisSpacing: 16.0,
        mainAxisSpacing: 20.0,
        childAspectRatio: childAspectRatio, // Aspect ratio for width/height
      ),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(), // Disable scrolling
      itemCount: destinations.length, // Total number of items
      itemBuilder: (BuildContext context, int index) {
        final destination = destinations[index];
        return TextButton(
          onPressed: () {  },
          child: Container(
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
                // Background image
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.0),
                    image: DecorationImage(
                      image: AssetImage(destination['image']),
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
                // Content on top of image and gradient
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
          ),
        );
      },
    );
  }
}
