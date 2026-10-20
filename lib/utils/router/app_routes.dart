import 'package:athan_app/utils/router/app_router.dart';
import 'package:athan_app/view_models/asma_ul_husna_cubit/asma_ul_husna_cubit.dart';
import 'package:athan_app/view_models/settings_cubit/settings_cubit.dart';
import 'package:athan_app/views/pages/asma_ul_husna_page.dart';
import 'package:athan_app/views/pages/custom_bottom_navbar.dart';
import 'package:athan_app/views/pages/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.home:
        return MaterialPageRoute(builder: (_) => const CustomBottomNavbar());
      case AppRoutes.settings:
        return MaterialPageRoute(builder: (_) => const SettingsPage());
      case AppRoutes.asmaUlHusna:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) =>
                AsmaUlHusnaCubit(settingsCubit: context.read<SettingsCubit>())
                  ..fetchAsmaUlHusna(),
            child: const AsmaUlHusnaPage(),
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
