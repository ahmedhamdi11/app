import 'dart:io';

import 'package:app/Features/attack_detection/data/repos/attack_detection_repo.dart';
import 'package:app/core/functions/pick_file.dart';
import 'package:app/core/models/prediction_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'attack_detection_states.dart';

class AttackDetectionCubit extends Cubit<AttackDetectionStates> {
  AttackDetectionCubit({required this.attackDetectionRepo})
      : super(AttackDetectionInitial());
  AttackDetectionRepo attackDetectionRepo;
  File? file;

  deleteFile() {
    file = null;
    emit(FileDeleteState());
  }

  Future detectAttack() async {
    emit(DetectAttackLoadingState());
    var result = await attackDetectionRepo.detectAttack(file: file!);

    result.fold(
      (failure) => emit(DetectAttackFailureState(failure.errMessage)),
      (predection) => emit(DetectAttackSuccessState(predection)),
    );
  }

  Future pickFileForAttackDetection() async {
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
