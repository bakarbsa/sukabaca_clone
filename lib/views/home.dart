import 'package:flutter/material.dart';
import 'package:sukabaca_clone/core/utility/theme.dart';
import 'package:sukabaca_clone/core/widgets/book_container.dart';
import 'package:sukabaca_clone/core/widgets/genre_container.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(18, 15, 18, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('SukaBaca', style: Theme.of(context).textTheme.headline1),
          const SizedBox(height: 15),
          TextFormField(
            decoration: InputDecoration(
              hintText: 'Search',
              hintStyle: Theme.of(context).textTheme.subtitle2,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 15,
              ),
              suffixIcon: Icon(
                Icons.search,
                color: greyColor,
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
          ),
          const SizedBox(height: 40),
          Text('Rangkumanmu', style: Theme.of(context).textTheme.subtitle1),
          const SizedBox(height: 15),
          BookContainer(
            genres: [romansa, komedi, petualangan, horror],
          ),
          const SizedBox(height: 15),
          BookContainer(
            genres: [petualangan, horror],
          ),
        ],
      ),
    );
  }
}
