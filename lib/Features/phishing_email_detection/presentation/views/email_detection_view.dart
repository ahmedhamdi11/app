import 'package:app/Features/phishing_email_detection/presentation/manager/cubit/phishing_email_cubit.dart';
import 'package:app/Features/phishing_email_detection/presentation/widgets/email_detection_body.dart';
import 'package:app/core/widgets/default_alert_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class EmailDetectionView extends StatelessWidget {
  const EmailDetectionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: const Text('Phishing Email Detection')),
      body: BlocListener<PhishingEDCubit, PhishingEDStates>(
        listener: (context, state) {
          if (state is CheckEmailSuccessState) {
            showDialog(
              context: context,
              builder: (context) => DefaultAlertDialog(
                title: const Text('Result'),
                actions: [
                  OutlinedButton(
                    onPressed: () => GoRouter.of(context).pop(),
                    child: const Text('ok'),
                  )
                ],
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Text('prediction: '),
                        Text(
                          state.prediction.prediction,
                          style: TextStyle(
                            color: state.prediction.prediction == 'Safe Email'
                                ? Colors.green
                                : Colors.red,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    Text(
                        'prediction accuracy: ${state.prediction.predictionAccuracy}'),
                  ],
                ),
              ),
            );
          } else if (state is CheckEmailFailureState) {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                actions: [
                  OutlinedButton(
                    onPressed: () => GoRouter.of(context).pop(),
                    child: const Text('ok'),
                  )
                ],
                content: Text(state.errMessage),
              ),
            );
          }
        },
        child: const EmailDetectionBody(),
      ),
    );
  }
}
