import 'package:flutter/material.dart';
import 'package:sukabaca_clone/core/utility/theme.dart';

class AddBookForm extends StatefulWidget {
  const AddBookForm(
      {Key? key,
      required this.hintText,
      this.maxLines = 1,
      required this.controller})
      : super(key: key);

  final String hintText;
  final int maxLines;
  final TextEditingController controller;

  @override
  State<AddBookForm> createState() => _AddBookFormState();
}

class _AddBookFormState extends State<AddBookForm> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      maxLines: widget.maxLines,
      keyboardType: TextInputType.multiline,
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: Theme.of(context).textTheme.subtitle2,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 15,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(13),
          borderSide: BorderSide(
            color: blackColor,
            width: 3,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(13),
          borderSide: BorderSide(
            color: blackColor,
            width: 3,
          ),
        ),
      ),
    );
  }
}
