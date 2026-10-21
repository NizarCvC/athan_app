import 'package:athan_app/models/zakat_nisab_models/zakat_standard.dart';
import 'package:athan_app/models/zakat_nisab_models/zakat_unit.dart';
import 'package:athan_app/view_models/settings_cubit/settings_cubit.dart';
import 'package:athan_app/view_models/zakat_nisab_cubit/zakat_nisab_cubit.dart';
import 'package:athan_app/views/widgets/zakat_nisab_widgets/currency_dropdown_widget.dart';
import 'package:athan_app/views/widgets/zakat_nisab_widgets/segment_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ZakatConfigurationWidget extends StatelessWidget {
  const ZakatConfigurationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final settings = context.watch<SettingsCubit>().state;
    final settingsCubit = context.read<SettingsCubit>();
    final zakatNisabCubit = context.read<ZakatNisabCubit>();
    final size = MediaQuery.of(context).size;
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
          _buildInputLabel(context, 'Standard', Icons.account_balance_rounded),
          SizedBox(height: size.height * 0.015),
          _buildSegmentedControl(
            context: context,
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
          SizedBox(height: size.height * 0.028),
          Row(
            children: [
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildInputLabel(
                      context,
                      'Currency',
                      Icons.payments_rounded,
                    ),
                    SizedBox(height: size.height * 0.015),
                    CurrencyDropdownWidget(
                      currentCurrencyCode: settings.supportedCurrency.code,
                    ),
                  ],
                ),
              ),
              SizedBox(width: size.width * 0.02),
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildInputLabel(context, 'Unit', Icons.scale_rounded),
                    SizedBox(height: size.height * 0.015),
                    _buildSegmentedControl(
                      context: context,
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

  Widget _buildInputLabel(BuildContext context, String text, IconData icon) {
    final size = MediaQuery.of(context).size;
    return Row(
      children: [
        Icon(icon, size: 16, color: Colors.grey.shade500),
        SizedBox(width: size.width * 0.01),
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
    required BuildContext context,
    required String option1,
    required String option2,
    required String selectedValue,
    required Function(String) onChanged,
  }) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.05,
      decoration: BoxDecoration(
        color: Colors.grey.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          Expanded(
            child: SegmentButtonWidget(
              option: option1,
              selectedValue: selectedValue,
              onChanged: onChanged,
            ),
          ),
          Expanded(
            child: SegmentButtonWidget(
              option: option2,
              selectedValue: selectedValue,
              onChanged: onChanged,
            ),
          ),
        ],
      ),
    );
  }
}
