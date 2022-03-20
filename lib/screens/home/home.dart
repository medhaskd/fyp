// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:fyp/screens/home/categories.dart';
import 'package:fyp/screens/home/home_base.dart';

String categoryimagePath(String s) => 'assets/images/$s.png';

List<Map<String, dynamic>> categories = [
  {
    'id': 1,
    'name': 'Pest Control',
    'image': categoryimagePath('1'),
    'subtitle': "More effective than your footware"
  },
  {
    'id': 2,
    'name': 'Cooks',
    'image': categoryimagePath('2'),
    'subtitle': "Hire a cook for you next dinner party"
  },
  {
    'id': 3,
    'name': 'babysitters',
    'image': categoryimagePath('3'),
    'subtitle': "Take a day off, let us care for them"
  },
  {
    'id': 4,
    'name': 'Painters',
    'image': categoryimagePath('4'),
    'subtitle': "Wall repair to painting solutions"
  },
];

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _curIndex = 0;
  final PageController _pageController = PageController(initialPage: 0);

  final List<Widget> _pages = [
    HomeBase(),
    CategoriesPage(),
    HomeBase(),
    HomeBase(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            showSelectedLabels: false,
            currentIndex: _curIndex,
            showUnselectedLabels: false,
            onTap: (i) {
              _pageController.animateToPage(i,
                  duration: Duration(milliseconds: 100), curve: Curves.easeIn);
              setState(() {
                _curIndex = i;
              });
            },
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined),
                  label: "1",
                  activeIcon: Icon(
                    Icons.home,
                    color: Colors.black54,
                  )),
              BottomNavigationBarItem(
                  icon: Icon(Icons.category_outlined),
                  label: "1",
                  activeIcon: Icon(
                    Icons.category,
                    color: Colors.black54,
                  )),
              BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_cart_outlined),
                  label: "1",
                  activeIcon: Icon(
                    Icons.shopping_cart,
                    color: Colors.black54,
                  )),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person_outline_rounded),
                  label: "1",
                  activeIcon: Icon(
                    Icons.person,
                    color: Colors.black54,
                  )),
              // BottomNavigationBarItem(
              //     icon: Image.asset('assets/sqf.png'), label: "2"),
              // BottomNavigationBarItem(
              //     icon: Image.asset('assets/cart.png'), label: "3"),
              // BottomNavigationBarItem(
              //     icon: Image.asset('assets/user.png'), label: "4"),
            ]),
        body: PageView.builder(
            itemCount: _pages.length,
            controller: _pageController,
            onPageChanged: (i) {
              setState(() {
                _curIndex = i;
              });
            },
            itemBuilder: (context, index) {
              return _pages[index];
            }),
      ),
    );
  }
}
