import 'package:flutter/material.dart';

class Product {
  final int price;
  final String title;
  final String date;
  final String duration;
  final String imagePath;
  final String description;
  final Airline airline;
  final double rating;
  final List<Facility> facilities;
  final List<String> additionalInfo;
  final String category;
  final int year;
  final String month;
  final List<Package> packages;
  final int totalSeats;
  final double discountPercentage;
  final List<String> tags;  // New field for tags
  String selectedPackage;
  int selectedSeats;
  int seatsLeft;

  Product({
    required this.price,
    required this.title,
    required this.date,
    required this.duration,
    required this.imagePath,
    required this.description,
    required this.airline,
    required this.rating,
    required this.facilities,
    required this.additionalInfo,
    required this.category,
    required this.year,
    required this.month,
    required this.packages,
    this.selectedPackage = 'Paket Ekonomi',
    this.selectedSeats = 1,
    this.totalSeats = 10,
    this.discountPercentage = 0,
    required this.tags,  // Required tags field
  }) : seatsLeft = totalSeats;

  void updateSelectedSeats(int newValue) {}
}


class Facility {
  final String name;
  final IconData iconPath;

  Facility({
    required this.name,
    required this.iconPath,
  });
}

class Airline {
  final String logoPath;
  final String name;
  final String departureAirport;
  final String transitAirport;
  final String arrivalAirport;

  Airline({
    required this.logoPath,
    required this.name,
    required this.departureAirport,
    required this.transitAirport,
    required this.arrivalAirport,
  });
}

class Hotel {
  final String name;
  final int starRating;

  Hotel({
    required this.name,
    required this.starRating,
  });
}

class Package {
  final String packageType; // "Paket Ekonomi", "Paket Premium", "Paket Executive"
  final List<Hotel> hotels;
  final int additionalPrice;

  Package({
    required this.packageType,
    required this.hotels,
    required this.additionalPrice,
  });
}


final List<Facility> allFacilities = [
  Facility(name: 'WiFi', iconPath: Icons.wifi),
  Facility(name: 'Breakfast', iconPath: Icons.free_breakfast),
  Facility(name: 'Guided Tours', iconPath: Icons.tour),
  Facility(name: 'Full Board Meals', iconPath: Icons.restaurant),
  Facility(name: 'VIP Tents', iconPath: Icons.night_shelter),
  Facility(name: 'Beach Access', iconPath: Icons.beach_access),
  Facility(name: 'Island Tours', iconPath: Icons.directions_boat),
  Facility(name: 'City Tours', iconPath: Icons.location_city),
  Facility(name: 'Sakura Viewing Tours', iconPath: Icons.local_florist),
];



final List<Product> productList = [
  Product(
    price: 27500000,
    title: 'Umrah Hemat + Taif',
    date: '14 September 2024',
    duration: '9 Hari',
    imagePath: 'images/rectangle.png',
    description:
        'Nikmati perjalanan spiritual Anda dengan paket Umrah Hemat + Taif yang dirancang khusus untuk memberikan pengalaman terbaik dengan harga terjangkau. Dalam paket ini, Anda akan merasakan kenyamanan beribadah di Tanah Suci, sekaligus menikmati kunjungan ke kota Taif yang indah, dikenal sebagai "Kota Mawar" karena kesejukan udaranya dan pemandangan alamnya yang menakjubkan.',
    airline: Airline(
      logoPath: 'images/MaskapaiColored/Emirates.png',
      name: 'Emirates',
      departureAirport: 'Soekarno-Hatta (CGK)',
      transitAirport: 'Jeddah (JED)',
      arrivalAirport: 'Medina (MED)',
    ),
    rating: 4.5,
    facilities: allFacilities
        .where((f) => ['WiFi', 'Breakfast', 'Guided Tours', 'Island Tours', 'Sakura Viewing Tours'].contains(f.name))
        .toList(),
    additionalInfo: [
      'Tiket Pesawat Ekonomi Pergi – Pulang',
      'Visa Umroh dan asuransi perjalanan umroh',
      'Akomodasi. Transportasi sesuai Program',
      'Makanan menu Indonesia 3x sehari',
      'Makanan selama Ramadhan hanya ifthar dan sahur',
      'Bimbingan Manasik 2 kali dalam 1 bulan',
      'Ustadz Pembimbing / Muthowif / Tour Leader',
      'Di Madinah di sediakan Muthowif Wanita untuk ke Raudhah',
      'Pemberian Zam zam sesuai dengan kondisi dan aturan airlines',
      'Umroh 2x',
      'Ziaroh (City Tour) Madinah & Mekkah',
      'Muthowif berbahasa Indonesia',
    ],
    category: 'Haji&Umrah',
    year: 2024,
    month: 'September',
    packages: [
      Package(
        packageType: 'Paket Ekonomi',
        hotels: [
          Hotel(name: 'Hotel Madinah Ekonomi', starRating: 3),
          Hotel(name: 'Hotel Mecca Ekonomi', starRating: 3),
        ],
        additionalPrice: 0,
      ),
      Package(
        packageType: 'Paket Premium',
        hotels: [
          Hotel(name: 'Hotel Madinah Premium', starRating: 4),
          Hotel(name: 'Hotel Mecca Premium', starRating: 4),
        ],
        additionalPrice: 5000000,
      ),
      Package(
        packageType: 'Paket Executive',
        hotels: [
          Hotel(name: 'Hotel Madinah Executive', starRating: 5),
          Hotel(name: 'Hotel Mecca Executive', starRating: 5),
        ],
        additionalPrice: 10000000,
      ),
    ],
    totalSeats: 15,
    discountPercentage: 10,
      tags: ['Umrah Reguler']
  ),
  Product(
    price: 35000000,
    title: 'Haji Khusus',
    date: '1 Agustus 2024',
    duration: '20 Hari',
    imagePath: 'images/HajiImage.png',
    description:
        'Paket Haji Khusus yang menawarkan pengalaman ibadah Haji dengan fasilitas VIP...',
    airline: Airline(
      logoPath: 'images/airlines/garuda_logo.png',
      name: 'Garuda Indonesia',
      departureAirport: 'Soekarno-Hatta (CGK)',
      transitAirport: 'Jeddah (JED)',
      arrivalAirport: 'Mecca (MEC)',
    ),
    rating: 5.0,
    facilities: allFacilities
        .where((f) =>
            ['Full Board Meals', 'VIP Tents', 'Guided Tours, '].contains(f.name))
        .toList(),
    additionalInfo: ['Priority visa processing', 'Exclusive accommodation'],
    category: 'Haji&Umrah',
    year: 2024,
    month: 'Agustus',
    packages: [
      Package(
        packageType: 'Paket Ekonomi',
        hotels: [
          Hotel(name: 'Hotel Madinah Ekonomi', starRating: 3),
          Hotel(name: 'Hotel Mecca Ekonomi', starRating: 3),
        ],
        additionalPrice: 0,
      ),
      Package(
        packageType: 'Paket Premium',
        hotels: [
          Hotel(name: 'Hotel Madinah Premium', starRating: 4),
          Hotel(name: 'Hotel Mecca Premium', starRating: 4),
        ],
        additionalPrice: 5000000,
      ),
      Package(
        packageType: 'Paket Executive',
        hotels: [
          Hotel(name: 'Hotel Madinah Executive', starRating: 5),
          Hotel(name: 'Hotel Mecca Executive', starRating: 5),
        ],
        additionalPrice: 10000000,
      ),
    ],
    totalSeats: 20,
    discountPercentage: 5,
    tags: ['Haji Khusus']
  ),
  Product(
    price: 15000000,
    title: 'Paket Wisata Bali',
    date: '10 November 2024',
    duration: '5 Hari',
    imagePath: 'images/BaliImage.png',
    description:
        'Jelajahi keindahan Bali dengan paket wisata yang mencakup pantai-pantai eksotis dan pengalaman budaya...',
    airline: Airline(
      logoPath: 'images/airlines/batik_air_logo.png',
      name: 'Batik Air',
      departureAirport: 'Soekarno-Hatta (CGK)',
      transitAirport: '',
      arrivalAirport: 'Ngurah Rai (DPS)',
    ),
    rating: 4.7,
    facilities: allFacilities
        .where((f) => ['WiFi', 'Breakfast', 'Beach Access'].contains(f.name))
        .toList(),
    additionalInfo: ['Private tours', 'Free shuttle to airport'],
    category: 'Wisata Domestik',
    year: 2024,
    month: 'November',
    packages: [
      Package(
        packageType: 'Paket Ekonomi',
        hotels: [
          Hotel(name: 'Hotel Bali Ekonomi', starRating: 3),
        ],
        additionalPrice: 0,
      ),
      Package(
        packageType: 'Paket Premium',
        hotels: [
          Hotel(name: 'Hotel Bali Premium', starRating: 4),
        ],
        additionalPrice: 2000000,
      ),
      Package(
        packageType: 'Paket Executive',
        hotels: [
          Hotel(name: 'Hotel Bali Executive', starRating: 5),
        ],
        additionalPrice: 4000000,
      ),
    ],
    totalSeats: 30,
    discountPercentage: 0,
      tags: ['Family Package']
  ),
  Product(
    price: 18000000,
    title: 'Liburan ke Lombok',
    date: '25 Desember 2024',
    duration: '6 Hari',
    imagePath: 'images/LombokImage.png',
    description:
        'Nikmati liburan eksotis di Lombok dengan paket yang mencakup tur pulau-pulau cantik...',
    airline: Airline(
      logoPath: 'images/airlines/garuda_logo.png',
      name: 'Garuda Indonesia',
      departureAirport: 'Soekarno-Hatta (CGK)',
      transitAirport: '',
      arrivalAirport: 'Lombok (LOP)',
    ),
    rating: 4.8,
    facilities: allFacilities
        .where((f) => ['WiFi', 'Breakfast', 'Island Tours'].contains(f.name))
        .toList(),
    additionalInfo: ['Snorkeling equipment', '24/7 customer support'],
    category: 'Wisata Domestik',
    year: 2024,
    month: 'Desember',
    packages: [
      Package(
        packageType: 'Paket Ekonomi',
        hotels: [
          Hotel(name: 'Hotel Lombok Ekonomi', starRating: 3),
        ],
        additionalPrice: 0,
      ),
      Package(
        packageType: 'Paket Premium',
        hotels: [
          Hotel(name: 'Hotel Lombok Premium', starRating: 4),
        ],
        additionalPrice: 2000000,
      ),
      Package(
        packageType: 'Paket Executive',
        hotels: [
          Hotel(name: 'Hotel Lombok Executive', starRating: 5),
        ],
        additionalPrice: 4000000,
      ),
    ],
    totalSeats: 25,
    discountPercentage: 0,
      tags: ['Cultural Experience']
  ),
  Product(
    price: 45000000,
    title: 'Tour Eropa Barat',
    date: '1 April 2024',
    duration: '12 Hari',
    imagePath: 'images/EuropeTour.png',
    description:
        'Jelajahi keindahan Eropa Barat dengan paket tour yang mencakup berbagai kota besar dan destinasi menarik...',
    airline: Airline(
      logoPath: 'images/airlines/lufthansa_logo.png',
      name: 'Lufthansa',
      departureAirport: 'Soekarno-Hatta (CGK)',
      transitAirport: 'Frankfurt (FRA)',
      arrivalAirport: 'Paris (CDG)',
    ),
    rating: 4.9,
    facilities: allFacilities
        .where((f) => ['WiFi', 'Breakfast', 'City Tours'].contains(f.name))
        .toList(),
    additionalInfo: ['Schengen visa assistance', 'Luxury accommodation'],
    category: 'Wisata Internasional',
    year: 2024,
    month: 'April',
    packages: [
      Package(
        packageType: 'Paket Ekonomi',
        hotels: [
          Hotel(name: 'Hotel Eropa Ekonomi', starRating: 3),
        ],
        additionalPrice: 0,
      ),
      Package(
        packageType: 'Paket Premium',
        hotels: [
          Hotel(name: 'Hotel Eropa Premium', starRating: 4),
        ],
        additionalPrice: 8000000,
      ),
      Package(
        packageType: 'Paket Executive',
        hotels: [
          Hotel(name: 'Hotel Eropa Executive', starRating: 5),
        ],
        additionalPrice: 15000000,
      ),
    ],
    totalSeats: 20,
    discountPercentage: 15,
      tags: ['Luxury Package']
  ),
  Product(
    price: 40000000,
    title: 'Liburan Jepang Musim Semi',
    date: '15 Maret 2024',
    duration: '7 Hari',
    imagePath: 'images/JapanTour.png',
    description:
        'Rasakan keindahan Jepang saat musim semi dengan paket tur yang mencakup kunjungan ke Tokyo, Kyoto, dan Osaka...',
    airline: Airline(
      logoPath: 'images/airlines/japan_airlines_logo.png',
      name: 'Japan Airlines',
      departureAirport: 'Soekarno-Hatta (CGK)',
      transitAirport: 'Tokyo (NRT)',
      arrivalAirport: 'Kyoto (KIX)',
    ),
    rating: 4.6,
    facilities: allFacilities
        .where((f) =>
            ['WiFi', 'Breakfast', 'Sakura Viewing Tours'].contains(f.name))
        .toList(),
    additionalInfo: ['Private tour guide', 'Cultural experiences'],
    category: 'Wisata Internasional',
    year: 2024,
    month: 'Maret',
    packages: [
      Package(
        packageType: 'Paket Ekonomi',
        hotels: [
          Hotel(name: 'Hotel Tokyo Ekonomi', starRating: 3),
          Hotel(name: 'Hotel Kyoto Ekonomi', starRating: 3),
        ],
        additionalPrice: 0,
      ),
      Package(
        packageType: 'Paket Premium',
        hotels: [
          Hotel(name: 'Hotel Tokyo Premium', starRating: 4),
          Hotel(name: 'Hotel Kyoto Premium', starRating: 4),
        ],
        additionalPrice: 6000000,
      ),
      Package(
        packageType: 'Paket Executive',
        hotels: [
          Hotel(name: 'Hotel Tokyo Executive', starRating: 5),
          Hotel(name: 'Hotel Kyoto Executive', starRating: 5),
        ],
        additionalPrice: 12000000,
      ),
    ],
    totalSeats: 18,
    discountPercentage: 8,
      tags: ['Multi-Country Package']
  ),
];
