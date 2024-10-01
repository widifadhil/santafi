import 'package:flutter/material.dart';

class TopSearchFilterDestination extends StatefulWidget {
  final List<String> categories; // Kategori perjalanan
  final List<String> years; // Daftar tahun
  final List<String> months; // Daftar bulan

  final Function(String?, String?, String?) onSearch;
  final String initialCategory;
  final String initialYear;
  final String initialMonth;

  const TopSearchFilterDestination({
    super.key,
    required this.categories,
    required this.years,
    required this.months,
    required this.onSearch,
    this.initialCategory = 'Semua Paket',
    this.initialYear = 'Semua Tahun',
    this.initialMonth = 'Semua Bulan',
  });

  @override
  _TopSearchFilterDestinationState createState() => _TopSearchFilterDestinationState();
}

class _TopSearchFilterDestinationState extends State<TopSearchFilterDestination> {
  String? _selectedCategory;
  String? _selectedYear;
  String? _selectedMonth;

  @override
  void initState() {
    super.initState();
    // Initialize the selected values only if they exist in the respective lists
    _selectedCategory = widget.categories.contains(widget.initialCategory)
        ? widget.initialCategory
        : null;
    _selectedYear = widget.years.contains(widget.initialYear)
        ? widget.initialYear
        : null;
    _selectedMonth = widget.months.contains(widget.initialMonth)
        ? widget.initialMonth
        : null;
  }

  // Function to handle search action
  void _onSearchPressed() {
    // Perform search logic here with selected filters
    print('Selected Category: $_selectedCategory');
    print('Selected Year: $_selectedYear');
    print('Selected Month: $_selectedMonth');
    widget.onSearch(_selectedCategory, _selectedYear, _selectedMonth);
    // You can replace the above print statements with your actual search logic
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.15),
            blurRadius: 16,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            // Dropdown for Category
            Expanded(
              child: DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  labelText: 'Kategori Perjalanan',
                  prefixIcon: Icon(Icons.location_on_rounded),
                  border: OutlineInputBorder(),
                ),
                value: _selectedCategory,
                items: widget.categories.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    _selectedCategory = newValue;
                  });
                },
              ),
            ),
            const SizedBox(width: 24),

            // Dropdown for Year
            Expanded(
              child: DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  labelText: 'Tahun',
                  prefixIcon: Icon(Icons.calendar_today),
                  border: OutlineInputBorder(),
                ),
                value: _selectedYear,
                items: widget.years.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    _selectedYear = newValue;
                  });
                },
              ),
            ),
            const SizedBox(width: 24),

            // Dropdown for Month
            Expanded(
              child: DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  labelText: 'Bulan',
                  prefixIcon: Icon(Icons.calendar_month),
                  border: OutlineInputBorder(),
                ),
                value: _selectedMonth,
                items: widget.months.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    _selectedMonth = newValue;
                  });
                },
              ),
            ),
            const SizedBox(width: 16),

            // Search Button
            ElevatedButton(
              onPressed: _onSearchPressed,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(16),
                backgroundColor: const Color(0xFF0047BB),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                minimumSize: const Size(55, 55),
              ),
              child: const Icon(
                Icons.search,
                color: Colors.white,
                size: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }
}