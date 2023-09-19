import 'dart:io';

import 'package:app/Features/frauds_detection/data/repos/frauds_detection_repo.dart';
import 'package:app/core/functions/pick_file.dart';
import 'package:app/core/models/prediction_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'frauds_detection_state.dart';

class FraudsDetectionCubit extends Cubit<FraudsDetectionState> {
  FraudsDetectionCubit({required this.fraudsDetectionRepo})
      : super(FraudsDetectionInitial());
  FraudsDetectionRepo fraudsDetectionRepo;

  File? file;

  deleteFile() {
    file = null;
    emit(FileDeleteState());
  }

  Future detectFrauds() async {
    emit(DetectFraudsLoadingState());
    var result = await fraudsDetectionRepo.detectFrauds(file: file!);

    result.fold(
      (failure) => emit(DetectFraudsFailureState(failure.errMessage)),
      (predection) => emit(DetectFraudsSuccessState(predection)),
    );
  }

  Future pickFileForFraudsDetection() async {
    var result = await pickFile();

    result.fold(
      (failure) => emit(PickFileFailureState(failure.errMessage)),
      (value) {
        file = value;
        emit(PickFileSuccessState());
      },
    );
  }
}
