import 'package:flutter/material.dart';
import 'package:toktik/domain/entities/video_post.dart';
import 'package:toktik/widgets/shared/video_buttons.dart';
import 'package:toktik/widgets/video/fullscreen_player.dart';

class VideoScrollableView extends StatelessWidget {
  final List<VideoPost> videos;

  const VideoScrollableView({
    super.key,
    required this.videos,
  });

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.vertical,
      itemCount: videos.length,
      itemBuilder: (BuildContext context, int index) {
        final video = videos[index];

        return Stack(
          children: [
            SizedBox.expand(
              child: FullScreenPlayer(
                video: video.videoUrl,
                caption: video.caption,
              ),
            ),
            Positioned(
              bottom: 40,
              right: 20,
              child: VideoButtons(video: video),
            ),
          ],
        );
      },
    );
  }
}
