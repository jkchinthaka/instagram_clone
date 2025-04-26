class Story {
  final String id;
  final String userId;
  final String username;
  final String imageUrl;
  final bool isViewed;

  Story({
    required this.id,
    required this.userId,
    required this.username,
    required this.imageUrl,
    this.isViewed = false,
  });
}