import 'package:flutter/material.dart';
import 'package:sukabaca_clone/core/utility/theme.dart';
import 'package:sukabaca_clone/views/add_book.dart';
import 'package:sukabaca_clone/views/favorite.dart';
import 'package:sukabaca_clone/views/home.dart';
import 'package:sukabaca_clone/views/search.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _selectedIndex = 0;

  static const List<Widget> _navigationOption = [Home(), Favortie(), Search()];

  void _onNavTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: _navigationOption.elementAt(_selectedIndex)),
      floatingActionButton: InkWell(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => const AddBook()));
        },
        child: Container(
          width: 90,
          height: 90,
          decoration: BoxDecoration(
            color: blackColor,
            shape: BoxShape.circle,
            border: Border.all(width: 10, color: Colors.white),
          ),
          child: const Icon(Icons.add, color: Colors.white),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startDocked,
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(10),
          topLeft: Radius.circular(10),
        ),
        child: Container(
          color: blackColor,
          height: 80,
          child: Padding(
            padding: const EdgeInsets.only(left: 170),
            child: BottomNavigationBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              iconSize: 34,
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.white,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              currentIndex: _selectedIndex,
              onTap: _onNavTapped,
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.favorite),
                  label: 'home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.search),
                  label: 'home',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
