import 'package:athan_app/views/widgets/settings_widgets/helpers/setting_info.dart';
import 'package:flutter/material.dart';

class SettingBottomSheet<T> extends StatelessWidget {
  final SettingInfo<T> settingInfo;

  const SettingBottomSheet({super.key, required this.settingInfo});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;
    return SizedBox(
      width: double.infinity,
      height: size.height * 0.2,
      child: RadioGroup<T>(
        groupValue: settingInfo.initialValue,
        onChanged: settingInfo.settingAction,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView.builder(
            itemCount: settingInfo.options.length,
            itemBuilder: (context, index) {
              final option = settingInfo.options[index];
              return ListTile(
                title: Text(option.optionName, style: textTheme.titleLarge),
                trailing: Radio<T>(value: option.optionValue),
              );
            },
          )
        ),
      ),
    );
  }
}
