import 'package:app/core/constants/constants.dart';
import 'package:app/core/utils/app_router.dart';
import 'package:app/core/utils/app_styles.dart';
import 'package:app/core/widgets/default_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ThreatAwarenessListViewItem extends StatelessWidget {
  const ThreatAwarenessListViewItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRouter.threatAwarenessDetailsPath);
      },
      child: SizedBox(
        width: MediaQuery.sizeOf(context).width * 0.8,
        child: Card(
          color: kCardColor,
          margin: const EdgeInsetsDirectional.only(end: 8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                // details (title, description)
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Title ' * 3,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppStyles.text20.copyWith(color: kWhiteColor),
                      ),
                      Text(
                        'description' * 4,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: AppStyles.text16
                            .copyWith(color: kWhiteColor.withOpacity(0.5)),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 12),

                // image
                Stack(
                  children: [
                    // background corners
                    Positioned(
                      top: 0,
                      left: 0,
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: kSecondaryColor,
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: kSecondaryColor,
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                    ),

                    // image
                    const DefaultNetworkImage(
                      imageUrl: 'imageUrl',
                      width: 100,
                      height: 100,
                      margin: EdgeInsets.all(2),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
