import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CCCCarouselSliderPage extends StatelessWidget {
  const CCCCarouselSliderPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: const Text('CCC Carousel')),
        body: Center(
          child: CarouselSlider.builder(
            itemCount: 3,
            itemBuilder: (context, itemIndex, pageIndex) => Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Container(
                color: [
                  Colors.red,
                  Colors.blue,
                  Colors.green,
                ][itemIndex % 3],
              ),
            ),
            options: CarouselOptions(
              autoPlay: true,
              viewportFraction: 0.7,
              disableCenter: true,
              padEnds: false,
              height: MediaQuery.of(context).size.height / 2,
            ),
          ),
        ),
      );
}
