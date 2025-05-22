import 'package:flutter/material.dart';
import '../constants/app_constants.dart';

class SmallDiscountCard extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;
  final Color backgroundColor;
  final EdgeInsets margin;

  const SmallDiscountCard({
    Key? key,
    this.text = 'Diskon s.d. 10rb/transaksi. Yuk, langganan',
    this.onTap,
    this.backgroundColor = AppColors.primaryGreen,
    this.margin = const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: margin,
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Row(
          children: [
            const Icon(Icons.local_offer, color: AppColors.white),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                text,
                style: AppTextStyles.body.copyWith(color: AppColors.white),
              ),
            ),
            const Icon(Icons.arrow_forward, color: AppColors.white),
          ],
        ),
      ),
    );
  }
} 