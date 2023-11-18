import 'package:app/core/constants/constants.dart';
import 'package:app/core/widgets/custom_shimmer_widget.dart';
import 'package:flutter/material.dart';

class ThreatListViewShimmer extends StatelessWidget {
  const ThreatListViewShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsetsDirectional.only(start: 12.0),
      scrollDirection: Axis.horizontal,
      itemCount: 3,
      itemBuilder: (context, index) => SizedBox(
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
                      CustomShimmerWidget(
                        width: 105,
                        height: 14,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                      const SizedBox(height: 10),
                      CustomShimmerWidget(
                        width: 140,
                        height: 12,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      const SizedBox(height: 4),
                      CustomShimmerWidget(
                        width: 100,
                        height: 12,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      const SizedBox(height: 4),
                      CustomShimmerWidget(
                        width: 125,
                        height: 12,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 12),

                // image
                CustomShimmerWidget(
                  width: 100,
                  height: 100,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
