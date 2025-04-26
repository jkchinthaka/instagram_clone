import 'package:flutter/material.dart';
import 'package:instagram_clone/constants/colors.dart';
import 'package:instagram_clone/constants/strings.dart';

class ActivityScreen extends StatelessWidget {
  const ActivityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Activity'),
          bottom: const TabBar(
            tabs: [
              Tab(text: AppStrings.followingTab),
              Tab(text: AppStrings.youTab),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://randomuser.me/api/portraits/${index % 2 == 0 ? 'men' : 'women'}/$index.jpg'),
                  ),
                  title: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'user_$index ',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const TextSpan(text: 'liked your post'),
                      ],
                    ),
                  ),
                  trailing: Image.network(
                    'https://picsum.photos/100/100?random=$index',
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                );
              },
            ),
            ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://randomuser.me/api/portraits/${index % 2 == 0 ? 'men' : 'women'}/$index.jpg'),
                  ),
                  title: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'user_$index ',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const TextSpan(text: 'started following you'),
                      ],
                    ),
                  ),
                  trailing: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.blue,
                      foregroundColor: AppColors.white,
                    ),
                    child: const Text('Following'),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}