import 'dart:async';
import 'package:flutter/material.dart';
import 'package:santafi/main.dart';

// Example customer data
final List<Map<String, String>> testimonials = [
  {
    'name': 'Irfan Rahmat',
    'title': 'Travel Enthusiast',
    'testimonial':
    'I love Santafi, this is the best place to buy tickets and help you find your dream holiday.',
    'image': 'assets/images/profile.jpg'
  },
  {
    'name': 'Dewi Ayu',
    'title': 'Frequent Traveler',
    'testimonial':
    'Excellent service and the best deals on flights. My go-to platform for holidays!',
    'image': 'assets/images/profile2.jpg'
  },
  {
    'name': 'John Doe',
    'title': 'Adventurer',
    'testimonial':
    'Santafi helped me plan the best trip of my life. Highly recommended!',
    'image': 'assets/images/profile3.jpg'
  }
];

class TestimonialWidget extends StatefulWidget {
  const TestimonialWidget({super.key});

  @override
  _TestimonialWidgetState createState() => _TestimonialWidgetState();
}

class _TestimonialWidgetState extends State<TestimonialWidget> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    // Automatically move to the next page every 3 seconds
    _timer = Timer.periodic(Duration(seconds: 5), (Timer timer) {
      if (_currentIndex < testimonials.length - 1) {
        _currentIndex++;
      } else {
        _currentIndex = 0;
      }
      _pageController.animateToPage(
        _currentIndex,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    _timer?.cancel(); // Cancel the timer when the widget is disposed
    super.dispose();
  }

  // Build each testimonial card
  Widget _buildTestimonialCard(Map<String, String> testimonialData) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 100.0, vertical: 100.0),
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 100.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 100.0,
            spreadRadius: 10.0,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            radius: 50.0,
            backgroundImage: AssetImage(testimonialData['image']!),
          ),
          const SizedBox(height: 20.0), // Adjusted height for spacing
          Text(
            testimonialData['name']!,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: plusjakartasans,
              fontSize: 24.0,
            ),
          ),
          const SizedBox(height: 5.0),
          Text(
            testimonialData['title']!,
            style: TextStyle(
              color: Colors.grey,
              fontFamily: plusjakartasans,
              fontWeight: FontWeight.w400,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 20.0),
          // Star Rating
          Row(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(5, (index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: Icon(
                  Icons.star,
                  color: Colors.yellow[700],
                  size: 20.0,
                ),
              );
            }),
          ),
          const SizedBox(height: 20.0),
          // Testimonial Text with Overflow Handling
          Flexible(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                testimonialData['testimonial']!,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: plusjakartasans,
                  color: Colors.grey,
                  fontSize: 18.0, // Reduced font size to prevent overflow
                  fontWeight: FontWeight.w400,
                ),
                overflow: TextOverflow.ellipsis, // Avoids overflow
                maxLines: 2, // Limits to 2 lines
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Hovering state
  bool _isLeftHovered = false;
  bool _isRightHovered = false;

  // Main
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Left IconButton with hover effect
        MouseRegion(
          onEnter: (event) => setState(() => _isLeftHovered = true),
          onExit: (event) => setState(() => _isLeftHovered = false),
          child: Container(
            decoration: BoxDecoration(
              color: _isLeftHovered ? Color(0xFF0047BB) : Colors.transparent,
              borderRadius: BorderRadius.circular(100),
            ),
            child: IconButton.outlined(
              icon: Icon(
                Icons.chevron_left_rounded,
                color: _isLeftHovered ? Colors.white : Color(0xFF0047BB),
              ),
              iconSize: 50, // Keep size consistent
              onPressed: () {
                if (_currentIndex > 0) {
                  _currentIndex--;
                  _pageController.animateToPage(
                    _currentIndex,
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                }
              },
            ),
          ),
        ),

        // Testimonial PageView
        Column(
          children: [
            SizedBox(
              height: 600,
              width: 1024, // Adjust height based on design
              child: PageView.builder(
                controller: _pageController,
                itemCount: testimonials.length,
                itemBuilder: (context, index) {
                  return _buildTestimonialCard(testimonials[index]);
                },
                onPageChanged: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(testimonials.length, (index) {
                return AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  margin: const EdgeInsets.symmetric(horizontal: 5.0),
                  width: _currentIndex == index ? 12.0 : 8.0,
                  height: 8.0,
                  decoration: BoxDecoration(
                    color: _currentIndex == index ? Colors.blue : Colors.grey,
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                );
              }),
            ),
          ],
        ),

        // Right IconButton with hover effect
        MouseRegion(
          onEnter: (event) => setState(() => _isRightHovered = true),
          onExit: (event) => setState(() => _isRightHovered = false),
          child: Container(
            decoration: BoxDecoration(
              color: _isRightHovered ? Color(0xFF0047BB) : Colors.transparent,
              borderRadius: BorderRadius.circular(100),
            ),
            child: IconButton.outlined(
              icon: Icon(
                Icons.chevron_right_rounded,
                color: _isRightHovered ? Colors.white : Color(0xFF0047BB),
              ),
              iconSize: 50, // Keep size consistent
              onPressed: () {
                if (_currentIndex < testimonials.length - 1) {
                  _currentIndex++;
                  _pageController.animateToPage(
                    _currentIndex,
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                }
              },
            ),
          ),
        ),
      ],
    );
  }
}
