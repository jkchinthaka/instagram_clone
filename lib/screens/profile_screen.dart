import 'package:flutter/material.dart';
import 'package:instagram_clone/utils/mock_data.dart';
import 'package:instagram_clone/constants/colors.dart';
import 'package:instagram_clone/constants/strings.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text(MockData.currentUser.username),
          actions: [
            IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {},
            ),
          ],
        ),
        body: Column(
          children: [
            _buildProfileHeader(),
            _buildProfileStats(),
            _buildProfileBio(),
            _buildProfileButtons(),
            const TabBar(
              tabs: [
                Tab(icon: Icon(Icons.grid_on)),
                Tab(icon: Icon(Icons.video_collection)),
                Tab(icon: Icon(Icons.person_pin)),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  _buildPostsGrid(),
                  _buildReelsGrid(context),
                  _buildTaggedGrid(context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          CircleAvatar(
            radius: 40,
            backgroundImage: NetworkImage(MockData.currentUser.imageUrl),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildStatColumn(MockData.currentUser.posts.toString(), AppStrings.posts),
                _buildStatColumn(MockData.currentUser.followers.toString(), AppStrings.followers),
                _buildStatColumn(MockData.currentUser.following.toString(), AppStrings.following),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatColumn(String value, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          value,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        Text(
          label,
          style: const TextStyle(fontSize: 14),
        ),
      ],
    );
  }

  Widget _buildProfileStats() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Divider(),
    );
  }

  Widget _buildProfileBio() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            MockData.currentUser.fullName,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          Text(MockData.currentUser.bio),
          const SizedBox(height: 4),
          Text(
            MockData.currentUser.website,
            style: const TextStyle(color: AppColors.blue),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileButtons() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.lightGrey,
                foregroundColor: AppColors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              child: const Text(AppStrings.editProfile),
            ),
          ),
          const SizedBox(width: 8),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.lightGrey,
              foregroundColor: AppColors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            child: const Icon(Icons.person_add),
          ),
        ],
      ),
    );
  }

  Widget _buildPostsGrid() {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 2,
        crossAxisSpacing: 2,
      ),
      itemCount: MockData.currentUser.posts,
      itemBuilder: (context, index) => Image.network(
        'https://picsum.photos/500/500?random=$index',
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildReelsGrid(BuildContext context) {
    return Center(
      child: Text(
        'Reels',
        style: Theme.of(context).textTheme.headlineSmall,
      ),
    );
  }

  Widget _buildTaggedGrid(BuildContext context) {
    return Center(
      child: Text(
        'Tagged',
        style: Theme.of(context).textTheme.headlineSmall,
      ),
    );
  }
}