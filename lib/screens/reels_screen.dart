import 'package:flutter/material.dart';

class ReelsScreen extends StatelessWidget {
  const ReelsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: 5,
        itemBuilder: (context, index) {
          return Stack(
            children: [
              Container(
                color: Colors.black,
                child: Center(
                  child: Icon(Icons.videocam, color: Colors.white, size: 50),
                ),
              ),
              Positioned(
                bottom: 40,
                left: 16,
                right: 16,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '@user_$index',
                      style: const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'This is a sample Instagram reel video caption #reels #flutter',
                      style: const TextStyle(color: Colors.white),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Icon(Icons.music_note, color: Colors.white, size: 16),
                        const SizedBox(width: 8),
                        Text(
                          'Original Audio - user_$index',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Positioned(
                right: 16,
                bottom: 100,
                child: Column(
                  children: [
                    Column(
                      children: [
                        Icon(Icons.favorite, color: Colors.white, size: 32),
                        Text('1.2K', style: const TextStyle(color: Colors.white)),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Column(
                      children: [
                        Icon(Icons.mode_comment, color: Colors.white, size: 32),
                        Text('342', style: const TextStyle(color: Colors.white)),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Column(
                      children: [
                        Icon(Icons.send, color: Colors.white, size: 32),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Column(
                      children: [
                        Icon(Icons.more_vert, color: Colors.white, size: 32),
                      ],
                    ),
                    const SizedBox(height: 16),
                    CircleAvatar(
                      radius: 20,
                      backgroundImage: NetworkImage(
                          'https://randomuser.me/api/portraits/${index % 2 == 0 ? 'men' : 'women'}/$index.jpg'),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}