import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toktik/providers/discover_provider.dart';

import '../../widgets/shared/video_scrollable_view.dart';

class DiscoverPage extends StatelessWidget {
  const DiscoverPage({super.key});

  @override
  Widget build(BuildContext context) {
    final discoverProvider = context.watch<DiscoverProvider>();

    return Scaffold(
      body: discoverProvider.initialLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : VideoScrollableView(
              videos: discoverProvider.videos,
            ),
    );
  }
}
