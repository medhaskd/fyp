// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:fyp/screens/home/categories.dart';
import 'package:fyp/screens/home/home_base.dart';

String categoryimagePath(String s) => 'assets/images/$s.png';

// List<Map<String, dynamic>> categories = [
//   {
//     'id': 1,
//     'name': 'Pest Control',
//     'image': categoryimagePath('1'),
//     'subtitle': "More effective than your footware"
//   },
//   {
//     'id': 2,
//     'name': 'Cooks',
//     'image': categoryimagePath('2'),
//     'subtitle': "Hire a cook for you next dinner party"
//   },
//   {
//     'id': 3,
//     'name': 'babysitters',
//     'image': categoryimagePath('3'),
//     'subtitle': "Take a day off, let us care for them"
//   },
//   {
//     'id': 4,
//     'name': 'Painters',
//     'image': categoryimagePath('4'),
//     'subtitle': "Wall repair to painting solutions"
//   },
// ];

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PageController _pageController = PageController(initialPage: 0);

    final List<Widget> _pages = [
      HomeBase(),
      CategoriesPage(),
      CategoriesPage(),
      HomeBase(),
      Center(child: Text("PROFILE"))
    ];

    ValueNotifier<int> _curIndex = ValueNotifier<int>(0);

    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: ValueListenableBuilder(
            valueListenable: _curIndex,
            builder: (context, value, _) {
              return BottomNavigationBar(
                  type: BottomNavigationBarType.fixed,
                  showSelectedLabels: false,
                  currentIndex: _curIndex.value,
                  showUnselectedLabels: false,
                  onTap: (i) {
                    _pageController.animateToPage(i,
                        duration: Duration(milliseconds: 100),
                        curve: Curves.easeIn);

                    _curIndex.value = i;
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
                        icon: Icon(Icons.chat_bubble_outline_rounded),
                        label: "1",
                        activeIcon: Icon(
                          Icons.chat_bubble_rounded,
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
                  ]);
            }),
        body: ValueListenableBuilder(
            valueListenable: _curIndex,
            builder: (context, value, _) {
              return PageView.builder(
                  itemCount: _pages.length,
                  controller: _pageController,
                  onPageChanged: (i) {
                    _curIndex.value = i;
                  },
                  itemBuilder: (context, index) {
                    return _pages[index];
                  });
            }),
      ),
    );
  }
}
