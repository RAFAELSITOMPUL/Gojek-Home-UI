import 'package:flutter/material.dart';
import '../constants/app_constants.dart';
import 'main_service_card.dart';

class ServicesGrid extends StatelessWidget {
  final EdgeInsets margin;
  final int crossAxisCount;
  final double childAspectRatio;
  final List<ServiceCard> services;

  const ServicesGrid({
    Key? key,
    this.margin = const EdgeInsets.symmetric(horizontal: 16.0),
    this.crossAxisCount = 4,
    this.childAspectRatio = 0.7,
    this.services = const [],
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final servicesList = services.isNotEmpty ? services : _getDefaultServices();
    
    // screen width
    final screenWidth = MediaQuery.of(context).size.width;
    final isLargeScreen = screenWidth > 600;
    
    // adjust spacing based on screen size
    final verticalSpacing = isLargeScreen ? 8.0 : 16.0;
    final horizontalSpacing = isLargeScreen ? 8.0 : 16.0;

    return Container(
      margin: margin,
      padding: EdgeInsets.zero,
      child: GridView.count(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        crossAxisCount: crossAxisCount,
        childAspectRatio: isLargeScreen ? 1.2 : childAspectRatio, // Increase aspect ratio to reduce height
        mainAxisSpacing: verticalSpacing, // space between rows
        crossAxisSpacing: horizontalSpacing, // space between columns
        children: servicesList,
      ),
    );
  }

  List<ServiceCard> _getDefaultServices() {
    return [
      const ServiceCard(
        label: 'GoRide',
        badgeText: '5RB!',
        badgeColor: Colors.black,
        iconBackgroundColor: AppColors.lightGreen,
        icon: Icons.motorcycle,
        iconColor: AppColors.darkGreen,
      ),
      const ServiceCard(
        label: 'GoCar',
        badgeText: '6RB!',
        badgeColor: Colors.black,
        iconBackgroundColor: AppColors.lightGreen,
        icon: Icons.directions_car,
        iconColor: AppColors.darkGreen,
      ),
      ServiceCard(
        label: 'GoFood',
        badgeText: '-50%',
        badgeColor: AppColors.red,
        iconBackgroundColor: AppColors.red.withAlpha(51),
        icon: Icons.restaurant,
        iconColor: AppColors.red,
      ),
      const ServiceCard(
        label: 'GoSend',
        badgeText: '5RB!',
        badgeColor: Colors.black,
        iconBackgroundColor: AppColors.lightGreen,
        icon: Icons.local_shipping,
        iconColor: AppColors.darkGreen,
      ),
      ServiceCard(
        label: 'GoMart',
        badgeText: '-60%',
        badgeColor: AppColors.red,
        iconBackgroundColor: AppColors.red.withAlpha(51),
        icon: Icons.shopping_basket,
        iconColor: AppColors.red,
      ),
      ServiceCard(
        label: 'GoPay Pinjam',
        badgeText: '1JUTA',
        badgeColor: AppColors.blue,
        iconBackgroundColor: Colors.blue.withAlpha(51),
        icon: Icons.account_balance,
        iconColor: Colors.blue,
      ),
      ServiceCard(
        label: 'GoFood HEMAT',
        badgeText: '12RB!',
        badgeColor: AppColors.red,
        iconBackgroundColor: AppColors.red.withAlpha(51),
        icon: Icons.thumb_up,
        iconColor: AppColors.red,
      ),
      ServiceCard(
        label: 'Lainnya',
        badgeText: '',
        badgeColor: Colors.transparent,
        iconBackgroundColor: Colors.grey.withAlpha(51),
        icon: Icons.grid_view_rounded,
        iconColor: Colors.grey,
      ),
    ];
  }
} 