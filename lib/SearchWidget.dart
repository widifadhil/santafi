import 'package:flutter/material.dart';
import 'package:santafi/destinasi.dart';

class SearchWidget extends StatefulWidget {
  const SearchWidget({super.key});

  @override
  _SearchWidgetState createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  String selectedCategory = 'Pilih Tujuan Anda';
  String selectedYear = 'Pilih Tahun';
  String selectedMonth = 'Pilih Bulan';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
      width: 658,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(62),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.10),
            blurRadius: 32,
            blurStyle: BlurStyle.normal,
            offset: const Offset(0.0, 15.0),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Kategori Perjalanan',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w200,
                  color: Colors.grey,
                  fontFamily: 'PlusJakartaSans',
                ),
              ),
              SizedBox(
                height: 30,
                child: Row(
                  children: [
                    const Icon(Icons.location_on_rounded, color: Colors.orange, size: 16),
                    const SizedBox(width: 8),
                    DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        icon: const Visibility (visible:false, child: Icon(Icons.arrow_downward)),
                        dropdownColor: Colors.white,
                        value: selectedCategory,
                        items: <String>[
                          'Pilih Tujuan Anda',
                          'Haji&Umrah',
                          'Wisata Domestik',
                          'Wisata Internasional'
                        ].map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'PlusJakartaSans',
                              ),
                            ),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedCategory = newValue!;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 40,
            child: VerticalDivider(
              width: 30,
              thickness: 1,
              color: Colors.grey,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Tahun',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w200,
                  color: Colors.grey,
                  fontFamily: 'PlusJakartaSans',
                ),
              ),
              SizedBox(
                height: 30,
                child: Row(
                  children: [
                    const Icon(Icons.calendar_month_rounded, color: Colors.orange, size: 16),
                    const SizedBox(width: 8),
                    SizedBox(
                      width: 100,
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: selectedYear,
                          items: <String>[
                            'Pilih Tahun',
                            '2024',
                            '2025',
                            '2026'
                          ].map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'PlusJakartaSans',
                                ),
                              ),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedYear = newValue!;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Bulan',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w200,
                  color: Colors.grey,
                  fontFamily: 'PlusJakartaSans',
                ),
              ),
              SizedBox(
                height: 30,
                child: Row(
                  children: [
                    const Icon(Icons.calendar_month_rounded, color: Colors.orange, size: 16),
                    const SizedBox(width: 8),
                    SizedBox(
                      width: 125,
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: selectedMonth,
                          items: <String>[
                            'Pilih Bulan',
                            'April',
                            'September',
                            'Oktober',
                            'November',
                            'Desember'
                          ].map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'PlusJakartaSans',
                                ),
                              ),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedMonth = newValue!;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(width: 15),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DestinasiPage(
                    kategori: selectedCategory,
                    tahun: selectedYear,
                    bulan: selectedMonth,
                  ),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              backgroundColor: Colors.blue[900],
            ),
            child: const Text(
              'Cari',
              style: TextStyle(
                fontSize: 12,
                fontFamily: 'PlusJakartaSans',
                fontWeight: FontWeight.w200,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
