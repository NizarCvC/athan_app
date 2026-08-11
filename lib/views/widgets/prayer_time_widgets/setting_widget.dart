import 'package:flutter/material.dart';

class SettingWidget extends StatelessWidget {
  final Widget icon;
  final String title;
  final VoidCallback onTap;
  const SettingWidget({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: double.infinity,
      height: size.height * 0.06,
      child: ListTile(
        leading: icon,
        title: Text(title),
        onTap: onTap,
        trailing: Icon(
          size: size.height * 0.02,
          Icons.arrow_forward_ios_rounded,
        ),
      ),
    );
  }
}
