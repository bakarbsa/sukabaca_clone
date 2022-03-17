import 'package:flutter/material.dart';

class WelcomeSlider extends StatelessWidget {
  final int pages;
  final int pagesIndex;
  const WelcomeSlider({Key? key,required this.pages, required this.pagesIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(pages, (index) =>
        Container(
        margin: const EdgeInsets.only(bottom: 2),
        height: 8,
        width: (index == pagesIndex) ? 16 : 8,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.black.withAlpha((index==pagesIndex)?255:90),
        ),
      )
      ),
    );
  }
}



