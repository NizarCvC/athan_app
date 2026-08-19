import 'package:athan_app/utils/generated/l10n.dart';
import 'package:athan_app/view_models/settings_cubit/settings_cubit.dart';
import 'package:athan_app/views/widgets/settings_widgets/helpers/setting_info.dart';
import 'package:athan_app/views/widgets/settings_widgets/helpers/setting_options.dart';
import 'package:athan_app/views/widgets/settings_widgets/setting_bottom_sheet.dart';
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
      appBar: AppBar(title: Text(S.of(context).settings)),
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
                      title: S.of(context).notifications,
                      onTap: () {},
                    ),
                    const Divider(),
                    SettingWidget(
                      icon: Icons.dark_mode_outlined,
                      title: S.of(context).appTheme,
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
                      title: S.of(context).location,
                      onTap: () {},
                    ),
                    const Divider(),
                    SettingWidget(
                      icon: Icons.calendar_month_rounded,
                      title: S.of(context).calendarFormat,
                      onTap: () {},
                    ),
                    const Divider(),
                    SettingWidget(
                      icon: Icons.access_time_rounded,
                      title: S.of(context).timeFormat,
                      onTap: () {},
                    ),
                    const Divider(),
                    SettingWidget(
                      icon: Icons.language_rounded,
                      title: S.of(context).language,
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          backgroundColor: Theme.of(
                            context,
                          ).scaffoldBackgroundColor,
                          builder: (_) {
                            return SettingBottomSheet<String>(
                              settingInfo: SettingInfo(
                                initialValue: cubit.state.languageCode.code,
                                settingAction: (lang) {
                                  cubit.changeLanguage(lang!);
                                },
                                options: [
                                  SettingOptions(
                                    optionName: S.of(context).english,
                                    optionValue: 'en',
                                  ),
                                  SettingOptions(
                                    optionName: S.of(context).arabic,
                                    optionValue: 'ar',
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      },
                    ),
                    const Divider(),
                    SettingWidget(
                      icon: Icons.location_city_outlined,
                      title: S.of(context).calculationMethod,
                      onTap: () {},
                    ),
                    const Divider(),
                    SettingWidget(
                      icon: Icons.school_outlined,
                      title: S.of(context).juristicMethod,
                      onTap: () {},
                    ),
                    const Divider(),
                    SettingWidget(
                      icon: Icons.feedback_outlined,
                      title: S.of(context).feedback,
                      onTap: () {},
                    ),
                    const Divider(),
                  ],
                ),
              ),
              SizedBox(height: size.height * 0.03),
              Text(S.of(context).athanApp, style: textTheme.headlineSmall),
              SizedBox(height: size.height * 0.01),
              Text(
                '${S.of(context).version} v0.0.1',
                style: textTheme.titleMedium,
              ),
              SizedBox(height: size.height * 0.05),
            ],
          ),
        ),
      ),
    );
  }
}
