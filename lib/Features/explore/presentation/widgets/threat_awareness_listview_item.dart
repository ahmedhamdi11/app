import 'package:app/core/constants/constants.dart';
import 'package:app/core/utils/app_styles.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ThreatAwarenessListViewItem extends StatelessWidget {
  const ThreatAwarenessListViewItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: kIconsBackgroundColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: CachedNetworkImage(
                  imageUrl: 'imageUrl',
                  errorWidget: (context, url, error) => const Icon(
                    Icons.image,
                    color: kWhiteColor,
                  ),
                  placeholder: (context, url) => const Icon(
                    Icons.image,
                    color: kWhiteColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
