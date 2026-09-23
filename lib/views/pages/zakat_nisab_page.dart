import 'package:athan_app/utils/app_assets.dart';
import 'package:athan_app/utils/theme/app_colors.dart';
import 'package:athan_app/view_models/zakat_nisab_cubit/zakat_nisab_cubit.dart';
import 'package:athan_app/views/widgets/shared_widgets/custom_error_widget.dart';
import 'package:athan_app/views/widgets/shared_widgets/loading_widget.dart';
import 'package:athan_app/views/widgets/zakat_nisab_widgets/nisab_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ZakatNisabPage extends StatelessWidget {
  const ZakatNisabPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ZakatNisabCubit, ZakatNisabState>(
      buildWhen: (previous, current) =>
          current is FetchingZakatNisab ||
          current is FetchedZakatNisab ||
          current is FetchingZakatNisabFailed,
      builder: (context, state) {
        if (state is FetchingZakatNisab) {
          return const Scaffold(body: Center(child: LoadingWidget()));
        } else if (state is FetchedZakatNisab) {
          final zakatNisabInfo = state.zakatNisabInfo;
          final textTheme = Theme.of(context).textTheme;
          final size = MediaQuery.of(context).size;
          return Scaffold(
            body: SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: .start,
                    children: [
                      Text(
                        'Zakat Nisab',
                        style: textTheme.headlineLarge!.copyWith(
                          fontWeight: .w700,
                        ),
                      ),
                      Text(
                        'Live market rates & thresholds',
                        style: textTheme.labelMedium!.copyWith(
                          color: AppColors.grey1,
                        ),
                      ),
                      SizedBox(height: size.height * 0.03),
                      NisabCardWidget(
                        metal: zakatNisabInfo.nisabThresholds!.gold!,
                        icon: Image.asset(
                          AppAssets.goldIcon,
                          width: size.width * 0.1,
                        ),
                        title: 'Gold',
                        gradientColors: AppColors.goldGradient,
                      ),
                      SizedBox(height: size.height * 0.03),
                      NisabCardWidget(
                        metal: zakatNisabInfo.nisabThresholds!.silver!,
                        icon: Image.asset(
                          AppAssets.silverIcon,
                          width: size.width * 0.1,
                        ),
                        title: 'Silver',
                        gradientColors: AppColors.silverGradient,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        } else if (state is FetchingZakatNisabFailed) {
          return CustomErrorWidget(errorMessage: state.errorMessage);
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
