import 'package:flutter/material.dart';

class CustomPageIndicator extends StatelessWidget {
  const CustomPageIndicator({
    super.key,
    required this.length,
    required this.currentPage,
  });
  final int length;
  final int currentPage;
  @override
  Widget build(BuildContext context) {
    return Padding(
      // the horizontal padding on the page indicator should be 40 ,
      // the indicator item has an 8.0p padding,
      // removing the indicator item padding from the page indicator
      // so the total padding can be 40
      padding: const EdgeInsets.symmetric(horizontal: 40.0 - 8.0),
      child: Row(
        children: List.generate(
          3,
          (index) => Expanded(
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              height: 4.0,
              margin: const EdgeInsets.symmetric(horizontal: 8.0),
              decoration: BoxDecoration(
                color: index == currentPage
                    ? Colors.white
                    : Colors.white.withOpacity(0.4),
                borderRadius: BorderRadius.circular(5.0),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
