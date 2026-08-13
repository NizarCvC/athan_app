import 'package:athan_app/utils/theme/app_colors.dart';
import 'package:athan_app/view_models/dua_cubit/dua_cubit.dart';
import 'package:athan_app/view_models/fasting_cubit/fasting_cubit.dart';
import 'package:athan_app/view_models/prayer_time_cubit/prayer_time_cubit.dart';
import 'package:athan_app/view_models/ruqyah_cubit/ruqyah_cubit.dart';
import 'package:athan_app/view_models/settings_cubit/settings_cubit.dart';
import 'package:athan_app/view_models/zakat_nisab_cubit/zakat_nisab_cubit.dart';
import 'package:athan_app/views/pages/prayer_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

class CustomBottomNavbar extends StatefulWidget {
  const CustomBottomNavbar({super.key});

  @override
  State<CustomBottomNavbar> createState() => _CustomBottomNavbarState();
}

class _CustomBottomNavbarState extends State<CustomBottomNavbar> {
  late final PersistentTabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  List<PersistentTabConfig> _buildTabs(BuildContext context) {
    final settingsCubit = BlocProvider.of<SettingsCubit>(context);
    final activeColor = settingsCubit.state.themeMode == ThemeMode.light
        ? AppColors.black
        : AppColors.white;
    return [
      PersistentTabConfig(
        screen: BlocProvider(
          create: (context) =>
              PrayerTimeCubit()..fetchTodayPrayerTimes('Medina'),
          child: const PrayerPage(),
        ),
        item: ItemConfig(
          icon: const Icon(Icons.mosque_outlined),
          title: 'Prayer',
          activeForegroundColor: activeColor,
        ),
      ),
      PersistentTabConfig(
        screen: BlocProvider(
          create: (context) => FastingCubit(),
          child: const Scaffold(),
        ),
        item: ItemConfig(
          icon: const Icon(Icons.nights_stay_outlined),
          title: 'Fasting',
          activeForegroundColor: activeColor,
        ),
      ),
      PersistentTabConfig(
        screen: BlocProvider(
          create: (context) => ZakatNisabCubit(),
          child: const Scaffold(),
        ),
        item: ItemConfig(
          icon: const Icon(Icons.monetization_on_outlined),
          title: 'Zakat',
          activeForegroundColor: activeColor,
        ),
      ),
      PersistentTabConfig(
        screen: MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => DuaCubit()),
            BlocProvider(create: (context) => RuqyahCubit()),
          ],
          child: const Scaffold(),
        ),
        item: ItemConfig(
          icon: const Icon(Icons.back_hand_outlined),
          title: 'Dua',
          activeForegroundColor: activeColor,
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final settingsCubit = BlocProvider.of<SettingsCubit>(context);
    return Scaffold(
      body: PersistentTabView(
        controller: _controller,
        tabs: _buildTabs(context),
        navBarBuilder: (navbarConfig) => Style4BottomNavBar(
          navBarConfig: navbarConfig,
          navBarDecoration: NavBarDecoration(
            color: settingsCubit.state.themeMode == ThemeMode.light
                ? AppColors.white
                : AppColors.black,
          ),
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        handleAndroidBackButtonPress: true,
        resizeToAvoidBottomInset: true,
      ),
    );
  }
}
