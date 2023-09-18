import 'dart:io';

import 'package:app/Features/frauds_detection/data/repos/frauds_detection_repo.dart';
import 'package:app/core/models/prediction_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'frauds_detection_state.dart';

class FraudsDetectionCubit extends Cubit<FraudsDetectionState> {
  FraudsDetectionCubit({required this.fraudsDetectionRepo})
      : super(FraudsDetectionInitial());
  FraudsDetectionRepo fraudsDetectionRepo;
  File? file;
  Future checkEmail({required File file}) async {
    emit(DetectFraudsLoadingState());
    var result = await fraudsDetectionRepo.detectFrauds(file: file);

    result.fold(
      (failure) => emit(DetectFraudsFailureState(failure.errMessage)),
      (predection) => emit(DetectFraudsSuccessState(predection)),
    );
  }
}
