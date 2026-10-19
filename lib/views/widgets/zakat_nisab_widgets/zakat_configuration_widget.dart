import 'package:athan_app/models/zakat_nisab_models/supported_currency.dart';
import 'package:athan_app/models/zakat_nisab_models/zakat_standard.dart';
import 'package:athan_app/models/zakat_nisab_models/zakat_unit.dart';
import 'package:athan_app/utils/theme/app_colors.dart';
import 'package:athan_app/view_models/settings_cubit/settings_cubit.dart';
import 'package:athan_app/view_models/zakat_nisab_cubit/zakat_nisab_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// TODO: need to refactor this widget to be more reusable and maintainable.
class ZakatConfigurationWidget extends StatelessWidget {
  const ZakatConfigurationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final settings = context.watch<SettingsCubit>().state;
    final settingsCubit = context.read<SettingsCubit>();
    final zakatNisabCubit = context.read<ZakatNisabCubit>();
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: isDark ? Colors.white.withValues(alpha: 0.03) : Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          if (!isDark)
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.03),
              blurRadius: 15,
              offset: const Offset(0, 5),
            ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildInputLabel('Standard', Icons.account_balance_rounded),
          const SizedBox(height: 12),
          _buildSegmentedControl(
            option1: ZakatStandard.classical.name,
            option2: ZakatStandard.common.name,
            selectedValue: settings.zakatStandard.name,
            onChanged: (val) {
              settingsCubit.changeZakatStandard(
                ZakatStandard.values.byName(val),
              );
              zakatNisabCubit.fetchZakatNisabInfo();
            },
          ),
          const SizedBox(height: 24),
          Row(
            children: [
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildInputLabel('Currency', Icons.payments_rounded),
                    const SizedBox(height: 12),
                    _buildCurrencyDropdown(
                      context,
                      settings.supportedCurrency.code,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildInputLabel('Unit', Icons.scale_rounded),
                    const SizedBox(height: 12),
                    _buildSegmentedControl(
                      option1: ZakatUnit.gram.name,
                      option2: ZakatUnit.ounce.name,
                      selectedValue: settings.zakatUnit.name,
                      onChanged: (val) {
                        settingsCubit.changeZakatUnit(
                          ZakatUnit.values.byName(val),
                        );
                        zakatNisabCubit.fetchZakatNisabInfo();
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInputLabel(String text, IconData icon) {
    return Row(
      children: [
        Icon(icon, size: 16, color: Colors.grey.shade500),
        const SizedBox(width: 6),
        Text(
          text,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }

  Widget _buildSegmentedControl({
    required String option1,
    required String option2,
    required String selectedValue,
    required Function(String) onChanged,
  }) {
    return Container(
      height: 48,
      decoration: BoxDecoration(
        color: Colors.grey.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          _buildSegmentButton(option1, selectedValue, onChanged),
          _buildSegmentButton(option2, selectedValue, onChanged),
        ],
      ),
    );
  }

  Widget _buildSegmentButton(
    String option,
    String selectedValue,
    Function(String) onChanged,
  ) {
    final isSelected = selectedValue.toLowerCase() == option.toLowerCase();
    return Expanded(
      child: GestureDetector(
        onTap: () => onChanged(option),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          margin: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: isSelected ? AppColors.primaryColor : Colors.transparent,
            borderRadius: BorderRadius.circular(10),
            boxShadow: isSelected
                ? [
                    BoxShadow(
                      color: AppColors.primaryColor.withValues(alpha: 0.3),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ]
                : [],
          ),
          alignment: Alignment.center,
          child: Text(
            option.toUpperCase(),
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.grey.shade600,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.w600,
              fontSize: 13,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCurrencyDropdown(
    BuildContext context,
    String currentCurrencyCode,
  ) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      height: 48,
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
