import 'package:athan_app/models/zakat_nisab_models/metal_threshold.dart';
import 'package:athan_app/utils/theme/app_colors.dart';
import 'package:athan_app/views/widgets/fasting_widgets/glass_container.dart';
import 'package:athan_app/views/widgets/shared_widgets/custom_vertical_divider.dart';
import 'package:flutter/material.dart';

class NisabCardWidget extends StatelessWidget {
  final MetalThreshold metal;
  final String title;
  final Icon icon;
  final Color color;

  const NisabCardWidget({
    super.key,
    required this.metal,
    required this.icon,
    required this.title,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        color: color,
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.0),
                  color: AppColors.white2.withValues(alpha: 0.5),
                ),
                child: icon,
              ),
              SizedBox(width: size.width * 0.05),
              Text(
                '$title Nisab',
                style: textTheme.headlineMedium!.copyWith(fontWeight: .w700),
              ),
            ],
          ),
          SizedBox(height: size.height * 0.1),
          GlassContainer(
            child: Row(
              children: [
                Column(
                  children: [
                    const Text('Wight'),
                    SizedBox(height: size.height * 0.01),
                    Text('${metal.weight} g'),
                  ],
                ),
                const CustomVerticalDivider(),
                Column(
                  children: [
                    const Text('Unit Price'),
                    SizedBox(height: size.height * 0.01),
                    Text('${metal.unitPrice} g'),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: size.height * 0.1),
          const Text('Total Nisab Amount'),
          RichText(
            text: TextSpan(
              text: '${metal.nisabAmount}',
              children: const [TextSpan(text: 'Currency')],
            ),
          ),
        ],
      ),
    );
  }
}
