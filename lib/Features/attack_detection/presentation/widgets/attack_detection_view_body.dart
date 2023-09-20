import 'package:app/Features/attack_detection/presentation/manager/cubits/attack_detection_cubit/attack_detection_cubit.dart';
import 'package:app/core/constants/constants.dart';
import 'package:app/core/functions/show_failure_dialog.dart';
import 'package:app/core/widgets/default_alert_dialog.dart';
import 'package:app/core/widgets/default_button.dart';
import 'package:app/core/widgets/prediction_result_view.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path/path.dart' as p;

class AttackDetectionViewBody extends StatelessWidget {
  const AttackDetectionViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    AttackDetectionCubit attackDetectionCubit =
        BlocProvider.of<AttackDetectionCubit>(context);
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: BlocConsumer<AttackDetectionCubit, AttackDetectionStates>(
        listener: (context, state) {
          if (state is DetectAttackSuccessState) {
            _onSuccess(context, state);
          } else if (state is DetectAttackFailureState) {
            showFailureDialog(context, state.errMessage);
          } else if (state is PickFileFailureState) {
            showFailureDialog(context, state.errMassage);
          }
        },
        builder: (context, state) {
          return Column(
            children: [
              const Spacer(
                flex: 1,
              ),
              DottedBorder(
                color: kPrimaryColor.withOpacity(0.5),
                strokeWidth: 2,
                borderType: BorderType.RRect,
                radius: const Radius.circular(16.0),
                padding: const EdgeInsets.all(32.0),
                dashPattern: const [32.0, 6.0],
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    attackDetectionCubit.file == null
                        ? Image.asset(
                            'assets/images/upload.png',
                            height: 100,
                          )
                        : Stack(
                            alignment: Alignment.centerRight,
                            children: [
                              Card(
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  padding: const EdgeInsets.all(12),
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 28.0),
                                    child: Text(
                                      p.basename(
                                          attackDetectionCubit.file!.path),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ),
                              ),
                              IconButton(
                                color: Colors.red,
                                onPressed: () =>
                                    attackDetectionCubit.deleteFile(),
                                icon: const Icon(Icons.close_rounded),
                              )
                            ],
                          ),
                    const SizedBox(height: 28.0),
                    if (attackDetectionCubit.file == null)
                      const Text(
                        'Pick a csv file to check it.',
                        style: TextStyle(color: Colors.grey),
                      ),
                    const SizedBox(height: 32.0),
                    state is DetectAttackLoadingState
                        ? const CircularProgressIndicator()
                        : DefaultButton(
                            onPressed: () {
                              if (attackDetectionCubit.file == null) {
                                attackDetectionCubit
                                    .pickFileForAttackDetection();
                              } else {
                                attackDetectionCubit.detectAttack();
                              }
                            },
                            btnText: attackDetectionCubit.file == null
                                ? 'Pick File'
                                : 'Scan File',
                          ),
                  ],
                ),
              ),
              const Spacer(
                flex: 2,
              ),
            ],
          );
        },
      ),
    );
  }

  _onSuccess(BuildContext context, DetectAttackSuccessState state) {
    return showDialog(
      context: context,
      builder: (context) => DefaultAlertDialog(
        title: const Text('Result'),
        content: PredictionResultView(
          prediction: state.prediction.prediction,
          predictionAccuracy: state.prediction.predictionAccuracy,
          predictionColor: state.prediction.prediction == 'Normal'
              ? Colors.green
              : Colors.red,
        ),
      ),
    );
  }
}