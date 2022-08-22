import 'package:flutter/material.dart';
import 'package:news_app/controller/news_controller.dart';
import 'package:news_app/views/home_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    NewsC.getNewList();
  }

  @override
  Widget build(BuildContext context) {
    final tabs = [
      const HomePage(),
      const Center(
        child: Text("Page 2"),
      ),
      const Center(
        child: Text("Page 3"),
      ),
    ];

    Widget customButtomNav() {
      return ClipRRect(
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(30),
        ),
        child: BottomAppBar(
          // notchMargin: 4,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: BottomNavigationBar(
            currentIndex: _currentIndex,
            onTap: (value) {
              setState(() {
                _currentIndex = value;
              });
            },
            items: [
              BottomNavigationBarItem(
                icon: Container(
                  margin: const EdgeInsets.only(
                    top: 20,
                    bottom: 10,
                  ),
                  child: _currentIndex == 0
                      ? const Icon(
                          Icons.home,
                          color: Colors.black,
                        )
                      : const Icon(
                          Icons.home_outlined,
                          color: Colors.black,
                        ),
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Container(
                  margin: const EdgeInsets.only(
                    top: 20,
                    bottom: 10,
                  ),
                  child: const Icon(
                    Icons.search_outlined,
                    color: Colors.black,
                  ),
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Container(
                  margin: const EdgeInsets.only(
                    top: 20,
                    bottom: 10,
                  ),
                  child: _currentIndex == 2
                      ? const Icon(
                          Icons.bookmark_rounded,
                          color: Colors.black,
                        )
                      : const Icon(
                          Icons.bookmark_border,
                        ),
                  // color: _currentIndex == 2 ? Colors.black : Colors.white,
                ),
                label: '',
              )
            ],
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: customButtomNav(),
      body: tabs[_currentIndex],
    );
  }
}
