class VideoModel {
  final String id;
  final String title;
  final String thumbnailUrl;
  final String channelName;
  final String channelAvatarUrl;
  final String views;
  final String uploadTime;
  final String duration;
  final String videoUrl;

  VideoModel({
    required this.id,
    required this.title,
    required this.thumbnailUrl,
    required this.channelName,
    required this.channelAvatarUrl,
    required this.views,
    required this.uploadTime,
    required this.duration,
    required this.videoUrl,
  });
}