import 'package:flutter/material.dart';
import '../constants/app_constants.dart';
import 'product_card.dart';

class ProductList extends StatelessWidget {
  final String title;
  final String subtitle;
  final List<ProductCard> products;
  final VoidCallback? onSeeAllPressed;

  const ProductList({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.products,
    this.onSeeAllPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.bolt, color: Colors.amber, size: 24),
                          const SizedBox(width: 8),
                          Flexible(
                            child: Text(
                              title,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          const Icon(Icons.bolt, color: Colors.amber, size: 24),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(
                        subtitle,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[600],
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                if (onSeeAllPressed != null)
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: TextButton(
                      onPressed: onSeeAllPressed,
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.green.withAlpha(26),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        minimumSize: const Size(0, 32),
                      ),
                      child: const Text(
                        'Lihat semua',
                        style: TextStyle(
                          color: AppColors.primaryGreen,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 300,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: products,
            ),
          ),
        ],
      ),
    );
  }
} 