import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';

class CarouselWidget extends StatelessWidget {
  final List<String> imageUrls = [
    'lib/images/1.jpg',
    'lib/images/4.jpg',
    'lib/images/10.jpg',
    'lib/images/12.jpg',
    'lib/images/13.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200.0,
      child: Swiper(
        itemBuilder: (BuildContext context, int index) {
          return Image.asset(
            imageUrls[index],
            fit: BoxFit.cover,
          );
        },
        itemCount: imageUrls.length,
        autoplay: true,
        pagination: const SwiperPagination(),
        control: const SwiperControl(),
      ),
    );
  }
}
