import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:toktik/domain/entities/video_post.dart';

class VideoButtons extends StatelessWidget {
  final VideoPost video;
  const VideoButtons({super.key, required this.video});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _CustomIconButton(
          iconColor: Colors.red,
          iconData: Icons.favorite,
          value: video.likes,
        ),
        const SizedBox(height: 20),
        _CustomIconButton(
          iconData: Icons.remove_red_eye_outlined,
          value: video.views,
        ),
        const SizedBox(height: 20),
        SpinPerfect(
          infinite: true,
          duration: const Duration(seconds: 5),
          child: const _CustomIconButton(
            iconData: Icons.play_circle_outline,
            value: 0,
          ),
        ),
      ],
    );
  }
}

class _CustomIconButton extends StatelessWidget {
  final int value;
  final IconData iconData;
  final Color? color;

  const _CustomIconButton({
    required this.value,
    required this.iconData,
    iconColor,
  }) : color = iconColor ?? Colors.white;

  @override
  Widget build(BuildContext context) {
    final NumberFormat formatter = NumberFormat.compactCurrency(
      decimalDigits: 0,
      symbol: '',
    );

    return Column(
      children: [
        IconButton(
          onPressed: () {},
          icon: Icon(
            size: 30,
            iconData,
            color: color,
          ),
        ),
        if (value > 0) Text(formatter.format(value)),
      ],
    );
  }
}
