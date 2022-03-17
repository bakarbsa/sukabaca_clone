import 'package:flutter/material.dart';
import 'package:sukabaca_clone/core/widgets/default_button.dart';
import 'package:sukabaca_clone/core/widgets/welcome_slider.dart';
import 'package:sukabaca_clone/views/dashboard.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  final List img = [
    "welcomepage_1.png",
    "welcomepage_2.png",
    "welcomepage_3.png"
  ];

  final List textBold = [
    "Buku adalah Jendela Ilmu",
    "Catat Setiap Hal Penting",
    "Kemudahan Merangkum\nBuku Kesukaanmu"
  ];

  final List textBody = [
    "Luangkan waktumu untuk membaca\nbuku setiap hari",
    "Simpan setiap progress dan hal penting\ndari buku yang telah dibaca",
    "Berhenti membuang waktu membaca\nbuku kesukaanmu berulang kali"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: img.length,
        itemBuilder: (_, index) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                alignment: Alignment.topLeft,
                margin: const EdgeInsets.only(left: 20.0, right: 20, top: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      textBold[index],
                      style: Theme.of(context).textTheme.headline1,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      textBody[index],
                      style: Theme.of(context).textTheme.subtitle2,
                    ),
                  ],
                ),
              ),
              Container(
                  width: double.maxFinite - 10,
                  height: MediaQuery.of(context).size.width - 10,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/img/" + img[index]),
                        fit: BoxFit.cover,
                        filterQuality: FilterQuality.high),
                  )),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                WelcomeSlider(pages: img.length, pagesIndex: index)
              ]),
              Container(
                height: 50,
                width: double.maxFinite - 30,
                margin: const EdgeInsets.only(left: 50, right: 50),
                child: (index == 2)
                    ? DefaultButton(
                        text: "Jelajahi Sekarang",
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Dashboard()));
                        })
                    : Container(),
              )
            ],
          );
        },
      ),
    );
  }
}
