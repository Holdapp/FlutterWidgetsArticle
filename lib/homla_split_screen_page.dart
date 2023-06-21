import 'package:flutter/material.dart';

class HomlaSplitScreenPage extends StatelessWidget {
  const HomlaSplitScreenPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: const Text('Homla')),
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  const _ProductView(),
                  Container(
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(16.0)),
                    ),
                    height: 32.0,
                  )
                ],
              ),
            ),
            SliverFillRemaining(
              child: Container(
                color: Colors.red,
                height: MediaQuery.of(context).size.height / 2,
              ),
            ),
          ],
        ),
      );
}

class _ProductView extends StatefulWidget {
  const _ProductView();

  @override
  State<_ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends State<_ProductView> {
  final PageController _pageController = PageController(initialPage: 0);
  int _activeIndex = 0;

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
  Widget build(BuildContext context) => SizedBox(
        height: MediaQuery.of(context).size.height / 2,
        child: Stack(
          alignment: Alignment.centerLeft,
          children: [
            PageView.builder(
              controller: _pageController,
              onPageChanged: (page) => setState(() => _activeIndex = page),
              itemCount: productPhotos.length,
              itemBuilder: (context, index) => productPhotos[index],
              scrollDirection: Axis.vertical,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                productPhotos.length,
                (index) => _dot(_activeIndex == index),
              ),
            ),
          ],
        ),
      );

  Widget _dot(bool isPicked) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4.0),
            color: isPicked ? Colors.black87 : Colors.black38,
          ),
          height: 8.0,
          width: 8.0,
        ),
      );

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
