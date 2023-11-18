import 'package:app/Features/explore/presentation/manager/cubits/threat_awareness_cubit/threat_awareness_cubit.dart';
import 'package:app/Features/explore/presentation/widgets/threat_awareness_listview_item.dart';
import 'package:app/core/constants/constants.dart';
import 'package:app/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class ThreatAwarenessListView extends StatelessWidget {
  const ThreatAwarenessListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // list view title
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Row(
            children: [
              Text(
                'Threat Awareness',
                style: AppStyles.text22.copyWith(color: kWhiteColor),
              ),
              const Spacer(),

              // show more button
              InkWell(
                onTap: () {},
                borderRadius: BorderRadius.circular(12.0),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  child: Text(
                    'More >',
                    style: AppStyles.text14.copyWith(color: kSecondaryColor),
                  ),
                ),
              ),
              const SizedBox(width: 4),
            ],
          ),
        ),

        const SizedBox(height: 8),

        // treats awareness list view
        SizedBox(
          height: 150,
          child: BlocBuilder<ThreatAwarenessCubit, ThreatAwarenessStates>(
            builder: (context, state) {
              if (state is GetThreatAwarenessSuccessState) {
                return AnimationLimiter(
                  child: ListView.builder(
                    padding: const EdgeInsetsDirectional.only(start: 12.0),
                    scrollDirection: Axis.horizontal,
                    itemCount: state.threatAwarenessData.length,
                    itemBuilder: (context, index) =>
                        AnimationConfiguration.staggeredList(
                      position: index,
                      delay: const Duration(milliseconds: 200),
                      duration: const Duration(milliseconds: 450),
                      child: SlideAnimation(
                        horizontalOffset: 100,
                        child: ThreatAwarenessListViewItem(
                          treatAwarenessData: state.threatAwarenessData[index],
                        ),
                      ),
                    ),
                  ),
                );
              } else if (state is GetThreatAwarenessFailureState) {
                return Text(state.errMessage);
              } else {
                return const CircularProgressIndicator();
              }
            },
          ),
        ),
      ],
    );
  }
}
