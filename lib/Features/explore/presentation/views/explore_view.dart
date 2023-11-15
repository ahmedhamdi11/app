import 'package:app/Features/explore/presentation/widgets/news_listview_builder.dart';
import 'package:app/Features/explore/presentation/widgets/threat_awareness_listview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class ExploreView extends StatelessWidget {
  const ExploreView({super.key});

  @override
  Widget build(BuildContext context) {
    return Animate(
      effects: const [
        FadeEffect(),
      ],
      child: Column(
        children: [
          ThreatAwarenessListView(),
          SizedBox(height: 26.0),
          const Expanded(child: NewsListViewBuilder()),
        ],
      ),
    );
  }
}
