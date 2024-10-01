import 'package:carousel_slider/carousel_slider.dart'; // Single import needed
import 'package:flutter/material.dart';

class PromotionBanner extends StatefulWidget {
  const PromotionBanner({super.key});

  @override
  _PromotionBannerState createState() => _PromotionBannerState();
}

class _PromotionBannerState extends State<PromotionBanner> {
  final CarouselSliderController _controller = CarouselSliderController();
// No alias needed

  int _currentIndex = 0;

  final List<String> imagesList = [
    'images/promo.png',
    'images/promo1.png',
    'images/promo2.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider(
          items: imagesList.map((imagePath) {
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0),
                image: DecorationImage(
                  image: AssetImage(imagePath),
                  fit: BoxFit.cover,
                ),
              ),
            );
          }).toList(),
          carouselController: _controller,
          options: CarouselOptions(
            height: 417,
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 3),
            viewportFraction: 1.0,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
        ),
        Positioned(
          left: 10,
          top: 0,
          bottom: 0,
          child: GestureDetector(
            onTap: () {
              _controller.previousPage();
            },
            child: Icon(
              Icons.arrow_back_ios,
              size: 30,
              color: Colors.white,
            ),
          ),
        ),
        Positioned(
          right: 10,
          top: 0,
          bottom: 0,
          child: GestureDetector(
            onTap: () {
              _controller.nextPage();
            },
            child: Icon(
              Icons.arrow_forward_ios,
              size: 30,
              color: Colors.white,
            ),
          ),
        ),
        Positioned(
          bottom: 10,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: imagesList.asMap().entries.map((entry) {
              return GestureDetector(
                onTap: () => _controller.animateToPage(entry.key),
                child: Container(
                  width: 12.0,
                  height: 12.0,
                  margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _currentIndex == entry.key
                        ? Colors.white
                        : Colors.white.withOpacity(0.4),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
