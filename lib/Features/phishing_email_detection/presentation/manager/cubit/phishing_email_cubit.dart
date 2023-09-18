import 'package:app/core/models/prediction_model.dart';
import 'package:app/Features/phishing_email_detection/data/repos/phishing_email_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'phishing_email_states.dart';

class PhishingEDCubit extends Cubit<PhishingEDStates> {
  PhishingEDCubit({required this.emailDetectionRepo})
      : super(PhishingEDInitialState());

  EmailDetectionRepo emailDetectionRepo;
  String email = '';
  Future checkEmail({required String email}) async {
    emit(CheckEmailLoadingState());
    var result = await emailDetectionRepo.checkEmail(email: email);

    result.fold(
      (failure) => emit(CheckEmailFailureState(failure.errMessage)),
      (predection) => emit(CheckEmailSuccessState(predection)),
    );
  }
}
