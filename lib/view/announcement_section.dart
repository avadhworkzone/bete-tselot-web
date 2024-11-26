import 'package:flutter/material.dart';

class AnnouncementsSection extends StatelessWidget {
  final List<Map<String, String>> announcements = [
    {
      'image': 'https://example.com/announcement1.jpg',
      'title': 'New Service Announcement',
      'description': 'Join us for our upcoming prayer session.',
    },
    {
      'image': 'https://example.com/announcement2.jpg',
      'title': 'Weekly Devotional',
      'description': 'Read this week\'s devotional and stay inspired.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Text(
            'Announcements',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
            ),
            itemCount: announcements.length,
            itemBuilder: (context, index) {
              final announcement = announcements[index];
              return Card(
                child: Column(
                  children: [
                    Image.network(announcement['image']!),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        announcement['title']!,
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(announcement['description']!),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
