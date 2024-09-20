import 'package:flutter/material.dart';

class SearchBarDestinasiKategoriPerjalanan extends StatelessWidget {
  const SearchBarDestinasiKategoriPerjalanan({super.key, required this.icon, required this.label});
  final String label;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(
            color: Colors.black, // Label color when focused
          ),
          prefixIcon: Icon(icon),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black), // Change focus color here
            borderRadius: BorderRadius.circular(8),
          ),

          border: const OutlineInputBorder(),
        ),
        dropdownColor: Colors.white, // Set the background color to white
        items: ['Haji & Umrah', 'Wisata Domestik', 'Wisata Mancanegara'].map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: (_) {},
      ),
    );
  }
}

class SearchBarDestinasiTahun extends StatelessWidget {
  const SearchBarDestinasiTahun({super.key, required this.icon, required this.label});
  final String label;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(
            color: Colors.black, // Label color when focused
          ),
          prefixIcon: Icon(icon),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black), // Change focus color here
            borderRadius: BorderRadius.circular(8),
          ),
          border: const OutlineInputBorder(),
        ),
        dropdownColor: Colors.white, // Set the background color to white
        items: ['2024', '2025', '2026', '2030'].map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: (_) {},
      ),
    );
  }
}

class SearchBarDestinasiBulan extends StatelessWidget {
  const SearchBarDestinasiBulan({super.key, required this.icon, required this.label});
  final String label;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(
            color: Colors.black, // Label color when focused
          ),
          prefixIcon: Icon(icon),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black), // Change focus color here
            borderRadius: BorderRadius.circular(8),
          ),
          border: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue)
          ),
        ),
        dropdownColor: Colors.white, // Set the background color to white
        items: ['Januari', 'Februari', 'Maret', 'April'].map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: (_) {},
      ),
    );
  }
}
