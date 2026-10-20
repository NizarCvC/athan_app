import 'package:athan_app/models/asma_ul_husna_models/allah_name.dart';
import 'package:athan_app/utils/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AllahNameDetailsSheet extends StatelessWidget {
  final AllahName allahName;
  const AllahNameDetailsSheet({super.key, required this.allahName});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.grey.withValues(alpha: 0.3),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            allahName.name ?? '',
            style: const TextStyle(
              fontSize: 42,
              fontWeight: FontWeight.bold,
              color: AppColors.primaryColor,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            '${allahName.transliteration} — ${allahName.translation}',
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Text(
            allahName.meaning ?? '',
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 15,
              color: Colors.grey,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
    
  }
}
