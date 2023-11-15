import 'package:app/Features/explore/presentation/widgets/news_article_item.dart';
import 'package:app/core/constants/constants.dart';
import 'package:app/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

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
          Text(
            'Cyber security news',
            style: AppStyles.text22.copyWith(color: kWhiteColor),
          ),
          const SizedBox(height: 12),
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              padding: const EdgeInsets.only(
                bottom: 100,
              ),
              itemBuilder: (context, index) => const NewsArticleItem(),
            ),
          ),
        ],
      ),
    );
  }
}
