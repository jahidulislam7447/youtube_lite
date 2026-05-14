import 'package:flutter/material.dart';

class YouScreen extends StatelessWidget {
  const YouScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F0F0F),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0F0F0F),
        title: const Text(
          'You',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildProfileSection(),
            const SizedBox(height: 16),
            _buildMenuSection('Library', [
              _MenuItem(Icons.history, 'History'),
              _MenuItem(Icons.video_library, 'My videos'),
              _MenuItem(Icons.watch_later, 'Watch later'),
              _MenuItem(Icons.thumb_up, 'Liked videos'),
            ]),
            _buildMenuSection('Subscriptions', [
              _MenuItem(Icons.subscriptions, 'Manage subscriptions'),
              _MenuItem(Icons.person_add, 'Find channels'),
            ]),
            _buildMenuSection('Explore', [
              _MenuItem(Icons.trending_up, 'Trending'),
              _MenuItem(Icons.music_note, 'Music'),
              _MenuItem(Icons.sports_esports, 'Gaming'),
              _MenuItem(Icons.movie, 'Movies'),
              _MenuItem(Icons.newspaper, 'News'),
              _MenuItem(Icons.live_tv, 'Live'),
            ]),
            _buildMenuSection('Settings', [
              _MenuItem(Icons.settings, 'Settings'),
              _MenuItem(Icons.flag, 'Report history'),
              _MenuItem(Icons.help, 'Help'),
              _MenuItem(Icons.info, 'About'),
            ]),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileSection() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 30,
            backgroundColor: Colors.red,
            child: Icon(Icons.person, color: Colors.white, size: 35),
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Guest User',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 4),
              Text(
                'Sign in to access all features',
                style: TextStyle(color: Colors.grey, fontSize: 14),
              ),
            ],
          ),
          const Spacer(),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
            ),
            child: const Text('Sign in'),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuSection(String title, List<_MenuItem> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        ...items.map((item) => ListTile(
          leading: Icon(item.icon, color: Colors.white),
          title: Text(item.title, style: const TextStyle(color: Colors.white)),
          trailing: const Icon(Icons.chevron_right, color: Colors.grey),
          onTap: () {},
        )),
        const Divider(color: Colors.grey, height: 1),
      ],
    );
  }
}

class _MenuItem {
  final IconData icon;
  final String title;

  _MenuItem(this.icon, this.title);
}