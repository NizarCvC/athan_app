import 'package:athan_app/utils/theme/app_colors.dart';
import 'package:athan_app/view_models/settings_cubit/settings_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  final Widget? trailing;
  final VoidCallback onTap;
  const SettingWidget({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final cubit = BlocProvider.of<SettingsCubit>(context);
    return SizedBox(
      width: double.infinity,
      height: size.height * 0.06,
      child: ListTile(
        leading: Icon(
          icon,
          color: cubit.state.themeMode == ThemeMode.light
              ? AppColors.black
              : AppColors.white,
        ),
        title: Text(
          title,
          style: Theme.of(
            context,
          ).textTheme.titleMedium!.copyWith(fontWeight: .w600),
        ),
        onTap: onTap,
        trailing:
            trailing ??
            Icon(size: size.height * 0.02, Icons.arrow_forward_ios_rounded),
      ),
    );
  }
}
