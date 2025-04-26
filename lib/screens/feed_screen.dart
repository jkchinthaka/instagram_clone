import 'package:flutter/material.dart';

class Post {
  final String userImage;
  final String username;
  final String imageUrl;
  final bool isLiked;
  final bool isSaved;
  final int likes;
  final String caption;
  final int comments;

  Post({
    required this.userImage,
    required this.username,
    required this.imageUrl,
    required this.isLiked,
    required this.isSaved,
    required this.likes,
    required this.caption,
    required this.comments,
  });
}

class PostItem extends StatelessWidget {
  final Post post;
  const PostItem({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Post Header (User info + more button)
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              CircleAvatar(
                radius: 16,
                backgroundImage: NetworkImage(post.userImage),
              ),
              const SizedBox(width: 10),
              Text(post.username, 
                  style: const TextStyle(fontWeight: FontWeight.bold)),
              const Spacer(),
              IconButton(
                icon: const Icon(Icons.more_vert),
                onPressed: () {},
              ),
            ],
          ),
        ),

        // Post Image
        Image.network(
          post.imageUrl,
          width: double.infinity,
          height: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),

        // Action Buttons (Like, Comment, Share, Save)
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
          child: Row(
            children: [
              IconButton(
                icon: Icon(
                  post.isLiked ? Icons.favorite : Icons.favorite_border,
                  color: post.isLiked ? Colors.red : null,
                ),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.mode_comment_outlined),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.send_outlined),
                onPressed: () {},
              ),
              const Spacer(),
              IconButton(
                icon: Icon(
                  post.isSaved ? Icons.bookmark : Icons.bookmark_border,
                ),
                onPressed: () {},
              ),
            ],
          ),
        ),

        // Likes Count
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            '${post.likes} likes',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),

        // Caption
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
          child: RichText(
            text: TextSpan(
              style: DefaultTextStyle.of(context).style,
              children: [
                TextSpan(
                  text: '${post.username} ',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(text: post.caption),
              ],
            ),
          ),
        ),

        // Comments Preview
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
          child: Text(
            'View all ${post.comments} comments',
            style: const TextStyle(color: Colors.grey),
          ),
        ),

        // Timestamp
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
          child: Text(
            '2 hours ago',
            style: const TextStyle(color: Colors.grey, fontSize: 12),
          ),
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}