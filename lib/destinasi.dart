import 'package:flutter/material.dart';
import 'package:santafi/Footer.dart';
import 'package:santafi/Model/Product.dart';
import 'package:santafi/ProductCardDestinasi.dart'; // Make sure this path is correct
import 'package:santafi/TopSearchFilterDestinasi.dart';
import 'package:santafi/main.dart';
import 'header.dart'; // Import the Header

class DestinasiPage extends StatefulWidget {
  const DestinasiPage(
      {super.key,
        required this.tahun,
        required this.bulan,
        required this.kategori});
  final String kategori;
  final String tahun;
  final String bulan;

  @override
  _DestinasiPageState createState() => _DestinasiPageState();
}

class _DestinasiPageState extends State<DestinasiPage> {
  final List<String> categories = [
    'Semua Paket',
    'Haji&Umrah',
    'Wisata Domestik',
    'Wisata Internasional'
  ];

  // Filter values
  String selectedCategory = 'Semua Paket'; // Default to 'All' for no category filter
  String selectedYear = 'Semua Tahun'; // Default value for Year
  String selectedMonth = 'Semua Bulan'; // Default value for Month

  final List<String> years = [
    'Semua Tahun',
    '2024',
    '2025',
    '2026',
    '2027',
    '2028',
    '2029',
    '2030',
    '2031'
  ];
  final List<String> months = [
    'Semua Bulan',
    'Januari',
    'Februari',
    'Maret',
    'April',
    'Mei',
    'Juni',
    'Juli',
    'Agustus',
    'September',
    'Oktober',
    'November',
    'Desember'
  ];

  String dropdownValue = 'Recommended';

  // ExpansionTile state variables
  bool _isUmrahExpanded = true;
  bool _isHajiExpanded = true;
  bool _isLainnyaExpanded = true;

  // Checkbox state variables
  bool _isUmrahRegulerChecked = true; // Initially checked
  bool _isUmrahPlusChecked = false; // Initially unchecked
  bool _isHajiFurodaChecked = false; // Initially unchecked
  bool _isHajiKhususChecked = true; // Initially checked
  bool _isRegulerChecked = false; // Initially unchecked
  bool _isFlexibleChecked = true; // Initially checked

  List<Product> filteredProductList = [];

  @override
  void initState() {
    super.initState();
    filteredProductList = productList; // Initial product list

    selectedCategory =
    widget.kategori.isNotEmpty ? widget.kategori : 'Semua Paket';
    selectedYear = widget.tahun.isNotEmpty ? widget.tahun : 'Semua Tahun';
    selectedMonth = widget.bulan.isNotEmpty ? widget.bulan : 'Semua Bulan';
  }

  void filterProducts() {
    setState(() {
      filteredProductList = productList.where((product) {
        final matchesCategory = selectedCategory == 'Semua Paket' ||
            product.category == selectedCategory;
        final matchesYear = selectedYear == 'Semua Tahun' ||
            product.year.toString() == selectedYear;
        final matchesMonth = selectedMonth == 'Semua Bulan' ||
            product.month.toString() == selectedMonth;
        print('Filtered Category: $selectedCategory');
        print('Filtered Year: $selectedYear');
        print('Filtered Month: $selectedMonth');
        return matchesCategory && matchesYear && matchesMonth;
      }).toList();

      // Apply sorting
      if (dropdownValue == 'Price: Low to High') {
        filteredProductList.sort((a, b) => a.price.compareTo(b.price));
      } else if (dropdownValue == 'Price: High to Low') {
        filteredProductList.sort((a, b) => b.price.compareTo(a.price));
      } else if (dropdownValue == 'Top Rated') {
        filteredProductList.sort((a, b) => b.rating.compareTo(a.rating));
      }
      // 'Recommended' will keep the original order.
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAFBFC),
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: Header(), // Reuse the Header widget here
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: SizedBox(
                width: 1283, // The width as shown in the image
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 48.0),
                    // Top Search Filters
                    TopSearchFilterDestination(
                      categories: categories,
                      years: years,
                      months: months,
                      initialCategory: selectedCategory,
                      initialYear: selectedYear,
                      initialMonth: selectedMonth,
                      onSearch:
                          (selectedCategory, selectedYear, selectedMonth) {
                        setState(() {
                          this.selectedCategory =
                              selectedCategory ?? 'Semua Paket';
                          this.selectedYear = selectedYear ?? 'Semua Tahun';
                          this.selectedMonth = selectedMonth ?? 'Semua Bulan';
                          filterProducts(); // Re-filter products based on the new filters
                        });
                      },
                    ),
                    // Filters + Packages Row
                    const SizedBox(height: 32),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Left side filters
                        LeftSideFilterDestinasi(),
                        // Right side package cards
                        RightSideFilterDestinasi(),
                      ],
                    ),
                    const SizedBox(height: 32),
                  ],
                ),
              ),
            ),
            const Footer()
          ],
        ),
      ),
    );
  }

  Expanded RightSideFilterDestinasi() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Menampilkan ${filteredProductList.length} dari ${productList.length} Paket',
                  style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontFamily: montserrat),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'Sort by',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(width: 4),
                    DropdownButton<String>(
                      value: dropdownValue,
                      icon: const Icon(Icons.arrow_drop_down),
                      iconSize: 24,
                      elevation: 16,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                      underline: Container(
                        height: 0, // Removes the underline
                      ),
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownValue = newValue!;
                          filterProducts();
                        });
                      },
                      items: <String>[
                        'Recommended',
                        'Price: Low to High',
                        'Price: High to Low',
                        'Top Rated'
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ],
                )
              ],
            ),
          ),
          // GridView to display package cards
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: MediaQuery.of(context).size.width < 600 ? 2 : 3,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 0.75,
              ),
              itemCount: filteredProductList.length, // Dynamic item count from the filtered list
              itemBuilder: (context, index) {
                final product = filteredProductList[index]; // Fetch the product object
                return ProductCard(
                  product: product, // Pass the entire product object
                );
              },
            ),
          ),
          // "Show more results" button
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.0),
            child: Center(
              child: ElevatedButton(
                onPressed: () {
                  // Implement the show more results functionality if needed
                },
                style: ElevatedButton.styleFrom(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                ),
                child: const Text('Show more results'),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container LeftSideFilterDestinasi() {
    return Container(
      width: 300, // Fixed width for the filter section
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Filters', style: TextStyle(fontSize: 18)),
          const SizedBox(height: 28),
          // Umrah Section
          Theme(
            data: ThemeData().copyWith(dividerColor: Colors.transparent),
            child: ExpansionTile(
              iconColor: Colors.black,
              title: const Text('Umrah'),
              initiallyExpanded: _isUmrahExpanded,
              onExpansionChanged: (expanded) {
                setState(() {
                  _isUmrahExpanded = expanded;
                });
              },
              children: [
                CheckboxListTile(
                  title: const Text('Umrah Reguler'),
                  value: _isUmrahRegulerChecked,
                  onChanged: (value) {
                    setState(() {
                      _isUmrahRegulerChecked = value!;
                    });
                  },
                ),
                CheckboxListTile(
                  title: const Text('Umrah Plus'),
                  value: _isUmrahPlusChecked,
                  onChanged: (value) {
                    setState(() {
                      _isUmrahPlusChecked = value!;
                    });
                  },
                ),
              ],
            ),
          ),
          // Haji Section
          const Divider(),
          Theme(
            data: ThemeData().copyWith(dividerColor: Colors.transparent),
            child: ExpansionTile(
              iconColor: Colors.black,
              title: const Text('Haji'),
              initiallyExpanded: _isHajiExpanded,
              onExpansionChanged: (expanded) {
                setState(() {
                  _isHajiExpanded = expanded;
                });
              },
              children: [
                CheckboxListTile(
                  title: const Text('Haji Furoda'),
                  value: _isHajiFurodaChecked,
                  onChanged: (value) {
                    setState(() {
                      _isHajiFurodaChecked = value!;
                    });
                  },
                ),
                CheckboxListTile(
                  title: const Text('Haji Khusus'),
                  value: _isHajiKhususChecked,
                  onChanged: (value) {
                    setState(() {
                      _isHajiKhususChecked = value!;
                    });
                  },
                ),
              ],
            ),
          ),
          // Wisata Lainnya Section
          const Divider(),
          Theme(
            data: ThemeData().copyWith(dividerColor: Colors.transparent),
            child: ExpansionTile(
              iconColor: Colors.black,
              title: const Text('Wisata Lainnya'),
              initiallyExpanded: _isLainnyaExpanded,
              onExpansionChanged: (expanded) {
                setState(() {
                  _isLainnyaExpanded = expanded;
                });
              },
              children: [
                CheckboxListTile(
                  title: const Text('Reguler'),
                  value: _isRegulerChecked,
                  onChanged: (value) {
                    setState(() {
                      _isRegulerChecked = value!;
                    });
                  },
                ),
                CheckboxListTile(
                  title: const Text('Flexible'),
                  value: _isFlexibleChecked,
                  onChanged: (value) {
                    setState(() {
                      _isFlexibleChecked = value!;
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
