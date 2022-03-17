import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  final String text;
  final double width;
  final VoidCallback onPressed;
  const DefaultButton({Key? key, this.width = 150, required this.text, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: Colors.black,
      ),
      child: TextButton(
          onPressed: onPressed,
          child: Text(text, style: Theme.of(context).textTheme.button)),
    );
  }
}
