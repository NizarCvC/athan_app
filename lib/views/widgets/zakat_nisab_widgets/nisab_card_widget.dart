import 'package:athan_app/models/zakat_nisab_models/metal_threshold.dart';
import 'package:athan_app/utils/theme/app_colors.dart';
import 'package:athan_app/views/widgets/fasting_widgets/glass_container.dart';
import 'package:athan_app/views/widgets/shared_widgets/custom_vertical_divider.dart';
import 'package:flutter/material.dart';

class NisabCardWidget extends StatelessWidget {
  final MetalThreshold metal;
  final String title;
  final Widget icon;
  final List<Color> gradientColors;

  const NisabCardWidget({
    super.key,
    required this.metal,
    required this.icon,
    required this.title,
    required this.gradientColors,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        gradient: LinearGradient(colors: gradientColors),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.0),
                    color: AppColors.white2.withValues(alpha: 0.5),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: icon,
                  ),
                ),
                SizedBox(width: size.width * 0.03),
                Text(
                  '$title Nisab',
                  style: textTheme.headlineMedium!.copyWith(
                    color: AppColors.white1,
                    fontWeight: .w700,
                    letterSpacing: 0.5,
                  ),
                ),
              ],
            ),
            SizedBox(height: size.height * 0.05),
            GlassContainer(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Row(
                  mainAxisAlignment: .center,
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Text('Wight', style: textTheme.labelLarge),
                          SizedBox(height: size.height * 0.01),
                          Text('${metal.weight} g'),
                        ],
                      ),
                    ),
                    const CustomVerticalDivider(),
                    Expanded(
                      child: Column(
                        children: [
                          Text('Unit Price', style: textTheme.labelLarge),
                          SizedBox(height: size.height * 0.01),
                          Text('${metal.unitPrice} g'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: size.height * 0.05),
            const Text('Total Nisab Amount'),
            RichText(
              text: TextSpan(
                text: '${metal.nisabAmount}',
                children: const [TextSpan(text: 'Currency')],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
