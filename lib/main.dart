import 'package:athan_app/utils/generated/l10n.dart';
import 'package:athan_app/utils/app_constants.dart';
import 'package:athan_app/utils/router/app_router.dart';
import 'package:athan_app/utils/router/app_routes.dart';
import 'package:athan_app/utils/theme/app_theme.dart';
import 'package:athan_app/view_models/settings_cubit/settings_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    return BlocProvider(
      create: (context) => SettingsCubit(),
      child: BlocBuilder<SettingsCubit, SettingsState>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: AppConstants.appName,
            themeMode: state.themeMode,
            theme: AppTheme.light,
            darkTheme: AppTheme.dark,
            locale: Locale(state.languageCode.code),
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
            initialRoute: AppRoutes.home,
            onGenerateRoute: AppRouter.generateRoute,
          );
        },
      ),
    );
  }
}
