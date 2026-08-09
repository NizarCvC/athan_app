import 'package:athan_app/utils/theme/app_colors.dart';
import 'package:flutter/material.dart';

class ErrorWidget extends StatelessWidget {
  final String errorMessage;
  const ErrorWidget({super.key, required this.errorMessage});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.error, color: AppColors.red),
        Text(errorMessage, style: Theme.of(context).textTheme.titleLarge),
      ],
    );
  }
}
