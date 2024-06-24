import 'package:app/Features/explore/presentation/widgets/web_view_widgets/custom_bottom_sheet.dart';
import 'package:app/Features/explore/presentation/widgets/web_view_widgets/news_web_view_body.dart';
import 'package:app/core/constants/constants.dart';
import 'package:app/core/manager/theme_cubit/theme_cubit.dart';
import 'package:app/core/utils/app_styles.dart';
import 'package:app/core/widgets/default_back_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsWebview extends StatefulWidget {
  const NewsWebview({super.key, required this.url});
  final String url;
  @override
  State<NewsWebview> createState() => _NewsWebviewState();
}

class _NewsWebviewState extends State<NewsWebview> {
  late WebViewController _controller;
  double loadingProgress = 0.0;

  @override
  void initState() {
    _controller = WebViewController()
      ..enableZoom(true)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (progress) {
            if (mounted) {
              setState(() {
                loadingProgress = progress / 100;
              });
            }
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.url));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (await _controller.canGoBack()) {
          _controller.goBack();
          return false;
        } else {
          return true;
        }
      },
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: WebviewBody(
          loadingProgress: loadingProgress,
          controller: _controller,
        ),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      title: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
        decoration: BoxDecoration(
          color: context.read<ThemeCubit>().isDarkTheme
              ? kCardColor
              : kLightCardColor,
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Text(
          widget.url,
          style: AppStyles.text18.copyWith(color: kWhiteColor),
        ),
      ),
      centerTitle: true,
      leading: const DefaultBackButton(),
      actions: [
        IconButton(
          onPressed: () => _showModalSheet(),
          icon: Icon(
            Icons.more_vert,
            color: context.read<ThemeCubit>().isDarkTheme
                ? kWhiteColor
                : kLightTextColor,
          ),
        ),
      ],
    );
  }

  _showModalSheet() {
    showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25.0),
        ),
      ),
      context: context,
      builder: (context) {
        return CustomBottomSheet(
          url: widget.url,
          controller: _controller,
        );
      },
    );
  }
}
