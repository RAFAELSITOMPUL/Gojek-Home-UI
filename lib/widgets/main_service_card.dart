import 'package:flutter/material.dart';
import '../constants/app_constants.dart';

class ServiceCard extends StatelessWidget {
  final String label;
  final String badgeText;
  final Color badgeColor;
  final Color iconBackgroundColor;
  final IconData icon;
  final Color? iconColor;

  const ServiceCard({
    Key? key,
    required this.label,
    required this.badgeText,
    required this.badgeColor,
    required this.iconBackgroundColor,
    required this.icon,
    this.iconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isLargeScreen = screenWidth > 600;
    
    // adjust spacing based on screen size
    final verticalSpacing = isLargeScreen ? 4.0 : 8.0;
    
    final Color effectiveIconColor = iconColor ?? _determineIconColor(iconBackgroundColor);
    
    return Column(
      mainAxisSize: MainAxisSize.min, // Use minimum vertical space
      children: [
        Stack(
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: iconBackgroundColor,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Icon(
                icon,
                color: effectiveIconColor,
                size: 30,
              ),
            ),
            if (badgeText.isNotEmpty)
              Positioned(
                top: 0,
                left: 0,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(
                    color: badgeColor,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(16),
                      bottomRight: Radius.circular(16),
                    ),
                  ),
                  child: Text(
                    badgeText,
                    style: const TextStyle(
                      color: AppColors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
          ],
        ),
        SizedBox(height: verticalSpacing),
        Text(
          label,
          style: AppTextStyles.caption.copyWith(
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
          maxLines: isLargeScreen ? 1 : 2, 
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
  
  // idk if its still relevant or not since i'm used to do this lmao
  Color _determineIconColor(Color backgroundColor) {
    if (backgroundColor == AppColors.lightGreen) {
      return AppColors.darkGreen;
    }
    
    if (backgroundColor.red > 200 && backgroundColor.alpha < 128) {
      return AppColors.red;
    }
    
    if (backgroundColor.blue > 200 && backgroundColor.alpha < 128) {
      return Colors.blue;
    }
    
    return AppColors.red;
  }
} 