import 'package:flutter/material.dart';
import 'package:meal_recommender/core/themes/color_palette.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (index) {
        onTap(index);
      },
      backgroundColor: Colors.white,
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      elevation: 0,
      items: [
        BottomNavigationBarItem(
          icon: _buildNavItem(Icons.home_filled, 0),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: _buildNavItem(Icons.favorite_outline, 1),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: _buildNavItem(Icons.person_outline, 2),
          label: '',
        ),
      ],
    );
  }

  Widget _buildNavItem(IconData icon, int index) {
    bool isSelected = currentIndex == index;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 20),
      padding: EdgeInsets.all(isSelected ? 18 : 10),
      decoration: BoxDecoration(
        color: isSelected ? BaseColorPalette.mainColor : Colors.transparent,
        shape: BoxShape.circle,
      ),
      child: Icon(
        icon,
        size: isSelected ? 36 : 32,
        color: isSelected ? Colors.white : Colors.black,
      ),
    );
  }
}
