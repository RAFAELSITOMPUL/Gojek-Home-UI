import 'package:flutter/material.dart';
import '../constants/app_constants.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;
  final List<bool> hasBadge;

  const BottomNavBar({
    Key? key,
    this.currentIndex = 0,
    required this.onTap,
    this.hasBadge = const [false, true, false, true],
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(26),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      padding: const EdgeInsets.only(top: 8.0),
      child: SafeArea(
        top: false,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem(0, Icons.home, 'Beranda', currentIndex == 0, hasBadge[0]),
            _buildNavItem(1, Icons.local_offer, 'Promo', currentIndex == 1, hasBadge[1]),
            _buildNavItem(2, Icons.format_list_bulleted_rounded, 'Aktivitas', currentIndex == 2, hasBadge[2]),
            _buildNavItem(3, Icons.chat, 'Chat', currentIndex == 3, hasBadge[3]),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(int index, IconData icon, String label, bool isActive, bool badge) {
    // hitbox 
    return Expanded(
      child: GestureDetector(
        onTap: () => onTap(index),
        behavior: HitTestBehavior.opaque, 
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // green indicator line for active item
            if (isActive)
              Container(
                width: 24,
                height: 3,
                decoration: BoxDecoration(
                  color: AppColors.primaryGreen,
                  borderRadius: BorderRadius.circular(1.5),
                ),
              )
            else
              const SizedBox(height: 3),
            const SizedBox(height: 4),
            // gradient background for active item
            Container(
              decoration: isActive
                  ? BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          AppColors.primaryGreen.withAlpha(51),
                          AppColors.primaryGreen.withAlpha(0),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(8),
                    )
                  : null,
              padding: const EdgeInsets.all(4),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Icon(
                    icon,
                    color: isActive ? AppColors.primaryGreen : AppColors.darkGrey,
                  ),
                  if (badge)
                    Positioned(
                      right: -8,
                      top: -8,
                      child: Container(
                        width: 16,
                        height: 16,
                        decoration: const BoxDecoration(
                          color: AppColors.red,
                          shape: BoxShape.circle,
                        ),
                        child: const Center(
                          child: Text(
                            '1',
                            style: TextStyle(
                              color: AppColors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                color: isActive ? AppColors.primaryGreen : AppColors.darkGrey,
              ),
            ),
          ],
        ),
      ),
    );
  }
} 