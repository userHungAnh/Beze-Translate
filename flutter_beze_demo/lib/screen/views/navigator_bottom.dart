import 'package:flutter/material.dart';

class NavigatorBottom extends StatefulWidget {
  const NavigatorBottom(
      {Key? key, required this.onTap, required this.currentIndex})
      : super(key: key);
  final void Function(int) onTap;
  final int currentIndex;
  @override
  _NavigatorBottomState createState() => _NavigatorBottomState();
}

class _NavigatorBottomState extends State<NavigatorBottom> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: widget.onTap,
      currentIndex: widget.currentIndex,
      items: const [
        BottomNavigationBarItem(
          activeIcon: Icon(Icons.home, color: Colors.blue),
          icon: Icon(
            Icons.home,
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          activeIcon: Icon(Icons.settings, color: Colors.blue),
          icon: Icon(
            Icons.settings,
          ),
          label: 'Setting',
        ),
        BottomNavigationBarItem(
          activeIcon: Icon(Icons.account_balance, color: Colors.blue),
          icon: Icon(
            Icons.account_balance,
          ),
          label: 'Account',
        ),
      ],
    );
  }
}
