import 'package:flutter/material.dart';
import '../constants/app_constants.dart';

class RatingCard extends StatefulWidget {
  final int initialRating;
  final Function(int)? onRatingChanged;

  const RatingCard({
    Key? key,
    this.initialRating = 0,
    this.onRatingChanged,
  }) : super(key: key);

  @override
  State<RatingCard> createState() => _RatingCardState();
}

class _RatingCardState extends State<RatingCard> {
  late int _currentRating;
  int _hoverRating = 0;

  @override
  void initState() {
    super.initState();
    _currentRating = widget.initialRating;
  }

  void _updateRating(int rating) {
    setState(() {
      _currentRating = rating;
    });
    if (widget.onRatingChanged != null) {
      widget.onRatingChanged!(rating);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(25),
            blurRadius: 15,
            spreadRadius: 1,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      color: Colors.red.withAlpha(51),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: const Icon(
                      Icons.restaurant,
                      color: Colors.red,
                      size: 16,
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    'gofood',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              GestureDetector(
                onTap: () {},
                child: const Icon(Icons.close, color: AppColors.darkGrey),
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Text(
            'Beri rating untuk driver?',
            style: AppTextStyles.subheading,
          ),
          const SizedBox(height: 8),
          Text(
            'Lawless Jakarta',
            style: AppTextStyles.body.copyWith(color: AppColors.darkGrey),
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 4),
          Text(
            '26 Feb, 8:11 PM',
            style: AppTextStyles.caption.copyWith(color: AppColors.darkGrey),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              5,
              (index) => GestureDetector(
                onTap: () => _updateRating(index + 1),
                child: MouseRegion(
                  onEnter: (_) => setState(() => _hoverRating = index + 1),
                  onExit: (_) => setState(() => _hoverRating = 0),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Icon(
                      _getStarIcon(index + 1),
                      color: _getStarColor(index + 1),
                      size: 36,
                    ),
                  ),
                ),
              ),
            ),
          ),
          if (_currentRating > 0)
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Center(
                child: Text(
                  'Rating: $_currentRating/5',
                  style: AppTextStyles.body.copyWith(
                    color: AppColors.primaryGreen,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  IconData _getStarIcon(int starPosition) {
    if (_hoverRating > 0) {
      return starPosition <= _hoverRating ? Icons.star : Icons.star_border;
    }
    return starPosition <= _currentRating ? Icons.star : Icons.star_border;
  }

  Color _getStarColor(int starPosition) {
    if (_hoverRating > 0) {
      return starPosition <= _hoverRating ? Colors.amber : Colors.grey[400]!;
    }
    return starPosition <= _currentRating ? Colors.amber : Colors.grey[400]!;
  }
} 