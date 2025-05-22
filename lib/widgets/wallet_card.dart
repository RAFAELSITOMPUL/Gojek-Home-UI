import 'package:flutter/material.dart';
import '../constants/app_constants.dart';

class WalletCard extends StatelessWidget {
  final String balance;
  final String coins;
  final VoidCallback? onPayPressed;
  final VoidCallback? onTopUpPressed;
  final VoidCallback? onMorePressed;
  final int notificationCount;

  const WalletCard({
    Key? key,
    required this.balance,
    required this.coins,
    this.onPayPressed,
    this.onTopUpPressed,
    this.onMorePressed,
    this.notificationCount = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 360;
    
    final horizontalPadding = isSmallScreen ? 12.0 : 16.0;
    final actionSpacing = isSmallScreen ? 12.0 : 20.0;
    final iconSize = isSmallScreen ? 18.0 : 20.0;
    
    return Container(
      margin: EdgeInsets.symmetric(horizontal: horizontalPadding),
      padding: EdgeInsets.all(horizontalPadding),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(20),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(Icons.account_balance_wallet, 
                color: AppColors.blue,
                size: isSmallScreen ? 20.0 : 24.0,
              ),
              SizedBox(width: isSmallScreen ? 6.0 : 8.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    balance,
                    style: AppTextStyles.subheading,
                  ),
                  Text(
                    coins,
                    style: AppTextStyles.caption.copyWith(color: AppColors.darkGrey),
                  ),
                ],
              ),
            ],
          ),
          Row(
            children: [
              _buildRectangleAction(Icons.arrow_upward_rounded, 'Bayar', onPayPressed, iconSize),
              SizedBox(width: actionSpacing),
              _buildRectangleAction(Icons.add_rounded, 'Top Up', onTopUpPressed, iconSize),
              SizedBox(width: actionSpacing),
              Stack(
                clipBehavior: Clip.none, // Allow notification badge to overflow
                children: [
                  _buildCircleAction(Icons.more_horiz, 'Lainnya', onMorePressed, iconSize * 0.7),
                  if (notificationCount > 0)
                    Positioned(
                      right: -0,
                      top: -5,
                      child: Container(
                        width: 18,
                        height: 18,
                        decoration: BoxDecoration(
                          color: AppColors.red,
                          shape: BoxShape.circle,
                          border: Border.all(color: AppColors.white, width: 1),
                        ),
                        child: Center(
                          child: Text(
                            notificationCount.toString(),
                            style: const TextStyle(
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
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildRectangleAction(IconData icon, String label, VoidCallback? onPressed, double iconSize) {
    return GestureDetector(
      onTap: onPressed,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
            decoration: BoxDecoration(
              color: AppColors.blue,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              icon,
              color: AppColors.white,
              size: iconSize,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: AppTextStyles.caption.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCircleAction(IconData icon, String label, VoidCallback? onPressed, double iconSize) {
    return GestureDetector(
      onTap: onPressed,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: const BoxDecoration(
              color: AppColors.blue,
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              color: AppColors.white,
              size: iconSize,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: AppTextStyles.caption.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
} 