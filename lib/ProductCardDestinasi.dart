import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:santafi/DetailPage.dart';
import 'package:santafi/Model/Product.dart'; // Import your Product model

class ProductCard extends StatelessWidget {
  final Product product; // Use Product model

  const ProductCard({
    super.key,
    required this.product,
  });

  // Currency formatter
  String formatCurrency(int amount) {
    final formatter = NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ', decimalDigits: 0);
    return formatter.format(amount);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to the DetailPage with the `product` parameter
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailPage(
              product: product, // Pass the Product instance here
            ),
          ),
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              // Product image
              Container(
                height: 260,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey[300],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    product.imagePath, // Use imagePath from Product
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: Colors.grey[300],
                        alignment: Alignment.center,
                        child: const Text('Image not available'),
                      );
                    },
                  ),
                ),
              ),
              // Share button
              const Positioned(
                top: 16,
                right: 16,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 16,
                  child: Icon(Icons.ios_share_rounded, color: Colors.black, size: 16),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          // Price
          Text(
            formatCurrency(product.price), // Use price from Product
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xFF000000),
            ),
          ),
          const SizedBox(height: 4),
          // Package title
          Text(
            product.title, // Use title from Product
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 4),
          // Date and duration info
          Row(
            children: [
              const Icon(Icons.calendar_today, size: 14, color: Colors.grey),
              const SizedBox(width: 4),
              Text(
                product.date, // Use date from Product
                style: TextStyle(color: Colors.grey[600], fontSize: 12),
              ),
              const SizedBox(width: 16),
              const Icon(Icons.access_time, size: 14, color: Colors.grey),
              const SizedBox(width: 4),
              Text(
                product.duration, // Use duration from Product
                style: TextStyle(color: Colors.grey[600], fontSize: 12),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
