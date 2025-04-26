class User {
  final String id;
  final String username;
  final String fullName;
  final String imageUrl;
  final String bio;
  final String website;
  final int posts;
  final int followers;
  final int following;

  User({
    required this.id,
    required this.username,
    required this.fullName,
    required this.imageUrl,
    this.bio = '',
    this.website = '',
    this.posts = 0,
    this.followers = 0,
    this.following = 0,
  });
}