import 'package:app/Features/frauds_detection/presentation/manager/cubits/cubit/frauds_detection_cubit.dart';
import 'package:app/core/constants/constants.dart';
import 'package:app/core/functions/show_failure_dialog.dart';
import 'package:app/core/manager/theme_cubit/theme_cubit.dart';
import 'package:app/core/utils/app_styles.dart';
import 'package:app/core/widgets/default_alert_dialog.dart';
import 'package:app/core/widgets/default_button.dart';
import 'package:app/core/widgets/prediction_result_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:path/path.dart' as p;

class FraudsDetectionViewBody extends StatelessWidget {
  const FraudsDetectionViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    FraudsDetectionCubit fraudsDetectionCubit =
        BlocProvider.of<FraudsDetectionCubit>(context);
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: BlocConsumer<FraudsDetectionCubit, FraudsDetectionState>(
        listener: (context, state) {
          if (state is DetectFraudsSuccessState) {
            _onSuccess(context, state);
          } else if (state is DetectFraudsFailureState) {
            showFailureDialog(context, state.errMessage);
          } else if (state is PickFileFailureState) {
            showFailureDialog(context, state.errMassage);
          }
        },
        builder: (context, state) {
          return Center(
            child: Card(
              color: context.read<ThemeCubit>().isDarkTheme
                  ? kCardColor
                  : kLightCardColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25)),
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    fraudsDetectionCubit.file == null
                        ? SvgPicture.asset(
                            'assets/images/Add files-cuate.svg',
                            height: 120,
                            width: 120,
                          )
                        : Stack(
                            alignment: Alignment.centerRight,
                            children: [
                              Card(
                                color: kBackgroundColor,
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  padding: const EdgeInsets.all(16),
                                  child: Text(
                                    p.basename(fraudsDetectionCubit.file!.path),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: AppStyles.text14,
                                  ),
                                ),
                              ),
                              IconButton(
                                color: kRedColor,
                                onPressed: () =>
                                    fraudsDetectionCubit.deleteFile(),
                                icon: const Icon(Icons.close_rounded),
                              )
                            ],
                          ),
                    const SizedBox(height: 28.0),
                    if (fraudsDetectionCubit.file == null)
                      Text(
                        'Pick a csv file to scan it.',
                        style: TextStyle(
                          color: context.read<ThemeCubit>().isDarkTheme
                              ? Colors.grey
                              : kWhiteColor,
                        ),
                      ),

                    if (fraudsDetectionCubit.file == null)
                      const SizedBox(height: 22.0),

                    // scan button
                    state is DetectFraudsLoadingState
                        ? const CircularProgressIndicator()
                        : DefaultButton(
                            onPressed: () {
                              if (fraudsDetectionCubit.file == null) {
                                fraudsDetectionCubit
                                    .pickFileForFraudsDetection();
                              } else {
                                fraudsDetectionCubit.detectFrauds();
                              }
                            },
                            btnText: fraudsDetectionCubit.file == null
                                ? 'Pick File'
                                : 'Start Scan',
                          ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  _onSuccess(BuildContext context, DetectFraudsSuccessState state) {
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
          predictionColor: state.prediction.prediction == 'No Frauds'
              ? kPrimaryColor
              : kRedColor,
        ),
      ),
    );
  }
}
