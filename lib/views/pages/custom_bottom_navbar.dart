import 'package:athan_app/utils/theme/app_colors.dart';
import 'package:athan_app/views/pages/prayer_page.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

class CustomBottomNavbar extends StatefulWidget {
  const CustomBottomNavbar({super.key});

  @override
  State<CustomBottomNavbar> createState() => _CustomBottomNavbarState();
}

class _CustomBottomNavbarState extends State<CustomBottomNavbar> {
  late final PersistentTabController _controller;
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  List<Widget> _buildScreens(BuildContext context) {
    return const [PrayerPage(), Scaffold(), Scaffold(), Scaffold()];
  }

  List<ItemConfig> _navBarsItems() {
    return [
      ItemConfig(
        icon: const Icon(Icons.mosque_outlined),
        title: 'Prayer',
        activeForegroundColor: Theme.of(context).primaryColor,
      ),
      ItemConfig(
        icon: const Icon(Icons.mosque_outlined),
        title: 'Fasting',
        activeForegroundColor: Theme.of(context).primaryColor,
      ),
      ItemConfig(
        icon: const Icon(Icons.mosque_outlined),
        title: 'Zakat',
        activeForegroundColor: Theme.of(context).primaryColor,
      ),
      ItemConfig(
        icon: const Icon(Icons.mosque_outlined),
        title: 'Dua',
        activeForegroundColor: Theme.of(context).primaryColor,
      ),
    ];
  }

  List<PersistentTabConfig> _tabItems() {
    return [
      PersistentTabConfig(
        item: _navBarsItems()[0],
        screen: _buildScreens(context)[0],
      ),
      PersistentTabConfig(
        item: _navBarsItems()[1],
        screen: _buildScreens(context)[1],
      ),
      PersistentTabConfig(
        item: _navBarsItems()[2],
        screen: _buildScreens(context)[2],
      ),
      PersistentTabConfig(
        item: _navBarsItems()[3],
        screen: _buildScreens(context)[3],
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PersistentTabView(
        controller: _controller,
        tabs: _tabItems(),
        navBarBuilder: (navbarConfig) =>
            Style4BottomNavBar(navBarConfig: navbarConfig),
        onTabChanged: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        backgroundColor: AppColors.white,
        handleAndroidBackButtonPress: true,
        resizeToAvoidBottomInset: true,
      ),
    );
  }
}
