import 'package:app/core/constants/constants.dart';
import 'package:app/core/functions/launch_url_in_browser.dart';
import 'package:app/core/functions/share_url.dart';
import 'package:app/core/manager/theme_cubit/theme_cubit.dart';
import 'package:app/core/utils/app_styles.dart';
import 'package:app/core/widgets/default_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webview_flutter/webview_flutter.dart';

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({
    super.key,
    required this.controller,
    required this.url,
  });
  final WebViewController controller;
  final String url;
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ThemeCubit>();

    return Container(
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: cubit.isDarkTheme ? kBackgroundColor : kLightBackgroundColor,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(25.0)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 8.0,
          ),
          Container(
            width: 38.0,
            height: 5.0,
            decoration: BoxDecoration(
              color: cubit.isDarkTheme ? kSecondaryColor : kLightTextColor,
              borderRadius: BorderRadius.circular(18),
            ),
          ),

          const SizedBox(height: 18.0),

          // title
          Text(
            'More options',
            style: AppStyles.text18.copyWith(
              color: cubit.isDarkTheme ? kWhiteColor : kLightTextColor,
            ),
          ),
          const SizedBox(height: 12.0),

          Divider(
            color: cubit.isDarkTheme
                ? kWhiteColor.withOpacity(0.3)
                : kLightTextColor.withOpacity(0.3),
          ),

          // actions tiles
          DefaultListTile(
            onTap: () => _reload(context),
            title: Text(
              'Refresh',
              style: TextStyle(
                color: cubit.isDarkTheme ? kWhiteColor : kLightTextColor,
              ),
            ),
            leadingIcon: Icons.refresh,
          ),
          DefaultListTile(
            onTap: () => appUrlLauncher(url: url),
            title: Text(
              'Open in browser',
              style: TextStyle(
                color: cubit.isDarkTheme ? kWhiteColor : kLightTextColor,
              ),
            ),
            leadingIcon: Icons.open_in_browser_rounded,
          ),
          DefaultListTile(
            onTap: () => shareUrl(context, url: url),
            title: Text(
              'Share',
              style: TextStyle(
                color: cubit.isDarkTheme ? kWhiteColor : kLightTextColor,
              ),
            ),
            leadingIcon: Icons.share,
          ),
        ],
      ),
    );
  }

  void _reload(BuildContext context) {
    controller.reload();
    Navigator.of(context).pop();
  }
}
