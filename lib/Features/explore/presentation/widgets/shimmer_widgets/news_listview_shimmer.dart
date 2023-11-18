import 'package:app/core/constants/constants.dart';
import 'package:app/core/widgets/custom_shimmer_widget.dart';
import 'package:flutter/material.dart';

class NewsListViewShimmer extends StatelessWidget {
  const NewsListViewShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      padding: const EdgeInsets.only(
        bottom: 100,
      ),
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: Stack(
          children: [
            // background corners
            Positioned(
              top: 0,
              left: 0,
              child: CustomShimmerWidget(
                height: 85,
                width: 85,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(28),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: CustomShimmerWidget(
                height: 85,
                width: 85,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(28),
                ),
              ),
            ),

            // article card
            Card(
              color: kCardColor,
              margin: const EdgeInsets.all(3),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    // image
                    CustomShimmerWidget(
                      height: 100,
                      width: 100,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),

                    const SizedBox(width: 12),

                    // details (title, description)
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomShimmerWidget(
                            height: 16,
                            width: 125,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6),
                            ),
                          ),

                          const SizedBox(height: 8),

                          CustomShimmerWidget(
                            height: 12,
                            width: 155,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                          ),
                          const SizedBox(height: 4),

                          CustomShimmerWidget(
                            height: 12,
                            width: 135,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                          ),

                          const SizedBox(height: 8),

                          // date time
                          CustomShimmerWidget(
                            height: 12,
                            width: 100,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
