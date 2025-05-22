import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String name;
  final String description;
  final String price;
  final Color backgroundColor;
  final String? discountBadge;
  final String? dayBadge;
  final String? imagePath;

  const ProductCard({
    Key? key,
    required this.name,
    required this.description,
    required this.price,
    this.backgroundColor = Colors.blue,
    this.discountBadge,
    this.dayBadge,
    this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(28),
            blurRadius: 8,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
                child: Container(
                  height: 180,
                  width: double.infinity,
                  color: backgroundColor,
                  child: imagePath != null
                      ? Center(
                          child: Image.asset(
                            imagePath!,
                            width: 120,
                            height: 120,
                            fit: BoxFit.contain,
                          ),
                        )
                      : const Center(
                        child: Text(
                          "add an image here",
                          style: TextStyle(
                            color: Colors.white70,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ),
              ),
              ),
              if (discountBadge != null)
                Positioned(
                  left: 0,
                  top: 0,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12),
                        bottomRight: Radius.circular(12),
                      ),
                    ),
                    child: Text(
                      discountBadge!,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
              if (dayBadge != null)
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12),
                      ),
                    ),
                    child: Column(
                      children: [
                        const Text(
                          'SETIAP HARI',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 8,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          dayBadge!,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 14,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),
                Text(
                  price,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
} 