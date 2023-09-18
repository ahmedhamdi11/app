import 'package:app/Features/phishing_email_detection/presentation/manager/cubit/phishing_email_cubit.dart';
import 'package:app/Features/phishing_email_detection/presentation/widgets/email_detection_textfield.dart';
import 'package:app/core/widgets/default_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmailDetectionBody extends StatelessWidget {
  const EmailDetectionBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    PhishingEDCubit phishingEDCubit = BlocProvider.of<PhishingEDCubit>(context);
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: ListView(
        children: [
          const SizedBox(height: 80),
          EmailDetectionTextField(
            onChanged: (value) {
              phishingEDCubit.email = value;
            },
          ),
          const SizedBox(height: 30),
          BlocBuilder<PhishingEDCubit, PhishingEDStates>(
            builder: (context, state) {
              return state is CheckEmailLoadingState
                  ? const Center(child: CircularProgressIndicator())
                  : DefaultButton(
                      onPressed: () => phishingEDCubit.checkEmail(
                          email: phishingEDCubit.email),
                      btnText: 'Check Email',
                    );
            },
          )
        ],
      ),
    );
  }
}
