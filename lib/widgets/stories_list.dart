import 'package:flutter/material.dart';
import 'package:instagram_clone/utils/mock_data.dart';
import 'package:instagram_clone/constants/colors.dart';
import 'package:instagram_clone/constants/strings.dart';
import 'package:instagram_clone/models/story.dart';

class StoriesList extends StatelessWidget {
  const StoriesList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: MockData.stories.length + 1,
        itemBuilder: (context, index) {
          if (index == 0) {
            return _buildYourStory();
          }
          return _buildStoryItem(MockData.stories[index - 1]);
        },
      ),
    );
  }

  Widget _buildYourStory() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              color: AppColors.lightGrey,
              shape: BoxShape.circle,
            ),
            child: CircleAvatar(
              radius: 32,
              backgroundColor: Colors.white,
              child: CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(MockData.currentUser.imageUrl),
              ),
            ),
          ),
          const SizedBox(height: 4),
          const Text(AppStrings.yourStory),
        ],
      ),
    );
  }

  Widget _buildStoryItem(Story story) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: story.isViewed
                    ? [AppColors.grey, AppColors.grey]
                    : [Colors.pink, Colors.orange],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              shape: BoxShape.circle,
            ),
            child: CircleAvatar(
              radius: 32,
              backgroundColor: Colors.white,
              child: CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(story.imageUrl),
              ),
            ),
          ),
          const SizedBox(height: 4),
          Text(story.username),
        ],
      ),
    );
  }
}