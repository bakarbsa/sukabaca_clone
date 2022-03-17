import 'package:flutter/material.dart';
import 'package:sukabaca_clone/core/db/book.dart';
import 'package:sukabaca_clone/core/utility/theme.dart';
import 'package:sukabaca_clone/core/widgets/add_book_form.dart';
import 'package:sukabaca_clone/core/widgets/default_button.dart';
import 'package:sukabaca_clone/core/db/db.dart';
import 'package:sukabaca_clone/core/widgets/genre_container.dart';

DatabaseHelper db = DatabaseHelper();

class AddBook extends StatefulWidget {
  const AddBook({Key? key}) : super(key: key);

  @override
  State<AddBook> createState() => _AddBookState();
}

class _AddBookState extends State<AddBook> {
  final TextEditingController _titleController =
      TextEditingController(text: '');

  final TextEditingController _statusController =
      TextEditingController(text: '');

  final TextEditingController _rangkumanController =
      TextEditingController(text: '');

  String test = '';

  bool isHorror = false;
  bool isPetualangan = false;
  bool isPengembanganDiri = false;
  bool isKomedi = false;
  bool isRomansa = false;
  bool isFiksi = false;
  bool isThriller = false;
  bool isMisteri = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(18, 15, 18, 0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                AddBookForm(
                  hintText: 'Judul-Penulis',
                  controller: _titleController,
                ),
                const SizedBox(height: 15),
                AddBookForm(
                  hintText: 'status',
                  controller: _statusController,
                ),
                const SizedBox(height: 15),
                // Genre Button
                InkWell(
                  onTap: () => showDialog(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: blackColor,
                          width: 3,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GenreSelector(
                            genre: horror,
                            checkValue: isHorror,
                            onChecked: (_isHorror) {
                              setState(() {
                                isHorror = _isHorror;
                              });
                            },
                          ),
                          GenreSelector(
                            genre: petualangan,
                            checkValue: isPetualangan,
                            onChecked: (_isPetualangan) {
                              setState(() {
                                isPetualangan = _isPetualangan;
                              });
                            },
                          ),
                          GenreSelector(
                            genre: pengembanganDiri,
                            checkValue: isPengembanganDiri,
                            onChecked: (_isPengembanganDiri) {
                              setState(() {
                                isPengembanganDiri = _isPengembanganDiri;
                              });
                            },
                          ),
                          GenreSelector(
                            genre: komedi,
                            checkValue: isKomedi,
                            onChecked: (_isKomedi) {
                              setState(() {
                                isKomedi = _isKomedi;
                              });
                            },
                          ),
                          GenreSelector(
                            genre: romansa,
                            checkValue: isRomansa,
                            onChecked: (_isRomansa) {
                              setState(() {
                                isRomansa = _isRomansa;
                              });
                            },
                          ),
                          GenreSelector(
                            genre: fiksi,
                            checkValue: isFiksi,
                            onChecked: (_isFiksi) {
                              setState(() {
                                isFiksi = _isFiksi;
                              });
                            },
                          ),
                          GenreSelector(
                            genre: thriller,
                            checkValue: isThriller,
                            onChecked: (_isThriller) {
                              setState(() {
                                isThriller = _isThriller;
                              });
                            },
                          ),
                          GenreSelector(
                            genre: misteri,
                            checkValue: isMisteri,
                            onChecked: (_isMisteri) {
                              setState(() {
                                isMisteri = _isMisteri;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  child: Container(
                    width: double.infinity,
                    height: 60,
                    padding: const EdgeInsets.only(left: 18),
                    decoration: BoxDecoration(
                      border: Border.all(width: 3, color: Colors.black),
                      borderRadius: BorderRadius.circular(13),
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Genre',
                        style: Theme.of(context).textTheme.subtitle2,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                AddBookForm(
                  hintText: 'Rangkuman',
                  maxLines: 10,
                  controller: _rangkumanController,
                ),
                const SizedBox(height: 15),
                Container(
                  height: 50,
                  width: double.maxFinite - 30,
                  margin: const EdgeInsets.only(left: 50, right: 50),
                  child: DefaultButton(
                    text: "Buat Rangkuman",
                    onPressed: () {
                      final book = Book(
                        title: _titleController.text,
                        status: _statusController.text,
                        rangkuman: _rangkumanController.text,
                      );

                      setState(() async {
                        await db.insertBook(book);
                        test = 'success';
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class GenreSelector extends StatefulWidget {
  const GenreSelector({
    Key? key,
    required this.genre,
    required this.checkValue,
    required this.onChecked,
  }) : super(key: key);

  final Widget genre;
  final Function(bool) onChecked;
  final bool checkValue;

  @override
  State<GenreSelector> createState() => _GenreSelectorState();
}

class _GenreSelectorState extends State<GenreSelector> {
  bool isChecked = false;

  @override
  void initState() {
    super.initState();
    isChecked = widget.checkValue;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        widget.genre,
        Checkbox(
          side: BorderSide(
            color: blackColor,
            width: 2,
          ),
          activeColor: blackColor,
          shape: const CircleBorder(),
          value: isChecked,
          onChanged: (value) {
            setState(() {
              isChecked = value!;
              widget.onChecked(isChecked);
            });
          },
        ),
      ],
    );
  }
}
