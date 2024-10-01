import 'package:flutter/material.dart';

const List<Map<String, dynamic>> galeri = [
  {
    "image": 'images/galeri.png'
  },
  {
    "image": 'images/galeri2.png'
  },
  {
    "image": 'images/galeri3.png'
  },
  {
    "image": 'images/galeri4.png'
  },
  {
    "image": 'images/galeri5.png'
  },
  {
    "image": 'images/galeri6.png'
  },
  {
    "image": 'images/galeri7.png'
  },
  {
    "image": 'images/galeri8.png'
  },
];

class GaleriWidget extends StatelessWidget {
  const GaleriWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4, // Jumlah kolom
        crossAxisSpacing: 24.0,
        mainAxisSpacing: 24.0,
        childAspectRatio: 0.3 / 0.2, // Rasio aspek, sesuaikan dengan kebutuhanmu
      ),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: galeri.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
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
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              image: DecorationImage(
                image: AssetImage(galeri[index]['image']), // Corrected access here
                fit: BoxFit.cover,
              ),
            ),
          ),
        );
      },
    );
  }
}
