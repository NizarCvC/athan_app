import 'package:athan_app/models/zakat_nisab_models/supported_currency.dart';
import 'package:athan_app/utils/theme/app_colors.dart';
import 'package:athan_app/view_models/settings_cubit/settings_cubit.dart';
import 'package:athan_app/view_models/zakat_nisab_cubit/zakat_nisab_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CurrencyDropdownWidget extends StatelessWidget {
  final String currentCurrencyCode;

  const CurrencyDropdownWidget({super.key, required this.currentCurrencyCode});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.053,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.grey.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(14),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: currentCurrencyCode,
          isExpanded: true,
          dropdownColor: isDark ? const Color(0xFF1E293B) : Colors.white,
          icon: const Icon(
            Icons.keyboard_arrow_down_rounded,
            color: AppColors.primaryColor,
          ),
          borderRadius: BorderRadius.circular(16),
          items: SupportedCurrency.values.map((SupportedCurrency currency) {
            return DropdownMenuItem<String>(
              value: currency.code,
              child: Text(
                currency.code.toUpperCase(),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: isDark ? Colors.white : const Color(0xFF1E293B),
                ),
              ),
            );
          }).toList(),
          onChanged: (String? newValue) {
            if (newValue != null) {
              final selectedCurrency = SupportedCurrency.values.firstWhere(
                (currency) => currency.code == newValue,
              );
              context.read<SettingsCubit>().changeZakatCurrency(
                selectedCurrency,
              );
              context.read<ZakatNisabCubit>().fetchZakatNisabInfo();
            }
          },
        ),
      ),
    );
  }
}
