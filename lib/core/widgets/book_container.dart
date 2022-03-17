import 'package:flutter/material.dart';
import 'package:sukabaca_clone/core/utility/theme.dart';

class BookContainer extends StatelessWidget {
  final List<Widget> genres;

  const BookContainer({Key? key, required this.genres}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 14),
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: blackColor, width: 3),
        borderRadius: BorderRadius.circular(13),
      ),
      child: Row(
        children: [
          Container(
            width: 90,
            height: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/img/cover_book.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Guy Kawasaki',
                style: Theme.of(context).textTheme.bodyText1,
              ),
              Text(
                'by Alexander Nato',
                style: Theme.of(context).textTheme.bodyText2,
              ),
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 250),
                child: Wrap(
                  spacing: 5,
                  runSpacing: 5,
                  children: genres
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(width: 1),
                ),
                child: const Text(
                  'On Progres',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
