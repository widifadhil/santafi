import 'package:flutter/material.dart';
import 'package:santafi/Footer.dart';
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
  late int _selectedPackageIndex;

  @override
  void initState() {
    super.initState();
    _selectedPackageIndex = widget.product.packages.indexWhere(
      (pkg) => pkg.packageType == widget.product.selectedPackage,
    );
  }

  void _selectNextPackage() {
    setState(() {
      if (_selectedPackageIndex < widget.product.packages.length - 1) {
        _selectedPackageIndex++;
      } else {
        _selectedPackageIndex = 0; // Loop back to the first package
      }
    });
  }

  void _selectPreviousPackage() {
    setState(() {
      if (_selectedPackageIndex > 0) {
        _selectedPackageIndex--;
      } else {
        _selectedPackageIndex =
            widget.product.packages.length - 1; // Loop back to the last package
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final product = widget.product;
    Package selectedPackage = widget.product.packages[_selectedPackageIndex];
    return Scaffold(
      backgroundColor: const Color(0xFFFAFBFC),
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: Header(),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product image
            Center(
              child: SizedBox(
                width: 1283,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    //Judul Product Atas
                    Row(
                      children: [
                        const Text(
                          'Beranda',
                          style: TextStyle(
                              color: Color(0xFFFE6D00),
                              fontFamily: montserrat,
                              fontWeight: FontWeight.w400,
                              fontSize: 14),
                        ),
                        const Icon(Icons.chevron_right_rounded),
                        const Text(
                          'Destinasi',
                          style: TextStyle(
                              color: Color(0xFFFE6D00),
                              fontFamily: montserrat,
                              fontWeight: FontWeight.w400,
                              fontSize: 14),
                        ),
                        const Icon(Icons.chevron_right_rounded),
                        Text(
                          product.title,
                          style: const TextStyle(
                              color: Color(0xFF000000),
                              fontFamily: montserrat,
                              fontWeight: FontWeight.w400,
                              fontSize: 14),
                        )
                      ],
                    ),
                    const SizedBox(
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
                            children: <Widget>[
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
                              // Detail Penerbangan
                              Container(
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey
                                          .withOpacity(0.05), // Shadow color
                                      spreadRadius: 5, // Spread radius
                                      blurRadius: 16, // Blur radius
                                      offset: const Offset(0,
                                          4.12), // Offset: horizontal, vertical
                                    ),
                                  ],
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                padding: const EdgeInsets.all(25),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Maskapai',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontFamily: plusjakartasans,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    const SizedBox(
                                      height: 24,
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          width: 270,
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 16.0, horizontal: 33.0),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              border: Border.all(width: 0.5)),
                                          child: Row(
                                            children: [
                                              Image.asset(
                                                product.airline.logoPath,
                                                width: 65,
                                              ),
                                              const SizedBox(
                                                width: 25,
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    product.airline.name,
                                                    style: const TextStyle(
                                                        fontFamily: montserrat,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: 24),
                                                  ),
                                                  const Text(
                                                    'AIRBUS A320',
                                                    style: TextStyle(
                                                        fontFamily: montserrat,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontSize: 14,
                                                        color:
                                                            Color(0xFF464646)),
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                        const SizedBox(width: 130),
                                        const Expanded(
                                            child: IntrinsicHeight(
                                          child: Row(
                                            children: <Widget>[
                                              Icon(
                                                Icons.flight_rounded,
                                                size: 24,
                                              ),
                                              SizedBox(
                                                width: 20,
                                              ),
                                              VerticalDivider(
                                                thickness: 1,
                                                color: Color(0xFFD7E2EE),
                                              ),
                                              SizedBox(
                                                width: 20,
                                              ),
                                              Icon(
                                                Icons.wifi_rounded,
                                                size: 24,
                                              ),
                                              SizedBox(
                                                width: 20,
                                              ),
                                              VerticalDivider(
                                                thickness: 1,
                                                color: Color(0xFFD7E2EE),
                                              ),
                                              SizedBox(
                                                width: 20,
                                              ),
                                              Icon(
                                                Icons.alarm_on_rounded,
                                                size: 24,
                                              ),
                                              SizedBox(
                                                width: 20,
                                              ),
                                              VerticalDivider(
                                                thickness: 1,
                                                color: Color(0xFFD7E2EE),
                                              ),
                                              SizedBox(
                                                width: 20,
                                              ),
                                              Icon(
                                                Icons.fastfood_rounded,
                                                size: 24,
                                              ),
                                              SizedBox(
                                                width: 20,
                                              ),
                                              VerticalDivider(
                                                thickness: 1,
                                                color: Color(0xFFD7E2EE),
                                              ),
                                              SizedBox(
                                                width: 20,
                                              ),
                                              Icon(Icons.flight_class_rounded),
                                            ],
                                          ),
                                        )),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 40,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          product.airline.departureAirport,
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontFamily: montserrat,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 17,
                                        ),
                                        Image.asset(
                                            'images/MaskapaiColored/DepartureLine.png'),
                                        const SizedBox(
                                          width: 25,
                                        ),
                                        const Icon(
                                          Icons.flight_takeoff_rounded,
                                          size: 20,
                                        ),
                                        const SizedBox(
                                          width: 25,
                                        ),
                                        Image.asset(
                                            'images/MaskapaiColored/DepartureLine2.png'),
                                        const SizedBox(
                                          width: 17,
                                        ),
                                        Text(
                                          product.airline.transitAirport,
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontFamily: montserrat,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 17,
                                        ),
                                        Image.asset(
                                            'images/MaskapaiColored/DepartureLine.png'),
                                        const SizedBox(
                                          width: 25,
                                        ),
                                        const Icon(Icons.flight_land_rounded,
                                            size: 20),
                                        const SizedBox(
                                          width: 25,
                                        ),
                                        Image.asset(
                                            'images/MaskapaiColored/DepartureLine2.png'),
                                        const SizedBox(
                                          width: 17,
                                        ),
                                        Text(
                                          product.airline.arrivalAirport,
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontFamily: montserrat,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 24,
                              ),
                              const Text(
                                'Deskripsi',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24,
                                    fontFamily: montserrat),
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              Text(product.description,
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w200,
                                    fontFamily: montserrat,
                                  ),
                                  textAlign: TextAlign.justify),
                              const SizedBox(height: 24),
                              const Text(
                                'Bonus',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24,
                                    fontFamily: montserrat),
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              ListView(
                                shrinkWrap: true,
                                padding: const EdgeInsets.all(8.0),
                                children: [
                                  Wrap(
                                    spacing: 20.0, // Space between columns
                                    runSpacing: 10.0, // Space between rows
                                    children: [
                                      for (var i = 0;
                                          i < product.facilities.length;
                                          i += 2)
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            // First column item
                                            Expanded(
                                              child: Row(
                                                children: [
                                                  Icon(product
                                                      .facilities[i].iconPath),
                                                  const SizedBox(
                                                      width:
                                                          8.0), // Space between icon and text
                                                  Expanded(
                                                    child: Text(
                                                      product.facilities[i]
                                                          .name, // Facility name
                                                      style: const TextStyle(
                                                        fontSize: 16.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                      overflow: TextOverflow
                                                          .ellipsis, // Handles long text
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            // Second column item, ensure it exists
                                            if (i + 1 <
                                                product.facilities.length)
                                              Expanded(
                                                child: Row(
                                                  children: [
                                                    Icon(product
                                                        .facilities[i + 1]
                                                        .iconPath), // Corrected here
                                                    const SizedBox(width: 8.0),
                                                    Expanded(
                                                      child: Text(
                                                        product
                                                            .facilities[i + 1]
                                                            .name, // Facility name
                                                        style: const TextStyle(
                                                          fontSize: 16.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                        overflow: TextOverflow
                                                            .ellipsis, // Handles long text
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                          ],
                                        ),
                                    ],
                                  ),
                                ],
                              ),

                              const SizedBox(height: 16),
                              const Text(
                                'Additional Information:',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24,
                                    fontFamily: montserrat),
                              ),
                              const SizedBox(height: 16),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: product.additionalInfo.map((info) {
                                  return Padding(
                                    padding: const EdgeInsets.only(bottom: 4),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text("- ",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontFamily: montserrat,
                                                fontWeight: FontWeight.w200)),
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
                        // Content kanan
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
                                        onPressed: _selectPreviousPackage,
                                        icon: const Icon(
                                            Icons.chevron_left_rounded),
                                        iconSize: 48,
                                        color: Colors.black,
                                      ),
                                      const SizedBox(width: 12),
                                      Text(
                                        selectedPackage.packageType,
                                        style: const TextStyle(
                                          fontSize: 24,
                                          fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      const SizedBox(width: 12),
                                      IconButton(
                                        onPressed: _selectNextPackage,
                                        icon: const Icon(
                                            Icons.chevron_right_rounded),
                                        iconSize: 48,
                                        color: Colors.black,
                                      ),
                                    ],
                                  ),
                                  const Divider(),
                                  // Hotel details for the selected package
                                  ...selectedPackage.hotels.map((hotel) => Row(
                                        children: [
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  hotel.name,
                                                  style: const TextStyle(
                                                    fontWeight: FontWeight.bold,
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
                                                hotel.starRating, (index) {
                                              return const Icon(Icons.star,
                                                  color: Colors.orange,
                                                  size: 16);
                                            }),
                                          ),
                                          Row(
                                            children: List.generate(
                                                5 - hotel.starRating, (index) {
                                              return const Icon(
                                                  Icons.star_border,
                                                  size: 16);
                                            }),
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
                                    value: widget.product.selectedSeats,
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
                                          widget.product.updateSelectedSeats(newValue);
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
                                      Text(
                                          'Rp ${widget.product.price.toString()}'),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text('Diskon'),
                                      Text(
                                        'Rp ${widget.product.discountPercentage.toString()}',
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
                                        'Rp ${(widget.product.price + selectedPackage.additionalPrice).toString()}',
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
                                    child: OutlinedButton(
                                      onPressed: () {
                                        // Handle konsultasi button press
                                      },
                                      style: OutlinedButton.styleFrom(
                                        backgroundColor: Colors.white, // Button background color
                                        side: const BorderSide(color: Color(0xFF0047BB)), // Button border color
                                        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 128),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(8),
                                        ),
                                      ),
                                      child: const Text(
                                        'Konsultasi Paket',
                                        style: TextStyle(
                                          color: Color(0xFF0047BB), // Text color
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                  )

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
            const SizedBox(height: 60),
            const Footer()
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
