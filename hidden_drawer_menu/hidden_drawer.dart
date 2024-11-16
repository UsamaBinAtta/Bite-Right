import 'package:bite_right/hidden_drawer_menu/about_page.dart';
import 'package:flutter/material.dart';
import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';

class HiddenDrawer extends StatefulWidget {
  const HiddenDrawer({Key? key}) : super(key: key);

  @override
  State<HiddenDrawer> createState() => _HiddenDrawerState();
}

class _HiddenDrawerState extends State<HiddenDrawer> {

  List<ScreenHiddenDrawer> _pages = [];

  @override
  void initState() {
    super.initState();

    _pages = [
      ScreenHiddenDrawer(
        ItemHiddenMenu(
            name: 'About',
            baseStyle: TextStyle(),
            selectedStyle: TextStyle(), colorLineSelected: Color(0xff355E3B)
        ),
        AboutPage(),)
    ];
  }

  @override
  Widget build(BuildContext context) {
    return HiddenDrawerMenu(
      backgroundColorMenu: Color(0xff355E3B),
      screens: _pages,
      initPositionSelected: 0,

    );
  }
}
