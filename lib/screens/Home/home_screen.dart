import 'package:flutter/material.dart';
import '../../widgets/NavBar.dart';
import 'home_tab.dart';
import 'less_screen.dart';
import 'profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final PageController _pageController = PageController();

  bool _isPageScrolling = false;

  List<Widget> get _screens => [
        HomeTab(),
        LessScreen(),
        ProfileScreen(),
      ];

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      final page = _pageController.page ?? 0;
      final isScrollingNow = (page - page.round()).abs() > 0.01;
      if (_isPageScrolling != isScrollingNow) {
        setState(() {
          _isPageScrolling = isScrollingNow;
        });
      }
    });
  }

  void _onItemTapped(int index) {
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void _onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false, // disables back navigation
      child: Scaffold(
        backgroundColor: Colors.black,
        extendBody: true,
        extendBodyBehindAppBar: true,
        body: ScrollConfiguration(
          behavior: NoGlowScrollBehavior(),
          child: PageView(
            controller: _pageController,
            children: _screens,
            onPageChanged: _onPageChanged,
            physics: const BouncingScrollPhysics(),
          ),
        ),
        bottomNavigationBar: NavBar(
          currentIndex: _currentIndex,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}

// Custom ScrollBehavior to disable the default glowing overscroll effect
class NoGlowScrollBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}