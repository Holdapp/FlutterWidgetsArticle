import 'package:flutter/material.dart';

class CCCParallaxScrollingPage extends StatefulWidget {
  const CCCParallaxScrollingPage({super.key});

  @override
  State<CCCParallaxScrollingPage> createState() =>
      _CCCParallaxScrollingPageState();
}

class _CCCParallaxScrollingPageState extends State<CCCParallaxScrollingPage> {
  final ScrollController _scrollController = ScrollController();
  final PageController _pageController = PageController();
  int _currentProductPhoto = 0;
  bool _isFavorite = false;

  double get screenHeight => MediaQuery.of(context).size.height;
  double get scrollingOffset =>
      _scrollController.hasClients ? _scrollController.offset : 0.0;

  List<Widget> get productPhotos => [
        Image.asset(
          'assets/shoes.jpg',
          fit: BoxFit.contain,
        ),
        Image.asset(
          'assets/shoes.jpg',
          fit: BoxFit.contain,
        ),
        Image.asset(
          'assets/shoes.jpg',
          fit: BoxFit.contain,
        ),
      ];

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: const Text('CCC Product')),
        body: Stack(
          children: [
            _productDetails(),
            _productPhotos(),
            _productPhotoIndicator(),
            _actionIcon(),
          ],
        ),
      );

  Widget _productDetails() => ListView(
        cacheExtent: 64,
        controller: _scrollController,
        children: [
          /// Space that we want our product in
          SizedBox(height: screenHeight * 0.35),
          ...List.generate(
            10,
            (index) => Container(
              height: 100,
              color: [
                Colors.red,
                Colors.blue,
                Colors.green,
              ][index % 3],
            ),
          )
        ],
      );

  Widget _productPhotos() => Positioned(
        top: -0.6 * scrollingOffset - kToolbarHeight,
        right: 0,
        left: 0,
        height: screenHeight * 0.35,
        child: PageView(
          onPageChanged: (page) => setState(() => _currentProductPhoto = page),
          controller: _pageController,
          children: productPhotos,
        ),
      );

  Widget _productPhotoIndicator() => Positioned(
        top: screenHeight * 0.25 + kTextTabBarHeight - scrollingOffset,
        left: 0,
        right: 0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            productPhotos.length,
            (index) => _indicatorDot(index),
          ),
        ),
      );

  Widget _indicatorDot(int index) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: InkWell(
          onTap: () => _pageController.animateToPage(
            index,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeIn,
          ),
          child: CircleAvatar(
            radius: 8,
            backgroundColor:
                index == _currentProductPhoto ? Colors.black : Colors.black12,
          ),
        ),
      );

  Widget _actionIcon() => Positioned(
        top: screenHeight * 0.2 + kTextTabBarHeight - scrollingOffset,
        right: 16 - scrollingOffset * 0.25,
        child: IconButton(
          onPressed: () => setState(() => _isFavorite = !_isFavorite),
          icon: Icon(
            _isFavorite ? Icons.favorite : Icons.favorite_border,
            color: _isFavorite ? Colors.red : Colors.black,
          ),
        ),
      );

  @override
  void dispose() {
    _scrollController.dispose();
    _pageController.dispose();
    super.dispose();
  }
}
