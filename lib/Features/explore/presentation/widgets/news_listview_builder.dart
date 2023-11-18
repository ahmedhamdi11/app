import 'package:app/Features/explore/presentation/manager/cubits/cyber_news_cubit.dart/cyber_news_cubit.dart';
import 'package:app/Features/explore/presentation/widgets/news_article_item.dart';
import 'package:app/Features/explore/presentation/widgets/shimmer_widgets/news_listview_shimmer.dart';
import 'package:app/core/constants/constants.dart';
import 'package:app/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class NewsListViewBuilder extends StatelessWidget {
  const NewsListViewBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // title
          Text(
            'Cyber security news',
            style: AppStyles.text22.copyWith(color: kWhiteColor),
          ),

          const SizedBox(height: 12),

          // list view
          Expanded(
            child: BlocBuilder<CyberNewsCubit, CyberNewsStates>(
              builder: (context, state) {
                if (state is GetCyberNewsSuccessState) {
                  return AnimationLimiter(
                    child: ListView.builder(
                      itemCount: state.cyberNews.length,
                      padding: const EdgeInsets.only(
                        bottom: 100,
                      ),
                      itemBuilder: (context, index) =>
                          AnimationConfiguration.staggeredList(
                        position: index,
                        duration: const Duration(milliseconds: 450),
                        child: SlideAnimation(
                          horizontalOffset: 100,
                          verticalOffset: 30,
                          child: NewsArticleItem(
                            newsModel: state.cyberNews[index],
                          ),
                        ),
                      ),
                    ),
                  );
                } else if (state is GetCyberNewsFailureState) {
                  return Center(
                    child: Text(state.errMessage),
                  );
                } else {
                  return const NewsListViewShimmer();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
