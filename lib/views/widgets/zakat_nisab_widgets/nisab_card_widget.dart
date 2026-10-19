import 'package:athan_app/models/zakat_nisab_models/metal_threshold.dart';
import 'package:athan_app/utils/theme/app_colors.dart';
import 'package:athan_app/view_models/settings_cubit/settings_cubit.dart';
import 'package:athan_app/views/widgets/fasting_widgets/glass_container.dart';
import 'package:athan_app/views/widgets/shared_widgets/custom_vertical_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    final settings = BlocProvider.of<SettingsCubit>(context).state;
    return TweenAnimationBuilder(
      tween: Tween<double>(begin: 0, end: 1),
      duration: const Duration(milliseconds: 800),
      curve: Curves.easeOutCubic,
      builder: (context, double value, child) {
        return Transform.translate(
          offset: Offset(0, 30 * (1 - value)),
          child: Opacity(opacity: value, child: child),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
          gradient: LinearGradient(colors: gradientColors),
        ),
        child: Stack(
          children: [
            Positioned(
              right: -20,
              top: -20,
              child: SizedBox(
                width: 140,
                height: 140,
                child: Opacity(
                  opacity: 0.05,
                  child: ColorFiltered(
                    colorFilter: const ColorFilter.mode(
                      AppColors.white1,
                      BlendMode.srcIn,
                    ),
                    child: icon,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 24.0,
                horizontal: 24.0,
              ),
              child: Column(
                crossAxisAlignment: .start,
                children: [
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.2),
                          borderRadius: BorderRadius.circular(14),
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
                  SizedBox(height: size.height * 0.02),
                  GlassContainer(
                    child: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Row(
                        mainAxisAlignment: .center,
                        children: [
                          Expanded(
                            child: _buildStatItem(
                              'Wight',
                              '${metal.weight} ${settings.zakatUnit.value}',
                            ),
                          ),
                          const CustomVerticalDivider(),
                          Expanded(
                            child: _buildStatItem(
                              'Unit Price',
                              '${metal.unitPrice}',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: size.height * 0.02),
                  const Text(
                    'Total Nisab Amount',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      text: '${metal.nisabAmount}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 36,
                        fontWeight: FontWeight.w900,
                      ),
                      children: [
                        TextSpan(
                          text: settings.supportedCurrency.code.toUpperCase(),
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatItem(String label, String value) {
    return Column(
      children: [
        Text(
          label,
          style: TextStyle(
            color: Colors.white.withValues(alpha: 0.7),
            fontSize: 13,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(
            color: AppColors.white1,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
