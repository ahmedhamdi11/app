import 'package:app/Features/phishing_email_detection/presentation/manager/cubit/phishing_email_cubit.dart';
import 'package:app/Features/phishing_email_detection/presentation/widgets/email_detection_body.dart';
import 'package:app/core/constants/constants.dart';
import 'package:app/core/functions/show_failure_dialog.dart';
import 'package:app/core/manager/theme_cubit/theme_cubit.dart';
import 'package:app/core/utils/app_styles.dart';
import 'package:app/core/widgets/default_alert_dialog.dart';
import 'package:app/core/widgets/default_back_button.dart';
import 'package:app/core/widgets/prediction_result_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmailDetectionView extends StatelessWidget {
  const EmailDetectionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          'Phishing Email Detection',
          style: TextStyle(
            color:
                context.read<ThemeCubit>().isDarkTheme ? null : kLightTextColor,
          ),
        ),
        leading: const DefaultBackButton(),
      ),
      body: BlocListener<PhishingEDCubit, PhishingEDStates>(
        listener: (context, state) {
          if (state is CheckEmailSuccessState) {
            _onSuccess(context, state);
          } else if (state is CheckEmailFailureState) {
            showFailureDialog(context, state.errMessage);
          }
        },
        child: const EmailDetectionBody(),
      ),
    );
  }

  Future<dynamic> _onSuccess(
      BuildContext context, CheckEmailSuccessState state) {
    return showDialog(
      context: context,
      builder: (context) => DefaultAlertDialog(
        title: const Text(
          'Result',
          style: AppStyles.text16,
        ),
        content: PredictionResultView(
          prediction: state.prediction.prediction,
          predictionAccuracy: state.prediction.predictionAccuracy,
          predictionColor: state.prediction.prediction == 'Safe Email'
              ? kPrimaryColor
              : kRedColor,
        ),
      ),
    );
  }
}
