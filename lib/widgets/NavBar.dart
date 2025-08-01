import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class NavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const NavBar({
    Key? key,
    required this.currentIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24.0, left: 16.0, right: 16.0, top: 16.0),
      child: Material(
        
        elevation: 12,
        borderRadius: BorderRadius.circular(32),
        color: Colors.transparent,
        child: Container(
          decoration: BoxDecoration(
            color:  Colors.grey.withOpacity(0.2),
            borderRadius: BorderRadius.circular(32),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 24,
                offset: const Offset(0, 8),
              )
            ]
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: GNav(
              backgroundColor: Colors.transparent,
              rippleColor: Colors.transparent,
              hoverColor: Colors.grey.withOpacity(0.1),
              gap: 8,
              activeColor: Colors.white,
              iconSize: 24,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              duration: const Duration(milliseconds: 400),
              tabBackgroundColor: Colors.green.withOpacity(0.8),
              color: Colors.white.withOpacity(0.6),
              tabs: const [
                GButton(icon: Icons.home, text: 'Home'),
                GButton(icon: Icons.lock_clock_rounded, text: 'Less'),
                GButton(icon: Icons.person, text: 'Profile'),
              ],
              selectedIndex: currentIndex,
              onTabChange: onTap,
            ),
          ),
        ),
      ),
    );
  }
}