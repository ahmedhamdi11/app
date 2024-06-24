import 'package:app/Features/explore/data/models/news_model.dart';
import 'package:app/core/constants/constants.dart';
import 'package:app/core/manager/theme_cubit/theme_cubit.dart';
import 'package:app/core/utils/app_router.dart';
import 'package:app/core/utils/app_styles.dart';
import 'package:app/core/widgets/default_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class NewsArticleItem extends StatelessWidget {
  const NewsArticleItem({
    super.key,
    required this.newsModel,
  });

  final NewsModel newsModel;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ThemeCubit>();

    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: InkWell(
        onTap: () {
          GoRouter.of(context)
              .push(AppRouter.newsWebViewPath, extra: newsModel.url);
        },
        child: Stack(
          children: [
            // background corners
            Positioned(
              top: 0,
              left: 0,
              child: Container(
                width: 85,
                height: 85,
                decoration: BoxDecoration(
                  color: cubit.isDarkTheme ? kPrimaryColor : kLightTextColor,
                  borderRadius: BorderRadius.circular(28),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                width: 85,
                height: 85,
                decoration: BoxDecoration(
                  color: cubit.isDarkTheme ? kPrimaryColor : kLightTextColor,
                  borderRadius: BorderRadius.circular(28),
                ),
              ),
            ),

            // article card
            Card(
              color: cubit.isDarkTheme ? kCardColor : kLightCardColor,
              margin: const EdgeInsets.all(3),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    // image
                    DefaultNetworkImage(
                      imageUrl: newsModel.urlToImage,
                      width: 100,
                      height: 100,
                    ),

                    const SizedBox(width: 12),

                    // details (title, description)
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            newsModel.title,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style:
                                AppStyles.text20.copyWith(color: kWhiteColor),
                          ),
                          Text(
                            newsModel.description,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: AppStyles.text16
                                .copyWith(color: kWhiteColor.withOpacity(0.5)),
                          ),

                          const SizedBox(height: 8),

                          // date time
                          Text(
                            newsModel.publishedAt,
                            maxLines: 1,
                            textAlign: TextAlign.right,
                            overflow: TextOverflow.ellipsis,
                            style: AppStyles.text14.copyWith(
                              color: cubit.isDarkTheme
                                  ? kSecondaryColor
                                  : kLightTextColor,
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
