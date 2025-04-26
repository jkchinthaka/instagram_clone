class Post {
  final String id;
  final String username;
  final String userImage;
  final String imageUrl;
  final String caption;
  final int likes;
  final int comments;
  final DateTime timePosted;
  final bool isLiked;
  final bool isSaved;

  Post({
    required this.id,
    required this.username,
    required this.userImage,
    required this.imageUrl,
    required this.caption,
    required this.likes,
    required this.comments,
    required this.timePosted,
    this.isLiked = false,
    this.isSaved = false,
  });
  // Example posts
  static List<Post> examplePosts = [
    Post(
      id: '1',
      username: 'user1',
      userImage: 'assets/images/user1.jpg',
      imageUrl: 'assets/images/post1.jpg',
      caption: 'Beautiful sunset!',
      likes: 120,
      comments: 5,
      timePosted: DateTime.now().subtract(Duration(minutes: 10)),
    ),
    Post(
      id: '2',
      username: 'user2',
      userImage: 'assets/images/user2.jpg',
      imageUrl: 'assets/images/post2.jpg',
      caption: 'Delicious food!',
      likes: 200,
      comments: 10,
      timePosted: DateTime.now().subtract(Duration(hours: 1)),
    ),
    // Add more example posts as needed
  ];
}