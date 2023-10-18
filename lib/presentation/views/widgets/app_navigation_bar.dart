import 'package:flutter/material.dart';

class AppNavigationBar extends StatelessWidget {
  const AppNavigationBar({
    super.key,
    required this.selectedIndex,
    required this.onDestinationSelected,
  });

  final int selectedIndex;
  final ValueChanged<int> onDestinationSelected;

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      selectedIndex: selectedIndex,
      onDestinationSelected: onDestinationSelected,
      destinations: const [
        NavigationDestination(icon: Icon(Icons.home), label: 'Trang chu'),
        NavigationDestination(icon: Icon(Icons.shopping_bag), label: 'Mua sam'),
        NavigationDestination(icon: Icon(Icons.shopify_rounded), label: 'Uu dai'),
        NavigationDestination(icon: Icon(Icons.shop), label: 'Cua hang'),
        NavigationDestination(icon: Icon(Icons.person), label: 'Thanh vien'),
      ],
    );
  }
}
