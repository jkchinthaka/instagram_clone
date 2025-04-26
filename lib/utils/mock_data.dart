import '../models/post.dart';
import '../models/user.dart';
import '../models/story.dart';

class MockData {
  static final User currentUser = User(
    id: '1',
    username: 'flutter_dev',
    fullName: 'Flutter Developer',
    imageUrl: 'https://randomuser.me/api/portraits/women/44.jpg',
    bio: 'Building awesome apps with Flutter',
    website: 'https://flutter.dev',
    posts: 124,
    followers: 1253,
    following: 543,
  );

  static final List<Post> posts = List.generate(
    20,
    (index) => Post(
      id: '$index',
      username: 'user_$index',
      userImage: 'https://randomuser.me/api/portraits/${index % 2 == 0 ? 'men' : 'women'}/$index.jpg',
      imageUrl: 'https://randomuser.me/api/portraits/${index % 2 == 0 ? 'men' : 'women'}/$index.jpg',
      caption: 'This is a sample Instagram post caption #${index + 1} #flutter #instagram_clone',
      likes: 100 + index * 10,
      comments: 10 + index,
      timePosted: DateTime.now().subtract(Duration(hours: index)),
    ),
  );

  static final List<Story> stories = List.generate(
    10,
    (index) => Story(
      id: '$index',
      userId: 'user_$index',
      username: 'user_$index',
      imageUrl: 'https://randomuser.me/api/portraits/${index % 2 == 0 ? 'men' : 'women'}/$index.jpg',
      isViewed: false,
    ),
  );
}