import 'package:athan_app/views/widgets/settings_widgets/helpers/setting_options.dart';

class SettingInfo<T> {
  final T initialValue;
  final void Function(T?) settingAction;
  final List<SettingOptions<T>> options;

  SettingInfo({required this.initialValue, required this.settingAction, required this.options});
}
