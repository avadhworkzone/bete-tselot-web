import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HeroSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider(
          items: [
            Image.network(
              'https://example.com/hero1.jpg',
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width,
            ),
            Image.network(
              'https://example.com/hero2.jpg',
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width,
            ),
          ],
          options: CarouselOptions(
            height: 500,
            autoPlay: true,
            viewportFraction: 1.0,
          ),
        ),
        Positioned.fill(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Welcome to Bete Tselot',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Read More'),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
