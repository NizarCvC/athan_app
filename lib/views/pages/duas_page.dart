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
        elevation: 0,
        backgroundColor: Colors.transparent,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarBrightness: isDark ? Brightness.dark : Brightness.light,
          statusBarIconBrightness: isDark ? Brightness.light : Brightness.dark,
        ),
        title: const Column(
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
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            SizedBox(height: size.height * 0.01),
            const RandomDuaHighlightCardWidget(),
            SizedBox(height: size.height * 0.05),
          ],
        ),
      ),
    );
  }
}
