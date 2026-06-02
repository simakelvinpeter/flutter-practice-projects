import 'package:flutter/material.dart';

import 'nba_page.dart';
import 'weather_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: _ApiAppBar(),
        body: TabBarView(children: [WeatherPage(), NbaPage()]),
      ),
    );
  }
}

class _ApiAppBar extends StatelessWidget implements PreferredSizeWidget {
  const _ApiAppBar();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      foregroundColor: Colors.grey[800],
      elevation: 0,
      title: const Text('API Examples'),
      bottom: const TabBar(
        labelColor: Colors.black,
        indicatorColor: Colors.black,
        tabs: [
          Tab(text: 'Weather'),
          Tab(text: 'NBA'),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 48);
}
