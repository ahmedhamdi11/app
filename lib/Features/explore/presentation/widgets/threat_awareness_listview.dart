import 'package:app/Features/explore/presentation/widgets/threat_awareness_listview_item.dart';
import 'package:app/core/constants/constants.dart';
import 'package:app/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
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
          child: AnimationLimiter(
            child: ListView.builder(
              padding: const EdgeInsetsDirectional.only(start: 12.0),
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (context, index) =>
                  AnimationConfiguration.staggeredList(
                position: index,
                delay: const Duration(milliseconds: 200),
                duration: const Duration(milliseconds: 450),
                child: const SlideAnimation(
                    horizontalOffset: 100,
                    child: ThreatAwarenessListViewItem()),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
