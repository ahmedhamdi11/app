import 'package:app/core/constants/constants.dart';
import 'package:app/core/utils/app_styles.dart';
import 'package:app/core/widgets/default_back_button.dart';
import 'package:app/core/widgets/default_network_image.dart';
import 'package:flutter/material.dart';

class ThreatAwarenessDetailsView extends StatelessWidget {
  const ThreatAwarenessDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const DefaultBackButton(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),

            // title
            Text(
              'Title ' * 5,
              style: AppStyles.text22,
            ),

            const SizedBox(height: 12),

            // image
            Stack(
              children: [
                // background corners
                Positioned(
                  top: 0,
                  left: 0,
                  child: Container(
                    width: 75,
                    height: 75,
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
                    width: 75,
                    height: 75,
                    decoration: BoxDecoration(
                      color: kSecondaryColor,
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                ),

                // image
                DefaultNetworkImage(
                  imageUrl: '',
                  width: MediaQuery.sizeOf(context).width,
                  height: 200,
                  margin: const EdgeInsets.all(2),
                ),
              ],
            ),

            const SizedBox(height: 28),

            // description
            Text(
              'Content:',
              style: AppStyles.text18.copyWith(
                color: kWhiteColor,
              ),
            ),

            Text(
              'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was in the 1960s with the release of sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like PageMaker including versions of Lorem Ipsum.',
              style: AppStyles.text16.copyWith(
                color: kWhiteColor.withOpacity(0.8),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
