import 'package:flutter/material.dart';
import 'package:santafi/Header.dart';
import 'package:santafi/Model/Product.dart';
import 'package:santafi/main.dart';

class DetailPage extends StatefulWidget {
  final Product product;

  const DetailPage({
    super.key,
    required this.product,
  });

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    final product = widget.product;

    return Scaffold(
      backgroundColor: const Color(0xFFFAFBFC),
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: Header(),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product image
            Center(
              child: SizedBox(
                width: 1283,
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    //Judul Product Atas
                    Row(
                      children: [
                        Text(
                          'Beranda',
                          style: TextStyle(
                              color: Color(0xFFFE6D00),
                              fontFamily: montserrat,
                              fontWeight: FontWeight.w400,
                              fontSize: 14),
                        ),
                        Icon(Icons.chevron_right_rounded),
                        Text(
                          'Destinasi',
                          style: TextStyle(
                              color: Color(0xFFFE6D00),
                              fontFamily: montserrat,
                              fontWeight: FontWeight.w400,
                              fontSize: 14),
                        ),
                        Icon(Icons.chevron_right_rounded),
                        Text(
                          product.title,
                          style: TextStyle(
                              color: Color(0xFF000000),
                              fontFamily: montserrat,
                              fontWeight: FontWeight.w400,
                              fontSize: 14),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 35,
                    ),
                    // Content
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Content kiri
                        Expanded(
                          flex: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Product Image
                              Center(
                                child: Container(
                                  width: 853,
                                  height: 407,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16.0),
                                    image: DecorationImage(
                                      image: AssetImage(product.imagePath),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 16),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        product.title,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w900,
                                            fontFamily: 'Montserrat',
                                            fontSize: 24),
                                      ),
                                      const SizedBox(height: 8),
                                      Row(
                                        children: [
                                          Row(
                                            children: [
                                              const Icon(
                                                  Icons.calendar_month_rounded),
                                              const SizedBox(width: 8),
                                              Text(
                                                product.date,
                                                style: const TextStyle(
                                                    fontWeight: FontWeight.w400,
                                                    fontFamily: 'Montserrat',
                                                    fontSize: 14),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(width: 16),
                                          Row(
                                            children: [
                                              const Icon(Icons.alarm),
                                              const SizedBox(width: 8),
                                              Text(
                                                product.duration,
                                                style: const TextStyle(
                                                    fontWeight: FontWeight.w400,
                                                    fontFamily: 'Montserrat',
                                                    fontSize: 14),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 8),
                                      buildStarRating(product.rating),
                                    ],
                                  ),
                                  const SizedBox(width: 308),
                                  Column(
                                    children: [
                                      const SizedBox(height: 40),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Container(
                                            margin: const EdgeInsets.all(8),
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.black),
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            child: IconButton(
                                              icon: const Icon(
                                                  Icons.favorite_border),
                                              iconSize: 20,
                                              onPressed: () {},
                                            ),
                                          ),
                                          Container(
                                            margin: const EdgeInsets.all(8),
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.black),
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            child: IconButton(
                                              icon: const Icon(Icons.share),
                                              iconSize: 20,
                                              onPressed: () {
                                                print('share');
                                              },
                                            ),
                                          ),
                                          Container(
                                            margin:
                                                const EdgeInsets.only(left: 8),
                                            child: ElevatedButton(
                                              onPressed: () {
                                                // Handle booking logic
                                              },
                                              style: ElevatedButton.styleFrom(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 22,
                                                        vertical: 18),
                                                backgroundColor:
                                                    const Color(0xFF0047BB),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(9),
                                                ),
                                              ),
                                              child: const Text(
                                                'Pesan Paket',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w600,
                                                  fontFamily: 'Montserrat',
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              const SizedBox(height: 16),
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                padding: EdgeInsets.symmetric(vertical: 33, horizontal: 25),
                                child: Column(
                                  children: [
                                    Text(
                                      'Maskapai',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontFamily: plusjakartasans,
                                          fontWeight: FontWeight.w600
                                      ),
                                    ),
                                    SizedBox(height: 24,),
                                    Row(
                                      children: [
                                        Expanded(child: Row(

                                        ))
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              Text(
                                'Description: ${product.description}',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'Airlines: ${product.airline}',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 8),
                              const Text(
                                'Facilities:',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Wrap(
                                spacing: 8.0,
                                children: product.facilities.map((facility) {
                                  return Chip(
                                    label: Text(
                                        facility.name), // Use facility.name
                                    avatar: const Icon(Icons
                                        .check), // Example icon for facility
                                  );
                                }).toList(),
                              ),
                              const SizedBox(height: 16),
                              const Text(
                                'Additional Information:',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: product.additionalInfo.map((info) {
                                  return Padding(
                                    padding: const EdgeInsets.only(bottom: 4),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text("• ",
                                            style: TextStyle(fontSize: 18)),
                                        Expanded(child: Text(info)),
                                      ],
                                    ),
                                  );
                                }).toList(),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 40),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(18.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      IconButton(
                                        onPressed: () {
                                          // Handle left icon press
                                        },
                                        icon: const Icon(
                                            Icons.chevron_left_rounded),
                                        iconSize: 48,
                                        color: Colors.black,
                                      ),
                                      const SizedBox(width: 12),
                                      Text(
                                        product.selectedPackage,
                                        style: const TextStyle(
                                          fontSize: 24,
                                          fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      const SizedBox(width: 12),
                                      IconButton(
                                        onPressed: () {
                                          // Handle right icon press
                                        },
                                        icon: const Icon(
                                            Icons.chevron_right_rounded),
                                        iconSize: 48,
                                        color: Colors.black,
                                      ),
                                    ],
                                  ),
                                  const Divider(),
                                  // Hotel details
                                  ...product.packages
                                      .firstWhere((pkg) =>
                                          pkg.packageType ==
                                          product.selectedPackage)
                                      .hotels
                                      .map((hotel) => Row(
                                            children: [
                                              Expanded(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      hotel.name,
                                                      style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 16,
                                                      ),
                                                    ),
                                                    const Text(
                                                      'Setaraf',
                                                      style: TextStyle(
                                                        color: Colors.grey,
                                                        fontSize: 14,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Row(
                                                children: List.generate(
                                                    hotel.starRating,
                                                    (index) => const Icon(
                                                        Icons.star,
                                                        color: Colors.orange,
                                                        size: 16)),
                                              ),
                                              Row(
                                                children: List.generate(
                                                    5 - hotel.starRating,
                                                    (index) => const Icon(
                                                        Icons.star_border,
                                                        size: 16)),
                                              ),
                                            ],
                                          )),
                                  const SizedBox(height: 16),
                                  // Seat Selection
                                  const Text(
                                    'Jumlah Paket',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  DropdownButtonFormField<int>(
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                      contentPadding: EdgeInsets.symmetric(
                                          horizontal: 12, vertical: 8),
                                    ),
                                    value: product.selectedSeats,
                                    items:
                                        List.generate(5, (index) => index + 1)
                                            .map((int value) {
                                      return DropdownMenuItem<int>(
                                        value: value,
                                        child: Text(value.toString()),
                                      );
                                    }).toList(),
                                    onChanged: (int? newValue) {
                                      setState(() {
                                        if (newValue != null) {
                                          product.updateSelectedSeats(newValue);
                                        }
                                      });
                                    },
                                  ),
                                  const SizedBox(height: 16),
                                  // Price Details
                                  const Text(
                                    'Detail Harga',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text('Harga Normal'),
                                      Text('Rp ${product.price.toString()}'),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text('Diskon'),
                                      Text(
                                        'Rp ${product.discountPercentage.toString()}',
                                        style: const TextStyle(
                                          decoration:
                                              TextDecoration.lineThrough,
                                          color: Colors.red,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Divider(),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text('Total'),
                                      Text(
                                        'Rp ${product.finalPrice.toString()}',
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 16),
                                  // Konsultasi Paket Button
                                  Center(
                                    child: ElevatedButton(
                                      onPressed: () {
                                        // Handle konsultasi button press
                                      },
                                      style: ElevatedButton.styleFrom(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 16, horizontal: 32),
                                        backgroundColor: Colors.blue,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                      ),
                                      child: const Text(
                                        'Konsultasi Paket',
                                        style: TextStyle(
                                            fontSize: 16, color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildStarRating(double rating) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: List.generate(5, (index) {
        return Icon(
          index < rating ? Icons.star : Icons.star_border,
          color: Colors.orange,
        );
      }),
    );
  }
}
