import 'package:athan_app/generated/l10n.dart';
import 'package:athan_app/utils/app_constants.dart';
import 'package:athan_app/utils/theme/app_theme.dart';
import 'package:athan_app/views/pages/custom_bottom_navbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: '.env');
  runApp(const AthanApp());
}

class AthanApp extends StatelessWidget {
  const AthanApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppConstants.appName,
      themeMode: .light,
      theme: AppTheme.lightModeTheme,
      darkTheme: AppTheme.darkModeTheme,
      locale: const Locale('en'),
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      home: const CustomBottomNavbar(),
    );
  }
}
