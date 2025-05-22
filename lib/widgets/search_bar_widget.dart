import 'package:flutter/material.dart';
import '../constants/app_constants.dart';

class SearchBarWidget extends StatelessWidget {
  final String hintText;
  final bool showShadow;
  final bool showBorder;
  final VoidCallback? onProfileTap;
  final bool hasNotification;
  final VoidCallback? onTap;

  const SearchBarWidget({
    Key? key,
    this.hintText = 'made with ❤️ by @Rafael_Paulus_Sitompul',
    this.showShadow = true,
    this.showBorder = false,
    this.onProfileTap,
    this.hasNotification = true,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: onTap,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                height: 50,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(30),
                  border: showBorder
                      ? Border.all(color: Colors.grey.shade300, width: 1.0)
                      : null,
                  boxShadow: const [],
                ),
                child: Row(
                  children: [
                    const SizedBox(width: 15),
                    const Icon(Icons.search, color: AppColors.darkGrey),
                    const SizedBox(width: 10),
                    Text(
                      hintText,
                      style: AppTextStyles.body
                          .copyWith(color: AppColors.darkGrey),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
          GestureDetector(
            onTap: onProfileTap,
            child: Stack(
              children: [
                const CircleAvatar(
                  backgroundColor: AppColors.white,
                  radius: 20,
                  child: Icon(Icons.person, color: AppColors.darkGreen),
                ),
                if (hasNotification)
                  Positioned(
                    right: 0,
                    top: 0,
                    child: Container(
                      width: 12,
                      height: 12,
                      decoration: const BoxDecoration(
                        color: AppColors.red,
                        shape: BoxShape.circle,
                      ),
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
