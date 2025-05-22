import 'package:flutter/material.dart';
import '../constants/app_constants.dart';

class PromoContentCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final Color bannerColor;
  final Widget? actionButton;
  final bool hasImage;
  final double imageHeight;
  final EdgeInsets margin;
  final String? imagePath;

  const PromoContentCard({
    Key? key,
    required this.title,
    required this.subtitle,
    this.bannerColor = Colors.green,
    this.actionButton,
    this.hasImage = true,
    this.imageHeight = 200,
    this.margin = const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
    this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(30),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (hasImage)
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16.0),
                topRight: Radius.circular(16.0),
              ),
              child: Container(
                width: double.infinity,
                height: imageHeight,
                color: bannerColor,
                child: imagePath != null
                    ? Image.asset(
                        imagePath!,
                        width: double.infinity,
                        height: double.infinity,
                        fit: BoxFit.cover,
                      )
                    : const Center(
                        child: Text(
                          "Space for promotional image\n add yours on home_screen.dart",
                          style: TextStyle(
                            color: Colors.white70,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ),
              ),
            ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppTextStyles.subheading,
                ),
                const SizedBox(height: 8),
                Text(
                  subtitle,
                  style: AppTextStyles.body.copyWith(color: AppColors.darkGrey),
                ),
                if (actionButton != null) 
                  Padding(
                    padding: const EdgeInsets.only(top: 12.0),
                    child: actionButton,
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
} 