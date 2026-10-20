import 'package:athan_app/utils/router/app_router.dart';
import 'package:athan_app/views/widgets/duas_widgets/dua_navigation_card.dart';
import 'package:athan_app/views/widgets/duas_widgets/random_dua_highlight_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DuasPage extends StatelessWidget {
  const DuasPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        elevation: 0,
        backgroundColor: Colors.transparent,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarBrightness: isDark ? Brightness.dark : Brightness.light,
          statusBarIconBrightness: isDark ? Brightness.light : Brightness.dark,
        ),
        title: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Islamic Spiritual Hub',
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 24,
                  letterSpacing: 0.3,
                ),
              ),
              Text(
                'Duas, 99 Names of Allah & Ruqyah',
                style: TextStyle(color: Colors.grey, fontSize: 13),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: .start,
          children: [
            SizedBox(height: size.height * 0.01),
            const RandomDuaHighlightCardWidget(),
            SizedBox(height: size.height * 0.03),
            const Text(
              'Explore Sections',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
            ),
            SizedBox(height: size.height * 0.02),
            DuaNavigationCard(
              title: 'Asma-ul-Husna',
              description:
                  'The 99 Beautiful Names of Allah with meanings & audio',
              badgeText: '99 Names',
              icon: Icons.auto_awesome_rounded,
              gradientColors: const [Color(0xFF31893b), Color(0xFF1B5E20)],
              onTap: () {
                Navigator.of(
                  context,
                  rootNavigator: true,
                ).pushNamed(AppRoutes.asmaUlHusna);
              },
            ),
            SizedBox(height: size.height * 0.01),
            DuaNavigationCard(
              title: 'Masnun Duas',
              description: 'Authentic supplications categorized for daily life',
              badgeText: '44+ Categories',
              icon: Icons.volunteer_activism_rounded,
              gradientColors: const [Color(0xFF0D9488), Color(0xFF115E59)],
              onTap: () {},
            ),
            SizedBox(height: size.height * 0.01),
            DuaNavigationCard(
              title: 'Ruqyah Shariah',
              description: 'Quranic healing programs & educational guides',
              badgeText: '3 Programs & 13 Topics',
              icon: Icons.shield_rounded,
              gradientColors: const [Color(0xFF1E3A8A), Color(0xFF172554)],
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
