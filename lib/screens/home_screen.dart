import 'package:flutter/material.dart';
import '../constants/app_constants.dart';
import '../widgets/driver_rating_card.dart';
import '../widgets/promo_content_card.dart';
import '../widgets/product_card.dart';
import '../widgets/product_list.dart';
import '../widgets/wallet_card.dart';
import '../widgets/search_bar_widget.dart';
import '../widgets/bottom_nav_bar.dart';
import '../widgets/small_discount_card.dart';
import '../widgets/main_service_grid.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();
  bool _isScrolled = false;
  double _scrollOffset = 0.0;
  final int _currentNavIndex = 0;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    final offset = _scrollController.offset;
    setState(() {
      _scrollOffset = offset;
      _isScrolled = offset > 10;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final statusBarHeight = MediaQuery.of(context).padding.top;

    const walletCardHeight = 120.0;

    final greenBackgroundHeight = screenHeight < 600
        ? screenHeight * 0.4
        : screenHeight < 800
            ? screenHeight * 0.35
            : screenHeight * 0.3;

    const minGreenHeight = 200.0;
    const maxGreenHeight = 350.0;
    final clampedGreenHeight =
        greenBackgroundHeight.clamp(minGreenHeight, maxGreenHeight);

    final adjustedBackgroundHeight =
        clampedGreenHeight - _scrollOffset.clamp(0.0, clampedGreenHeight);

    final walletCardTopPosition = clampedGreenHeight - (walletCardHeight * 0.4);
    final adjustedWalletPosition = walletCardTopPosition - statusBarHeight - 56;
    const minPosition = 20.0;
    final walletMarginTop = adjustedWalletPosition > minPosition
        ? adjustedWalletPosition
        : minPosition;

    return  Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Stack(
children: [
  TopBackground(adjustedBackgroundHeight: adjustedBackgroundHeight),
  SafeArea(child: Column(
    children: [
      _searchBarWidget(),
      Expanded(child: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: walletMarginTop,),
            _walletCard(),
            const SizedBox(height: 24,),
            const ServicesGrid(),
            const SizedBox(height: 8,),
            _discountCard(),
            _rateText(),
            const RatingCard(),
            const SizedBox(height: 20,),
            _promoCard(),
            _lowestCard(),
            _promoSecondCard(),
            const SizedBox(height: 20,),
            
          ],
        ),
      ))
    ],
  ))
],
      ),
     
    );
  }

































  PromoContentCard _promoSecondCard() {
    return const PromoContentCard(
      title: 'Need rice in a hurry?',
      subtitle: 'GoMart delivers groceries in minutes. Click 🛒 ⚡',
      bannerColor: Color(0xFFFFAA33),
      imageHeight: 180,
    );
  }

  Padding _lowestCard() {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: ProductList(
        title: 'LOWEST PRICE PROMOS',
        subtitle: 'Discounts up to 40% all day long. Hurry up, GoMart!',
        onSeeAllPressed: () {},
        products: _getProductCards(),
      ),
    );
  }

  PromoContentCard _promoCard() {
    return const PromoContentCard(
      title: 'Exciting news for everyone! Try it now! 💙',
      subtitle:
          'Now you can use GoPay Later for Gojek PLUS subscriptions. More convenient + auto-renews every month, starting from just \$0.60!',
      bannerColor: Color(0xFF7FFF00),
      imageHeight: 180,
    );
  }

  Padding _rateText() {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: Text(
        'Give us your rating!',
        style: AppTextStyles.subheading,
      ),
    );
  }

  SmallDiscountCard _discountCard() {
    return const SmallDiscountCard(
      text: 'Discount up to \$10 per transaction. Subscribe now!',
    );
  }

  WalletCard _walletCard() {
    return const WalletCard(
      balance: '\$1,000',
      coins: '50,000 coins',
      notificationCount: 2,
    );
  }

  AnimatedContainer _searchBarWidget() {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      color: _isScrolled ? AppColors.white : Colors.transparent,
      child: SearchBarWidget(
        showShadow: false,
        showBorder: _isScrolled,
        onProfileTap: () {},
        onTap: () {},
      ),
    );
  }

  List<ProductCard> _getProductCards() {
    return [
      ProductCard(
          name: 'Le Minerale',
          description: 'Gallon 15L',
          price: '\$1.00',
          backgroundColor: Colors.purple.withAlpha(77),
          discountBadge: '31%',
          dayBadge: 'MONDAY'),
      ProductCard(
          name: 'Instant Noodles',
          description: 'Fried 84g',
          price: '\$0.13',
          backgroundColor: Colors.blue.withAlpha(77),
          discountBadge: '39%',
          dayBadge: 'TUESDAY'),
      ProductCard(
          name: 'Ultra Milk',
          description: 'UHT 1L',
          price: '\$1.00',
          backgroundColor: Colors.cyan.withAlpha(77)),
      ProductCard(
          name: 'Premium Rice',
          description: '5kg',
          price: '\$5.00',
          backgroundColor: Colors.amber.withAlpha(77),
          discountBadge: '25%',
          dayBadge: 'THURSDAY'),
      ProductCard(
          name: 'Bottled Water',
          description: '500ml',
          price: '\$0.25',
          backgroundColor: Colors.teal.withAlpha(77),
          discountBadge: '10%',
          dayBadge: 'FRIDAY'),
      ProductCard(
          name: 'Wafer Tango',
          description: 'Sachet 200g',
          price: '\$0.80',
          backgroundColor: Colors.pink.withAlpha(77),
          discountBadge: '20%',
          dayBadge: 'SATURDAY'),
      ProductCard(
          name: 'Coffee',
          description: 'Sachet 35g',
          price: '\$0.20',
          backgroundColor: Colors.cyan.withAlpha(77)),
    ];
  }
}

class TopBackground extends StatelessWidget {
  const TopBackground({
    super.key,
    required this.adjustedBackgroundHeight,
  });

  final double adjustedBackgroundHeight;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      height: adjustedBackgroundHeight,
      child: Container(
        decoration: const BoxDecoration(
          color: AppColors.lightGreen,
        ),
      ),
    );
  }
}
