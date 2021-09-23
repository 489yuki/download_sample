import 'package:flutter/material.dart';

@immutable
class VideoData {
  const VideoData(this.videoUrl, this.videoName);

  final String videoUrl;
  final String videoName;
}

//ダウンロードのメソッドを試すため、増やしています。
List<VideoData> videoDataList = [
  VideoData(
      'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
      'b.mp4'),
  VideoData(
      'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
      'c.mp4'),
  VideoData(
      'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
      'd.mp4'),
  VideoData(
      'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
      'e.mp4'),
  VideoData(
      'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
      'bf.mp4'),
  VideoData(
      'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
      'bg.mp4'),
  VideoData(
      'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
      'bh.mp4'),
  VideoData(
      'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
      'bi.mp4'),
];