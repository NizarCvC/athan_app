import 'package:athan_app/view_models/settings_cubit/settings_cubit.dart';
import 'package:athan_app/views/widgets/settings_widgets/setting_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;
    final cubit = BlocProvider.of<SettingsCubit>(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: size.height * 0.7,
                child: ListView(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    SettingWidget(
                      icon: Icons.notifications_none_outlined,
                      title: 'Notifications',
                      onTap: () {},
                    ),
                    const Divider(),
                    SettingWidget(
                      icon: Icons.dark_mode_outlined,
                      title: 'App Theme',
                      onTap: () {},
                      trailing: Switch(
                        value: cubit.state.themeMode == ThemeMode.dark
                            ? true
                            : false,
                        onChanged: (bool newValue) {
                          cubit.toggleTheme(newValue);
                        },
                      ),
                    ),
                    const Divider(),
                    SettingWidget(
                      icon: Icons.location_on_outlined,
                      title: 'Location',
                      onTap: () {},
                    ),
                    const Divider(),
                    SettingWidget(
                      icon: Icons.calendar_month_rounded,
                      title: 'Calendar Format',
                      onTap: () {},
                    ),
                    const Divider(),
                    SettingWidget(
                      icon: Icons.access_time_rounded,
                      title: 'Time Format',
                      onTap: () {},
                    ),
                    const Divider(),
                    SettingWidget(
                      icon: Icons.language_rounded,
                      title: 'Language',
                      onTap: () {},
                    ),
                    const Divider(),
                    SettingWidget(
                      icon: Icons.location_city_outlined,
                      title: 'Calculation Method',
                      onTap: () {},
                    ),
                    const Divider(),
                    SettingWidget(
                      icon: Icons.school_outlined,
                      title: 'Juristic Method', // أو Juristic Method
                      onTap: () {},
                    ),
                    const Divider(),
                    SettingWidget(
                      icon: Icons.feedback_outlined,
                      title: 'Feedback',
                      onTap: () {},
                    ),
                    const Divider(),
                  ],
                ),
              ),
              SizedBox(height: size.height * 0.03),
              Text('Athan App', style: textTheme.headlineSmall),
              SizedBox(height: size.height * 0.01),
              Text('Version v0.0.1', style: textTheme.titleMedium),
              SizedBox(height: size.height * 0.05),
            ],
          ),
        ),
      ),
    );
  }
}
