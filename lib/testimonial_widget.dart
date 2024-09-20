import 'package:flutter/material.dart';


// Testimonial Widget
Widget testimonialWidget() {
  return Container(
    width: 1024,
    margin: const EdgeInsets.symmetric(vertical: 20.0,),
    padding: const EdgeInsets.symmetric(vertical: 40.0,),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20.0),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.1),
          blurRadius: 10.0,
          spreadRadius: 5.0,
          offset: const Offset(0, 5),
        ),
      ],
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        const CircleAvatar(
          radius: 70.0,
          backgroundImage: AssetImage('assets/images/profile.jpg'),
        ),
        const SizedBox(height: 46.0),
        const Text(
          'Irfan Rahmat',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24.0,
          ),
        ),
        const SizedBox(height: 5.0),
        const Text(
          'Travel Enthusiast',
          style: TextStyle(
            color: Colors.grey,
            fontSize: 18,
          ),
        ),
        const SizedBox(height: 10.0),
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
        const SizedBox(height: 10.0),
        const Text(
          'I love Santafi, this is the best place to buy ticket and help\nyou find your dream holiday.',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.grey,
            fontSize: 24.0,
          ),
        ),
      ],
    ),
  );
}
